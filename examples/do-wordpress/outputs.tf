output "wp_address" {
  value = "${digitalocean_droplet.main.ipv4_address}"
}
