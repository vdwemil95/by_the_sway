# PATH
set -x PATH $PATH ~/.local/bin

# Intro
# neofetch

# Look
set fish_color_command green

# Powerline
# function fish_prompt
#     powerline-shell --shell bare $status
# end
starship init fish | source

# Wayland specific envvars
set -gx MOZ_ENABLE_WAYLAND 1
set -gx MOZ_DBUS_REMOTE 1
set -gx XDG_SESSION_TYPE wayland
set -gx _JAVA_AWT_WM_NONREPARENTING 1

# Make default programs
set -gx BROWSER firefox
set -gx FILE nautilus
set -gx STATUSBAR waybar
set -gx TERMINAL alacritty
set -gx SUDO_ASKPASS $HOME/.local/bin/wofipass

# Desktop settings for screen casting
set -gx XDG_CURRENT_DESKTOP sway


# My keybindings
bind \en 'history-token-search-forward'
bind \ep 'history-token-search-backward'