module "compute_gcp" {
  source         = "./.."
  project        = "seu_projeto_id"
  instance_name  = "nomedainstancia"
  instance_image = "debian-cloud/debian-10"
  machine_type   = "e2-small"
  zone           = "us-central1-a"
  network        = "default"

  metadata_startup_script = "echo 'Hello Mentoria' > /tmp/hello.txt"

  ssh_keys = <<-EOT
                debian:ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGNALqk5plP32GSTpho1XuqRz8xxbj+GCp7bFM5mWtgEcDAoLvccqq939IrqcDPemqJkkT2LCkCwcLsQYFjnnfswwF7SVFV9xFpiMTQEiNqmfJZRcsRbf+6MP4TnEB71KPGVCoUWSsGKfWO7CaFirTKtSi13BeQGFupwBtjHh/== debian
                ubuntu:ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGNALqk5plP32GSTpho1XuqRz8xxbj+GCp7bFM5mWtgEcDAoLvccqq939IrqcDPemqJkkT2LCkCwcLsQYFjnnfswwF7SVFV9xFpiMTQEiNqmfJZRcsRbf+6MP4TnEB71KPGVCoUWSsGKfWO7CaFirTKtSi13BeQGFupwBtjHh/== ubuntu
            EOT

  labels = {
    value = "key"
  }

  tags = ["mentoriaiac"]
}
