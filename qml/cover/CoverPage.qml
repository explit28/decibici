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
            iconSource: deviceManager.locked ? "image://theme/icon-s-secure" : "image://theme/icon-s-outline-secure"
            onTriggered: deviceManager.locked = !deviceManager.locked
        }

        CoverAction {
            iconSource: deviceManager.lights ? "image://theme/icon-m-day" : "image://theme/icon-m-do-not-disturb"
            onTriggered: deviceManager.lights = !deviceManager.lights
        }
    }
}
