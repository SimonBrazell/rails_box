Rails Box
=============================

Rails Box is a ready-to-go development environment for building Rails 5 web apps. Especially useful for Windows users to get a complete dev environment set up without all the headaches.

### Installation

To install, download and install [Vagrant](https://www.vagrantup.com/downloads.html) for your platform, then download and install [VirtualBox](http://virtualbox.org/).

Once Vagrant and VirtualBox are installed, you can download the latest release of this GitHub repo, and unzip it. `cd` into the unzipped folder and run:

```bash
$ vagrant up
$ vagrant ssh
```

The username for vagrant is `vagrant` and the password is `vagrant`. 

This will download and install the image, and then go through the dependencies and install them one by one. `vagrant ssh` will connect you to the image and give you a bash prompt. Once everything completes, you'll have a working box to build your Rails 5 apps.

If you are interested in varying the versions Ruby or Rails installed you can do so by editing the [Vagrantfile](https://github.com/simonbrazell/rails_box/blob/master/Vagrantfile) - line 26, replacing the versions for ruby, rails, or bundler with something else:

```ruby
config.vm.provision :shell, path: "install-ruby.sh", args: "ruby-2.3.1@rails5.0.0.1 bundler:1.12.5 rails:5.0.0.1", privileged: false
```
Happy coding!!!
