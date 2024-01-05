output "id" {
  description = "vault id"
  value       = oci_kms_vault.main.id
}

output "management_endpoint" {
  description = "management_endpoint id"
  value       = oci_kms_vault.main.management_endpoint
}