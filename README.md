# koralle's dotfiles

## Prerequisites

### Install Nix with Nix Flakes

Please install Nix with Nix Flakes with [nix-installer](https://github.com/DeterminateSystems/nix-installer).

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Usage

For the first time, since home-manager is not installed, build via the `nix run` command:

```sh
nix run home-manager/master -- switch --flake .#koralle
```

From the second time onwards, since home-manager is installed, the command becomes slightly simplified:

```sh
home-manager switch --flake .#koralle
```

I have further simplified this using just and justfile.

```sh
just switch
```

or 

```sh
just s
```
