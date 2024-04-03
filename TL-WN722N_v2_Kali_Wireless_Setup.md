
#### WiFi Adapter Setup Instructions for Kali Linux

Use these commands to set up your WiFi adapter on Kali Linux for packet injection and monitoring:

#### Commands:

```bash
sudo apt update
sudo apt upgrade
sudo apt install bc
sudo apt-get install build-essential
sudo apt-get install libelf-dev
```

Try either of these commands to install the appropriate Linux headers:

```bash
sudo apt-get install linux-headers-`uname -r`
sudo apt-get install linux-headers-5.10.0-kali6-amd64
```

Then, continue with the following commands:

```bash
sudo apt install dkms
sudo rmmod r8188eu.ko
git clone https://github.com/aircrack-ng/rtl8188eus
cd rtl8188eus
sudo -i
echo "blacklist r8188eu" > "/etc/modprobe.d/realtek.conf"
exit
sudo reboot
sudo apt update
cd rtl8188eus
sudo make
sudo make install
sudo modprobe 8188eu
```

#### To Enable Monitor Mode and Test Packet Injection:

```bash
sudo ifconfig wlan0 down
sudo airmon-ng check kill
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
iwconfig
sudo aireplay-ng --test wlan0
```

These instructions provide the necessary steps to configure your WiFi adapter on Kali Linux for packet injection and monitoring. Ensure to follow them carefully for successful setup and testing.
