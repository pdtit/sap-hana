variable "api-version" {
  description = "IMDS API Version"
  default     = "2019-04-30"
}

variable "auto-deploy-version" {
  description = "Version for automated deployment"
  default     = "Fe"
}

variable "scenario" {
  description = "Deployment Scenario"
  default     = "sap_system"
}

// Registers the current deployment state with Azure's Metadata Service (IMDS)
resource "null_resource" "IMDS" {
  provisioner "local-exec" {
    command = "curl -i -H \"Metadata: \"true\"\" -H \"user-agent: SAP AutoDeploy/${var.auto-deploy-version}; scenario=${var.scenario}; deploy-status=Terraform_${var.scenario}\" http://169.254.169.254/metadata/instance?api-version=${var.api-version}"
  }
}
