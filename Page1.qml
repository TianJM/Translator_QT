import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.1
import QtQuick 2.7
import "Controls" as MyControls
import MyHttp 1.0

Item {
    id:page1;
    function focusOnTextInput(){
        if(!textInput.activeFocus){
            textInput.forceActiveFocus();
            textInput.cursorVisible = true;
        }
    }
    onActiveFocusChanged: {
        if(page1.activeFocus){
            console.log("page1 focus");
            focusOnTextInput();
        }
        else{
            console.log("page1 no focus");
        }
    }
    PropertyAnimation{
        id:textM2LW
        target: textBack;
        property: "width";
        to:page1.width * 0.9;
        duration: 400;
        onStarted: {
            //setTextVisiable();
        }
    }
    PropertyAnimation{
        id:textL2MW
        target: textBack;
        property: "width";
        to:0//page1.width * 0.0;
        duration: 400;
        onStopped: {
            //setTextUnvisiable();
        }
    }
    PropertyAnimation{
        id:textM2LP
        target: textBack;
        property: "x";
        to:page1.width * 0.05;
        duration: 400;
    }
    PropertyAnimation{
        id:textL2MP
        target: textBack;
        property: "x";
        to:page1.width * 0.5;
        duration: 400;
    }
    PropertyAnimation{
        id:menushowR;
        target: page1;
        property: "radius";
        to:0;
        duration: 500;
    }
    PropertyAnimation{
        id:menuhideR;
        target: page1;
        property: "radius";
        to:20;
        duration: 500;
    }

    function textM2L(){
        textBack.isMini = false;
        textM2LP.running = true;
        textM2LW.running = true;
    }
    function textL2M(){
        textBack.isMini = true;
        textL2MP.running = true;
        textL2MW.running = true;
        if(chooseMenu.item.isShow){
            chooseMenu.item.hide();
        }
    }

    function returnIsMini(){
        return textBack.isMini;
    }
    function changeradius(){
        if(!chooseMenu.item.isShow){
            textBack.radius = 20;
        }
        else textBack.radius = 0;
    }
    function returnIsWRShow(){
        return wordExplainRec.isShow;
    }
    function showWRG(){
        page1Back.showWR();
    }
    function hideWRG(){
        page1Back.hideWR();
    }
    function changeIsShowWRFlag(a){
        wordExplainRec.isShow = a;
    }
    function returnTextIsActive(){
        return textInput.activeFocus;
    }
    function textInputAdd(a){
        textInput.text += a;
    }
    MyHttp{
        id:httpO;
        onContentReady0: {
            page1Back.showWR();
        }
    }
    function doHttp(i,a,b){
        httpO.inithttp(i,textInput.text,a,b);
        httpO.get();
    }

    Rectangle{
        id:page1Back;
        anchors.fill: parent;
        color: "#01000000";
        focus: false;
        activeFocusOnTab: false;
        Rectangle{
            id:textBack
            property bool isMini: true;
            clip: true;
            radius: 15;
            width: 0;height: 30;
            x:0;y:10;
            color: "#EEFFFFFF";
            focus: false;
            activeFocusOnTab: false;
            MouseArea{
                id:textInputMouseA;
                width: textBack.width - 150;
                height: 30;
                clip: true;
                anchors.left: chooseLanguageB.right;
                anchors.top: textBack.top;
                cursorShape: Qt.IBeamCursor;
                focus: false;
                activeFocusOnTab: false;
                TextInput{
                    selectByMouse: true;
                    selectionColor: "#880000FF";
                    activeFocusOnTab: true;
                    id:textInput;
                    clip: true;
                    anchors.fill: parent;
                    font.pointSize: 10;
                    verticalAlignment: TextInput.AlignVCenter;
                    maximumLength: 50;
                    Rectangle{
                        id:ss01;
                        visible: false;
                        anchors.fill: parent;
                        color: "#00000000";
                        radius: 1;
                        border.width: 1;
                        border.color:"#01000000";
                    }
                    Rectangle{
                        id:ss02;
                        visible: true;
                        anchors.fill: parent;
                        color: "#00000000";
                        Text {
                            id: readytext;
                            visible: false;
                            text: qsTr("输入要查询的单词或词组.")
                            verticalAlignment: TextInput.AlignVCenter;
                            horizontalAlignment: TextInput.AlignLeft;
                            anchors.fill: parent;
                            font.pointSize: 8;
                            color: "gray";
                        }
                        Text {
                            id: noreadytext;
                            visible: false;
                            text: qsTr("Tab键开始查词.")
                            verticalAlignment: TextInput.AlignVCenter;
                            horizontalAlignment: TextInput.AlignLeft;
                            anchors.fill: parent;
                            font.pointSize: 8;
                            color: "gray";
                        }
                    }
                    function textInputNofocus(){
                        ss01.visible = false;
                        ss02.visible = true;
                        noreadytext.visible = true;
                        readytext.visible = false;
                    }
                    function textInputfocus(){
                        ss01.visible = true;
                        ss02.visible = true;
                        noreadytext.visible = false;
                        readytext.visible = true;
                    }
                    function textInputfocusHaveText(){
                        ss01.visible = true;
                        ss02.visible = false;
                        //noreadytext.visible = false;
                        //readytext.visible = true;
                    }

                    onAccepted: {
                        console.log("page1 text accept.");
                        //if(textInput.length != 0)
                            //page1Back.showWR();
                        waitChooseList.item.getStringLength(0);
                        textInput.selectAll();
                        doHttp(true,"EN","zh-CHS");

                    }
                    onActiveFocusChanged: {
                        if(textInput.activeFocus){
                            console.log("textInput1 focus.")
                            ss01.visible = true;
                            if(textInput.length != 0){
                                textInput.selectAll();
                                textInputfocusHaveText();
                            }
                            if(textInput.length == 0){

                                textInputfocus();
                            }
                        }
                        else{
                            console.log("textInput1 no focus.")
                            //ss01.visible = false;
                            if(textInput.length == 0){

                                textInputNofocus();
                            }
                        }
                    }
                    focus: true;
                    onTextChanged: {
                        waitChooseList.item.getString(textInput.text);
                        waitChooseList.item.getStringLength(0);
                        if(textInput.length == 0){
                            page1Back.hideWR();
                            textInputfocus();
                        }
                        else{
                            textInputfocusHaveText();
                        }

                        if(wordExplainRec.isShow){
                            page1Back.hideWR();
                        }

                    }

                }
            }

            Button{
                id:chooseLanguageB;
                width: 110;
                height: 30;
                anchors.left: textBack.left;
                anchors.top: textBack.top;
                iconSource: "qrc:/Image/chooseL.png";
                text: "汉英互译";
                style: choosebtnstyle;
                focus: false;
                activeFocusOnTab: false;
                MouseArea{
                    anchors.fill: parent;
                    cursorShape: Qt.PointingHandCursor;
                    onClicked: {
                        console.log("choose button clicked.")
                        if(!chooseMenu.item.isShow){
                            chooseMenu.item.show();
                            //changeradius();
                        }
                        else{
                            chooseMenu.item.hide();
                            //changeradius();
                        }
                    }
                }
            }
            Button{
                id:searchB;
                width: 40;
                height: 30;
                anchors.right: textBack.right;
                anchors.top: textBack.top;
                iconSource: "qrc:/Image/search.png";
                style: searchbtnstyle;
                focus: false;
                activeFocusOnTab: false;
                MouseArea{
                    anchors.fill: parent;
                    cursorShape: Qt.PointingHandCursor;
                    onClicked: {
                        console.log("search button clicked.")
                    }
                }


            }
            Component{
                id:searchbtnstyle;
                ButtonStyle{
                    background: Rectangle{
                        id:rec1;
                        radius: 20;
                        color: "transparent";
                    }
                }
            }
            Component{
                id:choosebtnstyle;
                ButtonStyle{
                    background: Rectangle{
                        id:rec1;
                        radius: 20;
                        color: "transparent";
                    }
                }
            }
        }
        Rectangle{
            id:wordExplainRec;
            height: 0;
            width: 0;
            //anchors.top: textBack.bottom;
            //anchors.topMargin: 5;
            //anchors.left: textBack.left;
            x:page1.width * 0.05;
            y:45;
            property bool isShow: false;
            color: "#AAFFFFFF";
            radius: 5;
            focus: false;
            activeFocusOnTab: false;
        }
        PropertyAnimation{
            id:showWordExplainRecH;
            target:wordExplainRec;
            property: "height";
            to:page1Back.height - 45;
            duration: 400;
        }
        PropertyAnimation{
            id:showWordExplainRecW;
            target:wordExplainRec;
            property: "width";
            to:page1Back.width * 0.9;
            duration: 400;
        }
        PropertyAnimation{
            id:hideWordExplainRecH;
            target:wordExplainRec;
            property: "height";
            to:0;
            duration: 400;
        }
        PropertyAnimation{
            id:hideWordExplainRecW;
            target:wordExplainRec;
            property: "width";
            to:0;
            duration: 400;
        }
        function showWR(){
            showWordExplainRecH.running = true;
            showWordExplainRecW.running = true;
            wordExplainRec.isShow = true;
        }
        function hideWR(){
            hideWordExplainRecH.running = true;
            hideWordExplainRecW.running = true;
            wordExplainRec.isShow = false;
        }

        Loader{
            id:waitChooseList;
            source: "Controls/WaitForChooseList.qml";
            anchors.right: textBack.right;
            anchors.top: textBack.bottom;
            anchors.topMargin: 5;
            onLoaded: {
                if(item != null){
                    console.log("list init.")
                }
            }
            focus: false;
            activeFocusOnTab: false;
        }
        Connections{
            target: chooseMenu.item;
            ignoreUnknownSignals: true;
            onSendChoosed:{
                chooseLanguageB.text = a;
                //console.log(chooseLanguageB.text);
            }
        }

        Loader{
            id:chooseMenu;
            source: "Controls/ChooseTransModeMenu.qml";
            anchors.left: textBack.left;
            anchors.top: textBack.bottom;
            anchors.topMargin: 5;
            onLoaded: {
                if(item != null){
                    console.log("menu init.")
                }
            }
            focus: false;
            activeFocusOnTab: false;
        }
        onWidthChanged: {
            textL2MP.stop();
            textL2MW.stop();
            textM2LP.stop();
            textM2LW.stop();
            if(textBack.isMini){
                textBack.width = 0//page1.width * 0.0;
                textBack.x = page1.width * 0.5;
            }
            else{
                textBack.width = page1.width * 0.9;
                textBack.x = page1.width * 0.05;
            }
            if(wordExplainRec.isShow){
                wordExplainRec.width = page1.width * 0.9;
                wordExplainRec.x = page1.width * 0.05;
            }
            waitChooseList.item.width = page1.width * 0.9 - 110;
        }
        onHeightChanged: {
            if(wordExplainRec.isShow)
                wordExplainRec.height = page1.height - 45;
        }
    }
}
