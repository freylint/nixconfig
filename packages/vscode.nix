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
      ];
    })
  ];
}
