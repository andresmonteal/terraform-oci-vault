// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

variable "tenancy_ocid" {
  description = "(Required) (Updatable) The OCID of the root compartment."
  type        = string
  default     = null
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
  default     = null
}

variable "compartment" {
  description = "compartment name where to create all resources"
  type        = string
  default     = null
}

variable "name" {
  description = "(Required) (Updatable) A user-friendly name for the vault. It does not have to be unique, and it is changeable. Avoid entering confidential information."
  type        = string
}

variable "type" {
  description = "(Required) The type of vault to create. Each type of vault stores the key with different degrees of isolation and has different options and pricing."
  type        = string
  default     = "DEFAULT"
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace."
  type        = map(any)
  default     = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(any)
  default     = null
}

# vault key

variable "key_display_name" {
  description = "A user-friendly name for the key. It does not have to be unique, and it is changeable. Avoid entering confidential information."
  type        = string
  default     = "master-key"
}

variable "key_shape_algorithm" {
  description = "The algorithm used by a key's key versions to encrypt or decrypt."
  type        = string
  default     = "AES"
}

variable "key_shape_length" {
  description = "The length of the key in bytes, expressed as an integer."
  type        = string
  default     = "32"
}

variable "key_protection_mode" {
  description = "Required) The service endpoint to perform management operations against. Management operations include 'Create,' 'Update,' 'List,' 'Get,' and 'Delete' operations. See Vault Management endpoint."
  type        = string
  default     = "HSM"
}