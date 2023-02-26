{ nixpkgs, environment, pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-python.python
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        vscjava.vscode-java-debug
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vim";
          publisher = "vscodevim";
          version = "1.24.3";
          sha256 = "e1f3e8441b6d59513c6777b83ba62b91fd3888ebbd125b294053f9ec738f5409";
        }
        {
          name = "vscode-pull-request-github";
          publisher = "GitHub";
          version = "0.58.1";
          sha256 = "22eb65e4926aaf085e72aed960d1c18888b37179c3dedad472b1e6b2068341cb";
        }
        {
          name = "EditorConfig";
          publisher = "EditorConfig";
          version = "0.16.4";
          sha256 = "8fe3f6a29ae91f4af3a88d152add096d91b5f440c4edeefe9006f73061824439";
        }
        # General tooling
        {
          name = "even-better-toml";
          publisher = "tamasfe";
          version = "0.19.0";
          sha256 = "32a4906ab35385b11fd701c34dfd72038e89321589378e9bd3c73bb55ebed675";
        }
        {
          name = "vscode-lldb";
          publisher = "vadimcn";
          version = "1.8.1";
          sha256 = "Uu7ESouPnScXs9x3iCb8MupSwXiZe5sSZqczpKA2aSQ=";
        }
        {
          name = "vscodeintellicode";
          publisher = "VisualStudioExptTeam";
          version = "1.2.30";
          sha256 = "f2Gn+W0QHN8jD5aCG+P93Y+JDr/vs2ldGL7uQwBK4lE=";
        }
        # Rust tooling
        {
          name = "rust-analyzer";
          publisher = "rust-lang";
          version = "0.4.1416";
          sha256 = "c6hRhXczpZwZV/49y373nZZh/5lonW5SdhRwxzFxPcU=";
        }
        # Java tooling
        {
          name = "java";
          publisher = "redhat";
          version = "1.15.0";
          sha256 = "isYlOIx/P+6tkCAbjePBe2pIv5ORL9mkF2zxYXyArcM=";
        }
        # JS tooling
        {
          name = "js-debug";
          publisher = "ms-vscode";
          version = "1.76.0";
          sha256 = "ZAUUYbTq7iqBHwj+REXIb+osh1sxxYOP9hPyOCEinFA=";
        }
      ];
    })
  ];
}
