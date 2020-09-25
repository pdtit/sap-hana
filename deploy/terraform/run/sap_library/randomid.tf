# Generates random text for boot diagnostics storage account name
resource random_id lib-random-id {
  byte_length = 4
}
