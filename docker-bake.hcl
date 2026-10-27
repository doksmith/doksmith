group "default" {
  targets = ["flarum-2_0", "flarum-1_8"]
}

target "flarum-1_8" {
  context    = "images/flarum/1.8"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64", "linux/arm64"]
  tags       = [
    "ghcr.io/doksmith/flarum:1.8.21",
    "ghcr.io/doksmith/flarum:1.8",
    "ghcr.io/doksmith/flarum:1"
  ]
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
