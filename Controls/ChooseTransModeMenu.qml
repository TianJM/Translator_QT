import QtQuick 2.2
import "../"
Rectangle{
    id:listViewRec;
    width: 110;
    height: 0;
    clip: true;
    property bool isShow:false;
    color: "#AAFFFFFF";
    //border.width: 1;
    //border.color: "#300000FF";
    signal sendChoosed(var a,var b);
    radius: 3;
    ListView{
        id:listView;
        interactive: false;
        anchors.fill: parent;
        currentIndex: 0;
        clip: true;
        focus: false;
        activeFocusOnTab: false;
        highlight: Rectangle{
            color: "#00000000";
            Rectangle{
                anchors.fill: parent;
                radius: 3;
                color: "#300090FF";
            }
        }
        model: ListModel{
            ListElement{titlenameL: "自动";titlenameR: "自动";col: "#00000000";}
            ListElement{titlenameL: "中文";titlenameR: "英文";col: "#00000000";}
            ListElement{titlenameL: "中文";titlenameR: "日文";col: "#00000000";}
            ListElement{titlenameL: "中文";titlenameR: "韩文";col: "#00000000";}
            ListElement{titlenameL: "中文";titlenameR: "俄文";col: "#00000000";}
        }
        delegate: listcomponent;
        onCurrentIndexChanged: {
            //console.log("List:"+listView.currentIndex);
        }
        onActiveFocusChanged: {
            if(!listView.activeFocus){
                console.log("choose transMode no focus.")
                hide();
            }
            else{
                console.log("choose transMode focus.")
            }
        }
    }
    Component{
                id:listcomponent;
                Rectangle{
                    id:rec;
                    width: 110;height: 30;
                    radius: 3;
                    //color: "#90FFFFFF";
                    function setDelTextColor(a){deltext.color = a;}
                    Text {
                        anchors.left: parent.left;
                        anchors.top: parent.top;
                        //anchors.leftMargin: 2;
                        height: parent.height;
                        width: (parent.width - 30)/2;
                        id: deltextL;
                        text: titlenameL;
                        font.pixelSize: 14;
                        verticalAlignment: Text.AlignVCenter;
                        horizontalAlignment: Text.AlignRight;
                    }
                    Item{
                        id:gloimgI
                        height: 30;
                        width: 30;
                        anchors.left: deltextL.right;
                        anchors.top: parent.top;
                        Image {
                            id: gloimg
                            anchors.fill: parent;
                            anchors.margins: 7;
                            source: "qrc:/Image/lr3.png"
                        }
                    }

                    Text {
                        anchors.left: gloimgI.right;
                        anchors.top: parent.top;
                        //anchors.leftMargin: 2;
                        height: parent.height;
                        width: (parent.width - 30)/2;
                        id: deltextR;
                        text: titlenameR;
                        font.pixelSize: 14;
                        verticalAlignment: Text.AlignVCenter;
                        horizontalAlignment: Text.AlignLeft;
                    }
                    color: "#00000000";
                    MouseArea{
                        id:delMouA;
                        hoverEnabled: true;
                        anchors.fill: parent;
                        onClicked: {
                            listView.currentIndex = index;
                            hide();
                            toM();
                            //selected();
                            sendChoosed(deltextL.text,deltextR.text);
                        }
                        onPressed: {/*rec.color = "#100000FF";*/}
                        onReleased: {rec.color = "#00000000";}
                        onEntered: {
                            //setDelTextColor("#500000FF");
                            rec.color = "#200090FF";
                        }
                        onExited: {
                            //setDelTextColor("gray");
                            rec.color = "#00000000";
                        }
                        cursorShape: Qt.PointingHandCursor;
                    }
                }
            }
    PropertyAnimation{
        id:menuShow;
        target: listViewRec;
        property: "height";
        to:150;
        duration: 300;
    }
    PropertyAnimation{
        id:menuHide;
        target: listViewRec;
        property: "height";
        to:0;
        duration: 300;
    }
    function show(){
        menuShow.running = true;
        forceActiveFocus();
        isShow = true;
    }
    function hide(){
        menuHide.running = true;
        isShow = false;

    }
    onActiveFocusChanged: {
        if(!listViewRec.activeFocus){
            hide();
            toM();
            console.log("choose transMode no focus.")
        }
        else{
            console.log("choose transMode focus.")
        }
    }
    focus: false;
    activeFocusOnTab: false;

}

