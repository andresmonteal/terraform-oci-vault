// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

########################
# Vault
########################

locals {
  default_freeform_tags = {
    terraformed = "Please do not edit manually"
    module      = "oracle-terraform-oci-vault"
  }
  merged_freeform_tags = merge(var.freeform_tags, local.default_freeform_tags)
  compartment_id       = try(data.oci_identity_compartments.compartment[0].compartments[0].id, var.compartment_id)
}

resource "oci_kms_vault" "main" {
  #Required
  compartment_id = local.compartment_id
  display_name   = var.name
  vault_type     = var.type

  #Optional
  defined_tags  = var.defined_tags
  freeform_tags = local.merged_freeform_tags

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}

resource "oci_kms_key" "main" {
  #Required
  compartment_id = local.compartment_id
  display_name   = var.key_display_name
  key_shape {
    #Required
    algorithm = var.key_shape_algorithm
    length    = var.key_shape_length
  }
  management_endpoint = oci_kms_vault.main.management_endpoint

  #Optional
  defined_tags    = var.defined_tags
  freeform_tags   = local.merged_freeform_tags
  protection_mode = var.key_protection_mode

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}