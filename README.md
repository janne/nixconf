# My Nix Setup

Used for setting up dotfiles, etc.

## Setup

Install Nix using the [Determinate installer](https://github.com/DeterminateSystems/nix-installer):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Clone this repo:

```bash
cd ~
git clone https://github.com/janne/nixconf.git
```

Set up all configs etc:

```bash
nix run nixpkgs#home-manager switch -- --flake ~/nixconf
```

## Usage

Edit the files in `~/nixconf` and then run:

```bash
switch
```

## Uninstall

```bash
/nix/nix-installer uninstall
```
