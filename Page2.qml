import QtQuick 2.0
import QtQuick.Controls 2.2
import MyHttp 1.0
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
            transitionTextEdit.text = httpO.returnrTranslation();
        }
    }
    function doHttp(i,a,b){
        httpO.inithttp(i,originTextEdit.text,a,b);
        httpO.get();
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
                z:0;
                id:buttonRange;
                x:0;
                y:(parent.height - 40) * 0.5;
                width: parent.width;
                height: 40;
                //border.width: 1;
                //border.color: "#10000000";
                color: "#030099FF";
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
                    width: 130;
                    height: 30;
                    border.width: 1;
                    border.color: "#335577FF";
                    Rectangle{
                        id:le
                        anchors.left: parent.left;
                        anchors.top: parent.top;
                        width: 100;
                        height: parent.height;
                        //border.width: 2;
                        //border.color: "#550077FF";
                        color: "#110077FF";
                        MouseArea{
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                        }
                    }
                    Rectangle{
                        id:ri
                        anchors.left: le.right;
                        anchors.top: le.top;
                        width: parent.width - le.width;
                        height: parent.height;
                        color: "#335577FF";
                        border.width: 1;
                        border.color: "#885599FF"
                        Image {
                            id: img
                            source: "qrc:/Image/search.png"
                            anchors.centerIn: parent;
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
                                doHttp(false,"EN","zh-CHS");
                            }
                        }
                    }
                }

            }
            Rectangle{
                z:0;
                id:transitionRange;
                x:0;
                y:(parent.height - 40) * 0.5 + 50;
                width: parent.width;
                height: (parent.height - 40) * 0.5;
                //border.width: 1;
                color: "#00FFFFFF";
                radius: 3;
                Text {
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
