Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision "docker" do |d|
    d.run "ubuntu",
      cmd: "bash -l",
      args: "-v '/vagrant:/var/www'"
  end
end
