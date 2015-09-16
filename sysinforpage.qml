import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1
//import "Testqml.qml"
View {
    Text{
        text:"sysinfor"
    }
    Testqml{
       id:test
       Rectangle{
           Text{
               text:"test1"
           }
       }
       Rectangle{
           Text{
               text:"test2"
           }
       }
       Rectangle{
           Text{
               text:"test3"
           }
       }
    }
}

