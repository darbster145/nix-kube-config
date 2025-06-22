{ config, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    # TODO, Use SOPS-NIX here 
    #tokenFile = "/var/lib/rancher/k3s/server/token";
    token = "SZM9Bk70sa";
    serverAddr = "https://10.0.0.5:6443";
  };

  # Used for cluster reset
  services.etcd.enable = false;

}
