# Fire Emblem: The Sacred Stones

This is a disassembly of Fire Emblem - The Sacred Stones (USA, Australia)

It builds the following ROM:

- [**fe8.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=1972) `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

## Setting Up

- Have one of Unix/Linux/[WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)/MSYS2/Cygwin/whatever

- Have [devkitARM](https://devkitpro.org/wiki/Getting_Started) or another arm-none-eabi toolchain

- You will need the following packages (or their equivalents on systems not based on Debian):
  - `build-essential`, `git`, `libpng-dev`

- Build tools using `./build_tools.sh`.
  - This will also download, build and install agbcc, you don't need to install it separately.

- Get yourself a copy of the original ROM of Fire Emblem - The Sacred Stones (USA, Australia). Put it in this folder as `baserom.gba`.

- Once this is done, you can build fe8 using `make`.
  - For non-devkitARM toolchains, do `make TOOLCHAIN=/path/to/toolchain/`.

<details>
<summary>click for sample commands on Debian+ (Ubuntu, Linux Mint, etc.)</summary>

Please execute these commands one by one and not all at once so you can troubleshoot anything that goes wrong.

```sh
# installing devkitARM
wget https://apt.devkitpro.org/install-devkitpro-pacman
chmod +x ./install-devkitpro-pacman
sudo ./install-devkitpro-pacman
rm -f install-devkitpro-pacman

# getting the required packages
sudo apt install build-essential git libpng-dev

# cloning the fe8 repository (if you haven't done that yet)
git clone https://github.com/StanHash/fe8.git
cd fe8

# building tools
./build_tools.sh

# getting a baserom
cp "<WHEREVER YOUR FE8 ROM IS>" baserom.gba

# build
make
```

</details>

## See also

* [**StanHash/fe1**](https://github.com/StanHash/fe1), a disassembly of Fire Emblem : Shadow Dragon and the Blade of Light
* [**ZaneAvernathy/FireEmblem5**](https://github.com/ZaneAvernathy/FireEmblem5), a disassembly of Fire Emblem: Thracia 776
* [**StanHash/fe6**](https://github.com/StanHash/fe6), a decompilation of Fire Emblem: The Binding Blade
