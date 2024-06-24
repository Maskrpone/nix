{ stdenv, fetchzip }:
{
  pname = "Comsol";
  version = "6.2.0";

  src = fetchzip {
      url = "https://nonusdownload.comsol.com/product/6.2.0.415/full/COMSOL62_lnx.zip?__gda__=1719224455_6a872795b60f79eefb50c7b823eb7b67&fileExt=.zip";
      sha256 = "";
    };
  }
