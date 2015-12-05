import QtQuick 2.2
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import WeldSys.ERModbus 1.0
import WeldSys.ERLed 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.0
import "qrc:/Database.js" as DB
import "CanvasPaint.js" as Paint

/*应用程序窗口*/
ApplicationWindow{
    id: app;title: "app";visible: true
    /*APP配置文件存储格式为txt*/
    APPConfig{id:appconfig;}
    /*led与背光驱动C++函数*/
    ERLed{ id:led;lcdbacklight:backlightslider.value*2}
    /*主题默认颜色*/
    theme { primaryColor: appconfig.themeprimarycolor;accentColor: appconfig.themeaccentcolor;backgroundColor:appconfig.themebackgroundcolor
        tabHighlightColor: "white"  }
    property var sections: [ "grooveset", "weldset", "welding" ]
    property var sectionTitles: [ "坡口条件(I)", "焊接条件(II)", "焊接分析(III)" ]
    property string selectedComponent: sections[0]
    /*当前本地化语言*/
    property string local: "zh_CN"
    /*当前坡口形状*/
    property string currentgroove;
    /*更新时间定时器*/
    Timer{ interval: 600; running: true; repeat: true;
                  onTriggered:{
                      datetime.text= new Date().toLocaleDateString(Qt.locale(app.local),"MMMdd ddd ")+new Date().toLocaleTimeString(Qt.locale(app.local),"h:mm");
                                        console.log(datetime.text)}}
    /*高压action*/
    ActionButton{id:highv;anchors {right: robot.left;top: parent.top;rightMargin: Units.dp(12);topMargin: page.actionBar.height-highv.height/2}iconName:"image/flash_off"
                visible: !page.actionBar.overflowMenuShowing}
    /*机器人action*/
    ActionButton{id:robot;anchors { right: handle.left;top: parent.top;rightMargin: Units.dp(12);leftMargin: Units.dp(24);topMargin: page.actionBar.height-highv.height/2  }iconName:"action/android"
                visible: !page.actionBar.overflowMenuShowing}
    /*操作盒action*/
    ActionButton{id:handle;anchors { right: power.left;top: parent.top;rightMargin: Units.dp(12);leftMargin: Units.dp(24);topMargin: page.actionBar.height-highv.height/2 }iconName:"awesome/calculator"
                visible: !page.actionBar.overflowMenuShowing}
    /*电源action*/
    ActionButton{id:power;anchors {right: parent.right;top: parent.top;rightMargin: Units.dp(24);leftMargin: Units.dp(24);topMargin: page.actionBar.height-highv.height/2 }iconName:"awesome/heartbeat"
                visible: !page.actionBar.overflowMenuShowing}
    /*初始化Ｔabpage*/
    initialPage: TabbedPage {
        id: page
        /*标题*/
        title:qsTr("便携式MAG焊接机器人系统")
        /*最大action显示数量*/
        actionBar.maxActionCount: 6
        /*actions列表*/
        actions: [
            /*危险报警action*/
            Action {iconName: "alert/warning";name: qsTr("警告");hoverAnimation: true;text:"a";
                //onTriggered: demo.showError("Something went wrong", "Do you want to retry?", "Close", true)
            },
            /*背光控制插件action*/
            Action{name: qsTr("背光"); iconName: "device/brightness_medium";text:"a"; hoverAnimation: true
                onTriggered:backlight.show(); 
            },
            /*系统选择颜色action*/
            Action {iconName: "image/color_lens";name: qsTr("色彩") ;text:"a";
                onTriggered: colorPicker.show();hoverAnimation: true
            },
            /*系统设置action*/
            Action {iconName: "action/settings";name: qsTr("设置");hoverAnimation: true;text:"a";
                //onTriggered
            },
            /*时间action*/
            Action{name: qsTr("时间"); id:datetime;hasText:true;
               onTriggered:datePickerDialog.show();
            },
            /*账户*/
            Action {iconName: "action/account_circle";name: qsTr("帐户")
                onTriggered:changeuser.show();
            },
            /*语言*/
            Action {iconName: "action/language";name: qsTr("语言");
                onTriggered: languagePicker.show();
            },
            /*系统电源*/
            Action {iconName: "awesome/power_off";name: qsTr("关机")
                onTriggered: Qt.quit();
            }
        ]
        Repeater {
            model: sections
            delegate: Tab {
                title: sectionTitles[index]
                property string selectedComponent: modelData
                Item {
                    Flickable {
                        id: flickable
                        anchors {
                            left: parent.left
                            right: parent.right
                            top: parent.top
                            bottom: parent.bottom
                        }
                        clip: true
                        contentHeight: Math.max(loader.implicitHeight + 40, height)
                        Loader {
                            id: loader
                            anchors.fill: parent
                            asynchronous: true
                            visible: status == Loader.Ready
                            source: { return Qt.resolvedUrl("%.qml").arg(selectedComponent)}
                        }
                        ProgressCircle {
                            anchors.centerIn: parent
                            visible: loader.status == Loader.Loading
                        }
                    }
                    Scrollbar {
                        flickableItem: flickable
                    }
                }
            }
        }
        Keys.onDigit1Pressed: page.selectedTab=0;
        Keys.onDigit2Pressed: page.selectedTab=1;
        Keys.onDigit3Pressed: page.selectedTab=2;
    }
    /*日历*/
    Dialog {
        id:datePickerDialog; hasActions: true; contentMargins: 0;floatingActions: true
        negativeButtonText:qsTr("取消");positiveButtonText: qsTr("完成");
        DatePicker {
            frameVisible: false;dayAreaBottomMargin : Units.dp(48);isLandscape: true;
        }
    }
    /*背光调节*/
    Dialog{
        id:backlight
        title: qsTr("背光调节");negativeButtonText:qsTr("取消");positiveButtonText: qsTr("完成");
        Slider {
            id:backlightslider;height:Units.dp(64);width:Units.dp(240);Layout.alignment: Qt.AlignCenter;
            value:appconfig.backlight;stepSize: 5;focus: true;numericValueLabel: true;
            minimumValue: 0;maximumValue: 100; activeFocusOnPress: true;
        }
        Rectangle{
            width:Units.dp(240);
            height:Units.dp(10);
        }

        onAccepted: {appconfig.backlight=backlightslider.value}
        onRejected: {backlightslider.value=appconfig.backlight}
    }
    /*颜色选择对话框*/
    Dialog {
        id: colorPicker;title: qsTr("主题");negativeButtonText:qsTr("取消");positiveButtonText: qsTr("完成");
        /*接受则存储系统颜色*/
      onAccepted:{appconfig.themeprimarycolor=theme.primaryColor;appconfig.themeaccentcolor=theme.accentColor;appconfig.themebackgroundcolor=theme.backgroundColor; }
         /*不接受则释放系统颜色*/
      onRejected: {theme.primaryColor=appconfig.themeprimarycolor;theme.accentColor=appconfig.themeaccentcolor;theme.backgroundColor=appconfig.themebackgroundcolor; }
      /*下拉菜单*/
      MenuField { id: selection; model: ["基本色彩", "前景色彩", "背景色彩"]; width: Units.dp(160)}
        Grid {
            columns: 7
            spacing: Units.dp(8)
            Repeater {
                model: [
                    "red", "pink", "purple", "deepPurple", "indigo",
                    "blue", "lightBlue", "cyan", "teal", "green",
                    "lightGreen", "lime", "yellow", "amber", "orange",
                    "deepOrange", "grey", "blueGrey", "brown", "black",
                    "white"
                ]
                Rectangle {
                    width: Units.dp(30)
                    height: Units.dp(30)
                    radius: Units.dp(2)
                    color: Palette.colors[modelData]["500"]
                    border.width: modelData === "white" ? Units.dp(2) : 0
                    border.color: Theme.alpha("#000", 0.26)
                    Ink {
                        anchors.fill: parent
                        onPressed: {
                            switch(selection.selectedIndex) {
                                case 0:
                                    theme.primaryColor = parent.color
                                    break;
                                case 1:
                                    theme.accentColor = parent.color
                                    break;
                                case 2:
                                    theme.backgroundColor = parent.color
                                    break;
                            }
                        }
                    }
                }
            }
        }
    }
    /*更换用户对话框*/
    Dialog{
        id:changeuser;
        title:qsTr("更换用户");negativeButtonText:qsTr("取消");positiveButtonText:qsTr("确定");
        positiveButtonEnabled:false;
        focus: true;
        onAccepted: {
                   appconfig.currentusername = changeuserFeildtext.selectedText;
                   appconfig.currentusertype = changeuserFeildtext.helperText; }
        onRejected: {
                   changeuserFeildtext.helperText = appconfig.currentusertype;
                    for(var i=0;i<100;i++){
                        if(accountname.text === usrnamemodel.get(i).text ){
                               changeuserFeildtext.selectedIndex = i;
                              break; }
                    }
             }
        ListModel{id:usrnamemodel;ListElement{text:"user";}}
        MenuField{id:changeuserFeildtext;
                floatingLabel:true;
                placeholderText:qsTr("用户名:");
                model:usrnamemodel;
                onItemSelected:  {
                       password.enabled=true;
                       var data=usrnamemodel.get(index);
                             DB.db.transaction ( function(tx) {
                                 var result = tx.executeSql("select * from AccountTable where name = " + "\'"+data.text+"\'");
                                 if(result.rows.length === 0) {
                                        //////////////
                                 }
                                 else{ appconfig.currentuserpassword = result.rows.item(0).password;
                                         changeuserFeildtext.helperText = result.rows.item(0).type;
                                 }});
                             password.text="";}}
        TextField{id:password;
                        floatingLabel:true;
                        placeholderText:qsTr("密码:");
                        characterLimit: 8;
                        onTextChanged:{
                                   if(password.text=== appconfig.currentuserpassword){
                                          changeuserDialog.positiveButtonEnabled=true;
                                          password.helperText.color="green";
                                          password.helperText=qsTr("密码正确");}
                                   else{changeuserDialog.positiveButtonEnabled=false;
                                          password.helperText=qsTr("请输入密码...");}}
                        onHasErrorChanged: {
                               if(password.hasError === true){
                                    console.log("length changed");
                                     password.helperText =qsTr( "密码超过最大限制");}}
                       Keys.onPressed: {
                             switch(event.key){
                             case Qt.Key_F1:
                                 password.insert(password.length,"1");         
                                 event.accepted=true;
                                 break;
                             case Qt.Key_F2:
                                 password.insert(password.length,"2");
                                 event.accepted=true;
                                 break;
                             }
                         }
                   }
    }
    /*语言对话框*/
    Dialog{  id:languagePicker;
          title:qsTr("更换语言");negativeButtonText:qsTr("取消");positiveButtonText:qsTr("确定");
           Column{
               width: parent.width
               spacing: 0
            Repeater{
                model: [qsTr("汉语"),qsTr("英语")];
                ListItem.Standard{
                       text:modelData;
                        showDivider: true;
                        selected:true;
                    }
               }
            }
    }
}
