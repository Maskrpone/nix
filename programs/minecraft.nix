{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    pname = "Minecraft-launcher";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://launcher.mojang.com/download/Minecraft.tar.gz";
      hash = "sha256-zZ8LRPyc7EKCnLLnEUXuWZ89NMdxW1WWNRTQqNNiFKs=";
    };

    phases = [ "unpackPhase" "configurePhase" "installPhase" ];

    configurePhase = ''
      chmod +x minecraft-launcher
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp -r * $out/bin/
    '';
}
