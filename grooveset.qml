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
    property int currentgroove:appconfig.currentgroove;
    property var teachmodename: ["自动","半自动","手动"];
    property var teachfisrtpointmodel: ["右方","左方"];
    //property var pagedata:DB.getPageFunctionAndValueFromTable(grooveset.currentgroove,255);
    anchors.left: parent.left
    anchors.leftMargin: grooveset.visible ? 0 :100
    Behavior on anchors.leftMargin {
        NumberAnimation { duration: 200 }
    }
    /*当前坡口改变即处理数据*/
    onCurrentgrooveChanged: {
        switch(DB.getValueFromFuncOfTable(grooveset.currentgroove,"function","示教模式")){
        case "自动":teachmodegroup.current=teachmoderepeater.itemAt(0);break;
        case "半自动":teachmodegroup.current=teachmoderepeater.itemAt(1);break;
        case "手动":teachmodegroup.current=teachmoderepeater.itemAt(2);break;
        };
        switch(DB.getValueFromFuncOfTable(grooveset.currentgroove,"function","示教第1点位置")){
        case "左方":teachfisrtpointgroup.current=teachfirstpointrepeater.itemAt(0);break;
        case "右方":teachfisrtpointgroup.current=teachfirstpointrepeater.itemAt(1);break;
        }
    }
    /*坡口列表*/
    property var groovestyles: [
        qsTr( "平焊单边V型坡口T接头"), qsTr( "平焊单边V型坡口平对接"),  qsTr("平焊V型坡口平对接"),  qsTr("水平角焊"),
        qsTr("横焊单边V型坡口T接头"), qsTr( "横焊单边V型坡口平对接"),  qsTr("横焊V型坡口平对接"),  qsTr("立焊单边V型坡口平对接"), qsTr("立焊V型坡口平对接")  ]
    Sidebar{
        id:groovelist
        anchors{
            left:parent.left
            top:parent.top
            bottom: parent.bottom
        }
        style: "dark"
        width:Units.dp(255);
        focus: true
        Column{
            id:stand
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
                        for(var i=0;i<9;i++){
                            if(i===index) groove.selected=true;
                            else repeat.itemAt(i).selected=false
                        }
                        appconfig.currentgroove=index;
                    }
                    selected: (grooveset.currentgroove === index) ? true : false
                }
            }
        }
    }
    Column{
        anchors.left: groovelist.right
        anchors.top:parent.top
        anchors.right: parent.right
        ListItem.SectionHeader{
            id:teachmodeset
            text:qsTr("示教设置")
            style: "subheading"
            showDivider: true;
            iconName: "awesome/gears"
        }
        /*示教模式设置*/
        ListItem.Subtitled{
            id:teachmode
            text:qsTr("示教模式:");
            anchors.left: parent.left
            anchors.leftMargin: Units.dp(48)
            backgroundColor: Theme.backgroundColor
            height:teachmodeset.height
            visible: teachmodeset.expanded
            secondaryItem:Row{
                anchors.verticalCenter: parent.verticalCenter
                QuickControls.ExclusiveGroup { id: teachmodegroup;onCurrentChanged:
                        DB.setValueFromFuncOfTable(grooveset.currentgroove,"示教模式",teachmodegroup.current.text)}
                Repeater{
                    id:teachmoderepeater
                    model:teachmodename
                    delegate:RadioButton{
                        text:modelData
                        darkBackground:Theme.isDarkColor(Theme.backgroundColor)
                        exclusiveGroup: teachmodegroup
                    }
                }
            }
        }
        /*示教第一点位置*/
        ListItem.Subtitled{
            id:teachfirstpoint
            text:qsTr("示教第一点位置:");
            anchors.left: parent.left
            anchors.leftMargin: Units.dp(48)
            backgroundColor: Theme.backgroundColor
            height:teachmodeset.height
            visible: teachmodeset.expanded
            secondaryItem:Row{
                anchors.verticalCenter: parent.verticalCenter
                QuickControls.ExclusiveGroup { id: teachfisrtpointgroup;onCurrentChanged:
                        DB.setValueFromFuncOfTable(grooveset.currentgroove,"示教第1点位置",teachfisrtpointgroup.current.text)}
                Repeater{
                    id:teachfirstpointrepeater
                    model:teachfisrtpointmodel
                    delegate:RadioButton{
                        text:modelData
                        darkBackground:Theme.isDarkColor(Theme.backgroundColor)
                        exclusiveGroup: teachfisrtpointgroup
                    }
                }
            }
        }
    }
    Dialog{
        id:teachmodedialog
    }
}
