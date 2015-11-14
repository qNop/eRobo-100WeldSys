import QtQuick 2.2
import Material 0.1
import Material.Extras 0.1
import WeldSys.APPConfig 1.0
import WeldSys.ERModbus 1.0
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.0
import "qrc:/Database.js" as DB
import "CanvasPaint.js" as Paint

Window{
    property  var index;
    property var  pagename:["groove","sysinfor","dataAnalay","setting"]
    property string indexpage: pagename[0];
    id: eRoboWeldSys;visible:true;index:0;
    width:appConfig.screenWidth;height: appConfig.screenHeight
    theme{primaryColor: "red";accentColor: "yellow";backgroundColor: "gray"}
    APPConfig{ id:appConfig;}
    ERModbus{id:ermodbus;}
    Timer{ interval: 100; running: true; repeat: true;
               onTriggered:{ datetime.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd dddd hh:mm:ss");
                   ermodbus.modbus_write_reg=1;
                   //index++;
                   switch(index){
                        case 4  :indexpage=pagename[0];groove.elevation=5; sysInforCard.elevation=0;dataAnalayCard.elevation=0;settingCard.elevation=0; break;
                        case 8  :indexpage=pagename[1];groove.elevation=0; sysInforCard.elevation=5;dataAnalayCard.elevation=0;settingCard.elevation=0; break;
                        case 12:indexpage=pagename[2];groove.elevation=0; sysInforCard.elevation=0;dataAnalayCard.elevation=5;settingCard.elevation=0; break;
                        case 16:indexpage=pagename[3];groove.elevation=0; sysInforCard.elevation=0;dataAnalayCard.elevation=0;settingCard.elevation=5; index=0;break;
                    }}}
    FocusScope{id:window;anchors{left:parent.left;right:parent.right;top:parent.top;bottom:parent.bottom;}
            Keys.enabled: true;
            Keys.onPressed: {
                switch(event.key){
                case Qt.Key_1:
                       console.log("Keyaccpet Key1");
                    break;
                }
                event.accepted =ture;
            }
            Keys.onEscapePressed: {
                console.log("Qt excit~");
                Qt.quit();
            }
          View{id:titlebar;height:24;elevation: 5;width: parent.width;backgroundColor: theme.accentColor
                    Text{id:appname;anchors{verticalCenter: parent.verticalCenter;left: parent.left;leftMargin: 5;}
                            text:qsTr("ER-100:便携式MAG焊接机器人系统");font.pixelSize: 14;}
                    RowLayout{ height:parent.height;  width:400; anchors.right:parent.right;
                        Icon{ id:brighnessIcon;name:"device/brightness_medium";anchors.right:warnIcon.left }
                        Icon{id:warnIcon; name:"awesome/warning" ;anchors.right:exchange.left}
                        Icon{id:exchange;name:"awesome/upload";anchors.right:lock.left}
                        Icon{id:lock;name:"awesome/lock"; anchors.right:accountIcon.left}
                        Icon{ id:accountIcon;name:"awesome/user";anchors.right:accountname.left}
                           //  color: Theme.lightDark(theme.backgroundColor, Theme.light.iconColor, Theme.dark.iconColor);}
                          //   onClicked: {changeuserDialog.show();password.enabled=false;password.text=""}}
                        Text{id:accountname; text:appConfig.currentusername;anchors.right:datetime.left;font.pixelSize: 14;}
                        Text{id:datetime;anchors.right:powerIcon.left;font.pixelSize: 14;}
                        Icon{id:powerIcon;name:"awesome/power_off";anchors.right:parent.right;anchors.rightMargin: 5}}}
          View{id:background;anchors{bottom:parent.bottom;top:titlebar.bottom;right:parent.right;left:parent.left}
                  backgroundColor:Palette.colors["blue"]["900"];
                   Button{id:groove;anchors{left:parent.left;leftMargin: 10;top:parent.top;topMargin: 10;}
                         elevation:0;width:100;height:140;backgroundColor:Palette.colors["red"]["500"];//radius:5;
                        Text{ id:grooveposition;font.pixelSize: 18;text:"平焊";anchors{top:parent.top;topMargin: 5;horizontalCenter: parent.horizontalCenter} }
                        Text{id:groovetype;font.pixelSize: 14;text:"单边V型坡口";anchors{top:grooveposition.bottom;horizontalCenter: parent.horizontalCenter} }
                        Text{id:joint;font.pixelSize:14; text:"T接头(I)";anchors{top:groovetype.bottom;horizontalCenter: parent.horizontalCenter}}
                        Canvas{id:canvas;anchors.left:parent.left;anchors.bottom: parent.bottom;width:100;height:80;
                                     onPaint:{Paint.paintflatweld(0,canvas);}} onClicked:{indexpage=pagename[0]; changeuserDialog.show();}
                    }
                   Button{id:sysInforCard;anchors{left:parent.left;leftMargin: 10;top:groove.bottom;topMargin: 10;}
                       elevation: 0; width:100;height:88;backgroundColor:Palette.colors["green"]["500"];onClicked:{indexpage=pagename[1]}}//radius: 5;
                   Button{id:dataAnalayCard;anchors{left:parent.left;leftMargin: 10;top:sysInforCard.bottom;topMargin: 10;}
                       elevation: 0;width: 100;height: sysInforCard.height;backgroundColor:Palette.colors["amber"]["500"];onClicked:{indexpage=pagename[2]}}//radius: 5;
                   Button{id:settingCard;anchors{left:parent.left;leftMargin: 10;top:dataAnalayCard.bottom;topMargin: 10;}//radius: 5;
                       elevation: 0;width: 100;height: sysInforCard.height;backgroundColor:Palette.colors["lime"]["500"];onClicked:{indexpage=pagename[3]}}
                   Card{ id:displayCard;anchors{right:parent.right;rightMargin:10;top:parent.top;topMargin:10;left:groove.right;leftMargin:10;bottom:parent.bottom;bottomMargin:10}
                       elevation: 0;//radius: 5;
                       backgroundColor:Palette.colors["grey"]["100"]/* ((displayCard.backgroundColor=="")?(Palette.colors["red"]["500"]):
                                      ((groove.elevation>sysInforCard.elevation)?
                                        ((groove.elevation>dataAnalayCard.elevation)?
                                          ((groove.elevation>settingCard.elevation)?(groove.backgroundColor):((groove.elevation===settingCard.elevation)?(displayCard.backgroundColor):(settingCard.backgroundColor)))
                                          :((dataAnalayCard>settingCard.elevation)?((groove.elevation===dataAnalayCard.elevation)?(displayCard.backgroundColor):(dataAnalayCard.backgroundColor)):
                                                                                                                    ((dataAnalayCard.elevation===settingCard.elevation)?(displayCard.backgroundColor):(settingCard.backgroundColor))))
                                      :((sysInforCard.elevation>dataAnalayCard.elevation)?
                                          ((sysInforCard.elevation>settingCard.elevation)?(sysInforCard.backgroundColor):((sysInforCard.elevation===settingCard.elevation)?(displayCard.backgroundColor):(settingCard.backgroundColor)))
                                          :((dataAnalayCard.elevation>settingCard.elevation)?((sysInforCard.elevation===dataAnalayCard.elevation)?(displayCard.backgroundColor):(dataAnalayCard.backgroundColor)):
                                                                                                                    ((dataAnalayCard.elevation===settingCard.elevation)?(displayCard.backgroundColor):(settingCard.backgroundColor))))))*/
                        Flickable{id:displayFlickable;clip: true;anchors {left:parent.left;right: parent.right;top: parent.top;bottom: parent.bottom}
                            Loader {id: pageloader;anchors.fill: parent;asynchronous: true;visible: status == Loader.Ready;
                                           source: {return Qt.resolvedUrl(("%1page.qml").arg(indexpage.replace("","")))}  }
                            ProgressCircle {anchors.centerIn: parent;visible: pageloader.status == Loader.Loading}}
                       Scrollbar{flickableItem:displayFlickable;}
                   }}}
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
            DB.db.transaction ( function(tx) {
              var result = tx.executeSql("select * from AccountTable");
              if(result.rows.length === 0) {
                     //////////////
              }
              else{for(var i=0;i<result.rows.length;i++){
                     var name = result.rows.item(i).name;
                      usrnamemodel.append( {"text":name});
                      if(name === accountname.text){
                           changeuserFeildtext.selectedIndex = i+1;
                           changeuserFeildtext.helperText=result.rows.item(i).type;} }
                    usrnamemodel.remove(0);                
              }
          });
        ermodbus.modbus_status="setup";
      }
}

