provider "digitalocean" {
  token = "${var.do_token}"
}

resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "digitalocean_ssh_key" "main" {
  name       = "Terraform Wordpress Example"
  public_key = "${tls_private_key.main.public_key_openssh}"
}

resource "digitalocean_droplet" "main" {
  image = "${var.image}"
  name = "${var.name}"
  region = "${var.region}"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "${tls_private_key.main.public_key_fingerprint_md5}"
  ]

  depends_on = ["digitalocean_ssh_key.main"]

  connection {
      user = "root"
      type = "ssh"
      private_key = "${tls_private_key.main.private_key_pem}"
      timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir /wp",
    ]
  }

  provisioner "file" {
    source      = "wp/"
    destination = "/wp"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/local/bin:/usr/bin",
      "sudo apt-get update -qq",
      "sudo apt install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable\"",
      "sudo apt-get update -qq",
      "sudo apt install docker-ce -y",
      "sudo curl -L \"https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "cd /wp",
      "docker-compose up -d",
    ]
  }
}
