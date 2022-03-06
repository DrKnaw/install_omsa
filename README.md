# omsa-install_script
a dummy script for install omsa on debian/proxmox.
# How to make it work ?
Just simply run the script by typing 'bash discord-activies.sh' in your terminal and fill the question.
# Warning

#Manual INSTALL
gpg --keyserver hkp://pool.sks-keyservers.net:80 --recv-key 1285491434D8786F
gpg -a --export 1285491434D8786F | apt-key add -
echo "deb http://linux.dell.com/repo/community/openmanage/930/bionic bionic main" > /etc/apt/sources.list.d/linux.dell.com.sources.list
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openwsman/libwsman-curl-client-transport1_2.6.5-0ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openwsman/libwsman-client4_2.6.5-0ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openwsman/libwsman1_2.6.5-0ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openwsman/libwsman-server1_2.6.5-0ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sblim-sfcc/libcimcclient0_2.2.8-0ubuntu2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openwsman/openwsman_2.6.5-0ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/multiverse/c/cim-schema/cim-schema_2.48.0-0ubuntu1_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sblim-sfc-common/libsfcutil0_1.0.1-0ubuntu4_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/multiverse/s/sblim-sfcb/sfcb_1.4.9-0ubuntu5_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sblim-cmpi-devel/libcmpicppimpl0_2.0.3-0ubuntu2_amd64.deb
dpkg -i libwsman-curl-client-transport1_2.6.5-0ubuntu3_amd64.deb
dpkg -i libwsman-client4_2.6.5-0ubuntu3_amd64.deb
dpkg -i libwsman1_2.6.5-0ubuntu3_amd64.deb
dpkg -i libwsman-server1_2.6.5-0ubuntu3_amd64.deb
dpkg -i libcimcclient0_2.2.8-0ubuntu2_amd64.deb
dpkg -i openwsman_2.6.5-0ubuntu3_amd64.deb
dpkg -i cim-schema_2.48.0-0ubuntu1_all.deb
dpkg -i libsfcutil0_1.0.1-0ubuntu4_amd64.deb
dpkg -i sfcb_1.4.9-0ubuntu5_amd64.deb
dpkg -i libcmpicppimpl0_2.0.3-0ubuntu2_amd64.deb

apt update
apt install srvadmin-all
touch /opt/dell/srvadmin/lib64/openmanage/IGNORE_GENERATION
srvadmin-services.sh enable && srvadmin-services.sh start
