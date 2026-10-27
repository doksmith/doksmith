group "default" {
  targets = ["flarum-2_0"]
}

target "flarum-2_0" {
  context    = "images/flarum/2.0"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64", "linux/arm64"]
  tags       = [
    "ghcr.io/doksmith/flarum:2.0.2",
    "ghcr.io/doksmith/flarum:2.0",
    "ghcr.io/doksmith/flarum:2",
    "ghcr.io/doksmith/flarum:latest"
  ]
}
