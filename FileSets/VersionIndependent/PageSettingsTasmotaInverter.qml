/////// new menu for system shutdown

import QtQuick 1.1
import "utils.js" as Utils
import com.victron.velib 1.0

MbPage
{
	id: root
	title: qsTr("Tasmota Inverter")
    VBusItem { id: tasmotaItem; bind: Utils.path("com.victronenergy.inverter.tasmota", "/Connected") }

    model: VisibleItemModel
    {
        MbItemText
        {
            text: qsTr("Tasmota Inverter not running")
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            show: !tasmotaItem.valid
        }

        MbItemText
        {
            property VBusItem tasmotaIp: VBusItem { bind: "com.victronenergy.inverter.tasmota/Settings/Tasmota/Setup/TasmotaIp" }
            id: tasmotaIpValue
            name: qsTr("TasmotaIp")
            show: tasmotaIp.value
            writeAccessLevel: User.AccessInstaller
            show: tasmotaItem.valid
        }
    }
}