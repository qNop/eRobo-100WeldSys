import QtQuick 2.2
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import WeldSys.ERModbus 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Controls 1.3 as QuickControls
import QtQuick.LocalStorage 2.0
import "qrc:/Database.js" as DB
import "CanvasPaint.js" as Paint


Rectangle{
    id:grooveset
    color:Theme.backgroundColor
        APPConfig{id:appconfig}
    property int currentGroove:appconfig.currentGroove
    property var teachmodemodel: ["自动","半自动","手动"];
    property var startendcheckmodel:["自动","手动"]
    property var teachfisrtpointmodel: ["右方","左方"];
    //property var pagedata:DB.getPageFunctionAndValueFromTable(grooveset.currentGroove,255);
    anchors.left: parent.left
    anchors.leftMargin: grooveset.visible ? 0 :100
    Behavior on anchors.leftMargin {
        NumberAnimation { duration: 200 }
    }
    focus: true;
    Keys.onPressed: {
        console.log(event.key);
        switch(event.key){
        case Qt.Key_Up:
            event.accepted = true;
            break;
        case Qt.Key_Down:
            event.accepted = true;
            break;
        case Qt.Key_Left:
            event.accepted = true;
            break;
        case Qt.Key_Right:
            event.accepted = true;
            break;
        case Qt.Key_1:
            if(grooveset.visible){
                changeindex();
              //  groovelist.visible=!groovelist.visible;
               event.accepted = true;
            }
            break;
        }
    }
    /*当前坡口改变即处理数据*/
    onCurrentGrooveChanged: {
        switch(DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","示教模式")){
        case "自动":teachmodegroup.current=teachmoderepeater.itemAt(0);break;
        case "半自动":teachmodegroup.current=teachmoderepeater.itemAt(1);break;
        case "手动":teachmodegroup.current=teachmoderepeater.itemAt(2);break;
        };
        switch(DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","示教第1点位置")){
        case "右方":teachfisrtpointgroup.current=teachfirstpointrepeater.itemAt(0);break;
        case "左方":teachfisrtpointgroup.current=teachfirstpointrepeater.itemAt(1);break;
        }
        switch(DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","始终端检测")){
        case "自动":startendcheckgroup.current=startendcheckrepeater.itemAt(0);break;
        case "手动":startendcheckgroup.current=startendcheckrepeater.itemAt(1);break;
        }
    }
    /*坡口列表*/
    property var groovestyles: [
        qsTr( "平焊单边V型坡口T接头"), qsTr( "平焊单边V型坡口平对接"),  qsTr("平焊V型坡口平对接"),  qsTr("水平角焊"),
        qsTr("横焊单边V型坡口T接头"), qsTr( "横焊单边V型坡口平对接"),  qsTr("横焊V型坡口平对接"),  qsTr("立焊单边V型坡口平对接"), qsTr("立焊V型坡口平对接")  ]
    /*数据库参数列表*/
    property var teachSetList: [qsTr( "示教模式"),qsTr( "始终端检测"),qsTr( "示教第一点位置"),qsTr( "示教第一点时焊接长"),
        qsTr( "示教点数"),qsTr( "板厚"),qsTr( "余高"),qsTr( "坡口检测点左"),qsTr( "坡口检测点右"),qsTr( "板厚补正"),qsTr( "角度补正"),qsTr( "间隙补正"),]
    property int keyindex: 0;
    onKeyindexChanged: {
        console.log("keyindexchanged")
    }
    Component.onCompleted: {
        forceActiveFocus();
        console.log(grooveset.activeFocus);
    }

 //   signal changeindex();
    function changeindex() {
        grooveset.currentGroove++;
        if(grooveset.currentGroove>8){
            grooveset.currentGroove=0;
        }
    }
    Sidebar{
        id:groovelist
        anchors{
            left:parent.left
            top:parent.top
            bottom: parent.bottom
        }
        style: "dark"
        width:Units.dp(255);
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
                        appconfig.currentGroove=index;
                    }
                    selected: (grooveset.currentGroove === index) ? true : false
                }
            }
        }
    }
    Flickable{
        id:fickable
        anchors {
            left: groovelist.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        clip: true
        contentHeight: Math.max(parent.implicitHeight + 40, height)
        Column{
            anchors.fill: parent
            ListItem.SectionHeader{
                id:teachmodeset
                text:qsTr("示教设置")
                style: "subheading"
                showDivider: true;
                iconName: "awesome/gears"
                expanded: true;
            }
            /*示教模式设置*/
            ListItem.Subtitled{
                id:teachmode
                text:qsTr("示教模式:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) :  teachmode.visible ? Units.dp(48): Units.dp(148) ;
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                secondaryItem:Row{
                    anchors.verticalCenter: parent.verticalCenter
                    QuickControls.ExclusiveGroup { id: teachmodegroup;onCurrentChanged:
                            DB.setValueFromFuncOfTable(grooveset.currentGroove,"示教模式",teachmodegroup.current.text)}
                    Repeater{
                        id:teachmoderepeater
                        model:teachmodemodel
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
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : teachfirstpoint.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded
                secondaryItem:Row{
                    anchors.verticalCenter: parent.verticalCenter
                    QuickControls.ExclusiveGroup { id: teachfisrtpointgroup;onCurrentChanged:
                            DB.setValueFromFuncOfTable(grooveset.currentGroove,"示教第1点位置",teachfisrtpointgroup.current.text)}
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
            /*始终端检测*/
            ListItem.Subtitled{
                id:startendcheck
                text:qsTr("始终端检测:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : teachfirstpointtimelength.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text !== "手动")
                secondaryItem:Row{
                    anchors.verticalCenter: parent.verticalCenter
                    QuickControls.ExclusiveGroup { id: startendcheckgroup;onCurrentChanged:
                            DB.setValueFromFuncOfTable(grooveset.currentGroove,"始终端检测",startendcheckgroup.current.text)}
                    Repeater{
                        id:startendcheckrepeater
                        model:startendcheckmodel
                        delegate:RadioButton{
                            text:modelData
                            darkBackground:Theme.isDarkColor(Theme.backgroundColor)
                            exclusiveGroup: startendcheckgroup
                        }
                    }
                }
            }
            /*示教1点时焊接长(mm)*/
            ListItem.Subtitled{
                id:teachfirstpointtimelength
                text:qsTr("示教一点时焊接长:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : teachfirstpointtimelength.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded
                secondaryItem:Label{
                    id: teachfirstpointtimelengthglabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","示教1点时焊接长(mm)")+"(mm)"
                    style:"subheading"
                }
            }
            /*板厚(mm)*/
            ListItem.Subtitled{
                id:thick
                text:qsTr("板厚:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : thick.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text === "自动")
                secondaryItem:Label{
                    id: thicklabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","板厚(mm)") === "测定" ?"测定":DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","板厚(mm)")+"(mm)"
                    style:"subheading"
                }
            }
            /*余高(mm)*/
            ListItem.Subtitled{
                id:restheight
                text:qsTr("余高:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : restheight.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text === "自动")
                secondaryItem:Label{
                    id: restheightabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","余高(mm)")+"(mm)"
                    style:"subheading"
                }
            }
            /*坡口检测点左(mm)*/
            ListItem.Subtitled{
                id:groovecheckleft
                text:qsTr("坡口检测点左:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : groovecheckleft.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text === "自动")
                secondaryItem:Label{
                    id: groovecheckleftlabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","坡口检测点左(mm)")+"(mm)"
                    style:"subheading"
                }
            }
            /*坡口检测点右(mm)*/
            ListItem.Subtitled{
                id:groovecheckright
                text:qsTr("坡口检测点右:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : groovecheckright.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text === "自动")
                secondaryItem:Label{
                    id: groovecheckrightabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","坡口检测点右(mm)")+"(mm)"
                    style:"subheading"
                }
            }
            /*板厚补正(mm)*/
            ListItem.Subtitled{
                id:thickfix
                text:qsTr("板厚补正:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : thickfix.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text === "半自动")
                secondaryItem:Label{
                    id: thickfixlabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","板厚补正(mm)")+"(mm)"
                    style:"subheading"
                }
            }
            /*角度补正(mm)*/
            ListItem.Subtitled{
                id:anglefix
                text:qsTr("角度补正:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) :  anglefix.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text === "半自动")
                secondaryItem:Label{
                    id: anglefixlabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","角度补正(度)")+"(度)"
                    style:"subheading"
                }
            }
            /*间隙补正(mm)*/
            ListItem.Subtitled{
                id:gapfix
                text:qsTr("间隙补正:");
                anchors.left: parent.left
                anchors.leftMargin: grooveset.leftMargin > 0  ? Units.dp(148) : gapfix.visible ? Units.dp(48) : Units.dp(148) ;
                Behavior on anchors.leftMargin{
                    NumberAnimation { duration: 200 }
                }
                backgroundColor: Theme.backgroundColor
                height:teachmodeset.height
                visible: teachmodeset.expanded&&(teachmodegroup.current.text === "半自动")
                secondaryItem:Label{
                    id: gapfixlabel
                    anchors.verticalCenter: parent.verticalCenter
                    text:DB.getValueFromFuncOfTable(grooveset.currentGroove,"function","间隙补正(mm)")+"(mm)"
                    style:"subheading"
                }
            }
           /**/
            ListItem.SectionHeader{
                id:weldset
                text:qsTr("示教设置")
                style: "subheading"
                showDivider: true;
                iconName: "awesome/gears"
                expanded: true;
            }
        }
    }
    Dialog{
        id:teachmodedialog
    }
}
