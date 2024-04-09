variable "ami_image_id" {

  type = string

  description = "This is a variable for ami image id"

  default = "ami-0cd59ecaf368e5ccf"

}

variable "instance_type" {

  type = string


}

variable "ec2_name" {

    type = set(string)
  
}