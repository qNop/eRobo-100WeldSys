import QtQuick 2.0
import Material 0.1
import Material.ListItems 0.1

Item {
    anchors.fill: parent
    id: bottomSheetDemo

    Button {
        anchors.centerIn: parent
        elevation: 1
        text: "Open Bottom Sheet"
        onClicked: {
            actionSheet.open()
        }
    }

    BottomActionSheet {
        id: actionSheet

        title: "Demo!"

        actions: [
            Action {
                iconName: "social/share"
                name: "Share"
            },

            Action {
                iconName: "file/file_download"
                name: "Download (Disabled)"
                enabled: false
            },

            Action {
                iconName: "action/autorenew"
                name: "THIS SHOULD BE HIDDEN"
                visible: false
            },

            Action {
                iconName: "action/settings"
                name: "Details"
                hasDividerAfter: true
            },

            Action {
                iconName: "content/forward"
                name: "Move"
            },

            Action {
                iconName: "action/delete"
                name: "Delete"
            },

            Action {
                iconName: "content/create"
                name: "Rename"
            }
        ]
    }
}

