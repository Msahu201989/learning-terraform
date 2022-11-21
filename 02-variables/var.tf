variable "sample" {       # How to declare Variable
  default = "hello"
}

# If Variable is not a Combination then var.sample, if its is combinig with any other string then ${var.sample}
output "sample" {         # Access the Variable
  value = var.sample      # calling variable
}

output "sample1" {
  value = "Hey, ${var.sample}"  #  attaching a string "hey" so use ${var.sample}
}
