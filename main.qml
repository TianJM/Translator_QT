import QtQuick 2.9
import QtQuick.Window 2.2
import QtQml 2.2
//import QtQml 2.0
//import QtQuick.Controls.Material 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "Controls" as MyControls

Window {
    id:window
    visible: true;
    width: 800;
    height: 500;
    minimumHeight: 500;
    minimumWidth: 800;
    title: qsTr("Translator");
    flags: Qt.FramelessWindowHint | Qt.Window;
    onFocusObjectChanged:{

    }
    onActiveFocusItemChanged: {

    }
    onActiveChanged: {
        if(window.active){
            if(rightView.currentIndex == 0){
                console.log("window focus.");
                if(page1.returnIsMini()){
                    page1.textM2L();
                }
            }
            //console.log("1." + window.activeFocusItem);
            if(rightView.currentIndex == 0)
                page1.focusOnTextInput();
            //console.log("2." + window.activeFocusItem);
        }
        else console.log("window no focus.");
    }
    x:200;y:100;
    onVisibilityChanged: {
        if(mainWinTop.ss == 1){
            mainWinTop.ss = 0;
            window.visibility = Window.Maximized;
        }
        if(window.visibility == Window.Maximized){
            maxOrnormalButton.iconSource = "qrc:/Image/normal.png";
        }
        else if(window.visibility == Window.Windowed){
            maxOrnormalButton.iconSource = "qrc:/Image/max.png";
        }
    }
    Item{
        id: mainWin;
        anchors.fill: parent;
        clip: true;
        //radius: 20;
        //border.width: 3;
        focus:true;
        activeFocusOnTab: false;
        Keys.enabled: true;
        Keys.priority: Keys.BeforeItem;
        Keys.onPressed: {
            console.log("mainWin detect " + event.key);
            if(event.key == Qt.Key_Alt){
                toNextView();
                event.accepted = true;
            }
            /*if(rightView.currentIndex == 0){
                for(var s =39; s <= 96;s++){
                    if(event.key == s){
                        if(!page1.returnTextIsActive()){
                            page1.focusOnTextInput();
                            //page1.textInputAdd();
                        }
                    }
                }
            }*/
        }

        function toNextView(){
            listView.currentIndex += 1;
            if(listView.currentIndex == 6){
                for(var i = 6;i >0;listView.currentIndex = --i);
            }
        }
        Image {
            id: mainBag;
            anchors.fill: parent;
            fillMode: Image.PreserveAspectCrop;
            smooth: true;
            source: "qrc:/Image/yzk02.jpg";
            opacity: 0.9;
            focus:false;
            activeFocusOnTab: false;
        }
        Rectangle{
            id:mainWinLeft;
            width: 150;height: parent.height;
            anchors.top: parent.top;anchors.left: parent.left;
            color: Qt.rgba(1,1,1,0.8);
            focus: false;
            activeFocusOnTab: false;
            Keys.enabled: true;
            Keys.onPressed: {
                console.log("mainWinLeft detect " + event.key);
            }

            Image {
                id: logoImg;
                source: "qrc:/Image/hj2.gif";
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.leftMargin: 35;
                anchors.topMargin: 20;
                width: 80;
                height: 80;
                focus: false;
                activeFocusOnTab: false;
                fillMode: Image.Stretch;
                Rectangle{
                    anchors.fill: parent;
                    //border.width: 2;
                    color: "#00000000";
                }

            }
            Text {
                id: logoText;
                width: 80;height: 35;
                horizontalAlignment: Text.AlignHCenter;
                text: qsTr("**词典");
                color:"#BB000000";
                //font.bold: true;
                font.pixelSize: 17;
                font.weight: Font.Medium;
                //font.wordSpacing: 10
                font.letterSpacing: 1;
                anchors.top: logoImg.bottom;
                anchors.left: parent.left;
                anchors.leftMargin: 35;
                anchors.topMargin: 5;
                focus: false;
                activeFocusOnTab: false;
            }
            Item{
                id:winLeftMiddle;
                anchors.left: mainWinLeft.left;anchors.top: logoText.bottom;
                height: mainWinLeft.height - logoImg.height - logoText.height - winLeftBottom.height - 20;
                width: 150;
                focus: false;
                activeFocusOnTab: false;
                Keys.enabled: true;
                Keys.onPressed: {
                    console.log("mainWinLeftMiddle detect " + event.key);
                }
                Component{
                    id:delegateTem;
                    Rectangle{
                        id:rec;
                        width: 150;height: 40;
                        focus: false;
                        activeFocusOnTab: false;
                        function setDelTextColor(a){deltextR.color = a;deltextL.color = a;}
                        Text {
                            anchors.left: parent.left;
                            anchors.leftMargin: 20;
                            anchors.top: parent.top;
                            height: parent.height - 4;
                            horizontalAlignment: Text.AlignLeft;
                            verticalAlignment: Text.AlignVCenter;
                            width: 23;
                            id: deltextL;
                            text: titlenameL;
                            color: "gray";
                            font.pixelSize: 20;
                            focus: false;
                            activeFocusOnTab: false;
                        }
                        Text {
                            anchors.left: deltextL.right;
                            anchors.top: parent.top;
                            //anchors.leftMargin: 20;
                            height: parent.height;
                            horizontalAlignment: Text.AlignLeft;
                            verticalAlignment: Text.AlignVCenter;
                            id: deltextR;
                            text: titlenameR;
                            color: "gray";
                            font.pixelSize: 14;
                            focus: false;
                            activeFocusOnTab: false;
                        }
                        color: col;
                        MouseArea{
                            id:delMouA;
                            hoverEnabled: true;
                            anchors.fill: parent;
                            onClicked: {listView.currentIndex = index;}
                            onPressed: {/*rec.color = "#100000FF";*/}
                            onReleased: {rec.color = "#00000000";}
                            onEntered: {
                                setDelTextColor("#FF000000");
                                rec.color = "#050000FF";
                            }
                            onExited: {
                                setDelTextColor("gray");
                                rec.color = "#00000000";
                            }
                            cursorShape: Qt.PointingHandCursor;
                            focus: false;
                            activeFocusOnTab: false;
                        }
                    }
                }      
                ListModel{
                    id: mymodel0
                    ListElement{titlenameL: "Ⓐ";titlenameR: " 查词";col: "#00000000";}
                    ListElement{titlenameL: "✏";titlenameR: " 翻译";col: "#00000000";}
                    ListElement{titlenameL: "📙";titlenameR: " 单词本";col: "#00000000";}
                    ListElement{titlenameL: "📚";titlenameR: " 长句本";col: "#00000000";}
                    ListElement{titlenameL: "🔨";titlenameR: " 设置";col: "#00000000";}
                    ListElement{titlenameL: "😜";titlenameR: " 关于";col: "#00000000";}
                }

                ListView{
                    id:listView;
                    interactive: false;
                    currentIndex: 0;
                    anchors.fill: parent;
                    highlight: Rectangle{
                        color: "#100099FF";
                        Rectangle{
                            anchors.left: parent.left;
                            anchors.top: parent.top;
                            height: parent.height;
                            width: 3.5;
                            color: "#FF0099FF";
                        }
                    }
                    Keys.enabled: true;
                    Keys.onPressed: {
                        console.log("mainWinLeftMiddleListView detect " + event.key);
                    }
                    model: mymodel0;
                    delegate: delegateTem;
                    onCurrentIndexChanged: {
                        //console.log("List:"+listView.currentIndex);
                    }
                    focus: false;
                    activeFocusOnTab: false;
                }
            }
            Rectangle{
                id:winLeftBottom;
                color: Qt.rgba(0,0,0,0);
                anchors.left: mainWinLeft.left;
                anchors.top: winLeftMiddle.bottom;
                width: mainWinLeft.width;
                height: 100;
                focus: false;
                activeFocusOnTab: false;
                //border.color: "#800000FF";
                //border.width: 1;

            }
        }
        Rectangle{
            id: mainWinRight;
            width: parent.width - 150;height: parent.height;
            anchors.top: parent.top;anchors.right: parent.right;
            clip: true;
            color: "#05FFFFFF";
            focus: false;
            activeFocusOnTab: false;
            Keys.enabled: false;
            SwipeView{
                clip: true;
                id:rightView;
                focus: false;
                activeFocusOnTab: false;
                anchors.top: mainWinRight.top;
                anchors.left: mainWinRight.left;
                anchors.topMargin: 20;
                anchors.leftMargin: 20;
                width: mainWinRight.width - 40;
                height: mainWinRight.height - 30;
                orientation: Qt.Vertical;
                Keys.enabled: true;
                Keys.onPressed: {
                    console.log("SwipeView detect " + event.key);
                }
                interactive: false;
                Page1{id:page1}Page2{id:page2}Page3{id:page3}
                Page4{id:page4}Page5{id:page5}Page6{id:page6}
                onCurrentIndexChanged: {
                    listView.currentIndex = rightView.currentIndex;
                    console.log("swipe:"+rightView.currentIndex);
                    if(rightView.currentIndex == 0){
                        if(page1.returnIsMini()){
                            page1.textM2L();
                        }
                        if(page1.returnIsWRShow()){
                            page1.showWRG();
                        }

                        //page1.focusOnTextInput();
                    }
                    else{
                        if(!page1.returnIsMini()){
                            page1.textL2M();
                        }
                        if(page1.returnIsWRShow()){
                            page1.hideWRG();
                            page1.changeIsShowWRFlag(true);
                        }
                    }
                    if(rightView.currentIndex == 1){

                    }
                    if(rightView.currentIndex == 2){

                    }
                    if(rightView.currentIndex == 3){

                    }
                    if(rightView.currentIndex == 4){

                    }
                    if(rightView.currentIndex == 5){

                    }
                }
                currentIndex: listView.currentIndex;
            }
        }
        Item{
            id: mainWinTop;
            width: parent.width;height: 30;
            //visible: false;
            anchors.left: parent.left;anchors.top: parent.top;
            property int ss: 0;property point winPos: "0,0";
            property var winWidth;property var winHeight;
            focus: false;
            activeFocusOnTab: false;
            function getWinStatus(){
                winPos = Qt.point(window.x,window.y);
                winWidth = window.width;
                winHeight = window.height;
            }
            function setWinStatus(){
                window.setWInPoint(winPos.x,winPos.y);
                window.width = winWidth;
                window.height = winHeight;
            }

            MouseArea{
                id:windowMouseArea;
                anchors.fill: parent;
                width: parent.width;height: parent.height;
                property point clickPoint: "0,0";
                acceptedButtons: Qt.LeftButton;
                focus: false;activeFocusOnTab: false;
                onPressed: {
                    clickPoint  = Qt.point(mouse.x, mouse.y);
                }
                onPositionChanged: {
                    /*
                    if(window.visibility == Window.Maximized){
                        console.log(window.width,clickPoint.x);
                        var temx = clickPoint.x/window.width;
                        console.log(temx);
                        temx = mainWinTop.winWidth * temx;
                        var temy = clickPoint.y;
                        console.log(temx);
                        window.visibility = Window.Windowed;
                        window.width = mainWinTop.winWidth;
                        window.height = mainWinTop.winHeight;
                        window.setWInPoint(clickPoint.x - temx,clickPoint.y - temy);
                    }
                    */
                    var offset = Qt.point(mouse.x - clickPoint.x, mouse.y - clickPoint.y);
                    //window.setX(offset.x += window.x);
                    //window.setY(offset.y += window.y);
                    window.setWInPoint(offset.x, offset.y);
                }

                onDoubleClicked: {
                    /*
                    if(window.visibility == Window.Maximized)
                    {
                        window.visibility = Window.Windowed;
                        //minimizeButton.visible = true;
                        mainWinTop.setWinStatus();
                    }
                    else if(window.visibility == Window.Windowed)
                    {
                        window.visibility = Window.Maximized;
                        mainWinTop.getWinStatus();
                        //minimizeButton.visible = false;
                    }
                    */
                }

            }
            Component{
                id:btnstyle;
                ButtonStyle{
                    background: Rectangle{
                        color: Qt.rgba(0,0,0,0);
                        radius: 100;
                        function getClickStatusWi(a,b)
                        {
                            if(a)
                                return 2;
                            else if(b)
                                return 1;
                            else return 0;
                        }
                        border.width: getClickStatusWi(control.pressed , control.hovered);
                        function getClickStatusCo(a,b)
                        {
                            var s = "#100000FF";
                            if(a)
                                s = "#DD9999FF";
                            else if(b)
                                s = "#DD9999FF";
                                return s;
                        }
                        border.color: getClickStatusCo(control.pressed , control.hovered);

                    }
                }
            }
            Button{
                id: closeButton;
                //visible: false;
                height: 20;width: 20;
                anchors.right: mainWinTop.right;
                anchors.top: parent.top;
                anchors.rightMargin: 5;
                anchors.topMargin: 5;
                iconSource:"qrc:/Image/close.png";
                focus: false;activeFocusOnTab: false;
                onClicked:{
                    Qt.quit();
                }
                style:btnstyle;


            }
            Button{
                id: maxOrnormalButton;
                //visible: false;
                height: 20;width: 20;
                anchors.right: closeButton.left;
                anchors.top: parent.top;
                anchors.rightMargin: 5;
                anchors.topMargin: 5;
                iconSource:"qrc:/Image/max.png";
                focus: false;activeFocusOnTab: false;
                onClicked:{
                    if(window.visibility == Window.Maximized)
                    {
                        window.visibility = Window.Windowed;
                        //mainWinTop.setWinStatus();
                    }
                    else if(window.visibility == Window.Windowed)
                    {
                        window.visibility = Window.Maximized;
                        //mainWinTop.getWinStatus();
                    }
                }
                style:btnstyle;
            }
            Button{
                id: minimizeButton;
                //visible: false;

                height: 20;width: 20;
                anchors.right: maxOrnormalButton.left;
                anchors.top: parent.top;
                anchors.rightMargin: 5;
                anchors.topMargin: 5;
                iconSource:"qrc:/Image/minimize.png";
                focus: false;activeFocusOnTab: false;
                onClicked:{
                    if(window.visibility == Window.Maximized)
                        mainWinTop.ss = 1;
                    window.visibility = Window.Minimized;
                }
                style:btnstyle;
            }
        }
    }
    function setWInPoint(a,b){
        window.x += a;
        window.y += b;
    }
}
