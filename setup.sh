# this script allows to install the tool for swtch the graphics card of the machine
# https://github.com/bayasdev/envycontrol
sudo apt install jq
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-prefs
sudo apt install dconf-editor
sudo apt-get install fzf

this_dir=$(pwd -P)
cd ~/

wget https://github.com/bayasdev/envycontrol/releases/download/v3.4.0/python3-envycontrol_3.4.0-1_all.deb

sudo dpkg -i python3-envycontrol_3.4.0-1_all.deb

cd $(this_dir)

mkdir gpu_settings

unzip GPU_profile_selectorlorenzo9904.gmail.com.v11.shell-extension.zip -d gpu_settings

METADATA_FILE=gpu_settings/metada.json

UUID=$(jq -r '.uuid' "$METADATA_FILE")

mv gpu_settings $UUID

cp $UUID ~/.local/share/gnome-shell/extensions/

mkdir ~/gpu_switcher

GPUSpath="~/gpu_switcher/app.sh"
GPUScontent=""

if [[ $SHELL == *"zsh"* ]]; then
    echo "aplying the variable on zshrc."
    touch $GPUSpath
    chmod+x $GPUSpath
    echo 'alias gpu_switcher="./~/gpu_switcher/app.sh"' >> ~/.zshrc
    source ~/.zshrc
elif [[ $SHELL == *"bash"* ]]; then
    echo "aplying the variable on bashrc."
    touch $GPUSpath
    chmod+x $GPUSpath
    echo 'alias gpu_switcher="./~/gpu_switcher/app.sh"' >> ~/.bashrc
    source ~/.bashrc
else
    echo "You are using a shell that doesnt suport the terminal menu: $SHELL"
    echo "exiting..."
    exit 0
fi

# now you go to app "Extensions" and enable the gpu profile selector