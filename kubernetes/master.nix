{ config, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    # TODO, Use SOPS-NIX here 
    tokenFile = "/var/lib/rancher/k3s/server/token";
    clusterInit = true;
  };
}
