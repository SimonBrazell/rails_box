Rails Box
=============================

Rails Box is a ready-to-go development environment for building Rails web apps. Especially useful for Windows users to get a complete dev environment set up without all the headaches.

### Contents

* Ruby
* Rails
* Bundler
* Git
* NodeJS
* PostgreSQL

All versions will be the latest stable release at the time of creation of the VM, see below for instructions on installing specific versions.

### Installation

To install, download and install [Vagrant](https://www.vagrantup.com/downloads.html) for your platform, then download and install [VirtualBox](http://virtualbox.org/).

Once Vagrant and VirtualBox are installed, you can download the latest release of this GitHub repo, and unzip it, either placing its contents in an existing project root or empty folder. `cd` into the folder and run:

```bash
$ vagrant up
$ vagrant ssh
```

The username for vagrant is `vagrant` and the password is `vagrant`.

This will download and install the image, and then go through the dependencies and install them one by one. `vagrant ssh` will connect you to the image and give you a bash prompt. Once everything completes, you'll have a working box to build your Rails apps.

If you are interested in varying the versions Ruby or Rails installed you can do so by editing the [Vagrantfile](https://github.com/simonbrazell/rails_box/blob/master/Vagrantfile) - line 26, replacing the ruby, rails, or bundler arguments with versioned ones, e.g. (Ruby 2.3.1, Rails 5.0.0.1, and Bundler 1.12.5):

```ruby
config.vm.provision :shell, path: "install-ruby.sh", args: "ruby-2.3.1@rails bundler:1.12.5 rails:5.0.0.1", privileged: false
```

### Usage

Once you have created a Rails project and setup the DB - `rake db:setup`, you can run it from the box. To do so first `cd` into the project root, then type `server` to run the web server. You should then be able to view the running application in your local web browser by navigating to `localhost:3000`. That's about it, please let me know if I have missed anything.

Happy coding!

## License
Released under the MIT License, Copyright (c) 2016 Simon Brazell.
