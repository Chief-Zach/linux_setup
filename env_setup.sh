#!/bin/zsh


sudo apt install zsh npm neovim

input=$(nvim --version)

# Extract version numbers using regex
if [[ $input =~ NVIM\ v([0-9]+)\.([0-9]+)\.([0-9]+) ]]; then
    major="${BASH_REMATCH[1]}"
    minor="${BASH_REMATCH[2]}"
    patch="${BASH_REMATCH[3]}"

    if (($major > 0)) || (($minor >= 9 && $minor >= 5)); then

        curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        mkdir -p ~/.config/nvim/bundle

        git clone https://github.com/neovim/nvim-lspconfig.git ~/.config/nvim/bundle/nvim-lspconfig
        git clone https://github.com/hrsh7th/nvim-cmp.git ~/.config/nvim/bundle/nvim-cmp
        git clone https://github.com/hrsh7th/cmp-buffer.git ~/.config/nvim/bundle/cmp-buffer
        git clone https://github.com/hrsh7th/cmp-path.git ~/.config/nvim/bundle/cmp-path
        git clone https://github.com/hrsh7th/cmp-nvim-lsp.git ~/.config/nvim/bundle/cmp-nvim-lsp
        git clone https://github.com/hrsh7th/cmp-cmdline.git ~/.config/nvim/bundle/cmp-cmdline
        git clone https://github.com/vim-airline/vim-airline.git ~/.config/nvim/bundle/vim-airline
        git clone https://github.com/vim-airline/vim-airline-themes.git ~/.config/nvim/bundle/vim-airline-themes
        
        wget -O ~/.config/nvim/init.lua https://raw.githubusercontent.com/Chief-Zach/linux_setup/refs/heads/main/init.lua

        sudo npm install -g pyright

        nvim -es -c :PlugInstall
        
            
    else
        echo "NeoVim version not good. Try installing from snap, or functions will be disabled"
        
        git clone https://github.com/vim-airline/vim-airline.git ~/.config/nvim/bundle/vim-airline
        git clone https://github.com/vim-airline/vim-airline-themes.git ~/.config/nvim/bundle/vim-airline-themes
        wget -O ~/.config/nvim/init.lua https://raw.githubusercontent.com/Chief-Zach/linux_setup/refs/heads/main/init.lua.bak
        
    fi
fi


# Clone PowerLevel
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Setup PowerLevel
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "Enter the username for the user to activate ZSH for: "
read username

sudo chsh -s /bin/zsh $username

wget -O ~/.zshrc https://raw.githubusercontent.com/Chief-Zach/linux_setup/refs/heads/main/.zshrc

source ~/.zshrc
