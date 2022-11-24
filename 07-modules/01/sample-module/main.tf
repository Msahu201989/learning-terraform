resource "local_file" "test" {
  content  = "hello"
  filename = "/tmp/test"
}