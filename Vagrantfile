# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|  
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "base.pp"
  end
 
  config.vm.define :neo01 do |neo|    
    neo.vm.network :private_network, ip: "192.168.33.101"
    neo.vm.network :forwarded_port, host: 4569, guest: 8080
  end
 
  config.vm.define :neo02 do |neo|
    neo.vm.network :private_network, ip: "192.168.33.102"
  end 
end
