
# Installing Chromium Browser and Alacritty Terminal on Debian

## Installing Chromium Browser

1. **Update Package Lists**: Open a terminal and update the package lists:
   ```bash
   sudo apt update
   ```

2. **Install Chromium**: Use the following command to install Chromium browser:
   ```bash 
   sudo apt install chromium
   ```

3. **Launch Chromium**: Once installed, you can launch Chromium from the applications menu or by typing `chromium` in the terminal.

## Installing Rust and Cargo

1. **Install Rust using Rustup**: Open a terminal and run the following command to install Rust and Cargo using Rustup:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. **Add Rust to PATH**: After installing Rust, add the Rust toolchain to your system's PATH environment variable:
   ```bash
   source $HOME/.cargo/env
   ```

3. **Verify Installation**: Verify that Cargo is installed by running:
   ```bash
   cargo --version
   ```

## Installing Alacritty Terminal

1. **Install Dependencies**: Open a terminal and install the necessary dependencies for building Alacritty:
   ```bash
   sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev xclip
   ```

2. **Clone the Alacritty Repository**: Clone the Alacritty repository from GitHub:
   ```bash
   cd ~
   git clone https://github.com/alacritty/alacritty.git
   ```

3. **Build Alacritty**: Navigate into the `alacritty` directory and build Alacritty using Cargo:
   ```bash
   cd alacritty
   cargo build --release
   ```

4. **Install Alacritty**: After the build process is complete, install Alacritty by copying the executable binary to `/usr/local/bin`, the application icon to `/usr/share/pixmaps`, and the desktop file to `/usr/share/applications`:
   ```bash
   sudo cp target/release/alacritty /usr/local/bin
   sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
   sudo desktop-file-install extra/linux/Alacritty.desktop
   sudo update-desktop-database
   ```

5. **Launch Alacritty**: You can now launch Alacritty from the applications menu or by typing `alacritty` in the terminal.

## Cleaning Up

After installing Chromium and Alacritty, you can remove the cloned Alacritty repository if you no longer need it:
   
   ```bash
   rm -rf ~/alacritty
   ```


