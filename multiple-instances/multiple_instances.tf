# On crée une variable region contenant la liste des régions OVHcloud
# Elle servira à itérer sur différentes régions afin de
# démarrer une instance sur chacune d'elles.
variable "region" {
  type = list
  default = ["GRA11", "SBG5"]
}

# Création d'une paire de clés SSH
resource "openstack_compute_keypair_v2" "test_keypair_all" {
  count = length(var.region)
  name = "test_keypair_all" # Nom de la clé SSH
  public_key = file("~/.ssh/id_rsa.pub") # Chemin vers ma clé SSH
  region = element(var.region, count.index)
}

# Créons une Compute instance OpenStack dans chaque région
resource "openstack_compute_instance_v2" "instances_on_all_regions" {
  # Nombre de fois que la ressource sera créée
  # défini par la longueur de la variable region
  count = length(var.region)
  name = "terraform_instances" # Nom de l'instance
  flavor_name = "d2-2" # Flavor de l'instance
  image_name = "Ubuntu 22.04" # Nom de l'image
  # element est une fonction qui accède à l'élément à la position
  # count.index de la liste var.region. Elle permet d'itérer entre les régions
  region = element(var.region, count.index)
  # Accesses the name of the openstack_compute_keypair_v2 resource variable named test_keypair
  key_pair = element(openstack_compute_keypair_v2.test_keypair_all.*.name, count.index)
  network {
    name = "Ext-Net" # Adds the public network to your instance
  }
}