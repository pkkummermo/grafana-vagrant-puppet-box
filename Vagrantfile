Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.forward_port 80, 9100
  config.vm.forward_port 2003, 2003
  config.vm.forward_port 8125, 9125, { :protocol => 'udp' }
  config.vm.forward_port 9200, 9200
  config.vm.forward_port 9300, 9300

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "base.pp"
  end
end
