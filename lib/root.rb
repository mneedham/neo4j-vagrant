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
      end
    end
  end
end