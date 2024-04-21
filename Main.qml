import QtQuick
import QtQuick.Controls
import QtWebView

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("MetaBox")

    property url webUrl: "https://bulentcan.com/metabox"

    Text {
        anchors.centerIn: parent
        font.pixelSize: 16
        color: Qt.red
        text: qsTr("Ağ bağlantınızı kontrol edin...")
    }

    WebView {
        id: webView
        anchors.fill: parent

        visible: (webView.status === webView.LoadSucceededStatus) ? true : false

        settings.javaScriptEnabled: true
        settings.allowFileAccess: true
        settings.localStorageEnabled: true
        url: webUrl

        // onLoadingChanged: {
        //     if(webView.status === webView.LoadSucceededStatus){

        //         var jsText = '
        //             var barkodInput = document.getElementById("barkod")

        //             if(barkodInput){
        //                 barkodInput.addEventListener(\'click\', function(event){
        //                     barkodInput.setAttribute(\'inputmode\', \'none\')
        //                 })
        //             }';

        //         webView.runJavaScript(jsText);
        //     }
        // }
    }
}
