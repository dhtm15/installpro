#!/bin/bash

cd

if [ $(id -u) -eq 0 ]
then
        clear
else
        if echo $(id) |grep sudo > /dev/null
        then
        clear
        echo "Voce n�o � root"
        echo "Seu usuario esta no grupo sudo"
        echo -e "Para virar root e fazer a instala��o execute \033[1;31msudo su\033[0m"
        exit
        else
        clear
        echo -e "Vc pecisa esta como root para poder fazer a instal��o, Para virar root execute \033[1;31msu\033[0m e digite sua senha root"
        exit
        fi
fi


if yum -y update
then
yum -y update
yum -y install git
git clone https://github.com/dhtm15/VpsPackPro.git
clear
cd VpsPack
rm -rf README.md
rm -rf install
for arqs in `ls`
do
rm /bin/$arqs 2>/dev/null
mv $arqs /bin
chmod +x /bin/$arqs
done
echo -e "\033[1;33mConcluido, Execute o comando \033[1;32mmenu\033[1;33m como root \033[0m"
else
apt-get update
apt-get install -y git
git clone https://github.com/dhtm15/VpsPackPro.git
clear
cd VpsPack
rm -rf README.md
rm -rf install
for arqs in `ls`
do
rm /bin/$arqs 2>/dev/null
mv $arqs /bin
chmod +x /bin/$arqs
done
echo -e "\033[1;37mConcluido, Execute o comando \033[1;33mmenu\033[1;37m como root \033[0m"
fi
cd
rm -rf install 2> /dev/null
rm -rf VpsPack 2> /dev/null