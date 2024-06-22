{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
    pname = "Minecraft-launcher";
    version = "1.0";

    src = fetchurl {
      url = "https://launcher.mojang.com/download/Minecraft.tar.gz";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
}
