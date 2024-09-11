output "fabric_connection_uuid" {
  description = "Unique identifier of the connection."
  value       = module.equinix-fabric-connection.primary_connection.uuid
}

output "fabric_connection_name" {
  description = "Name of the connection."
  value       = module.equinix-fabric-connection.primary_connection.name
}

output "fabric_connection_status" {
  description = "Connection provisioning status."
  value       = one(module.equinix-fabric-connection.primary_connection.operation).equinix_status
}

output "fabric_connection_provider_status" {
  description = "Connection provisioning provider status."
  value       = one(module.equinix-fabric-connection.primary_connection.operation).provider_status
}

output "fabric_connection_speed" {
  description = "Connection speed in Mbps."
  value       = module.equinix-fabric-connection.primary_connection.bandwidth
}

output "fabric_connection_seller_metro" {
  description = "Connection seller metro code."
  value       = one(one(one(module.equinix-fabric-connection.primary_connection.z_side).access_point).location).metro_code
}

output "fabric_connection_seller_region" {
  description = "Connection seller region."
  value       = one(one(module.equinix-fabric-connection.primary_connection.z_side).access_point).seller_region
}

output "network_edge_bgp_state" {
  description = "Network Edge device BGP peer state."
  value       = try(equinix_network_bgp.this[0].state, null)
}

output "network_edge_bgp_provisioning_status" {
  description = "Network Edge device BGP peering configuration provisioning status."
  value       = try(equinix_network_bgp.this[0].provisioning_status, null)
}

output "aws_dx_id" {
  description = "AWS Direct connection ID."
  value       = local.aws_dx_id
}

output "aws_vgw_id" {
  description = "AWS Virtual Gateway ID."
  value       = try(local.aws_vgw_id, null)
}

output "aws_vpc_id" {
  description = "AWS VPC ID."
  value       = try(local.aws_vpc_id, null)
}

output "aws_vif_id" {
  description = "AWS Private Virtual Interface ID."
  value       = try(aws_dx_private_virtual_interface.this[0].id, null)
}
