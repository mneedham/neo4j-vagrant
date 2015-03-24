# -*- mode: ruby -*-
# vi: set ft=ruby :
require File.join(File.dirname(__FILE__), 'lib', 'root.rb')

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define :neo01 do |neo|
    neo.vm.hostname = "neo01"
    neo.vm.network :forwarded_port, guest: 7474, host: 7001
    neo.vm.network :forwarded_port, guest: 80, host: 8080
    neo.vm.network :private_network, ip: "192.168.33.101"
    neo.provision_as_neo :server_id => 1, :initial_hosts => ["192.168.33.101", "192.168.33.102", "192.168.33.103"]
  end

  config.vm.define :neo02 do |neo|
    neo.vm.hostname = "neo02"
    neo.vm.network :forwarded_port, guest: 7474, host: 7002
    neo.vm.network :private_network, ip: "192.168.33.102"
    neo.provision_as_neo :server_id => 2, :initial_hosts => ["192.168.33.101", "192.168.33.102", "192.168.33.103"]
  end

  config.vm.define :neo03 do |neo|
    neo.vm.hostname = "neo03"
    neo.vm.network :forwarded_port, guest: 7474, host: 7003
    neo.vm.network :private_network, ip: "192.168.33.103"
    neo.provision_as_neo :server_id => 3, :initial_hosts => ["192.168.33.101", "192.168.33.102", "192.168.33.103"]
  end

end
