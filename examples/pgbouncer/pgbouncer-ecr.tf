resource "aws_ecr_repository" "pgbouncer" {
  name = "${var.name}"
}

resource "null_resource" "build_pgbouncer_image" {
  provisioner "local-exec" {
    command = "./docker/build.sh ${aws_ecr_repository.pgbouncer.repository_url} ${var.region}"
  }
}
