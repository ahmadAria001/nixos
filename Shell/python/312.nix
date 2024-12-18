#{ pkgs ? import <nixpkgs> {}}:
#let
#	py = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/cf8cc1201be8bc71b7cbbbdaf349b22f4f99c7ae.tar.gz") {};
#in
#pkgs.mkShell {
#  packages = 
#    with pkgs.python310Packages; [
#      fastapi
#      uvicorn
#      sqlalchemy
#      pymysql
#      python-dotenv
#      pillow
#      pydantic
#      python-multipart
#      alembic
#      #tensorflow
#      deepface
#      bcrypt
#      passlib
#      tf-keras
#      aiomysql
#      python-jose
#      #mtcnn
#    ];
#}

{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "pipzone";
  targetPkgs = pkgs: (with pkgs; [
    python310
    python310Packages.pip
    python310Packages.virtualenv
    cudaPackages.cudatoolkit
  ]);
  runScript = "bash";
}).env
