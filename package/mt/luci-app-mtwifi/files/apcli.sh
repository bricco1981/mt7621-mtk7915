#!/bin/sh /etc/rc.common

start() {
	iwpriv apcli0 set ApCliEnable=0
	ssid=$(grep -e "ApCliSsid=" /etc/wireless/mt7615/mt7615.1.5G.dat)
	enable=$(grep -e "ApCliEnable=" /etc/wireless/mt7615/mt7615.1.5G.dat)
	iwpriv apcli0 set "$ssid"
	iwpriv apcli0 set ApCliAutoConnect=3
    	iwpriv apcli0 set "$enable"
    	iwpriv apclix0 set ApCliEnable=0
	ssid=$(grep -e "ApCliSsid=" /etc/wireless/mt7615/mt7615.1.2G.dat)
	enable=$(grep -e "ApCliEnable=" /etc/wireless/mt7615/mt7615.1.2G.dat)
	iwpriv apclix0 set "$ssid"
	iwpriv apclix0 set ApCliAutoConnect=3
    	iwpriv apclix0 set "$enable"
    	kick=$(grep -e "KickStaRssiLow=" /etc/wireless/mt7615/mt7615.1.5G.dat)
    	iwpriv ra0 set "$kick"
    	kick=$(grep -e "KickStaRssiLow=" /etc/wireless/mt7615/mt7615.1.2G.dat)
    	iwpriv rax0 set "$kick"
}



