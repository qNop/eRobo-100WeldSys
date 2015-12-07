import QtQuick 2.2
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import WeldSys.ERModbus 1.0
import WeldSys.ERLed 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.LocalStorage 2.0
import "qrc:/Database.js" as DB
import "CanvasPaint.js" as Paint

Rectangle{
    id:grooveset
    color:Theme.backgroundColor
    APPConfig{id:appconfig}
    property int currentgroove: appconfig.currentgroove
    anchors.left: parent.left
    anchors.leftMargin: grooveset.visible ? 0 :100
    Behavior on anchors.leftMargin {
        NumberAnimation { duration: 200 }
    }
    Component.onCompleted: {
    console.log( DB.gettablelegth("FlatWeldSingleBevelGrooveT")   )
    }
    /*坡口列表*/
    property var groovestyles: [
        qsTr( "平焊单边V型坡口T接头"), qsTr( "平焊单边V型坡口平对接"),  qsTr("平焊V型坡口平对接"),  qsTr("水平角焊"),
        qsTr("横焊单边V型坡口T接头"), qsTr( "横焊单边V型坡口平对接"),  qsTr("横焊V型坡口平对接"),  qsTr("立焊单边V型坡口平对接"), qsTr("立焊V型坡口平对接")  ]
    Card{
        id:groovelist
        elevation:2;
        anchors{
            left:parent.left
            top:parent.top
        }
        backgroundColor: parent.color
        width:Units.dp(260);
        height: header.height +stand.height
        ListItem.Subheader{
            id:header
            width:parent.width
            text:qsTr("坡口");
            style: "subheading"
            showDivider: true;
        }
        Column{
            id:stand
            anchors.top:header.bottom
            width:parent.width
            Repeater{
                id:repeat
                model:groovestyles;
                delegate:ListItem.Standard{
                    id:groove
                    text:modelData;
                    textColor: groove.selected ? Theme.lightDark(groovelist.backgroundColor,Theme.light.accentColor,Theme.dark.textColor)
                                               :Theme.lightDark(groovelist.backgroundColor,Theme.light.shade(0.6),Theme.dark.shade(0.6))
                    onClicked: {
                        var i;
                        for(i=0;i<9;i++){
                            if(i===index)
                                groove.selected=true;
                            else
                                repeat.itemAt(i).selected=false
                        }
                        appconfig.currentgroove=index;
                    }
                    selected: (grooveset.currentgroove === index) ? true : false
                }
            }
        }
    }
    ListItem.Subheader{
        id:modelist
        text:qsTr("示教模式")
        anchors.left: groovelist.right
        anchors.leftMargin: 24
        anchors.top:parent.top
        anchors.right: parent.right
        style: "subheading"
        showDivider: true;
    }


        //            Row{
        //                anchors.verticalCenter: parent.verticalCenter
        //                QuickControls.ExclusiveGroup { id: mode }
        //                RadioButton {
        //                    id:auto
        //                    text: qsTr("全自动")
        //                    checked: true
        //                    exclusiveGroup: mode
        //                }
        //                RadioButton {
        //                    id:handleauto
        //                    text:qsTr("半自动")
        //                    exclusiveGroup: mode
        //                }
        //                RadioButton {
        //                    id:handle
        //                    text: qsTr("手动")
        //                    exclusiveGroup: mode
        //                }
        //            }
        //            onClicked: {
        //                if(auto.checked){
        //                    handleauto.checked=true;
        //                }else if(handleauto.checked){
        //                    handle.checked=true;
        //                }else if(handle){
        //                    auto.checked=true;
        //                }
        //            }
        //            action:IconButton{
        //                anchors.centerIn: parent
        //                iconName: "awesome/gears"
        //                size:Units.dp(45)
        //                onClicked: {teachmodedialog.show();}
        //            }
        //   }
    Dialog{
        id:teachmodedialog
    }
//    BottomSheet{
//        id:bottom
//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        anchors.top:groovelist.bottom
//        //backgroundColor: Theme.primaryDarkColor
//        //radius: 0
//        Label{
//            id:groovetext
//            anchors.left: parent.left
//            anchors.leftMargin: Units.dp(16)
//            anchors.verticalCenter: parent.verticalCenter
//            text:qsTr("系统状态:")
//            style: "subheading"
//            color: Theme.lightDark(bottom.backgroundColor,Theme.light.textColor,Theme.dark.textColor)
//        }
//    }
}
