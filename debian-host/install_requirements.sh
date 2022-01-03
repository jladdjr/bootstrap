sudo apt install -y ansible

echo -e "[defaults]\nstdout_callback = yaml" > ~/.ansible.cfg

sudo apt install -y make

# On Intel NUC, need to install Intel wireless drivers for wifi to work
# sudo apt install firmware-iwlwifi

# 1/2/2022
# On scrappy, in order to even see graphical login, needed to switch to lightdm.
# (The issue seemed to be that debian thought that scrappy had two monitors?)
# After installing the lightdm package, you will immediately see a configuration
# screen which will ask which desktop manager should be used by default. Switch
# to lightdm
# sudo apt install -y lightdm

# On scrappy, also need to install broadcom drivers in order for wifi to work
# sudo apt install -y firmware-b43-installer
