# # vi: set ft=ruby :
domain   = 'test.uk'

appnodes = [
  { :hostname => 'app1',  :ip => '10.0.0.20', :box => 'ubuntu/trusty64', :ram => '512', :recipe => 'go', :cb => 'chef/cookbooks' },
  { :hostname => 'app2',  :ip => '10.0.0.21', :box => 'ubuntu/trusty64', :ram => '512', :recipe => 'go', :cb => 'chef/cookbooks'  } ,
  { :hostname => 'web',   :ip => '10.0.0.10', :box => 'ubuntu/trusty64', :ram => '512', :recipe => 'nginx', :cb => 'chef/cookbooks'  },
]

Vagrant.configure("2") do |config|

  appnodes.each do |node|

    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "ubuntu/trusty64"
      nodeconfig.vm.hostname = node[:hostname] + ".box"
      nodeconfig.vm.network :private_network, ip: node[:ip]
	  config.vm.provision :chef_zero do |chef|
	  chef.cookbooks_path = [ node[:cb].to_s ]
	  chef.add_recipe node[:recipe].to_s
	  chef.verbose_logging = true


      memory = node[:ram] ? node[:ram] : 256;
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "50",
          "--memory", memory.to_s,
        ]
      end
    end
   end
  end
end
