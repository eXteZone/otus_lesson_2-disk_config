Vagrant.configure(2) do |config|
  config.vm.box = "eXteZone/centos7-5x"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.89.99"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.name = "disk-config"
    vb.cpus = "2"
  config.vm.hostname = "disk-config1"

config.vm.synced_folder ".", "/vagrant", disabled: true

file_to_disk0 = "disk1.vdi"
vb.customize ["storagectl", :id, "--name", "SATA Controller", "--add", "sata", "--controller", "IntelAHCI"]
unless File.exist?(file_to_disk0)
vb.customize ["createhd", "--filename", file_to_disk0, "--size", 250, "--format", "VDI"]
    end

file_to_disk1 = "disk2.vdi"
unless File.exist?(file_to_disk1)
vb.customize ["createhd", "--filename", file_to_disk1, "--size", 250, "--format", "VDI"]
    end

file_to_disk2 = "disk3.vdi"
unless File.exist?(file_to_disk2)
vb.customize ["createhd", "--filename", file_to_disk2, "--size", 250, "--format", "VDI"]
    end

vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 0, "--device", 0, "--type", "hdd", "--medium", file_to_disk0]
vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", file_to_disk1]
vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 2, "--device", 0, "--type", "hdd", "--medium", file_to_disk2]

  end
end
