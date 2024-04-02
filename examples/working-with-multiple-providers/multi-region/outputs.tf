output "instance_region_1_az" {
  value = aws_instance.region_1.availability_zone
  description = "The AZ where the instance in the first region deployed"
}

output "instance_region_2_az" {
  value = aws_instance.region_2.availability_zone
  description = "The AZ where the instance in the second region deployed"
}