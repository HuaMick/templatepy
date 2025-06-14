{ pkgs ? import <nixpkgs> {} }:

let
  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    # Jupyter
    jupyter
    jupyterlab
    ipykernel
    
    # Testing
    pytest
    pytest-cov
    pytest-mock
    
    # Development tools
    black
    mypy
    ruff
    python-dotenv
    pymongo
  ]);
in

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Python environment
    pythonEnv
    
    # Development tools
    black
    mypy
    ruff
    
    # Git
    git
  ];

  shellHook = ''
    # Set up Python path
    export PYTHONPATH=$PWD/src:$PYTHONPATH
  '';
} 
