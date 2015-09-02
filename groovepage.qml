import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1
import QtQuick.Layouts 1.1
//import "Groovecardview.qml"

View {
    ColumnLayout{
        anchors{centerIn:parent.Center}
        spacing: 10
    RowLayout{
        spacing: 10
        Groovecardview{
            id:l;
        }
        Groovecardview{
            id:l1;
        }
        Groovecardview{
            id:l2;
        }
        Groovecardview{
            id:l3;
        }
    }
    RowLayout{
         spacing: 10
         Groovecardview{
             id:y;
         }
         Groovecardview{
             id:y1;
         }
         Groovecardview{
             id:y2;
         }
         Groovecardview{
             id:y3;
         }
    }
    }
}

