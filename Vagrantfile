# -*- mode: ruby -*-
# vi: set ft=ruby :



#----------------------------------------------------------------------------
# ~ VARIABLES
#----------------------------------------------------------------------------

VAGRANT_IP = ENV['VAGRANT_IP'] || "192.168.56.78"
MOUNT_DIR = ENV['VAGRANT_DIR'] || "www"



###############################################################################

Vagrant.require_version ">= 1.6.0"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # this one is nice
  # https://github.com/mootools/mootools-forge/blob/master/Vagrantfile

  #----------------------------------------------------------------------------
  # ~ SETTINGS
  #----------------------------------------------------------------------------

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "foomo-fat-trusty-amd64"

  # fetch from here, if not locally present
  config.vm.box_url = "http://www.foomo.org/downloads/foomo-fat-trusty-amd64.box"
  
  # host names on host machine
  config.vm.hostname = "vagrant.local"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: VAGRANT_IP

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    # show the vb gui or not
    vb.gui = false
    # Use VBoxManage to customize the VM. For example to change memory:
    #vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "2", "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    #http://www.ifusio.com/blog/setup-vagrant-with-2-or-more-cpu-cores-on-64bits-systems
  end

  # nfs
  config.vm.synced_folder MOUNT_DIR, "/var/www", type: "nfs"
  #, owner: "www-data:www-data"

  #----------------------------------------------------------------------------
  # ~ PROVISIONING
  #----------------------------------------------------------------------------

  # SHELL
  # some proper apt-magic tricks
  # http://www.microhowto.info/howto/perform_an_unattended_installation_of_a_debian_package.html

  config.vm.provision "shell" do |shell|
    shell.path = "provisioning/10-foomo-apps-provision.sh"
  end
  
  config.vm.provision "shell" do |shell|
    shell.path = "provisioning/20-docker-provision.sh"
  end

  config.vm.provision "shell" do |shell|
    shell.path = "provisioning/30-upstart-service-provision.sh"
  end

end