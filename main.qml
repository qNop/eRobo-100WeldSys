import QtQuick 2.2
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import "qrc:/Database.js" as DB
import QtQuick.LocalStorage 2.0

Window{
    property  var res;
    id: eRoboWeldSysCheck
    visible:true
    width:appConfig.screenWidth
    height: appConfig.screenHeight
    theme.primaryColor: "red";
    theme.accentColor: "blue";
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
                RowLayout{
                    height:24
                    width: parent.width
                        Text{
                            id:appname
                            text:qsTr("  ER-100:便携式MAG焊接机器人系统");
                        }
                        Icon{ id:brighnessIcon;name:"device/brightness_medium" }
                        Icon{id:warnIcon; name:"awesome/warning" ;}
                        Icon{id:exchange;name:"awesome/upload";}
                        Icon{id:lock;name:"awesome/lock";}
                        IconButton{
                            id:accountIcon;
                             iconName:"awesome/user";
                             color: Theme.lightDark(theme.backgroundColor, Theme.light.iconColor,
                                                                                           Theme.dark.iconColor);
                             onClicked: {changeuser.show();password.enabled=false;password.text=""}
                        }
                        Text{id:accountname; text:appConfig.currentusername;}
                        Text{id:datetime ;}
                        Icon{ id:powerIcon;name:"awesome/power_off"}
                        ThinDivider{anchors.bottom: parent.bottom;}
                }

                Button{
                    x:150;
                    y:100;
                    width:100;
                    height:80;
                /*  Canvas{
                          id:canvas
                          height:80;
                          width: 100;
                            onPaint: {
                                 var ctx = getContext("2d");
                                       ctx.save();
                                       ctx.clearRect(0,0,canvas.width, canvas.height);
                                       ctx.strokeStyle =theme.primaryColor;
                                        ctx.font="16px Roboto";
                                        ctx.fillStyle="blue";
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
                    }*/
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
      ListModel{
            id:usrnamemodel;
            ListElement{
            text:"user";
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
            contentMargins: 12;
            onAccepted: {
                appConfig.currentusername = changeuserid.selectedText;
                appConfig.currentusertype = changeuserid.helperText;
            }
            onRejected: {
                changeuserid.helperText = appConfig.currentusertype;
                 for(var i=0;i<100;i++){
                     if(accountname.text === usrnamemodel.get(i).text ){
                            changeuserid.selectedIndex = i;
                           break;
                     }
                 }
            }
            Rectangle{
                height:changeuserid.height+3*changeuser.contentMargins+password.height;
                width:parent.width
                MenuField{
                      id:changeuserid
                      anchors.top:parent.top
                      floatingLabel:true;
                      width: parent.width
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
                              else{
                           //     appConfig.currentusername = result.rows.item(0).name;
                                   appConfig.currentuserpassword = result.rows.item(0).password;
                                   changeuserid.helperText = result.rows.item(0).type;
                              }
                          });
                          password.text="";
                      }
              }
             TextField{
                        id:password
                        floatingLabel:true;
                        anchors.top:changeuserid.bottom
                        anchors.topMargin: 10;
                        width: parent.width
                        placeholderText:qsTr("密码:");
                        characterLimit: 8;
                        onTextChanged:{
                                if(password.text=== appConfig.currentuserpassword){
                                       changeuser.positiveButtonEnabled=true;
                                       password.helperText=qsTr("密码正确");
                                }
                                else{
                                        changeuser.positiveButtonEnabled=false;
                                       password.helperText=qsTr("请输入密码...");
                                }
                        }
                        onHasErrorChanged: {
                            if(password.hasError === true){
                                 console.log("length changed");
                                  password.helperText =qsTr( "密码超过最大限制");
                            }
                        }
                }
              }
        }
      Component.onCompleted: {
            DB.openDatabase();
            var  name;
            DB.db.transaction ( function(tx) {
              var result = tx.executeSql("select * from AccountTable");
              if(result.rows.length === 0) {
                     //////////////
              }
              else{
                  for(var i=0;i<result.rows.length;i++){
                      name = result.rows.item(i).name;
                      usrnamemodel.append( {"text":name});
                      if(name === accountname.text){
                           changeuserid.selectedIndex = i+1;
                           changeuserid.helperText=result.rows.item(i).type;
                      }
                  }
                   usrnamemodel.remove(0);
              }
          });
      }
}
