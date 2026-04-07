# layton-nvim

my neovim config with lazy.nvim

If your neovim has already been configured, please backup your configuration before cloning this repository.

- backup your neovim configuration

```shell
mv ~/.config/nvim{,.bak}

mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- clone this repository

```shell
git clone https://github.com/LaytonLee/layton-nvim.git ~/.config/nvim
```

## Requirements

- Neovim >= 0.12.0
- Git
- [Lazygit](https://github.com/jesseduffield/lazygit) (Optional)
- **tree-sitter-cli** and a **C** compiler for nvim-treesitter, see [here](https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#requirements).
- **curl** for [blink.cmp](https://github.com/Saghen/blink.cmp)
- for [fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - **fzf**: [fzf](https://github.com/junegunn/fzf)
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
- **ImageMagick** for [image.nvim](https://github.com/3rd/image.nvim), see [here](https://github.com/3rd/image.nvim?tab=readme-ov-file#imagemagick).
