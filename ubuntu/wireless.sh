sudp apt update
sudo apt install dpkg-dev
sudo apt install build-essential libc6-dev linux-headers-`uname -r`
sudo apt install git

git clone https://github.com/FomalhautWeisszwerg/rtl8822bu.git
cd rtl8822bu
make
sudo make install
sudo modprobe 8822bu
