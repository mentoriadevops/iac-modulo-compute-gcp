module "compute_gcp" {
  source        = "./.."
  project       = "seuprojeto"
  instance_name = "nomedainstanci"
  machine_type  = "e2-small"
  zone          = "us-east1-d"
  network       = "default"
  labels = {
    value        = "key"
  }
}