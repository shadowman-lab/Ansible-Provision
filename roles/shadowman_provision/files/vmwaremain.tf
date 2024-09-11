provider "vsphere" {
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Shadowman"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = "NFS_Cersei"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "LAN_02"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template7" {
  name          = "/Shadowman/vm/RHEL7_ShadowMan"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template8" {
  name          = "/Shadowman/vm/RHEL8_ShadowMan"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template9" {
  name          = "/Shadowman/vm/RHEL9_ShadowMan"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "server1" {
  name             = "server1.shadowman.dev"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "Discovered virtual machine"
  firmware         = data.vsphere_virtual_machine.template7.firmware
  scsi_type        = data.vsphere_virtual_machine.template7.scsi_type

  num_cpus = data.vsphere_virtual_machine.template7.num_cpus
  memory   = data.vsphere_virtual_machine.template7.memory

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template7.network_interface_types[0]
  }

  tags = [
    "urn:vmomi:InventoryServiceTag:41497d49-f982-4ff3-8c58-b48d7c8f3814:GLOBAL",
    "urn:vmomi:InventoryServiceTag:4bdb57e9-2993-4157-8b17-0a8bcf98930f:GLOBAL",
    "urn:vmomi:InventoryServiceTag:9748f3d1-08b5-4ccf-abbe-0b6c1c24d4fc:GLOBAL"
  ]

  wait_for_guest_net_timeout = 10
  wait_for_guest_ip_timeout  = -1

  disk {
    label            = "server1"
    thin_provisioned = data.vsphere_virtual_machine.template7.disks.0.thin_provisioned
    size             = data.vsphere_virtual_machine.template7.disks.0.size
  }

  guest_id = data.vsphere_virtual_machine.template7.guest_id

  clone {
    template_uuid = data.vsphere_virtual_machine.template7.id
  }
}

output "vm_name_server1" {
  value = vsphere_virtual_machine.server1.name
}

resource "vsphere_virtual_machine" "server2" {
  name             = "server2.shadowman.dev"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "Discovered virtual machine"
  firmware         = data.vsphere_virtual_machine.template8.firmware
  scsi_type        = data.vsphere_virtual_machine.template8.scsi_type

  num_cpus = data.vsphere_virtual_machine.template8.num_cpus
  memory   = data.vsphere_virtual_machine.template8.memory

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template8.network_interface_types[0]
  }

  tags = [
    "urn:vmomi:InventoryServiceTag:41497d49-f982-4ff3-8c58-b48d7c8f3814:GLOBAL",
    "urn:vmomi:InventoryServiceTag:4bdb57e9-2993-4157-8b17-0a8bcf98930f:GLOBAL",
    "urn:vmomi:InventoryServiceTag:9748f3d1-08b5-4ccf-abbe-0b6c1c24d4fc:GLOBAL"
  ]

  wait_for_guest_net_timeout = 10
  wait_for_guest_ip_timeout  = -1

  disk {
    label            = "server2"
    thin_provisioned = data.vsphere_virtual_machine.template8.disks.0.thin_provisioned
    size             = data.vsphere_virtual_machine.template8.disks.0.size
  }

  guest_id = data.vsphere_virtual_machine.template8.guest_id

  clone {
    template_uuid = data.vsphere_virtual_machine.template8.id
  }
}

output "vm_name_server2" {
  value = vsphere_virtual_machine.server2.name
}

resource "vsphere_virtual_machine" "server3" {
  name             = "server3.shadowman.dev"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "Discovered virtual machine"
  firmware         = data.vsphere_virtual_machine.template9.firmware
  scsi_type        = data.vsphere_virtual_machine.template9.scsi_type

  num_cpus = data.vsphere_virtual_machine.template9.num_cpus
  memory   = data.vsphere_virtual_machine.template9.memory

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template9.network_interface_types[0]
  }

  tags = [
    "urn:vmomi:InventoryServiceTag:41497d49-f982-4ff3-8c58-b48d7c8f3814:GLOBAL",
    "urn:vmomi:InventoryServiceTag:4bdb57e9-2993-4157-8b17-0a8bcf98930f:GLOBAL",
    "urn:vmomi:InventoryServiceTag:9748f3d1-08b5-4ccf-abbe-0b6c1c24d4fc:GLOBAL"
  ]

  wait_for_guest_net_timeout = 10
  wait_for_guest_ip_timeout  = -1

  disk {
    label            = "server3"
    thin_provisioned = data.vsphere_virtual_machine.template9.disks.0.thin_provisioned
    size             = data.vsphere_virtual_machine.template9.disks.0.size
  }

  guest_id = data.vsphere_virtual_machine.template9.guest_id

  clone {
    template_uuid = data.vsphere_virtual_machine.template9.id
  }
}

output "vm_name_server3" {
  value = vsphere_virtual_machine.server3.name
}
