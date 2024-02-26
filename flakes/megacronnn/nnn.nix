{ pkgs ? import <nixpkgs>  {} }: let
    owner = "jarun";
    repo = "nnn";
    rev = "master";
    bin = "nnn";

in
pkgs.stdenv.mkDerivation {
  name = "megacronnn";
  src = pkgs.fetchFromGitHub {
    owner = owner;
    repo = repo;
    rev = rev;
    sha256 = "1d3s0bg3pw2nalh2kiqwlkv6qdcrdclxix2hdxh8qlnc0a9dlpaa";
  };

  buildInputs = [ pkgs.pkg-config pkgs.readline ];

  env = {
    NNN_FIFO = "/tmp/nnn.fifo";
  };
  
  buildPhase = ''
    make O_NERD=1
  '';
  
  inherit bin;
  
  installPhase = ''
    mkdir -p $out/bin
    cp $bin $out/bin
    chmod +x $out/bin/*
  '';

  postInstall = ''
    cp $out/bin/nnn /usr/local/bin/
  '';
}

