#!/bin/sh
#
# - Oh My ZSH
# --- *- Agnosterzak Theme
# --- *- Fast Syntax Highlighting Plugin
# - VueJS-CLI
# - Quasar Framework

echo "[Install]:Oh My ZSH"
WORKING_DIR="/home/vagrant/.oh-my-zsh"
if [ -d "$WORKING_DIR" ]; then
	rm -rf $WORKING_DIR;
fi
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
sudo chsh -s /usr/bin/zsh vagrant

echo "[Install]:Agnosterzak Theme"
git clone https://github.com/zakaziko99/agnosterzak-ohmyzsh-theme.git /home/vagrant/.oh-my-zsh/custom/themes/agnosterzak
sudo cp /home/vagrant/.oh-my-zsh/custom/themes/agnosterzak/agnosterzak.zsh-theme /home/vagrant/.oh-my-zsh/custom/themes/agnosterzak.zsh-theme
sed -i 's/robbyrussell/agnosterzak/g' /home/vagrant/.zshrc

echo "source '.bash_aliases'" >> /home/vagrant/.zshrc

echo "[Install]:Fast Syntax Highlighting Plugin"
git clone https://github.com/zdharma/fast-syntax-highlighting.git /home/vagrant/.oh-my-zsh/custom/plugins/fsh
sed -i '/plugins=(git)/plugins=(\n  git\n  colorize\n  fast-syntax-highlighting\n)' /home/vagrant/.zshrc
echo "source '/home/vagrant/.oh-my-zsh/custom/plugins/fsh/fast-syntax-highlighting.plugin.zsh'" >> /home/vagrant/.zshrc

echo "[Install]:Latest CLIs"
yarn global add @vue/cli @vue/cli-init @quasar/cli
yarn global upgrade vue@latest quasar@latest

echo "[COPY]:Copy SSLs"
mkdir -p /home/vagrant/code/SSL
cp /etc/nginx/ssl/*.crt /home/vagrant/code/SSL/
