#!/bin/bash
# Author: The Exegol Project

source common.sh

function install_pwn_apt_tools() {
    # CODE-CHECK-WHITELIST=add-aliases
    colorecho "Installing pwn apt tools"
    fapt qemu-user qemu-system binutils-aarch64-linux-gnu gdb-multiarch
    
    # add-history qemu-arm
    # add-history gdb-multiarch
    
    add-test-command "qemu-arm --version"      # Reads a PST and prints the tree structure to the console

    add-to-list "qemu-arm,https://www.qemu.org/docs/master/user/main.html,qemu-arm user space emulation has the following notable features."
}

# function install_gef() {
#     # CODE-CHECK-WHITELIST=add-aliases
#     colorecho "Installing gef"
#     git -C /opt/tools/ clone --depth 1 https://github.com/skylot/jadx.git
#     cd /opt/tools/jadx || exit
#     ./gradlew dist
#     ln -v -s /opt/tools/jadx/build/jadx/bin/jadx /opt/tools/bin/jadx
#     ln -v -s /opt/tools/jadx/build/jadx/bin/jadx-gui /opt/tools/bin/jadx-gui
#     add-history jadx
#     add-test-command "jadx --help"
#     add-to-list "jadx,https://github.com/skylot/jadx,Java decompiler"
# }

# Package dedicated to pwn tools
function package_pwn() {
    set_env
    local start_time
    local end_time
    start_time=$(date +%s)
    install_pwn_apt_tools
    # install_gef             # fork of the orignal gef with nice commands
    end_time=$(date +%s)
    local elapsed_time=$((end_time - start_time))
    colorecho "Package pwn completed in $elapsed_time seconds."
}

