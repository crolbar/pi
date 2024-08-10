# NixOS system config for a Raspberry Pi
Simple system config meant to be used as an image of a base system to flash the sd card with and start your nixos system from there.

build the image
```
nix run nixpkgs#nixos-generators -- -f sd-aarch64 --flake .#pi --system aarch64-linux -o ./pi.sd
```

cp it over from the symlink
```
cp pi.sd/sd-image/nixos-sd-image-24.11.20240804.cb9a96f-aarch64-linux.img .
```

and flash it to the sd card (in my instance `/dev/sdc`)
```
sudo dd if=nixos-sd-image-24.11.20240804.cb9a96f-aarch64-linux.img of=/dev/sdc bs=1M status=progress
```

# Resources found useful
https://blog.janissary.xyz/posts/nixos-install-custom-image
