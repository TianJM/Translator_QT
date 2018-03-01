import QtQuick 2.0
import "../"
Rectangle{
    id:listViewRec;
    width: 0;
    height: 0;
    clip: true;
    property bool isShow:false;
    property string holdingText : "";
    property int holdingTextLen: 0;
    color: "#EEFFFFFF";
    radius: 7;
    function getString(a){
        console.log("get string " + a);
    }
    function getStringLength(a){
        console.log("get length " + a);
        if(a > 0 && isShow == false){
            showList();
        }
        if(a == 0 && isShow == true){
            hideList();
        }

    }
    PropertyAnimation{
        id:showA;
        target: listViewRec;
        property: "height";
        to:150;
        duration: 100;
    }
    PropertyAnimation{
        id:hideA;
        target: listViewRec;
        property: "height";
        to:0;
        duration: 100;
    }
    function showList(){
        showA.running = true;
        isShow = true;
    }
    function hideList(){
        hideA.running = true;
        isShow = false;
    }

}
