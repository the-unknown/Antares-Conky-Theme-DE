# Antares (Conky Theme) translated into German
This is a German translation of the Conky Theme "Antares"

![Theme Preview](https://github.com/the-unknown/Antares-Conky-Theme-DE/blob/main/Antares_de.png?raw=true)

The original Antares theme was created by [Khiky-Merveilles](https://www.google.com) and can be downloaded here:
https://www.deviantart.com/khiky-merveilles/art/Antares-Conky-Theme-857864844

## Installation
Install Conky and JQ first.

**Ubuntu**
```
sudo apt install conky-all jq
```

**Arch**
```
pacmac build conky-lua-nv
sudo pacman -S curl jq
```

**Theme Installation**
```
cd /tmp
git clone https://github.com/the-unknown/Antares-Conky-Theme-DE.git
cd ./Antares-Conky-Theme-DE
cp conky ~/.conky -r
```

## Launch Conky
Best is to create a launcher and autostart on login.

**Terminal launch**
```
chmod +x ~/.conky/Antares/start_conky.sh
~/.conky/Antares/start_conky.sh
```
## HiDPI Displays (Retina Displays)
There are two files: `Antares-hidpi` and `rings-v1.2.1_hidpi.lua`
If you have a hidpi monitor, use these files instead of their non-hidpi counterparts.

Happy Hacking!
