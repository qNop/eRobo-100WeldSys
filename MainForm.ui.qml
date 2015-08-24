import QtQuick 2.4
//import QtQuick.Controls.Styles 1.2 as ControlsStyles
import Material.Extras 0.1
//import QtQuick.Controls 1.2 as Controls
import Material 0.1
import Material.ListItems 0.1 as ListItem

Rectangle {
    id: mainWindows
    property alias mouseArea: mouseArea
    visible: true
    x:0
    y:0
    width: 640
    height: 480
    anchors.top: parent.top
    anchors.left: parent.left
    border.width: 1
    MouseArea {
        id: mouseArea
        height: mainWindows.y-mouseArea.y
        x:1
        y:20
        width: 638
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 21
        visible: true
        hoverEnabled: false
        anchors.fill: parent
        Rectangle {
            id: grooveSetButton
            x: 10
            y: 10
            width: 100
            height: 160
            radius: 10
            border.width: 1
            Text{
                text:qsTr("      平焊\n单边V型坡口\n    T接头(I)")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }
        Rectangle {
            id: conditionSet
            x: grooveSetButton.x
            y: grooveSetButton.y+grooveSetButton.height+36
            width: grooveSetButton.width
            height: 50
            radius: 10
            border.width: 1
            Text{
                text:qsTr("参数设置(II)")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }
        Rectangle {
            id: weldSet
            x: 10
            y: 292
            width: 100
            height: 50
            radius: 10
            border.width: 1
            Text{
                text:qsTr("焊接信息(III)")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 12
            }
        }
        Rectangle {
            id: sysSet
            x: grooveSetButton.x
            y: weldSet.y+weldSet.height+36
            width: grooveSetButton.width
            height: 50
            radius: 10
            border.width: 1
            Text{
                text:qsTr("系统管理(IV)")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 12
            }
        }

    }
    Rectangle {
        id: titleBox
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 460
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        visible: true
       border.width: 1
        Text {
            id: appname
            x:0
            y: 0
            text: qsTr("ER-100机器人焊接系统")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            style: Text.Normal
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }
        Text {
            id: datetime
            x: username.x-10-datetime.width
            y:0
            text: qsTr("2015年07月15日下午10:10")
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Arial"
            style: Text.Normal
            font.pixelSize: 12
        }
        Text {
            id: username
            x:titleBox.width-2-username.width
            y: 0
            text: qsTr("登陆用户:陈世豪")
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            textFormat: Text.Sunken
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }
    }
     Page{
           id:groove;
           tabs:[
                 qsTr("坡口"),
                  qsTr("坡口条件（F2）"),
                  qsTr("模式条件（F3）")
           ]
        TabView{
               id:grooveSet
               x: 140
               y: 26
               width: 492
               height: 446
               currentIndex:groove.selectedTab
               model:tabs;
        }
        VisualItemModel{
                id:tabs
                Rectangle {
                    width: grooveSet.width
                    height: grooveSet.height
                }
                Rectangle {
                    width: grooveSet.width
                    height: grooveSet.height
                }
                Rectangle {
                    width: grooveSet.width
                    height: grooveSet.height
                }
        }
    }
}
