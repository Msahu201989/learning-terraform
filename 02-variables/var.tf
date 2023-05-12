variable "sample" {
  default = "hello"
}

output "sample" {
  value = "var.sample"
}

output "sample1" {
  value = "hey, ${var.sample}"
}

#variable "sample" {       # How to declare Variable
#  default = "hello"
#}
#
## If Variable is not a Combination then var.sample, if its is combinig with any other string then ${var.sample}
#output "sample" {         # Access the Variable
#  value = var.sample      # calling variable
#}
#
#output "sample1" {
#  value = "Hey, ${var.sample}"  #  attaching a string "hey" so use ${var.sample}
#}
#
## String data type
#variable "sample1" {
#  default = "Hello World"
#}
#
## Number data type
#variable "sample2" {
#  default = "100"
#}
#
## Boolean data type
#variable "sample3" {
#  default = "true"
#}
#
##List Variable
#variable "sample4" {
#  default = [
#     "HELLO" ,
#     100 ,
#     true
#  ]
#}
#
##MAP Variable
#variable "sample5" {
#  default = {
#    string  = "HELLO"
#    number  = 100
#    boolean = true
#  }
#}
#
### Access a list Value
#output "sample4" {
#  value = var.sample4[0] # [0] will give only output 1st string i.e hello
#}
#
### Access a Map Value
#output "sample5" {
#  value = var.sample5["number"]
#}
#
### Pick a Variable from Terraform.tfvars File
#variable "sample6" {}
#output "sample6" {
#  value = var.sample6
#}
#
### Pick a variable from CLI
#variable "sample7" {}
#output "sample7" {
#  value = var.sample7
#}
#
### Pick a variable from Shell ENV VARIABLE
##  export TF_VAR_sample8=123345 run first on server
#variable "sample8" {}
#output "sample8" {
#  value = var.sample8
#}
#
#variable "sample9" {}