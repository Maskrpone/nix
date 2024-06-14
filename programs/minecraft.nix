with import <nixpkgs> {};

stdenv.mkDerivation rec {
	name = "Minecraft";
	src = fetchurl {
		url = "https://launcher.mojang.com/download/Minecraft.tar.gz";
	};
}
