{ pkgs ? import <nixpkgs> {} }:

let
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      python310
      python310Packages.venvShellHook
      wget
      gperftools
    ];
 }
