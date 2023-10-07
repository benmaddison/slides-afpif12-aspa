# ASPA: RPKI-based AS_PATH verification

Sources for presentation given at AfPIF 12 in Accra, Ghana during August
2023.

## Usage

Building the materials in this repository requires [`nix`][nix].

### Building

HTML slides
: `nix build`

PDF slides
: `nix build --no-sandbox .#pdf`

### Development

Lint and spellcheck
: `nix flake check`

Preview and watch for changes
: `nix develop`

## License

Use of the materials contained in this repository is governed by the following licenses:

- **Software components** (including `nix` source files): MIT License. A copy of this license is available in `LICENSE.mit.txt` in the repository root.
- **Non-software components** (including presentation materials): Creative Commons Attribution Share Alike 4.0 International. A copy of this license is available in `LICENSE.cc-by-sa-4.0.txt` in the repository root, or at [CC-BY-SA-4.0].

[nix]: https://nixos.org/download
[CC-BY-SA-4.0]: https://creativecommons.org/licenses/by-sa/4.0/
