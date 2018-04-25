# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.


  config.vm.box = "centos/7"
  
  config.vm.define "api-server" do |api|
    api.vm.hostname = "api.server"
    api.vm.network "private_network", :ip => '10.10.10.3'
    api.vm.provision "shell", inline: <<-SHELL
       useradd  -m -p saYhApV8zquWg testing   && usermod -aG wheel testing
       su -c "mkdir /home/testing/.ssh && touch /home/testing/.ssh/authorized_keys" testing && chmod 700 /home/testing/.ssh && chmod 600 /home/testing/.ssh/authorized_keys
       cat /home/vagrant/.ssh/authorized_keys >> /home/testing/.ssh/authorized_keys


    SHELL
  end

  config.vm.define "deploy-server" do |deploy|
    deploy.vm.hostname = "deploy.server"
    deploy.vm.network "private_network", :ip => '10.10.10.2'
    deploy.vm.provision "file", source: ".vagrant/machines/api-server/virtualbox/private_key", destination: ".ssh/id_rsa"
    deploy.vm.provision "shell", inline: <<-SHELL
	     useradd  -m -p saYhApV8zquWg testing   && usermod -aG wheel testing

    SHELL

  end


end
