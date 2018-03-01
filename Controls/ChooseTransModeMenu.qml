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
    signal sendChoosed(var a);
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
                color: "#300000FF";
            }
        }
        model: ListModel{
            ListElement{titlename: "汉英互译";col: "#00000000";}
            ListElement{titlename: "日英互译";col: "#00000000";}
            ListElement{titlename: "汉日互译";col: "#00000000";}
            ListElement{titlename: "汉韩互译";col: "#00000000";}
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
                        anchors.fill: parent;
                        horizontalAlignment: Text.AlignHCenter;
                        verticalAlignment: Text.AlignVCenter;
                        id: deltext;
                        text: titlename;
                        color: "black";
                        font.pixelSize: 13;
                    }
                    color: "#00000000";
                    MouseArea{
                        id:delMouA;
                        hoverEnabled: true;
                        anchors.fill: parent;
                        onClicked: {
                            listView.currentIndex = index;
                            hide();
                            //selected();
                            sendChoosed(deltext.text);
                        }
                        onPressed: {/*rec.color = "#100000FF";*/}
                        onReleased: {rec.color = "#00000000";}
                        onEntered: {
                            //setDelTextColor("#500000FF");
                            rec.color = "#200000FF";
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
        to:120;
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
            console.log("choose transMode no focus.")
        }
        else{
            console.log("choose transMode focus.")
        }
    }
    focus: false;
    activeFocusOnTab: false;

}

