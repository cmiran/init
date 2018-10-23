#!/bin/bash

mkdir -p /Volumes/Storage/goinfre/$USER/vagrant
# echo 'export VAGRANT_HOME=/Volumes/Storage/goinfre/$USER/vagrant' >> ~/.zshrc

cat > Vagrantfile << EOM
Vagrant.configure("2") do |config|
	config.vm.box = "debian/stretch64"
	config.vm.synced_folder ".", "/git"
end
EOM

vagrant plugin install vagrant-vbguest
vagrant up
vagrant vb-guest
