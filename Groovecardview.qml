import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1
import "CanvasPaint.js" as Paint
 Card{
        id:groove;
        property string groovename: "平焊";
        property string groovetypename: "单边V型坡口";
        property string jointname:"T接头";
        property int canvastype:0;
        property bool groovetitle:false;
          elevation:5;width:100;height:140;radius:5;backgroundColor:Palette.colors["red"]["500"];
          Text{ id:grooveposition;font.pixelSize: 18;text:groovename;
              anchors{top:parent.top;horizontalCenter: parent.horizontalCenter} }
          Text{id:groovetype;font.pixelSize: 14;text:groovetypename;
              anchors{top:grooveposition.bottom;horizontalCenter: parent.horizontalCenter} }
          Text{id:joint;font.pixelSize:14; text:{
                if(groovetitle){
                    return jointname+"(I)";
                } else
                    return jointname;
              }
              anchors{top:groovetype.bottom;horizontalCenter: parent.horizontalCenter}}
          Canvas{id:canvas;anchors.left:parent.left;anchors.bottom: parent.bottom;width:parent.width;height:80;
                      onPaint:{Paint.paintflatweld(canvastype,canvas);
                      }
          }
 }


