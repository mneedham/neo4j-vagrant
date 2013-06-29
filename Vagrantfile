# -*- mode: ruby -*-
# vi: set ft=ruby :
require File.join(File.dirname(__FILE__), 'lib', 'root.rb')

Vagrant.configure("2") do |config|  
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
 
  config.vm.define :neo01 do |neo| 
    neo.provision_as_role :neo
    neo.vm.hostname = "neo01"
    neo.vm.network :private_network, ip: "192.168.33.101"
  end
 
  config.vm.define :neo02 do |neo|    
    neo.provision_as_role :neo  
    neo.vm.hostname = "neo02"
    neo.vm.network :private_network, ip: "192.168.33.102"
  end

  config.vm.define :neo03 do |neo| 
    neo.provision_as_role :neo
    neo.vm.hostname = "neo03"
    neo.vm.network :private_network, ip: "192.168.33.103"
  end  

  config.vm.define :lb do |lb|
    lb.provision_as_role :lb
    lb.vm.hostname = "lb01"
    lb.vm.network :private_network, ip: "192.168.33.104"
    lb.vm.network :forwarded_port, host: 4569, guest: 8080
  end
end