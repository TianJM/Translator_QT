import QtQuick 2.0
import QtQuick.Controls 2.2
//import QtQuick.Controls 1.4
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
    FontLoader { id: fixedFont;
        source: "qrc:/Fonts/ht.ttf";
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
    property bool isBusyInrun: false;
    MyHttp{
        id:httpO;
        onContentReady0: {
            isBusyInrun = false;
            page1Back.showWR();
            queryText.text = returnrQuery();
            var Usphonetic = returnrUsphonetic();
            Usphonetic = "美:" + Usphonetic;
            var Ukphonetic = returnrUkphonetic();
            Ukphonetic = "英:" + Ukphonetic;
            //var Phonetic = returnrPhonetic();
            //Phonetic = "通用:" + Phonetic;
            //phonetic.text = Phonetic;
            //phoneticRec.width = phonetic.contentWidth+20;
            usphonetic.text = Usphonetic;
            //usphoneticRec.width = usphonetic.contentWidth+20;
            ukphonetic.text = Ukphonetic;
            //ukphoneticRec.width = ukphonetic.contentWidth+20;
            if(oLanFact != 1 || returnrExplains() == ""){
                phoneticAndSpeech.height = 0;
                speak01.visible = false;
                speak02.visible = false;
                //speak03.visible = false;
                //phoneticRec.visible = false;
                usphoneticRec.visible = false;
                ukphoneticRec.visible = false;

            }
            else{
                phoneticAndSpeech.height = 30;
                speak01.visible = true;
                speak02.visible = true;
                //speak03.visible = true;
                //phoneticRec.visible = true;
                usphoneticRec.visible = true;
                ukphoneticRec.visible = true;

            }
            explainsText.clear();
            if(returnrTranslation() != ""){
                explainsText.text = "释义:\n    " + returnrTranslation();
            }
            if(returnrExplains() != "")
                explainsText.text += ("\n详细释义:\n    " + returnrExplains());
            websText.clear();
            if(returnrWeb() != "")
                websText.text = "相关释义:\n    " + returnrWeb();
        }
    }
    function doHttp(i,a,b){
        if(textInput.length > 0 ){
            httpO.inithttp(i,textInput.text,a,b);
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
    //property int oLan:0;
    //property int tLan:0;
    property int transType:0;
    property string judgedInputLanType: "";
    property int oLanFact:0;
    property int tLanFact:0;
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
            showLanType.text = "自动检测:中文";
        }
        if(judgedInputLanType == "EN"){
            showLanType.text = "自动检测:英文";
        }
        if(judgedInputLanType == "ja"){
            showLanType.text = "自动检测:日文";
        }
        if(judgedInputLanType == "ko"){
            showLanType.text = "自动检测:韩文";
        }
        if(judgedInputLanType == "ru"){
            showLanType.text = "自动检测:俄文";
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

    function judgeTransTypeAuto(){
        if(transType == 0){
            if(judgedInputLanType == "zh-CHS"){
                console.log("qwedsa1");
                oLanFact = 2;
                tLanFact = 1;
            }
            else if(judgedInputLanType == "EN"){
                console.log("qwedsa2");
                oLanFact = 1;
                tLanFact = 2;
            }
            else{
                console.log("qwedsa3");
                oLanFact = 0;
                tLanFact = 2;
            }
        }
        if(transType == 1){
            if(judgedInputLanType == "zh-CHS"){
                oLanFact = 2;
                tLanFact = 1;
            }
            else{
                oLanFact = 1;
                tLanFact = 2;
            }
        }
        if(transType == 2){
            if(judgedInputLanType == "zh-CHS"){
                oLanFact = 2;
                tLanFact = 3;
            }
            else{
                oLanFact = 3;
                tLanFact = 2;
            }
        }
        if(transType == 3){
            if(judgedInputLanType == "zh-CHS"){
                oLanFact = 2;
                tLanFact = 4;
            }
            else{
                oLanFact = 4;
                tLanFact = 2;
            }
        }
        if(transType == 4){
            if(judgedInputLanType == "zh-CHS"){
                oLanFact = 2;
                tLanFact = 5;
            }
            else{
                oLanFact = 5;
                tLanFact = 2;
            }
        }
    }
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
                width: 77;
                Text {
                    font.family: fixedFont.name;
                    //anchors.right: showLanTypeI.right;
                    //anchors.bottom: showLanTypeI.bottom;
                    anchors.centerIn: showLanTypeI;
                    height: 10;
                    id: showLanType
                    text: qsTr("");
                    font.pixelSize: 10;
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignHCenter;
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
                width: textBack.width - chooseLanguageB.width - searchB.width - 9 - showLanTypeI.width;
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
                    selectionColor: "#AA0099FF";
                    activeFocusOnTab: true;
                    id:textInput;
                    clip: true;
                    anchors.fill: parent;
                    font.pointSize: 10;
                    verticalAlignment: TextInput.AlignVCenter;
                    maximumLength: 30;
                    font.family: fixedFont.name;
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
                            font.family: fixedFont.name;
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
                            font.family: fixedFont.name;
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
                        if(textInput.length != 0){
                            judgeTransTypeAuto();
                            doHttp(true,judgeLT(oLanFact),judgeLT(tLanFact));
                        }

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
                color: "#10AABBFF";

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
                        source: "qrc:/Image/hj.jpeg"
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
                    font.family: fixedFont.name;
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
                        source: "qrc:/Image/hj.jpeg"
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
                    font.family: fixedFont.name;
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
                            doHttp(true,judgeLT(oLanFact),judgeLT(tLanFact));
                    }
                }
            }
        }
        Rectangle{
            id:wordExplainRec;
            height: 0;
            width: 0;
            clip: true;
            x:page1.width * 0.05;
            y:45;
            property bool isShow: false;
            color: "#CCFFFFFF";
            radius: 5;
            focus: false;
            activeFocusOnTab: false;
            border.width: 1;
            border.color: "#100099FF";
            MouseArea{
                anchors.fill: parent;
                function ifsure(){
                    if(scrollItem.height > wordExplainRec.height){
                        return true;
                    }
                    return false;
                }
                visible: ifsure();
                onWheel: {
                    var datl = wheel.angleDelta.y/120;//一刻滚轮代表正负120度，所以除以120等于1或者-1
                    if(datl > 0){
                        if(vbar.position >=0.05)
                            vbar.position -=0.05;
                    }
                    else
                        if(vbar.position <=0.95)
                            vbar.position +=0.05;
                }
            }

            Item{
                width: wordExplainRec.width;
                x:0;
                y:0;
                id: scrollItem;
                Item {
                    id:queryI;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    anchors.leftMargin: 30;
                    anchors.topMargin: 30;
                    height: 30;
                    Rectangle{
                        anchors.fill: parent;
                        color: "#00000000";
                    }
                    Text {
                        id: queryText;
                        text: qsTr("test");
                        anchors.fill: parent;
                        font.pixelSize: 30;
                        verticalAlignment: Text.AlignVCenter;
                        onTextChanged: {
                            queryI.height = contentHeight;
                            queryI.width = contentWidth;
                        }
                        font.family: fixedFont.name;
                    }
                    onHeightChanged: {
                        scrollItem.height = queryI.height + 60 + phoneticAndSpeech.height + explains.height + webs.height;
                    }

                }
                Item{
                    id: phoneticAndSpeech;
                    anchors.top: queryI.bottom;
                    anchors.topMargin: 10;
                    anchors.left: parent.left;
                    anchors.leftMargin: 30;
                    height: 30;
                    clip: true;
                    width: parent.width - 60;
                    onHeightChanged: {
                        scrollItem.height = queryI.height + 60 + phoneticAndSpeech.height + explains.height + webs.height;
                    }
                    Rectangle{
                        visible: false;
                        anchors.fill: parent;
                        color: "transparent";
                        border.width: 1;
                        border.color: "#08000000";
                    }

                    Rectangle{
                        visible: true;
                        id:speak01
                        width: 30;
                        height: 30;
                        anchors.left: parent.left;
                        anchors.top: parent.top;
                        color: "#000099FF";
                        Image {
                            anchors.fill: parent;
                            id: img01;
                            source: "qrc:/Image/hj.jpeg"
                            anchors.margins: 4;
                        }
                        MouseArea{
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                        }
                    }
                    Rectangle{
                        id:usphoneticRec;
                        height: 30;
                        anchors.left: speak01.right;
                        anchors.top: speak01.top;
                        color: "#00000000";
                        Text{
                            visible: true;
                            anchors.centerIn: parent;
                            verticalAlignment: Text.AlignVCenter;
                            id:usphonetic;
                            text: qsTr("test");
                            font.pixelSize: 11;
                            horizontalAlignment: Text.AlignHCenter;
                            onTextChanged: {
                                usphoneticRec.width = contentWidth;
                            }
                            font.family: fixedFont.name;
                        }
                    }
                    Rectangle{
                        visible: true;
                        id:speak02
                        width: 30;
                        height: 30;
                        anchors.left: usphoneticRec.right;
                        anchors.top: parent.top;
                        anchors.leftMargin: 10;
                        anchors.topMargin: 0;
                        color: "#000099FF";
                        Image {
                            anchors.fill: parent;
                            id: img02;
                            source: "qrc:/Image/hj.jpeg"
                            anchors.margins: 4;
                        }
                        MouseArea{
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                        }
                    }
                    Rectangle{
                        id:ukphoneticRec;
                        height: 30;
                        anchors.left: speak02.right;
                        anchors.top: speak02.top;
                        color: "#00000000";
                        Text{
                            visible: true;
                            anchors.centerIn: parent;
                            verticalAlignment: Text.AlignVCenter;
                            horizontalAlignment: Text.AlignHCenter
                            id:ukphonetic;
                            text: qsTr("test");
                            font.pixelSize: 11;
                            onTextChanged: {
                                ukphoneticRec.width = contentWidth;
                            }
                            font.family: fixedFont.name;

                        }
                    }
                    /*Rectangle{
                        visible: true;
                        id:speak03
                        width: 30;
                        height: 30;
                        anchors.left: speak01.left;
                        anchors.top: speak01.bottom;
                        anchors.leftMargin: 0;
                        anchors.topMargin: 5;
                        color: "#100099FF";
                    }
                    Rectangle{
                        id:phoneticRec;
                        height: 30;
                        anchors.left: speak03.right;
                        anchors.top: speak03.top;
                        color: "#10000000";
                        Text{
                            visible: true;
                            anchors.fill: parent;
                            verticalAlignment: Text.AlignVCenter;
                            horizontalAlignment: Text.AlignHCenter
                            id:phonetic;
                            text: qsTr("test");
                            //height: parent.height;
                            //width: contentWidth;
                            font.pixelSize: 11;
                            onTextChanged: {
                                phoneticRec.width = contentWidth;
                            }

                        }
                    }*/
                }
                Item {
                    id: explains;
                    anchors.left: parent.left;
                    anchors.topMargin: 10;
                    anchors.top: phoneticAndSpeech.bottom;
                    anchors.leftMargin: 30;
                    width: parent.width - 60;
                    Rectangle{
                        anchors.fill: parent;
                        color: "transparent";
                        border.width: 1;
                        border.color: "#08000000";
                    }

                    TextEdit {
                        Rectangle{
                            anchors.fill: parent;
                            color: "#00000000";
                        }
                        selectionColor: "#AA0099FF";
                        id: explainsText;
                        text: qsTr("text");
                        anchors.fill: parent;
                        font.pixelSize: 12;
                        //cursorVisible: false;
                        selectByMouse: true;
                        wrapMode: TextEdit.Wrap;
                        readOnly: true;
                        onTextChanged: {
                            explains.height = contentHeight + 20;
                        }
                        onActiveFocusChanged: {
                            if(!activeFocus){
                                select(0,0);
                            }
                        }
                        font.family: fixedFont.name;

                    }
                    onHeightChanged: {
                        scrollItem.height = queryI.height + 60 + phoneticAndSpeech.height + explains.height + webs.height;
                    }
                }
                Item {
                    id: webs;
                    anchors.left: parent.left;
                    anchors.topMargin: 10;
                    anchors.top: explains.bottom;
                    anchors.leftMargin: 30;
                    width: parent.width - 60;
                    Rectangle{
                        anchors.fill: parent;
                        color: "transparent";
                        border.width: 1;
                        border.color: "#08000000";
                    }
                    TextEdit {
                        Rectangle{
                            anchors.fill: parent;
                            color: "#00000000";
                        }
                        selectionColor: "#AA0099FF";
                        id: websText;
                        text: qsTr("text");
                        anchors.fill: parent;
                        font.pixelSize: 12;
                        //cursorVisible: false;
                        wrapMode: TextEdit.Wrap;
                        readOnly: true;
                        selectByMouse: true;
                        onTextChanged: {
                            webs.height = contentHeight + 20;
                            //explains.width = contentWidth;
                        }
                        onActiveFocusChanged: {
                            if(!activeFocus){
                                select(0,0);
                            }
                        }
                        font.family: fixedFont.name;
                    }
                    onHeightChanged: {
                        scrollItem.height = queryI.height + 60 + phoneticAndSpeech.height + explains.height + webs.height;
                    }
                }
            }
            ScrollBar {
                      id: vbar
                      hoverEnabled: true
                      active: hovered || pressed
                      orientation: Qt.Vertical
                      size: wordExplainRec.height / scrollItem.height
                      anchors.top: parent.top
                      anchors.right: parent.right
                      anchors.bottom: parent.bottom
                      onPositionChanged: {
                          scrollItem.y = -vbar.position * scrollItem.height;
                      }
            }
            ScrollBar {
                      id: hbar
                      hoverEnabled: true
                      active: hovered || pressed
                      orientation: Qt.Horizontal
                      size: wordExplainRec.width / scrollItem.width
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.bottom: parent.bottom
            }

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
                transType = c;
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
