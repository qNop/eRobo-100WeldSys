import QtQuick 2.4
import QtQuick.Layouts 1.1
import Material 0.1
import Material.Extras 0.1
/*仅显示进度条*/
PopupBase {
      id:popslider
      overlayLayer: "dialogOverlayLayer"
      overlayColor: Qt.rgba(0, 0, 0, 0.5)
      opacity: showing ? 1 : 0
      visible: opacity > 0
      anchors {
          centerIn: parent
          verticalCenterOffset: showing ? 0 : -(popslider.height/3)
          Behavior on verticalCenterOffset {
              NumberAnimation { duration: 200 }
          }
      }

      Behavior on opacity {
          NumberAnimation { duration: 200 }
      }
      function show() {
          open()
      }
    Slider{
        id:slider;width:480;anchors.centerIn: popslider//Layout.alignment:  Qt.AlignCenter;
        value:0;stepSize: 2;focus: true;//numericValueLabel: true;
        minimumValue: 0;maximumValue: 100; activeFocusOnPress: true;
    }
    Timer{ interval: 100; running: true; repeat: true;
        onTriggered: {
           slider.value+=2;
            if(slider.value>99){
                slider.value=0;
                close()
            }
        }}
}

