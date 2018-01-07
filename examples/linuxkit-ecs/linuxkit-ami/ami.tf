resource "null_resource" "build_linuxkit_image" {
  provisioner "local-exec" {
    command = "linuxkit build -dir /tmp -format aws -name ${var.name} -size 160M files/ecs.yml"
  }
}

resource "null_resource" "push_linuxkit_image" {
  provisioner "local-exec" {
    command = "AWS_REGION=${var.region} linuxkit -v push aws -bucket ${aws_s3_bucket.disk_image_bucket.id} /tmp/${var.name}.raw "
  }

  depends_on = [
    "null_resource.build_linuxkit_image",
  ]
}
