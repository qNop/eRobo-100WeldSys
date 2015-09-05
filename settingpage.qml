import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1

View {
    Text{
        text:"setting"
    }
    Button{
        id:b
        x:100
        y:100
        width:100
        height: 50;
        elevation:1
        onClicked: {
            landscapeDatePickerDialog.open();
            console.log("landdate");
       }
    }

    Dialog{id: landscapeDatePickerDialog;hasActions: true;contentMargins: 0;floatingActions: true;
              DatePicker { frameVisible: false;dayAreaBottomMargin : Units.dp(48);isLandscape: true }}
}

