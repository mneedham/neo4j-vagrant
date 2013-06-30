module Vagrant
  module Config
    module V2
      class Root
        def provision_as_role(role)
          vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.module_path = "puppet/modules"
            puppet.manifest_file  = "base.pp"
            puppet.facter = { "role" => role.to_s }
          end 
        end

        def provision_as_neo(opts)
          private_network = vm.networks.find { |x| x[0] == :private_network }
          ip = private_network ?  private_network[1][:ip] : opts[:ip]
          
          vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.module_path = "puppet/modules"
            puppet.manifest_file  = "base.pp"
            puppet.facter = { 
              "role" => 'neo', 
              "server_id" => opts[:server_id],
              "initial_hosts" => opts[:initial_hosts].map { |h| "#{h}:5001" }.join(","),
              "ip" => ip
            }
          end           
        end
      end
    end
  end
end