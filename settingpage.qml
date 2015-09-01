import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1

View {
    Text{
        text:"setting"
    }
    Dialog{id: landscapeDatePickerDialog;hasActions: true;contentMargins: 0;floatingActions: true;
              DatePicker { frameVisible: false;dayAreaBottomMargin : Units.dp(48);isLandscape: true }}
}

