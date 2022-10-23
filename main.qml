//import QtQuick 2.9
//import QtQuick.VirtualKeyboard
//import QtQml.Models 2.15

//Window {
//    id: window
//    width: 640
//    height: 480
//    visible: true
//    title: qsTr("Hello World")

//    ListModel {
//        id: contactListModel
//        ListElement {
//            name: "John"; phone: "+1 1234567890";
//            email: "john@abc.com"
//        }
//        ListElement {
//            name: "Michael" ; phone: "+44 213243546" ;
//            email: "michael@abc.com"
//        }
//        ListElement {
//            name: "Robert" ; phone: "+61 5678912345" ;
//            email: "robert@xyz.com"
//        }
//        ListElement {
//            name: "Kayla" ; phone: "+91 9876554321" ;
//            email: "kayla@xyz.com"
//        }
//    }


//    Component {
//        id: contactDelegate
//        Row {
//            id: contact
//            spacing: 20
//            Text { text: " Name: " + name; }
//            Text { text: " Phone no: " + phone }
//            Text { text: " Email ID: " + email }
//        }
//    }

//    ListView {
//        anchors.fill: parent
//        model: contactListModel
//        delegate: contactDelegate
//    }

//    InputPanel {
//        id: inputPanel
//        z: 99
//        x: 0
//        y: window.height
//        width: window.width

//        states: State {
//            name: "visible"
//            when: inputPanel.active
//            PropertyChanges {
//                target: inputPanel
//                y: window.height - inputPanel.height
//            }
//        }
//        transitions: Transition {
//            from: ""
//            to: "visible"
//            reversible: true
//            ParallelAnimation {
//                NumberAnimation {
//                    properties: "y"
//                    duration: 250
//                    easing.type: Easing.InOutQuad
//                }
//            }
//        }
//    }
//}

import QtQuick 2.15
import QtQuick.VirtualKeyboard
import QtQml.Models 2.15
import Qt.labs.qmlmodels 1.0

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    TableView {
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true
        model: TableModel {
            TableModelColumn { display: "name" }
            TableModelColumn { display: "phone" }
            TableModelColumn { display: "email" }

            rows: [
                {
                    name: "John",
                    phone: "+1 1234567890",
                    email: "john@abc.com"
                },
                {
                    name: "Michael",
                    phone: "+44 213243546",
                    email: "michael@abc.com"
                },
                {
                    name: "Robert",
                    phone: "+61 5678912345",
                    email: "robert@xyz.com"
                },
                {
                    name: "Kayla",
                    phone: "+91 9876554321",
                    email: "kayla@xyz.com"
                }
            ]

        }

        delegate: Rectangle {
            implicitWidth: 120
            implicitHeight: 50
            border.width: 2

            Text {
                text: display
                anchors.centerIn: parent
            }
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
