#!/bin/zsh


sudo apt install zsh npm neovim

# Clone PowerLevel
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Setup PowerLevel
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "Enter the username for the user to activate ZSH for: "
read username

sudo chsh -s /bin/zsh $username

mkdir -p ~/.config/nvim/bundle

git clone https://github.com/neovim/nvim-lspconfig.git ~/.config/nvim/bundle/nvim-lspconfig
git clone https://github.com/hrsh7th/nvim-cmp.git ~/.config/nvim/bundle/nvim-cmp
git clone https://github.com/hrsh7th/cmp-buffer.git ~/.config/nvim/bundle/cmp-buffer
git clone https://github.com/hrsh7th/cmp-path.git ~/.config/nvim/bundle/cmp-path
git clone https://github.com/hrsh7th/cmp-nvim-lsp.git ~/.config/nvim/bundle/cmp-nvim-lsp
git clone https://github.com/hrsh7th/cmp-cmdline.git ~/.config/nvim/bundle/cmp-cmdline
git clone https://github.com/vim-airline/vim-airline.git ~/.config/nvim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.config/nvim/bundle/vim-airline-themes


wget -O ~/.zshrc https://github.com/Chief-Zach/linux_setup/blob/main/.zshrc

wget -O ~/.config/nvim/init.lua https://github.com/Chief-Zach/linux_setup/blob/main/init.lua

sudo npm install -g pyright

nvim -es -c :PlugInstall

