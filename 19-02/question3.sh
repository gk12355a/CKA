sudo dpkg -i cri-dockerd_0.3.9.3-o.ubuntu-jammy_amd64.deb 
sudo apt-get install -f -y
sudo systemctl enable --now cri-docker.service cri-docker.socket
sudo systemctl status cri-docker.service
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
sudo sysctl -w net.ipv4.ip.forward=1
sudo sysctl -w net.netfilter.nf.conntrack_max=131072
sudo sysctl --system
