import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Column {
        anchors.centerIn: parent
        spacing: Theme.paddingLarge

        Label {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("decibici")
        }

        Label {
            id: status
            anchors.horizontalCenter: parent.horizontalCenter
            text: deviceManager.devicePaired ? (deviceManager.deviceConnected ? qsTr("Device connected") : qsTr("Device found")) : qsTr("Device not paired")
        }
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: deviceManager.locked ? "../resources/icons/icon-cover-locked.svg" : "../resources/icons/icon-cover-unlocked.svg"
            onTriggered: deviceManager.locked = !deviceManager.locked
        }

        CoverAction {
            iconSource: deviceManager.lights ? "../resources/icons/icon-cover-light-off.svg" : "../resources/icons/icon-cover-light-on.svg"
            onTriggered: deviceManager.lights = !deviceManager.lights
        }
    }
}
