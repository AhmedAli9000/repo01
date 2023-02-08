sudo -i

pvcreate /dev/sdc

vgcreate vg_usr_sap /dev/sdc

lvcreate -l 100%Free --name lv_usr_sap vg_usr_sap

mkfs.xfs /dev/vg_usr_sap/lv_usr_sap

mkdir /usr_sap

mount /dev/vg_usr_sap/lv_usr_sap /usr_sap

mount -a

OUTPUT="$(sudo blkid -s UUID -o value /dev/mapper/vg_usr_sap-lv_usr_sap$partnumber)"
echo "UUID="$OUTPUT"    /usr_sap    xfs    defaults    0    0" | sudo tee -a /etc/fstab"
