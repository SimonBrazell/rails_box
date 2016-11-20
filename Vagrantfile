# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Use Ubuntu 14.04 Trusty Tahr 64-bit
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = 'rails-box'

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  # Remove 'default: stdin: is not a tty' error messages.
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  # RVM, Ruby, Bundler and Rails install
  config.vm.provision :shell, path: "install-rvm.sh", args: "stable", privileged: false
  config.vm.provision :shell, path: "install-ruby.sh", args: "ruby@rails bundler rails", privileged: false

  # NodeJS and Postgres install
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update -y
    apt-get upgrade -y
    sudo apt-get install -y build-essential patch
    echo "
    #################
    Installing Git...
    #################
    "
    sudo apt-get install -y git
    echo "
    ####################
    Installing NodeJS...
    ####################
    "
    sudo apt-get install -y nodejs
    echo "
    ########################
    Installing PostgreSQL...
    ########################
    "
    sudo apt-get install -y postgresql postgresql-contrib libpq-dev
    sudo -u postgres psql -c "create role vagrant with createdb login password 'password';"
  SHELL

  # Adding aliases and environment variables
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    echo "
    ############################
    Preparing the environment...
    ############################
    "
    echo 'alias pgstart="sudo service postgresql start"' >> /home/vagrant/.profile
    echo 'alias pgstop="sudo service postgresql stop"' >> /home/vagrant/.profile
    echo 'alias server="rails server -b 0.0.0.0"' >> /home/vagrant/.profile
    echo 'alias c=clear' >> /home/vagrant/.profile
    echo 'cd /vagrant' >> /home/vagrant/.profile
    echo 'rvm gemset use rails' >> /home/vagrant/.profile
    echo "
    ######################
    Provisioning complete.
    ######################
    "
  SHELL
end
