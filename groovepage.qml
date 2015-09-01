import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1
import QtQuick.Layouts 1.1
import "CanvasPaint.js" as Paint
View {
    ColumnLayout{
        anchors{centerIn:parent.Center}
        spacing: 10
    RowLayout{
        spacing: 10
    Card{id:groove;//anchors{left:parent.left;leftMargin: 10;top:parent.top;topMargin: 10;}
          elevation:5;width:100;height:140;radius:5;backgroundColor:Palette.colors["red"]["500"];
         Text{ id:grooveposition;font.pixelSize: 18;text:"平焊";anchors{top:parent.top;horizontalCenter: parent.horizontalCenter} }
         Text{id:groovetype;font.pixelSize: 14;text:"单边V型坡口";anchors{top:grooveposition.bottom;horizontalCenter: parent.horizontalCenter} }
         Text{id:joint;font.pixelSize:14; text:"T接头(I)";anchors{top:groovetype.bottom;horizontalCenter: parent.horizontalCenter}}
         Canvas{id:canvas;anchors.left:parent.left;anchors.bottom: parent.bottom;width:100;height:80;
                      onPaint:{Paint.paintflatweld(0,canvas);}}}
    Card{id:groove1;//anchors{left:parent.left;leftMargin: 10;top:parent.top;topMargin: 10;}
          elevation:5;width:100;height:140;radius:5;backgroundColor:Palette.colors["red"]["500"];
         Text{ id:grooveposition1;font.pixelSize: 18;text:"平焊";anchors{top:parent.top;horizontalCenter: parent.horizontalCenter} }
         Text{id:groovetype1;font.pixelSize: 14;text:"单边V型坡口";anchors{top:grooveposition1.bottom;horizontalCenter: parent.horizontalCenter} }
         Text{id:joint1;font.pixelSize:14; text:"T接头(I)";anchors{top:groovetype1.bottom;horizontalCenter: parent.horizontalCenter}}
         Canvas{id:canvas1;anchors.left:parent.left;anchors.bottom: parent.bottom;width:100;height:80;
                      onPaint:{Paint.paintflatweld(0,canvas1);}}}
    Card{id:groove2;//anchors{left:parent.left;leftMargin: 10;top:parent.top;topMargin: 10;}
          elevation:5;width:100;height:140;radius:5;backgroundColor:Palette.colors["red"]["500"];
         Text{ id:grooveposition2;font.pixelSize: 18;text:"平焊";anchors{top:parent.top;horizontalCenter: parent.horizontalCenter} }
         Text{id:groovetype2;font.pixelSize: 14;text:"单边V型坡口";anchors{top:grooveposition2.bottom;horizontalCenter: parent.horizontalCenter} }
         Text{id:joint2;font.pixelSize:14; text:"T接头(I)";anchors{top:groovetype2.bottom;horizontalCenter: parent.horizontalCenter}}
         Canvas{id:canvas2;anchors.left:parent.left;anchors.bottom: parent.bottom;width:100;height:80;
                      onPaint:{Paint.paintflatweld(0,canvas2);}}}
    Card{id:groove3;//anchors{left:parent.left;leftMargin: 10;top:parent.top;topMargin: 10;}
          elevation:5;width:100;height:140;radius:5;backgroundColor:Palette.colors["red"]["500"];
         Text{ id:grooveposition3;font.pixelSize: 18;text:"平焊";anchors{top:parent.top;horizontalCenter: parent.horizontalCenter} }
         Text{id:groovetype3;font.pixelSize: 14;text:"单边V型坡口";anchors{top:grooveposition3.bottom;horizontalCenter: parent.horizontalCenter} }
         Text{id:joint3;font.pixelSize:14; text:"T接头(I)";anchors{top:groovetype3.bottom;horizontalCenter: parent.horizontalCenter}}
         Canvas{id:canvas3;anchors.left:parent.left;anchors.bottom: parent.bottom;width:100;height:80;
                      onPaint:{Paint.paintflatweld(0,canvas3);}}}
    }
    RowLayout{
          spacing: 10
        Card{id:groove4;//anchors{left:parent.left;leftMargin: 10;top:parent.top;topMargin: 10;}
              elevation:5;width:100;height:140;radius:5;backgroundColor:Palette.colors["red"]["500"];
             Text{ id:grooveposition4;font.pixelSize: 18;text:"平焊";anchors{top:parent.top;horizontalCenter: parent.horizontalCenter} }
             Text{id:groovetype4;font.pixelSize: 14;text:"单边V型坡口";anchors{top:grooveposition4.bottom;horizontalCenter: parent.horizontalCenter} }
             Text{id:joint4;font.pixelSize:14; text:"T接头(I)";anchors{top:groovetype4.bottom;horizontalCenter: parent.horizontalCenter}}
             Canvas{id:canvas4;anchors.left:parent.left;anchors.bottom: parent.bottom;width:100;height:80;
                          onPaint:{Paint.paintflatweld(0,canvas4);}}}
    }
    }
}

