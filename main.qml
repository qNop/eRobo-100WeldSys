import QtQuick 2.2
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.0
import "qrc:/Database.js" as DB
import "CanvasPaint.js" as Paint
Window{
    property  var res;
    id: eRoboWeldSys;visible:true
    width:appConfig.screenWidth;height: appConfig.screenHeight
    theme{primaryColor: "red";accentColor: "yellow";backgroundColor: "gray"}
    APPConfig{ id:appConfig}
    Timer{ interval: 500; running: true; repeat: true;
               onTriggered: datetime.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd dddd hh:mm:ss")}
   Dialog{id: landscapeDatePickerDialog;hasActions: true;contentMargins: 0;floatingActions: true
              DatePicker { frameVisible: false;dayAreaBottomMargin : Units.dp(48);isLandscape: true }}
   Rectangle{id:window;anchors{left:parent.left;right:parent.right;top:parent.top;bottom:parent.bottom;}border{color:"black";width:2}
          View{ id:titlebar;height:24;elevation: 5;width: parent.width;backgroundColor: theme.accentColor
                    Text{id:appname;anchors{verticalCenter: parent.verticalCenter;left: parent.left;leftMargin: 5;}
                            text:qsTr("ER-100:便携式MAG焊接机器人系统");font.pixelSize: 14;}
                    RowLayout{
                        height:parent.height;  width:400; anchors.right:parent.right;
                        Icon{ id:brighnessIcon;name:"device/brightness_medium";anchors.right:warnIcon.left }
                        Icon{id:warnIcon; name:"awesome/warning" ;anchors.right:exchange.left}
                        Icon{id:exchange;name:"awesome/upload";anchors.right:lock.left}
                        Icon{id:lock;name:"awesome/lock"; anchors.right:accountIcon.left}
                        IconButton{ id:accountIcon;iconName:"awesome/user";anchors.right:accountname.left
                             color: Theme.lightDark(theme.backgroundColor, Theme.light.iconColor, Theme.dark.iconColor);
                             onClicked: {changeuserDialog.show();password.enabled=false;password.text=""}}
                        Text{id:accountname; text:appConfig.currentusername;anchors.right:datetime.left}
                        Text{id:datetime;anchors.right:powerIcon.left}
                        Icon{id:powerIcon;name:"awesome/power_off";anchors.right:parent.right;anchors.rightMargin: 5}}}
          View{ id:background;anchors{bottom:parent.bottom;top:titlebar.bottom;right:parent.right;left:parent.left}
                  backgroundColor:Palette.colors["grey"]["200"];
                   Card{id:groove;anchors{left:parent.left;leftMargin: 10;top:parent.top;topMargin: 10;}
                         elevation:1;width:100;height:140;radius:5;backgroundColor:Palette.colors["red"]["500"];
                        Text{ id:grooveposition;font.pixelSize: 18;text:"平焊";anchors{top:parent.top;horizontalCenter: parent.horizontalCenter} }
                        Text{id:groovetype;font.pixelSize: 14;text:"单边V型坡口";anchors{top:grooveposition.bottom;horizontalCenter: parent.horizontalCenter} }
                        Text{id:joint;font.pixelSize:14; text:"T接头(I)";anchors{top:groovetype.bottom;horizontalCenter: parent.horizontalCenter}}
                        Canvas{id:canvas;anchors.left:parent.left;anchors.bottom: parent.bottom;width:100;height:80;
                                     onPaint:{Paint.paintflatweld(0,canvas);}}
                   Card{id:sysInfCard;anchors{left:parent.left;leftMargin: 10;top:groove.bottom;topMargin: 10;}
                       elevation: 5;radius: 5; width:100;height:88;backgroundColor:Palette.colors["green"]["500"];}
                   Card{id:dataAnalayCard;anchors{left:parent.left;leftMargin: 10;top:sysInfCard.bottom;topMargin: 10;}
                       elevation: 5;radius: 5;width: 100;height: sysInfCard.height;backgroundColor:Palette.colors["amber"]["500"];}
                   Card{id:settingCard;anchors{left:parent.left;leftMargin: 10;top:dataAnalayCard.bottom;topMargin: 10;}
                       elevation: 5;radius: 5;width: 100;height: sysInfCard.height;backgroundColor:Palette.colors["lime"]["500"];}
                   Card{ id:displayCard;anchors{right:parent.right;rightMargin:10;top:parent.top;topMargin:10;left:groove.right;leftMargin:10;bottom:parent.bottom;bottomMargin:10}
                      elevation: 1;radius: 5;
                      backgroundColor:
                           (sysInfCard.elevation<dataAnalayCard.elevation)?
                                       ((sysInfCard.elevation<settingCard.elevation)?sysInfCard.backgroundColor:settingCard.backgroundColor):
                                                                     ((dataAnalayCard.elevation<settingCard.elevation)?dataAnalayCard.backgroundColor:settingCard.backgroundColor)
                           }}}}
   Dialog{id:changeuserDialog;title:qsTr("更改用户");hasActions: true;floatingActions: false;negativeButtonText:qsTr("取消");
        positiveButtonText:qsTr("确定");positiveButtonEnabled:false;contentMargins: 12;
        onAccepted: {
               appConfig.currentusername = changeuserFeildtext.selectedText;
               appConfig.currentusertype = changeuserFeildtext.helperText; }
         onRejected: {
               changeuserFeildtext.helperText = appConfig.currentusertype;
                for(var i=0;i<100;i++){
                    if(accountname.text === usrnamemodel.get(i).text ){
                           changeuserFeildtext.selectedIndex = i;
                          break; }}}
        ListModel{id:usrnamemodel;ListElement{text:"user";}}
        Rectangle{height:changeuserFeildtext.height+3*changeuserDialog.contentMargins+password.height;
               width:parent.width;anchors{ left:parent.left;leftMargin: 10;}
               MenuField{id:changeuserFeildtext;anchors.top:parent.top;floatingLabel:true;
                     width: parent.width-20;placeholderText:qsTr("用户名:");model:usrnamemodel;
                     onItemSelected:  {
                         password.enabled=true;
                         var data=usrnamemodel.get(index);
                         DB.db.transaction ( function(tx) {
                             var result = tx.executeSql("select * from AccountTable where name = " + "\'"+data.text+"\'");
                             if(result.rows.length === 0) {
                                    //////////////
                             }
                             else{ appConfig.currentuserpassword = result.rows.item(0).password;
                                     changeuserFeildtext.helperText = result.rows.item(0).type;
                             }});
                         password.text="";}}
               TextField{id:password; anchors.top:changeuserFeildtext.bottom;anchors.topMargin: 10;
                    width: parent.width-20;floatingLabel:true;placeholderText:qsTr("密码:");characterLimit: 8;
                    onTextChanged:{
                               if(password.text=== appConfig.currentuserpassword){
                                      changeuserDialog.positiveButtonEnabled=true;
                                      password.helperText.color="green";
                                      password.helperText=qsTr("密码正确");}
                               else{changeuserDialog.positiveButtonEnabled=false;
                                      password.helperText=qsTr("请输入密码...");}}
                     onHasErrorChanged: {
                           if(password.hasError === true){
                                console.log("length changed");
                                 password.helperText =qsTr( "密码超过最大限制");}}}}}
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

