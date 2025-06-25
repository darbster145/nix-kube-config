{ config, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    # TODO, Use SOPS-NIX here 
    tokenFile = "/var/lib/rancher/k3s/server/token";
    extraFlags = [
      "--write-kubeconfig-mode \"0664\""
      "--disable traefik"
      "--disable servicelb"
      "--disable localstorage"
    ];
    clusterInit = true;
  };
}
