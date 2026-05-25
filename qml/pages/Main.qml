import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("About.qml"))
                }
            }

            MenuItem {
                text: qsTr("Connect")
                onClicked: {
                    deviceManager.connectToDevice()
                }
            }
        }

        PageHeader {
            id: header
            title: deviceManager.devicePaired ? (deviceManager.deviceConnected ? (deviceManager.servicesRegistered ? qsTr("Device connected") : qsTr("Registering services")) : qsTr("Device found")) : qsTr("Device not paired")
        }

        Row {
            id: switchRow
            width: parent.width
            anchors.top: header.bottom
            anchors.topMargin: Theme.paddingMedium

            Switch {
                id: onButton
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width/2
                checked: deviceManager.locked
                enabled: deviceManager.servicesRegistered

                icon.source: "image://theme/icon-m-device-lock"
                onClicked: deviceManager.locked = !deviceManager.locked
            }

            Switch {
                id: lightsButton
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width/2
                checked: deviceManager.lights
                enabled: deviceManager.servicesRegistered

                icon.source: "image://theme/icon-m-flashlight"
                onClicked: deviceManager.lights = !deviceManager.lights
            }
        }

        Row {
            id: iconsRow
            width: parent.width
            anchors.top: switchRow.bottom
            anchors.topMargin: Theme.paddingLarge*3

            Column {
                width: parent.width/4
                Icon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "image://theme/icon-m-battery"
                    width: Theme.iconSizeMedium
                    height: Theme.iconSizeMedium
                }

                Label {
                    text: deviceManager.battery + "%"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                width: parent.width/4
                Icon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:///icons/icon-m-voltage.svg"
                    width: Theme.iconSizeMedium
                    height: Theme.iconSizeMedium
                }

                Label {
                    text: deviceManager.batteryVoltage/1000 + " V"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                width: parent.width/4
                Icon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:///icons/icon-m-speed.svg"
                    width: Theme.iconSizeMedium
                    height: Theme.iconSizeMedium
                }

                Label {
                    text: deviceManager.speed + " km/h"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                width: parent.width/4
                Icon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:///icons/icon-m-distance.svg"
                    width: Theme.iconSizeMedium
                    height: Theme.iconSizeMedium
                }

                Label {
                    text: deviceManager.distance + " m"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        Slider {
            width: parent.width
            anchors.top: iconsRow.bottom
            anchors.topMargin: Theme.paddingLarge*3
            leftMargin: Theme.paddingLarge*3
            rightMargin: Theme.paddingLarge*3
            minimumValue: 0
            maximumValue: 100
            value: deviceManager.power
            label: qsTr("Assistance")
        }
    }
}
