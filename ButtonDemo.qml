import QtQuick 2.4
import QtQuick.Layouts 1.1
import Material 0.1

Item {
   property  bool  t5flag:false
    GridLayout {
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        columns: 3
        rows:5
        rowSpacing: 10
        columnSpacing:10
        Button {
            id:t1
            text: "Ra Button"
            elevation: 2
            onClicked: snackbar.open("Simple, isn't it?")
            ColorAnimation {
                from: "white"
                to: "black"
                duration: 200
            }
        }
        Button {
            id:t2
            text: "Ra Button"
            elevation: 2
            onClicked: snackbar.open("This is a snackbar")
        }
        Button {
            id:t3
            text: "Ra Button"
            onClicked: snackbar.open("Simple, isn't it?")
             elevation: 2
        }
        Button {
            id:t4
            elevation: 2
            text: "Ra Button"
            onClicked: snackbar.open("This is a snackbar")
        }
        Button {
            id:t5
            text: "Ra Button"
           elevation:t5flag?10:2
            onHoveredChanged:{
                if(t5flag ){
                      t5flag = false;

                }
                else{
                    snackbar.open("nihao");
                     t5flag = true;

                }
            }
        }
        Button {
            id:t6
            elevation: 2
            backgroundColor: Theme.backgroundColor
            text: "Ra Button"
            onClicked: snackbar.open("This is a snackbar")
        }
        Button {
            id:t7
            elevation: 2
            text: "Ra Button"
            onClicked: snackbar.open("This is a snackbar")
        }
        Button {
            id:t8
            elevation: 2
            text: "Ra Button"
            onClicked: snackbar.open("This is a snackbar")
        }
        Button {
            id:t9
            elevation: 2
            text: "Ra Button"
            onClicked: snackbar.open("This is a snackbar")
        }

    }
    Snackbar {
        id: snackbar
    }
}
