output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public.*.id}"]
}

output "private_subnet_ids" {
  value = ["${aws_subnet.private.*.id}"]
}

output "nat_subnet_cidr" {
  value = ["${aws_subnet.nat.*.cidr_block}"]
}

output "nat_subnet_id" {
  value = ["${aws_subnet.nat.*.id}"]
}

output "cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}
