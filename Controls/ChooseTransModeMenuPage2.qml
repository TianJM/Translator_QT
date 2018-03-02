import QtQuick 2.0
import QtQuick.Controls 2.2
import "../"
Rectangle {
    id:body;
    width: parent.width;
    height: 0;
    border.width: 1;
    border.color: "#335577FF";
    color: "#EEFFFFFF";
    signal sendChoosed(var a,var b);
    signal shide();
    property bool isShow: false;
    function setCurrentIndex(a){
        listView.currentIndex = a;
    }
    PropertyAnimation{
        id:menuShow;
        target: body;
        property: "height";
        to:270;
        duration: 100;
    }

    PropertyAnimation{
        id:menuHide;
        target: body;
        property: "height";
        to:0;
        duration: 100;
    }
    function show(){
        menuShow.running = true;
        listView.forceActiveFocus();
        isShow = true;
    }
    function hide(){
        menuHide.running = true;
        isShow = false;
        shide();
    }
    onActiveFocusChanged: {
        if(!body.activeFocus){
            //hide();
            console.log("body no focus.")
        }
        else{
            console.log("body focus.")
        }
    }

    Item{
        id:listViewScroll;
        anchors.fill: parent;
        //focus: true;
        //ScrollBar.horizontal.interactive: true
        //ScrollBar.vertical.interactive: true
        //wheelEnabled: true;
        ListView{
            id:listView;
            interactive: false;
            anchors.fill: parent;
            //currentIndex: 0;
            clip: true;
            focus: false;
            highlight: Rectangle{
                color: "#00000000";
                Rectangle{
                    anchors.fill: parent;
                    radius: 3;
                    color: "#300099FF";
                }
            }
            model: ListModel{
                ListElement{titlename: "自动检测";col: "#00000000";}
                ListElement{titlename: "英文";col: "#00000000";}
                ListElement{titlename: "中文";col: "#00000000";}
                ListElement{titlename: "日文";col: "#00000000";}
                ListElement{titlename: "韩文";col: "#00000000";}
                ListElement{titlename: "俄文";col: "#00000000";}
                ListElement{titlename: "法文";col: "#00000000";}
                ListElement{titlename: "葡萄牙文";col: "#00000000";}
                ListElement{titlename: "西班牙文";col: "#00000000";}
            }
            delegate: listcomponent;
            onCurrentIndexChanged: {
                //console.log("List:"+listView.currentIndex);
            }
            onActiveFocusChanged: {
                if(!listView.activeFocus){
                    hide();
                    console.log("choose transModep2 no focus.")
                }
                else{
                    console.log("choose transModep2 focus.")
                }
            }
        }
        Component{
            id:listcomponent;
            Rectangle{
                id:rec;
                width: parent.width;height: 30;
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
                        sendChoosed(deltext.text,index);
                    }
                    onPressed: {/*rec.color = "#100000FF";*/}
                    onReleased: {rec.color = "#00000000";}
                    onEntered: {
                        //setDelTextColor("#500000FF");
                        rec.color = "#200099FF";
                    }
                    onExited: {
                        //setDelTextColor("gray");
                        rec.color = "#00000000";
                    }
                    cursorShape: Qt.PointingHandCursor;
                }
            }
        }
        onActiveFocusChanged: {
            if(!listViewScroll.activeFocus){
                hide();
                console.log("choose SStransModep2 no focus.")
            }
            else{
                console.log("choose SStransModep2 focus.")
            }
        }
    }
}
