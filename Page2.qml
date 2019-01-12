import QtQuick 2.0
import QtQuick.Controls 2.2
import MyHttp 1.0
import CJudgeLanguageType 1.0
import "Controls" as MyControls
import QtQuick.Controls.Styles 1.2
Item {
    id:page2;
    onWidthChanged: {
        console.log("page2 widthchanged")
        finishAnimation();
        changeDisplayWayToVertical(displayIsHorizon);
    }
    onHeightChanged: {
        console.log("page2 heightchanged")
        finishAnimation();
        changeDisplayWayToVertical(displayIsHorizon);
    }
    PropertyAnimation{
        id:toHOW;
        target: originRange;
        property: "width";
        to:page2back.width;
        duration: 400;
    }
    PropertyAnimation{
        id:toHOH;
        target: originRange;
        property: "height";
        to:(page2back.height - 40)/2;
        duration: 400;
    }
    PropertyAnimation{
        id:toHOX;
        target: originRange;
        property: "x";
        to:0;
        duration: 400;
    }
    PropertyAnimation{
        id:toHOY;
        target: originRange;
        property: "y";
        to:0;
        duration: 400;
    }
    PropertyAnimation{
        id:toHBW;
        target: buttonRange;
        property: "width";
        to:page2back.width;
        duration: 400;
    }
    PropertyAnimation{
        id:toHBH;
        target: buttonRange;
        property: "height";
        to:40;
        duration: 400;
    }
    PropertyAnimation{
        id:toHBX;
        target: buttonRange;
        property: "x";
        to:0;
        duration: 400;
    }
    PropertyAnimation{
        id:toHBY;
        target: buttonRange;
        property: "y";
        to:(page2back.height - 40) * 0.5;
        duration: 400;
    }
    PropertyAnimation{
        id:toHTW;
        target: transitionRange;
        property: "width";
        to:page2back.width;
        duration: 400;
    }
    PropertyAnimation{
        id:toHTH;
        target: transitionRange;
        property: "height";
        to:(page2back.height - 40) * 0.5;
        duration: 400;
    }
    PropertyAnimation{
        id:toHTX;
        target: transitionRange;
        property: "x";
        to:0;
        duration: 400;
    }
    PropertyAnimation{
        id:toHTY;
        target: transitionRange;
        property: "y";
        to:(page2back.height - 40) * 0.5 + 40;
        duration: 400;
    }


    PropertyAnimation{
        id:toVOW;
        target: originRange;
        property: "width";
        to:page2back.width * 0.5;
        duration: 400;
    }
    PropertyAnimation{
        id:toVOH;
        target: originRange;
        property: "height";
        to:(page2back.height - 40);
        duration: 400;
    }
    PropertyAnimation{
        id:toVOX;
        target: originRange;
        property: "x";
        to:0;
        duration: 400;
    }
    PropertyAnimation{
        id:toVOY;
        target: originRange;
        property: "y";
        to:0;
        duration: 400;
    }
    PropertyAnimation{
        id:toVBW;
        target: buttonRange;
        property: "width";
        to:page2back.width;
        duration: 400;
    }
    PropertyAnimation{
        id:toVBH;
        target: buttonRange;
        property: "height";
        to:40;
        duration: 400;
    }
    PropertyAnimation{
        id:toVBX;
        target: buttonRange;
        property: "x";
        to:0;
        duration: 400;
    }
    PropertyAnimation{
        id:toVBY;
        target: buttonRange;
        property: "y";
        to:(page2back.height - 40);
        duration: 400;
    }
    PropertyAnimation{
        id:toVTW;
        target: transitionRange;
        property: "width";
        to:page2back.width * 0.5;
        duration: 400;
    }
    PropertyAnimation{
        id:toVTH;
        target: transitionRange;
        property: "height";
        to:(page2back.height - 40);
        duration: 400;
    }
    PropertyAnimation{
        id:toVTX;
        target: transitionRange;
        property: "x";
        to:page2back.width * 0.5;
        duration: 400;
    }
    PropertyAnimation{
        id:toVTY;
        target: transitionRange;
        property: "y";
        to:0;
        duration: 400;
    }
    property bool displayIsHorizon: true;
    function changeDisplayWayToVertical(a){
        if(a){
            displayIsHorizon = false;
            originRange.width = page2back.width * 0.5;
            originRange.height = page2back.height - 40;
            originRange.x = 0;
            originRange.y = 0;
            buttonRange.width = page2back.width;
            buttonRange.height = 40;
            buttonRange.x = 0;
            buttonRange.y = page2back.height - 40;
            transitionRange.width = page2back.width * 0.5;
            transitionRange.height = page2back.height - 40;
            transitionRange.x = page2back.width * 0.5;
            transitionRange.y = 0;
        }
        else{
            displayIsHorizon = true;
            originRange.width = page2back.width;
            originRange.height = (page2back.height - 40)/2;
            originRange.x = 0;
            originRange.y = 0;
            buttonRange.width = page2back.width;
            buttonRange.height = 40;
            buttonRange.x = 0;
            buttonRange.y = (page2back.height - 40)/2;
            transitionRange.width = page2back.width;
            transitionRange.height = (page2back.height - 40)/2;
            transitionRange.x = 0;
            transitionRange.y = (page2back.height - 40)/2 + 40;
        }
    }
    FontLoader { id: fixedFont;
        source: "qrc:/Fonts/ht.ttf";
    }
    function changeDisplayWayToVerticalAnimation(a){
        if(a){
            displayIsHorizon = false;
            toVOW.running = true;
            toVOH.running = true;
            toVOX.running = true;
            toVOY.running = true;
            toVBW.running = true;
            toVBH.running = true;
            toVBX.running = true;
            toVBY.running = true;
            toVTW.running = true;
            toVTH.running = true;
            toVTX.running = true;
            toVTY.running = true;
        }
        else{
            displayIsHorizon = true;
            toHOW.running = true;
            toHOH.running = true;
            toHOX.running = true;
            toHOY.running = true;
            toHBW.running = true;
            toHBH.running = true;
            toHBX.running = true;
            toHBY.running = true;
            toHTW.running = true;
            toHTH.running = true;
            toHTX.running = true;
            toHTY.running = true;
        }
    }
    function finishAnimation(){
        toVOW.complete();
        toVOH.complete();
        toVOX.complete();
        toVOY.complete();
        toVBW.complete();
        toVBH.complete();
        toVBX.complete();
        toVBY.complete();
        toVTW.complete();
        toVTH.complete();
        toVTX.complete();
        toVTY.complete();
        toHOW.complete();
        toHOH.complete();
        toHOX.complete();
        toHOY.complete();
        toHBW.complete();
        toHBH.complete();
        toHBX.complete();
        toHBY.complete();
        toHTW.complete();
        toHTH.complete();
        toHTX.complete();
        toHTY.complete();
    }
    MyHttp{
        id:httpO;
        onContentReady1: {
            isBusyInrun = false;
            transitionTextEdit.text = httpO.returnrTranslation();
        }
    }
    function doHttp(i,a,b){
        if(originTextEdit.length > 0 ){
            httpO.inithttp(i,originTextEdit.text,a,b);
            httpO.get();
            isBusyInrun = true;
        }
    }
    CJudgeLanguageType{
        id:judgeTypeO;
    }
    //property list coms: [];
    function judgeType(){
        //judgeTypeO.judgeQString(originTextEdit.text);
        var cnC = judgeTypeO.judgeQstringZhCount(originTextEdit.text);
        //console.log("CN:"+cnC);
        var enC = judgeTypeO.judgeQstringEnCount(originTextEdit.text);
        //console.log("EN:"+enC);
        var jaC = judgeTypeO.judgeQstringJaCount(originTextEdit.text);
        //console.log("JA:"+jaC);
        var koC = judgeTypeO.judgeQstringKoCount(originTextEdit.text);
        //console.log("KO:"+koC);
        //var nuC = judgeTypeO.judgeQstringNuCount(originTextEdit.text);
        //console.log("NU:"+nuC);
        var ruC = judgeTypeO.judgeQstringRuCount(originTextEdit.text);
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
    property int oLanFact:0;
    property int tLanFact:0;
    function judgeTransTypeAuto(){
        if(oLan == 0 && tLan == 0){
            if(judgedInputLanType == "zh-CHS"){
                oLanFact = 0;
                tLanFact = 1;
            }
            else{
                oLanFact = 0;
                tLanFact = 2;
            }
        }
        else if(oLan == 0 && tLan != 0 ){
            oLanFact = 0;
            tLanFact = tLan;
        }
        else if(oLan != 0 && tLan == 0 ){
            if(judgedInputLanType == "zh-CHS"){
                oLanFact = oLan;
                tLanFact = 1;
            }
            else{
                oLanFact = oLan;
                tLanFact = 2;
            }
        }
        else{
            oLanFact = oLan;
            tLanFact = tLan;
        }
    }

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
    function setPoH(){
        chooseTrans2.anchors.bottomMargin = -120;
        chooseTrans1.anchors.bottomMargin = -120;
    }
    function setPoV(){
        chooseTrans2.anchors.bottomMargin = -30;
        chooseTrans1.anchors.bottomMargin = -30;
    }
    function judgeVHset(){
        if(displayIsHorizon){
            setPoH();
        }
        else
            setPoV();
    }

    function setShowLanTypeText(){
        if(judgedInputLanType == "zh-CHS"){
            showLanType.text = "检测到语言主体为中文";
        }
        if(judgedInputLanType == "EN"){
            showLanType.text = "检测到语言主体为英文";
        }
        if(judgedInputLanType == "ja"){
            showLanType.text = "检测到语言主体为日文";
        }
        if(judgedInputLanType == "ko"){
            showLanType.text = "检测到语言主体为韩文";
        }
        if(judgedInputLanType == "ru"){
            showLanType.text = "检测到语言主体为俄文";
        }
        if(judgedInputLanType == ""){
            showLanType.text = "";
            showLanTypeRec.anchors.margins = 0;
        }
        else
            showLanTypeRec.anchors.margins = -7;
    }
    property bool isBusyInrun: false;
    Rectangle{
        width: 200;
        height: 150;
        anchors.centerIn: parent;
        visible: isBusyInrun;
        color: "#99FFFFFF";
        radius: 10;
        z:5;
        BusyIndicator{
            //visible: false;
            anchors.centerIn: parent;
            running: isBusyInrun;
        }
    }
    Rectangle{
        anchors.fill: parent;
        //border.width: 3;
        color: "#02000000";
        Rectangle{
            //anchors.top: parent.top;
            //anchors.left: parent.left;
            id:page2back;
            anchors.fill: parent;
            anchors.leftMargin: 20;
            anchors.rightMargin: 20;
            anchors.topMargin: 10;
            //anchors.bottomMargin: 10;
            color: "#CCFFFFFF";
            //radius: 8;
            border.width: 1;
            border.color: "#22000000";
            radius: 3;
            clip: true;
            Rectangle{
                z:0;
                id:originRange;
                //anchors.top:
                x:0;
                y:0;
                width: parent.width;
                height: (parent.height - 40) * 0.5;
                //border.width: 1;
                color: "#00FFFFFF";
                radius: 3;
                Text {
                    font.family: fixedFont.name;
                    id: titletextO;
                    text: qsTr("原文");
                    color: "#55000000";
                    font.bold: true;
                    font.pixelSize: 13;
                    verticalAlignment: Text.AlignVCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 15;
                    anchors.top: parent.top;
                    anchors.topMargin: 8;
                    height: 20;
                }
                Item{
                    anchors.left: titletextO.right;
                    anchors.top:titletextO.top;
                    anchors.leftMargin: 20;
                    anchors.topMargin: 6;
                    height: 10;
                    Text {
                        font.family: fixedFont.name;
                        anchors.left: parent.left;
                        anchors.top: parent.top;
                        height: 10;
                        id: showLanType
                        text: qsTr("");
                        font.pixelSize: 12;
                        verticalAlignment: Text.AlignVCenter;
                        Rectangle{
                            id: showLanTypeRec
                            anchors.fill:parent;
                            color: "#100099FF";
                            radius: 20;
                            anchors.margins: 0;
                        }
                    }
                }
                Rectangle{
                    //anchors.right: parent.right;
                    //anchors.top: parent.top;
                    x:parent.width;
                    y:parent.height * 0.05;
                    width: 1;
                    height: parent.height * 0.9;
                    color: "#11000000";
                }
                Item{
                    id:originTextEditBack;
                    anchors.top: titletextO.bottom;
                    anchors.topMargin: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    width: parent.width - 20;
                    height: parent.height - 37;
                    //cursorShape: Qt.IBeamCursor;
                    clip: true;
                    ScrollView{
                        anchors.fill: parent;
                        TextArea{
                            font.family: fixedFont.name;
                            id:originTextEdit;
                            //anchors.fill: parent
                            width: parent.width;
                            height: returnMax(originTextEdit.contentHeight,parent.height);
                            anchors.margins: 8;
                            //clip: true;
                            wrapMode: TextEdit.Wrap;
                            font.pixelSize: 12
                            mouseSelectionMode: TextEdit.SelectCharacters;
                            selectByMouse: true;
                            function returnMax(a,b){
                                if(a>b)
                                    return a;
                                else return b;
                            }
                            onTextChanged: {
                                judgeType();
                                setShowLanTypeText();
                            }
                            onActiveFocusChanged: {
                                if(!activeFocus){
                                    select(0,0);
                                }
                            }
                        }
                    }
                    /*
                    ScrollView{
                        anchors.fill: parent;
                        focus: false;
                        TextEdit{
                            id:originTextEdit;
                            //anchors.fill: parent;
                            width: parent.width;
                            height: parent.returnMax(originTextEdit.contentHeight,parent.height);
                            anchors.margins: 8;
                            //clip: true;
                            wrapMode: TextEdit.Wrap;
                            font.pixelSize: 12
                            mouseSelectionMode: TextEdit.SelectCharacters;
                            selectByMouse: true;
                            onActiveFocusChanged: {
                                if(originTextEdit.activeFocus){
                                    originTextEditBackMA.visible = false;
                                    console.log("page2 TextInput1 focus.")
                                }
                                else{
                                    originTextEditBackMA.visible = true;
                                    console.log("page2 TextInput1 no focus.")
                                }
                            }
                            cursorDelegate: {

                            }
                        }
                        function returnMax(a,b){
                            if(a>b)
                                return a;
                            else return b;
                        }
                    }
                    MouseArea{
                        id:originTextEditBackMA;
                        anchors.fill: parent;
                        cursorShape: Qt.IBeamCursor;
                        onClicked: {
                            originTextEdit.forceActiveFocus();
                        }
                    }*/
               }
            }

            Rectangle{
                id:transitionRange;
                x:0;
                y:(parent.height - 40) * 0.5 + 50;
                width: parent.width;
                height: (parent.height - 40) * 0.5;
                //border.width: 1;
                color: "#00FFFFFF";
                radius: 3;
                Text {
                    font.family: fixedFont.name;
                    id: titletextT;
                    text: qsTr("译文");
                    color: "#55000000";
                    font.bold: true;
                    font.pixelSize: 13;
                    verticalAlignment: Text.AlignVCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 15;
                    anchors.top: parent.top;
                    anchors.topMargin: 8;
                    height: 20;
                }
                Item{

                    id:transitionTextEditBack;
                    anchors.top: titletextT.bottom;
                    anchors.topMargin: 5;
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    width: parent.width - 20;
                    height: parent.height - 37;
                    //cursorShape: Qt.IBeamCursor;
                    clip: true;
                    ScrollView{
                        anchors.fill: parent;
                        TextArea{
                            font.family: fixedFont.name;
                            id:transitionTextEdit;
                            //anchors.fill: parent
                            width: parent.width;
                            height: returnMax(originTextEdit.contentHeight,parent.height);
                            anchors.margins: 8;
                            //clip: true;
                            wrapMode: TextEdit.Wrap;
                            font.pixelSize: 12
                            mouseSelectionMode: TextEdit.SelectCharacters;
                            selectByMouse: true;
                            readOnly: true;
                            function returnMax(a,b){
                                if(a>b)
                                    return a;
                                else return b;
                            }
                            onActiveFocusChanged: {
                                if(!activeFocus){
                                    select(0,0);
                                }
                            }
                        }
                    }
                }
            }

            Rectangle{
                z:1;
                id:buttonRange;
                x:0;
                y:(parent.height - 40) * 0.5;
                width: parent.width;
                height: 40;
                //border.width: 1;
                //border.color: "#10000000";
                color: "#00000000";
                radius: 0;
                /*
                Rectangle{
                    x:parent.width * 0.025;
                    y:0;
                    width: parent.width * 0.95;
                    height: 1;
                    color: "#55000000";
                }
                Rectangle{
                    x:parent.width * 0.025;
                    y:parent.height;
                    width: parent.width * 0.95;
                    height: 1;
                    color: "#55000000";
                }
                */
                Rectangle{
                    id:searchAndChooseTransmode
                    anchors.right: parent.right;
                    anchors.rightMargin: 40;
                    //anchors.top: parent.top;
                    //anchors.topMargin: 7;
                    y:parent.height * 0.5 - 15;
                    width: 260;
                    height: 30;
                    color: "transparent";
                    border.width: 1;
                    border.color: "#330077FF";
                    Rectangle{
                        id:le
                        anchors.left: parent.left;
                        anchors.top: parent.top;
                        width: 100;
                        height: parent.height;
                        border.width: 0;
                        border.color: "#550077FF";
                        color: "#000077FF";

                        Text {
                            font.family: fixedFont.name;
                           anchors.fill: parent;
                            id: lText;
                            text: qsTr("自动检测");
                            horizontalAlignment: Text.AlignHCenter;
                            verticalAlignment: Text.AlignVCenter;
                            font.pixelSize: 13;
                            color: "#FF000000";

                            //color: "#300099FF"
                        }
                        MouseArea{
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                            onClicked: {
                                //judgeVHset();
                                if(!chooseTrans1.item.isShow){
                                    chooseTrans1.item.show();
                                    lText.color = "#FF0099FF";
                                    lText.visible = false;
                                }
                                else{
                                    lText.color = "#FF000000";
                                    chooseTrans1.item.hide();
                                    lText.visible = true;
                                }
                            }
                        }
                    }
                    Rectangle{
                        id:le2
                        anchors.left: le.right;
                        anchors.top: le.top;
                        width: 30;
                        height: parent.height;
                        //border.width: 1;
                        //border.color: "#550077FF";
                        color: "#000077FF";
                        Image {
                            id: img;
                            source: "qrc:/Image/toright.png";
                            anchors.fill: parent;
                            anchors.margins: 7;
                            smooth: true;
                        }
                    }
                    Rectangle{
                        id:mi
                        anchors.left: le2.right;
                        anchors.top: le2.top;
                        width: 100;
                        height: parent.height;
                        border.width: 0;
                        border.color: "#550077FF";
                        color: "#000077FF";
                        Text {
                           anchors.fill: parent;
                            id: rText
                            text: qsTr("自动检测");
                            horizontalAlignment: Text.AlignHCenter;
                            verticalAlignment: Text.AlignVCenter;
                            font.pixelSize: 13;
                            font.family: fixedFont.name;
                        }
                        MouseArea{
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                            onClicked: {
                                //judgeVHset();
                                if(!chooseTrans2.item.isShow){
                                    chooseTrans2.item.show();
                                    rText.color = "#FF0099FF";
                                    rText.visible = false;
                                }
                                else{
                                    chooseTrans2.item.hide();
                                    rText.color = "#FF000000";
                                    rText.visible = true;
                                }
                            }
                        }
                    }
                    Rectangle{
                        id:ri
                        anchors.left: mi.right;
                        anchors.top: mi.top;
                        width: 30;
                        height: parent.height;
                        color: "#335577FF";
                        border.width: 1;
                        border.color: "#885599FF"
                        Image {
                            id: imgl
                            source: "qrc:/Image/search.png"
                            //anchors.centerIn: parent;
                            anchors.fill: parent;
                            anchors.margins: 7;
                        }
                        MouseArea{
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                            hoverEnabled: true;
                            onEntered: {
                                parent.color = "#335555FF";
                            }
                            onExited: {
                                parent.color = "#335577FF";
                            }
                            onPressed: {
                                parent.color = "#335533FF";
                                parent.border.width = 2;
                            }
                            onReleased: {
                                parent.color = "#335577FF";
                                parent.border.width = 1;
                            }
                            onClicked: {
                                forceActiveFocus();
                                judgeTransTypeAuto();
                                doHttp(false,judgeLT(oLanFact),judgeLT(tLanFact));
                                //judgeType(transitionTextEdit.text);
                            }
                        }

                    }

                    Loader{
                        id:chooseTrans1;
                        source: "Controls/ChooseTransModeMenuPage2.qml";
                        onLoaded: {
                            item.setCurrentIndex(0);
                            item.isShow = false;
                            if(item != null){
                                console.log("TransM1 init.")
                            }
                        }
                        width: le.width;
                        anchors.bottom: le.top;
                        anchors.bottomMargin: -31;
                        anchors.left: le.left;
                        focus: true;
                        z:2;
                    }
                    Loader{
                        id:chooseTrans2;
                        source: "Controls/ChooseTransModeMenuPage2.qml";
                        onLoaded: {
                            item.setCurrentIndex(0);
                            item.isShow = false;
                            if(item != null){
                                console.log("TransM2 init.")
                            }
                        }
                        width: mi.width;
                        anchors.bottom: mi.top;
                        anchors.bottomMargin: -31;
                        anchors.left: mi.left;
                        focus: true;
                        z:2;
                    }



                    Connections{
                        target: chooseTrans1.item;
                        ignoreUnknownSignals: true;
                        onSendChoosed:{
                            lText.text = a;
                            oLan = b;
                            console.log(oLan);
                        }
                    }
                    Connections{
                        target: chooseTrans1.item;
                        ignoreUnknownSignals: true;
                        onShide:{
                            lText.color = "#FF000000";
                            lText.visible = true;
                        }
                    }
                    Connections{
                        target: chooseTrans2.item;
                        ignoreUnknownSignals: true;
                        onSendChoosed:{
                            rText.text = a;
                            tLan = b;
                            console.log(tLan);
                        }
                    }
                    Connections{
                        target: chooseTrans2.item;
                        ignoreUnknownSignals: true;
                        onShide:{
                            rText.color = "#FF000000";
                            rText.visible = true;
                        }
                    }

                }
            }
            Rectangle{
                z:1;
                id:changeButtonRange;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.rightMargin: 40;
                anchors.topMargin: 7;
                width: 60;
                height: 25;
                color: "#03000000";
                border.width: 1;
                border.color: "#22000000"
                Rectangle{
                    id:leftbu;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    width: 30;
                    height: parent.height;
                    color: "transparent";
                    property bool isActive: false;
                    property bool pressFlag: false;
                    Rectangle{
                        height: 14;
                        width: 7;
                        x:7;
                        y:6;
                    }
                    Rectangle{
                        height: 14;
                        width: 7;
                        x:16;
                        y:6;
                    }

                    MouseArea{
                        anchors.fill: parent;
                        hoverEnabled: true;
                        onPressed: {
                            parent.color = "#995599FF";
                            rightbu.color = "transparent";
                            parent.isActive = true;
                            rightbu.isActive = false;
                            parent.pressFlag = true;

                            changeDisplayWayToVerticalAnimation(true);
                            originTextEdit.forceActiveFocus();
                        }
                        onEntered: {
                            parent.color = "#9955AAFF";
                        }
                        onExited: {
                            if(!parent.pressFlag){
                                if(!parent.isActive)
                                    parent.color = "transparent";
                                else
                                    parent.color = "#995599FF";
                            }
                            else{
                                parent.pressFlag = false;
                            }
                        }
                    }
                }
                Rectangle{
                    id:rightbu;
                    anchors.left: leftbu.right;
                    anchors.top: parent.top;
                    width: 30;
                    height: parent.height;
                    color: "#995599FF";
                    property bool isActive: true;
                    property bool pressFlag: false;
                    Rectangle{
                        height: 6;
                        width: 16;
                        x:8;
                        y:6;
                    }
                    Rectangle{
                        height: 6;
                        width: 16;
                        x:8;
                        y:14;
                    }

                    MouseArea{
                        anchors.fill: parent;
                        hoverEnabled: true;
                        onPressed: {
                            parent.color = "#995599FF";
                            leftbu.color = "transparent";
                            parent.isActive = true;
                            leftbu.isActive = false;
                            parent.pressFlag = true;

                            changeDisplayWayToVerticalAnimation(false);
                            originTextEdit.forceActiveFocus();
                        }
                        onEntered: {
                            parent.color = "#9955AAFF";
                        }
                        onExited: {
                            if(!parent.pressFlag){
                                if(!parent.isActive)
                                    parent.color = "transparent";
                                else
                                    parent.color = "#995599FF";
                            }
                            else{
                                parent.pressFlag = false;
                            }
                        }
                    }
                }
            }
        }
    }
}
