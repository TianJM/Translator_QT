import QtQuick 2.0

Item {
    id:page3;
    Rectangle{
        anchors.fill: parent;
        //border.width: 3;
        color: "#20000000";
    }

    Text {

        anchors.fill: parent;
        color: "blue";
        id: tex1;
        text: qsTr("Page3")
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
    }

}
