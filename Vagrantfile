Vagrant.configure("1") do |config|

  config.vm.box = "ubuntu/trusty64"

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

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end