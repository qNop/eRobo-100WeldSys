import QtQuick 2.2
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.0
import "qrc:/Database.js" as DB

Window{
    property  var res;
    id: eRoboWeldSysCheck
    visible:true
    width:appConfig.screenWidth
    height: appConfig.screenHeight
    theme.primaryColor: "red";
    theme.accentColor: "yellow";
    theme.backgroundColor: "gray"
    APPConfig{
           id:appConfig
       }
    Timer{
           interval: 500; running: true; repeat: true
           onTriggered: datetime.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd dddd hh:mm:ss")
       }
/*    Dialog {
              id: landscapeDatePickerDialog
              hasActions: true
              contentMargins: 0
              floatingActions: true
              DatePicker {
                  frameVisible: false
                  dayAreaBottomMargin : Units.dp(48)
                  isLandscape: true
              }
      }*/
   Rectangle{
          id:window
          anchors{
                left:parent.left
                right:parent.right
                top:parent.top
                bottom:parent.bottom;
          }
          View{
                   id:titlebar
                    height:24
                    elevation: 1;
                    width: parent.width
                    backgroundColor: theme.accentColor
                    Text{
                            id:appname
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5;
                            text:qsTr("ER-100:便携式MAG焊接机器人系统");
                            font.pixelSize: 14;
                        }
                    RowLayout{
                            height:parent.height
                            width:400;
                            anchors.right:parent.right
                        Icon{ id:brighnessIcon;name:"device/brightness_medium";anchors.right:warnIcon.left }
                        Icon{id:warnIcon; name:"awesome/warning" ;anchors.right:exchange.left}
                        Icon{id:exchange;name:"awesome/upload";anchors.right:lock.left}
                        Icon{id:lock;name:"awesome/lock"; anchors.right:accountIcon.left}
                        IconButton{
                            id:accountIcon;
                             iconName:"awesome/user";
                             anchors.right:accountname.left
                             color: Theme.lightDark(theme.backgroundColor, Theme.light.iconColor,
                                                                                           Theme.dark.iconColor);
                             onClicked: {changeuserDialog.show();password.enabled=false;password.text=""}

                        }
                        Text{id:accountname; text:appConfig.currentusername;anchors.right:datetime.left}
                        Text{id:datetime;anchors.right:powerIcon.left}
                        Icon{ id:powerIcon;name:"awesome/power_off";anchors.right:parent.right;anchors.rightMargin: 5}
                        }
                }
              View{

                  anchors.bottom: parent.bottom
                  anchors.top:titlebar.bottom
                  anchors.right:parent.right
                  anchors.left:parent.left
                  backgroundColor:Palette.colors["grey"]["300"];
                   Card{
                    id:bb;
                     backgroundColor:Palette.colors["red"]["500"];
                    anchors.left:parent.left
                    anchors.leftMargin: 10;
                    anchors.top:parent.top
                    anchors.topMargin: 10;
                    width:100;
                    height:140;
                    elevation: 2;
                    radius: 4;
                    Text{
                        id:text1
                        anchors.top:parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 18;
                            text:"平焊"
                    }
                    Text{
                        id:text2
                        anchors.top:text1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 14;
                            text:"单边V型坡口"
                    }
                    Text{
                        anchors.top:text2.bottom
                            font.pixelSize: 14;
                             anchors.horizontalCenter: parent.horizontalCenter
                            text:"T接头(I)"
                    }
                  Canvas{
                          id:canvas             
                          anchors.left:parent.left
                          anchors.bottom: parent.bottom
                          width:100;
                          height:80;
                            onPaint: {
                                 var ctx = getContext("2d");
                                       ctx.save();
                                       ctx.clearRect(0,0,canvas.width, canvas.height);
                                       ctx.strokeStyle ="black";
                                        ctx.fillStyle="blue";
                                        ctx.antialiasing=false;
                                       ctx.lineWidth=1;
                                       ctx.beginPath();
                                       ctx.moveTo(10,10);
                                       ctx.lineTo(20,10);
                                       ctx.lineTo(20,70);
                                       ctx.lineTo(10,70);
                                       ctx.closePath();
                           //     ctx.fill();
                                       ctx.stroke();
                                       ctx.beginPath();
                                       ctx.moveTo(20,50);
                                       ctx.lineTo(44,50);
                                       ctx.lineTo(44,60);
                                       ctx.lineTo(20,60);
                                       ctx.closePath();
                              //  ctx.fill();
                                       ctx.stroke();
                                        ctx.beginPath();
                                        ctx.moveTo(44,30);
                                        ctx.lineTo(90,30);
                                        ctx.lineTo(90,50);
                                        ctx.lineTo(30,50);
                                        ctx.closePath();                          
                                        ctx.stroke();
                                      //  ctx.fill();
                                       ctx.restore();
                            }
                    }
                }
                    Card{
                        x:10;
                        y:155;
                        elevation: 2;
                        radius: 4;
                        width: 100;
                        height:90;
                        backgroundColor:Palette.colors["green"]["500"];
                    }
                    Card{
                        x:10;
                       y:255;
                        elevation: 2;
                        radius: 4;
                        width: 100;
                        height: 90;
                        backgroundColor:Palette.colors["amber"]["500"];
                    }
                    Card{
                        x:10;
                        y:355;
                        elevation: 2;
                        radius: 4;
                        width: 100;
                        height: 90;
                        backgroundColor:Palette.colors["lime"]["500"];
                    }
                }
           }
   Dialog{
        ListModel{
               id:usrnamemodel;
               ListElement{
               text:"user";
               }
          }
           id:changeuserDialog;
           title:qsTr("更改用户");
           hasActions: true;
           floatingActions: false;
           negativeButtonText:qsTr("取消");
           positiveButtonText:qsTr("确定");
           positiveButtonEnabled:false;
           contentMargins: 12;
           onAccepted: {
               appConfig.currentusername = changeuserFeildtext.selectedText;
               appConfig.currentusertype = changeuserFeildtext.helperText;
           }
           onRejected: {
               changeuserFeildtext.helperText = appConfig.currentusertype;
                for(var i=0;i<100;i++){
                    if(accountname.text === usrnamemodel.get(i).text ){
                           changeuserFeildtext.selectedIndex = i;
                          break;
                    }
                }
           }
           Rectangle{
               height:changeuserFeildtext.height+3*changeuserDialog.contentMargins+password.height;
               width:parent.width
               anchors{
                   left:parent.left;
                   leftMargin: 10;
               }
               MenuField{
                     id:changeuserFeildtext
                     anchors.top:parent.top
                     floatingLabel:true;
                     width: parent.width-20;
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
                                  appConfig.currentuserpassword = result.rows.item(0).password;
                                  changeuserFeildtext.helperText = result.rows.item(0).type;
                             }
                         });
                         password.text="";
                     }
             }
            TextField{
                       id:password
                       floatingLabel:true;
                       anchors.top:changeuserFeildtext.bottom
                       anchors.topMargin: 10;
                       width: parent.width-20;
                       placeholderText:qsTr("密码:");
                       characterLimit: 8;
                       onTextChanged:{
                               if(password.text=== appConfig.currentuserpassword){
                                      changeuserDialog.positiveButtonEnabled=true;
                                      password.helperText.color="green";
                                      password.helperText=qsTr("密码正确");
                               }
                               else{
                                       changeuserDialog.positiveButtonEnabled=false;
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
                           changeuserFeildtext.selectedIndex = i+1;
                           changeuserFeildtext.helperText=result.rows.item(i).type;
                      }
                  }
                   usrnamemodel.remove(0);
              }
          });
      }
}

