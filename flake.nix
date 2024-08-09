{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    nixpkgs,
    nixos-hardware,
    ...
  }: {
    nixosConfigurations.pi = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        {
          nixpkgs.overlays = [
            (final: super: {
              makeModulesClosure = x:
                super.makeModulesClosure (x // {allowMissing = true;});
            })
          ];
        }
        nixos-hardware.nixosModules.raspberry-pi-4
        ./conf.nix
      ];
    };
  };
}
