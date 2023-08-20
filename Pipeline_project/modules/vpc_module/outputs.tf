output "networkinterface-id" {
    description = "ID of the network interface"
    value = aws_network_interface.new-1.id

}
output "subnet_id" {
  value = aws_subnet.server_12.id
  description = "THE ID OF THE SUBNET"
}