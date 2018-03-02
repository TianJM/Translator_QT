import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.1
import QtQuick 2.7
import "Controls" as MyControls
import MyHttp 1.0
import CJudgeLanguageType 1.0

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
        if(textInput.length > 0 ){
            httpO.inithttp(i,textInput.text,a,b);
            httpO.get();
        }
    }
    CJudgeLanguageType{
        id:judgeTypeO;
    }
    //property list coms: [];
    function judgeType(){
        //judgeTypeO.judgeQString(originTextEdit.text);
        var cnC = judgeTypeO.judgeQstringZhCount(textInput.text);
        //console.log("CN:"+cnC);
        var enC = judgeTypeO.judgeQstringEnCount(textInput.text);
        //console.log("EN:"+enC);
        var jaC = judgeTypeO.judgeQstringJaCount(textInput.text);
        //console.log("JA:"+jaC);
        var koC = judgeTypeO.judgeQstringKoCount(textInput.text);
        //console.log("KO:"+koC);
        //var nuC = judgeTypeO.judgeQstringNuCount(textInput.text);
        //console.log("NU:"+nuC);
        var ruC = judgeTypeO.judgeQstringRuCount(textInput.text);
        //console.log("RU:"+ruC);
        var arrN = new Array("zh-CHS","EN","ja","ko","ru");
        var arrC = new Array(cnC,enC,jaC,koC,ruC);
        for(var i = 0; i < arrC.length - 1;i++){
            var tem = max(arrC[0],arrC[i+1]);
            if(tem == arrC[i+1]){
                //var tem2 = arrC[i];
                arrC[0] = arrC[i+1];
                arrN[0] = arrN[i+1];
            }
        }
        if(arrC[0] != 0){
            judgedInputLanType = arrN[0];
            console.log(judgedInputLanType);
        }
        else
            judgedInputLanType = "";

    }
    function max(a,b){
        if(a >= b){
            return a;
        }
        return b;
    }
    property int oLan:0;
    property int tLan:0;
    property string judgedInputLanType: "";
    function judgeLT(a){
        if(a == 0){
            return "auto";
        }
        if(a == 1){
            return "EN";
        }
        if(a == 2){
            return "zh-CHS";
        }
        if(a == 3){
            return "ja";
        }
        if(a == 4){
            return "ko";
        }
        if(a == 5){
            return "ru";
        }
        if(a == 6){
            return "fr";
        }
        if(a == 7){
            return "pt";
        }
        if(a == 8){
            return "es";
        }
    }
    function setShowLanTypeText(){
        if(judgedInputLanType == "zh-CHS"){
            showLanType.text = "中文";
        }
        if(judgedInputLanType == "EN"){
            showLanType.text = "英文";
        }
        if(judgedInputLanType == "ja"){
            showLanType.text = "日文";
        }
        if(judgedInputLanType == "ko"){
            showLanType.text = "韩文";
        }
        if(judgedInputLanType == "ru"){
            showLanType.text = "俄文";
        }
        if(judgedInputLanType == ""){
            showLanType.text = "";
            showLanTypeRec.anchors.margins = 0;
        }
        else
            showLanTypeRec.anchors.margins = -5;
    }
    function toL(){
        changeLanbuToL.running = true;
    }
    function toM(){
        changeLanbuToM.running = true;
    }
    Rectangle{
        id:page1Back;
        anchors.fill: parent;
        color: "#01000000";
        focus: false;
        activeFocusOnTab: false;
        Rectangle{
            border.width: 1;
            border.color: "#400099FF";
            id:textBack
            property bool isMini: true;
            clip: true;
            radius: 15;
            width: 0;height: 30;
            x:0;y:10;
            color: "#EEFFFFFF";
            focus: false;
            activeFocusOnTab: false;
            Item{
                //anchors.left: textInputMouseA.right;
                anchors.top:textBack.top;
                anchors.right: searchB.left;
                anchors.rightMargin: 4;
                id: showLanTypeI
                height: textBack.height;
                width: 37;
                Text {
                    //anchors.right: showLanTypeI.right;
                    //anchors.bottom: showLanTypeI.bottom;
                    anchors.centerIn: showLanTypeI;
                    height: 10;
                    id: showLanType
                    text: qsTr("");
                    font.pixelSize: 14;
                    verticalAlignment: Text.AlignVCenter;
                    Rectangle{
                        id: showLanTypeRec
                        anchors.fill:parent;
                        color: "#330099FF";
                        radius: 100;
                        anchors.margins: 0;
                    }
                }
            }
            MouseArea{
                id:textInputMouseA;
                width: textBack.width - chooseLanguageB.width - searchB.width - 12 - showLanTypeI.width;
                height: 30;
                clip: true;
                //anchors.left: chooseLanguageB.right;
                anchors.right: showLanTypeI.left;
                //anchors.leftMargin: 0;
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
                    maximumLength: 70;
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
                        if(textInput.length != 0)
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
                        judgeType();
                        setShowLanTypeText();
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

            Rectangle{
                id:chooseLanguageB;
                width: 30;
                height: 30;
                anchors.left: textBack.left;
                anchors.top: textBack.top;
                radius: 15;
                focus: false;
                activeFocusOnTab: false;
                color: "#300099FF";

                PropertyAnimation{
                    id:changeLanbuToL;
                    target: chooseLanguageB;
                    property: "width";
                    to:110;
                    duration: 300;
                    onStarted: {
                        gloimgIM.visible = false;
                    }

                    onStopped: {

                        chooseLTextL.visible = true;
                        chooseLTextR.visible = true;
                        gloimgI.visible = true;
                    }
                }
                PropertyAnimation{
                    id:changeLanbuToM;
                    target: chooseLanguageB;
                    property: "width";
                    to:30;
                    duration: 300;
                    onStarted: {
                        chooseLTextL.visible = false;
                        chooseLTextR.visible = false;
                        gloimgI.visible = false;
                    }

                    onStopped: {
                        gloimgIM.visible = true;

                    }
                }

                Item{
                    id:gloimgIM
                    anchors.fill: parent;
                    visible: true;
                    Image {
                        id: gloimgM
                        anchors.fill: parent;
                        anchors.margins: 6;
                        source: "qrc:/Image/chooseL.png"
                    }
                }

                Text {
                    visible: false;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    //anchors.leftMargin: 2;
                    height: parent.height;
                    width: 40;
                    id: chooseLTextL;
                    text: qsTr("自动");
                    font.pixelSize: 15;
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignRight;
                }
                Item{
                    visible: false;
                    id:gloimgI
                    height: 30;
                    width: 30;
                    anchors.left: chooseLTextL.right;
                    anchors.top: parent.top;
                    Image {
                        id: gloimg
                        anchors.fill: parent;
                        anchors.margins: 7;
                        source: "qrc:/Image/lr3.png"
                    }
                }

                Text {
                    visible: false;
                    anchors.left: gloimgI.right;
                    anchors.top: parent.top;
                    //anchors.leftMargin: 2;
                    height: parent.height;
                    width: 40;
                    id: chooseLTextR;
                    text: qsTr("自动");
                    font.pixelSize: 15;
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignLeft;
                }
                MouseArea{

                    anchors.fill: parent;
                    cursorShape: Qt.PointingHandCursor;
                    onClicked: {
                        console.log("choose button clicked.")
                        if(!chooseMenu.item.isShow){
                            chooseMenu.item.show();
                            //changeradius();
                            toL();
                        }
                        else{
                            chooseMenu.item.hide();
                            //changeradius();
                            toM();
                        }
                    }
                }
            }
            Rectangle{
                id:searchB;
                width: 30;
                height: 30;
                anchors.right: textBack.right;
                anchors.top: textBack.top;
                radius: 15;
                focus: true;
                activeFocusOnTab: false;
                color: "transparent";
                Image {
                    id: seaimg
                    anchors.fill: parent;
                    anchors.margins: 7;
                    source: "qrc:/Image/search.png"
                }
                MouseArea{
                    anchors.fill: parent;
                    cursorShape: Qt.PointingHandCursor;
                    onClicked: {
                        console.log("search button clicked.")
                        textInput.forceActiveFocus();
                        textInput.selectAll();
                        if(textInput.length != 0)
                            doHttp(true,"EN","zh-CHS");
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
            border.width: 1;
            border.color: "#100099FF";

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
                chooseLTextL.text = a;
                chooseLTextR.text = b;
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
                item.width = 110;//chooseLanguageB.width;
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
