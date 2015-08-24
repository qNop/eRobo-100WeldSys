import QtQuick 2.0
import Material 0.1

Card {
    width: 100
    height: 60
    Canvas{
           anchors.top:parent.top;
            width:parent.width;
            property int line: 100;
            onPaint: {
                 var ctx = getContext("2d");
                       ctx.save();
                       ctx.clearRect(0,0,canvas.width, canvas.height);
                       ctx.beginPath();
                        ctx.moveTo(10,10);
                       ctx.lineTo(100,10);

                       ctx.closePath();
                       ctx.restore();
            }
    }
}

