{ config, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    token = "";
    clusterInit = (meta.hostname == "nk0");
  };
}
