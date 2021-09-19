#!/bin/bash

VM_NAME=Catalina
VM_FOLDER="/home/pgraffigna/datos/virtualbox"
ISO="/home/pgraffigna/datos/isos/macOS_Catalina.iso"
CPU=4
MEM=8000
VRAM=128
DISK=40000
OS=MacOS_64

echo -e "Creando la VM"
/usr/bin/vboxmanage createvm --name $VM_NAME --ostype $OS --register  

echo -e "Habilitando EFI"
/usr/bin/vboxmanage modifyvm $VM_NAME --firmware efi

echo -e "Configurando CPU, RAM y video RAM"
/usr/bin/vboxmanage modifyvm $VM_NAME --cpus $CPU --memory $MEM --vram $VRAM

echo -e "Configurando el adaptador de red"
/usr/bin/vboxmanage modifyvm $VM_NAME --nic1 nat
#/usr/bin/vboxmanage modifyvm $VM_NAME --nic1 bridged --bridgeadapter1 eth0

echo -e "Creando disco de tipo dinamico y agregando el ISO"
/usr/bin/vboxmanage createhd --filename $VM_FOLDER/$VM_NAME/$VM_NAME.vdi --size $DISK --format VDI --variant Standard

/usr/bin/vboxmanage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAhci
/usr/bin/vboxmanage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $VM_FOLDER/$VM_NAME/$VM_NAME.vdi
/usr/bin/vboxmanage storagectl $VM_NAME --name "IDE Controller" --add ide 
/usr/bin/vboxmanage storageattach $VM_NAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $ISO

echo -e "La VM esta lista para iniciar!!"



