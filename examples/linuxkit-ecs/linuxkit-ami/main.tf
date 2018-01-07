provider "aws" {
  region = "${var.region}"
}

data "template_file" "policy" {
  template = "${file("files/policy.tpl")}"

  vars {
    bucket = "${aws_s3_bucket.disk_image_bucket.id}"
  }
}

resource "aws_s3_bucket" "disk_image_bucket" {
  bucket_prefix = "${var.name}"
}

resource "aws_iam_role" "vmimport" {
  name               = "vmimport"
  assume_role_policy = "${file("files/assume-role-policy.json")}"
}

resource "aws_iam_role_policy" "import_disk_image" {
  name   = "import_disk_image"
  role   = "${aws_iam_role.vmimport.name}"
  policy = "${data.template_file.policy.rendered}"
}
