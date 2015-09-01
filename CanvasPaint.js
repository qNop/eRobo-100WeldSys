.import QtQuick 2.5 as Canvs

function paintflatweld(style,can){
   var  ctx=can.getContext("2d");
  ctx.save();
  ctx.clearRect(0,0,100, 80);
  ctx.strokeStyle ="black";
  ctx.fillStyle="blue";
  ctx.antialiasing=false;
  ctx.lineWidth=1;
   switch(style){
        case 0:
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
             //  ctx.fill();
             ctx.stroke();
            break;
    }
    ctx.restore();
}
