##instal KVM
apt-get update
apt-get install qemu-kvm libvirt-bin virtinst bridge-utils -y
modprobe vhost_net
lsmod | grep vhost
echo vhost_net >> /etc/modules 
rm /etc/network/interfaces
python -c 'print "auto l0\niface l0 inet loopback\nauto eth0\niface eth0 inet manual\niface br0 inet static\naddress 10.145.37.100\nnetwork 10.145.37.0\nnetmask 255.255.255.0\nbroadcasst 10.145.37.255\ngateway 10.145.37.1\ndns-nameservers 8.8.8.8\nbridge_ports eth0\nbridge_stp off\nauto br0" ' > /etc/network/interfaces
#create VM uncomment if you want to test
#mkdir -p /var/kvm/images
#virt-install --name tempate --ram 1024 --disk path=/var/kvm/images/template.img,size=15 --vcpus 1 --os-type linux --os-variant ubuntutrusty --network bridge=br0 --graphics none --console pty,target_type=serial --location 'http://archive.ubuntu.com/ubuntu/dists/trusty/main/installer-amd64/' --extra-args 'console=ttyS0,115200n8 serial'