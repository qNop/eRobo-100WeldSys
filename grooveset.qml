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
//import "Popslider.qml"

Rectangle{
    id:grooveset
    color:Theme.backgroundColor
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
           bottom: parent.bottom
       }
    backgroundColor: parent.color
    width:Units.dp(260);
    ListItem.Subheader{
        id:header
        width:parent.width
        text:qsTr("坡口");
        style: "subheading"
        showDivider: true;
        backgroundColor: parent.color
    }
    Column{
        id:stand
        anchors.top:header.bottom
        width:parent.width
         Repeater{
                 model:groovestyles;
                 delegate:ListItem.Standard{
                     text:modelData;
                     textColor: Theme.lightDark(groovelist.backgroundColor,Theme.light.textColor,Theme.dark.textColor)
                 }
            }
    }
   }
   Card{
       id:teachmodeset
       anchors.left: groovelist.right
       anchors.leftMargin: Units.dp(16)
       anchors.top:parent.top
       anchors.topMargin: Units.dp(16)
       anchors.right: parent.right
       anchors.rightMargin: Units.dp(16)
       height:modelist.height
       backgroundColor: parent.color
       ListItem.Subtitled{
           id:modelist
           text:qsTr("示教模式")
           secondaryItem:Row{
                 anchors.verticalCenter: parent.verticalCenter
                 QuickControls.ExclusiveGroup { id: mode }
                 RadioButton {
                     id:auto
                     text: qsTr("全自动")
                     checked: true
                     exclusiveGroup: mode
                 }
                 RadioButton {
                     id:handleauto
                     text:qsTr("半自动")
                     exclusiveGroup: mode
                 }
                 RadioButton {
                     id:handle
                     text: qsTr("手动")
                     exclusiveGroup: mode
                 }
           }
           onClicked: {
                if(auto.checked){
                    handleauto.checked=true;
                }else if(handleauto.checked){
                    handle.checked=true;
                }else if(handle){
                    auto.checked=true;
                }
           }
           action:IconButton{
                    anchors.centerIn: parent
                    iconName: "awesome/gears"
                    size:Units.dp(45)
                    onClicked: {teachmodedialog.show();}
           }
       }
   }
   Dialog{
       id:teachmodedialog
   }
}
