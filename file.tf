resource "local_file" "foo" {
    content     = var.file_content
    filename = "${var.environment}.foo"
}