#pacman shortcuts
alias install='sudo pacman --assume-installed vim --assume-installed sudo -S '
alias remove='sudo pacman -R '
alias update='sudo pacman -Syu --assume-installed vim --assume-installed sudo '
alias search='pacman -Ss '
alias search-installed='pacman -Q | grep '
alias switch='source .venv/bin/activate'
alias ntpd='sudo systemctl restart systemd-timesyncd'
alias changemac='sudo macchanger -r wlan0'
#alias wifi-down='sudo ip link set down dev wlan0'
#alias wifi-up='sudo ip link set up dev wlan0'

alias fecking='sudo '

alias drain='sudo nvidia-smi drain -p 0000:01:00.0 -m'

alias cat='bat '
alias ls='eza -l -g --group-directories-first '
alias pipupdate='pip list -o --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U'

alias make='make -j 16 '
alias cmake='cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B ./build'

alias gdb='gdb -q '

alias update-grub='sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch;sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak;sudo grub-mkconfig -o /boot/grub/grub.cfg;'

alias cd="z"

alias mirror-laptop="wl-mirror eDP-1"

alias udev-retrigger-power="sudo udevadm trigger --subsystem-match=power_supply"
alias udev-retrigger="sudo udevadm trigger"

alias reload="exec zsh"

alias syncthing-start="sudo systemctl start syncthingd@anubhav"

alias vimdiff="vim -d "

alias tree="tree --dirsfirst "

alias userctl="systemctl --user "

alias rsync="rsync --info=progress2 "

alias lg="lazygit"

alias top="btop"

alias dd="dd status=progress "
