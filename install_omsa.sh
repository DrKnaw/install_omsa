#!/bin/bash

gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 1285491434D8786F
gpg -a --export 1285491434D8786F | apt-key add -
echo "deb http://linux.dell.com/repo/community/openmanage/930/bionic bionic main" > /etc/apt/sources.list.d/linux.dell.com.sources.list
mkdir /tmp/packages_omsa
cd /tmp/packages_omsa
apt install wget -y 
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


echo 'Install Packages for OMSA?'
select activites in "Install" "Exit"; do
  case $activites in
        Install ) break;;
        Exit ) rm -R /tmp/packages_omsa; exit;;
    esac
done
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
cd ..
rm -R /tmp/packages_omsa
echo 'Install SRVADMIN?'
select activites in "Install" "Exit"; do
  case $activites in
        Install ) break;;
        Exit ) exit;;
    esac
done
apt update
apt install srvadmin-all -y 
echo ' '
echo 'Do You want OMSA to IGNORE GENERATION? (No)'
select activites in "Yes" "No"; do
  case $activites in
        Yes ) touch /opt/dell/srvadmin/lib64/openmanage/IGNORE_GENERATION; break;;
        No ) break;;
    esac
done
echo ' '
echo 'Enable SRVADMIN Services Right Now ?'
select activites in "Yes" "No"; do
  case $activites in
        Yes ) break;;
        No ) exit;;
    esac
done
/opt/dell/srvadmin/sbin/srvadmin-services.sh enable
/opt/dell/srvadmin/sbin/srvadmin-services.sh start
echo "Installation Done."
echo "OMSA is now normally running on https://0.0.0.0:1311"
echo ''