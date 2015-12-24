import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1

Rectangle {
    color: Theme.backgroundColor
    anchors.leftMargin: title.visible ? 0 :100
    Behavior on anchors.leftMargin {
        NumberAnimation { duration: 200 }
    }

    IconButton{
        iconSource: "icon://user/MAG"
    }
    Image{
        x:100;
        y:100;
        source: "MAG.png"
        sourceSize {
            width:24;
            height:24;
        }
    }

}

