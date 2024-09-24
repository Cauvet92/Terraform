resource "openstack_compute_keypair_v2" "test_keypair" {
  name       = "my_keypair_ed"
  public_key = file("/Users/edouard/.ssh/id_rsa.pub")
}

resource "openstack_compute_instance_v2" "simple_instance_ed" {
  name            = "simple_instance_ed"
  image_name      = "Ubuntu 24.04"
  flavor_name     = "d2-2"
  key_pair        = openstack_compute_keypair_v2.test_keypair.name

  metadata = {
    tag = "session-terraform"
  }

  network {
    name = "Ext-Net"
  }
}