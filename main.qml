import QtQuick 2.4
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import "qrc:/Database.js" as DB


Window{
    property  var res;
    id: eRoboWeldSysCheck
    visible:true
    width:appConfig.screenWidth
    height: appConfig.screenHeight
    theme.primaryColor: "red";
    theme.accentColor: "red";
    theme.backgroundColor: "yellow"
       APPConfig{
           id:appConfig
       }
       Timer{
           interval: 500; running: true; repeat: true
           onTriggered: datetime.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd dddd hh:mm:ss")
       }
      Rectangle{
          id:window
          anchors{
                left:parent.left
                right:parent.right
                top:parent.top
          }
                Row{
                    height:24
                    width: parent.width
                        Text{
                            id:appname
                            text:qsTr("  ER-100:便携式MAG焊接机器人系统");
                        }
                        Icon{ id:brighnessIcon; anchors.right:warnIcon.left;name:"device/brightness_medium" }
                        Icon{id:warnIcon; name:"awesome/warning" ;anchors.right:exchange.left;}
                        Icon{id:exchange;name:"awesome/upload";anchors.right:lock.left;}
                        Icon{id:lock;name:"awesome/lock";anchors.right:accountIcon.left;}
                        IconButton{
                            id:accountIcon;
                            anchors.right:accountname.left;
                             iconName:"awesome/user";
                             color: Theme.lightDark(theme.backgroundColor, Theme.light.iconColor,
                                                                                           Theme.dark.iconColor);
                             onClicked:  changeuser.show();
                        }
                        Text{id:accountname; anchors.right:datetime.left; text:appConfig.currentusername;}
                        Text{id:datetime ;anchors.right:powerIcon.left;}
                        Icon{ id:powerIcon; anchors.right:parent.right;anchors.rightMargin: 5;name:"awesome/power_off"}
                        ThinDivider{anchors.bottom: parent.bottom;}
                }
                Button{
                    x:150;
                    y:100;
                    width:100;
                    height:80;
                    text:"sdsadasd"
                    backgroundColor:"green";
                    Canvas{
                          id:canvas
                          height:80;
                          width: 100;
                            onPaint: {
                                 var ctx = getContext("2d");
                                       ctx.save();
                                       ctx.clearRect(0,0,canvas.width, canvas.height);
                                       ctx.strokeStyle =theme.primaryColor;
                                        ctx.font="16px Roboto";
                                        ctx.antialiasing=false;
                                       ctx.lineWidth=1.5;
                                       ctx.beginPath();
                                       ctx.moveTo(10,10);
                                       ctx.lineTo(20,10);
                                       ctx.lineTo(20,70);
                                       ctx.lineTo(10,70);
                                       ctx.closePath();
                                       ctx.stroke();
                                       ctx.beginPath();
                                       ctx.moveTo(20,50);
                                       ctx.lineTo(44,50);
                                       ctx.lineTo(44,60);
                                       ctx.lineTo(20,60);
                                       ctx.closePath();
                                       ctx.stroke();
                                        ctx.beginPath();
                                        ctx.moveTo(44,25);
                                        ctx.lineTo(90,25);
                                        ctx.lineTo(90,50);
                                        ctx.lineTo(30,50);
                                        ctx.closePath();
                                        ctx.text("god",40,70);
                                        ctx.stroke();
                                       ctx.restore();
                            }
                    }
                }
           }
      Dialog {
              id: landscapeDatePickerDialog
              hasActions: true
              contentMargins: 0
              floatingActions: true
              DatePicker {
                  frameVisible: false
                  dayAreaBottomMargin : Units.dp(48)
                  isLandscape: true
              }
      }
      Dialog{
            id:changeuser;
            title:qsTr("更改用户");
            hasActions: true;
            floatingActions: false;
            negativeButtonText:qsTr("取消");
            positiveButtonText:qsTr("确定");
            positiveButtonEnabled:false;
            contentMargins: 20;
            Rectangle{
                height:changeuserid.height+3*changeuser.contentMargins+password.height;
                width:parent.width
              TextField{
                       id:changeuserid
                       anchors.top:parent.top
                       anchors.topMargin: 10;
                      floatingLabel:true;
                      width: parent.width
                      placeholderText:qsTr("用户名");
                      helperText: qsTr("请输入名称");
                      onAccepted:{
                             changeuser.positiveButtonEnabled=true;
                              res=DB.checkusername(changeuserid.text.toString());
                      }
              }
             TextField{
                        id:password
                        floatingLabel:true;
                        anchors.top:changeuserid.bottom
                        anchors.topMargin: 28;
                        width: parent.width
                        placeholderText:qsTr("密码");
                        characterLimit: 8;

                }
              }
      }

      Component.onCompleted: {
            DB.openDatabase();
      }

}
