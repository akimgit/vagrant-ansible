
require 'yaml'
	if File.file?('values.yaml')
	  conf = YAML.load_file('values.yaml')
	else
	  raise "Configuration file 'values.yaml' does not exist"
	end

Vagrant.configure("2") do |config|
  conf['machines'].each do |name, ip, memory, cpus, box, port|
	  config.vm.define "#{name}" do |vm|
		  vm.vm.box = "#{box}" || "ubuntu/focal64"
		  vm.vm.hostname = "#{name}"
		  vm.vm.network :public_network, ip: "#{ip}"
		  vm.vm.provider "virtualbox" do |v|
		    v.memory = "#{memory}"
		    v.cpus = "#{cpus}"
		    v.name = "#{name}"
		 end
           end
    end
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "microservice.yml"
  end
end
