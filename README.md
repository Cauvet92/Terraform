# TODO

1. Créer une Compute instance (VM) qui sera une machine Ubuntu 22.04. Nous allons configurer une paire de clé afin de nous connecter à cette machine.
2. Nous ajouterons du stockage supplémentaire à cette machine.
3. Nous allons créer un réseau privé virtuel (vRack) auquel nous ajouterons de nouvelles machines
4. Nous allons créer un module qui permet la création de plusieurs VMs en une fois
5. Créer une infra de site web qui comprend : 
   1. un serveur non exposé à internet qui représentera le backend
   2. deux serveurs exposés à internet (avec IP publique) qui représenteront le frontend
6. Ajout d'un backend distant pour le state

# Prérequis

1. Token OVHCloud (https://www.ovh.com/auth/api/createToken) => application_key, application_secret et consumer_key
2. Un compte utilisateur de service avec son fichier RC d'Openstack
3. Un compte OVH