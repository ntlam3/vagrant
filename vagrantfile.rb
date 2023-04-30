Vagrant.configure("2") do |config|
    config.vm.define "web01" do |web01|
      web01.vm.box = "ubuntu/bionic64"
      web01.vm.network "private_network", ip: "192.168.40.11"
      web01.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
         vb.cpus = 2
      end
      web01.vm.provision "shell", inline: <<-SHELL
        apt update
        apt install apache2 wget unzip -y
        systemctl start apache2
        systemctl enable apache2
        cd /tmp/
        wget https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip
        unzip -i 2119_gymso_fitness.zip
        cp -r 2119_gymso_fitness/* /var/www/html/
        systemctl restart apache2
      SHELL
    end
  
    config.vm.define "db01" do |db01|
      db01.vm.box = "centos/7l"
      dbb01.vm.network "private_network", ip: "192.168.40.12"
      dbb01.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
         vb.cpus = 2
      end
      db01.vm.provision "shell", inline: <<-SHELL
        yum install mariadb-server -y
        systemctl start mariadb
      SHELL
    end     
end
