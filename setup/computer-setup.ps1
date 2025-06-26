
# We need to copy the profile script to the powershell profile directory
Copy-Item -Path "../profile.ps1" -Destination $PROFILE

# Configure Intellij IDEA vimrc file
Copy-Item -Path "../.ideavimrc" -Destination "~/.ideavimrc"

# Configure WINGET and install via commandline installer
# relys on 3rd party: https://github.com/asheroto/winget-install
Install-Script winget-install -Force
winget-install -Force

############ Install Required Applications via WINGET ############

### COMMON
winget install -e --id Google.Chrome --accept-source-agreements --authentication-mode silent
winget install -e --id AgileBits.1Password --accept-source-agreements --authentication-mode silent
winget install -e --id Nvidia.GeForceExperience --accept-source-agreements --authentication-mode silent
winget install -e --id Valve.Steam --accept-source-agreements --authentication-mode silent
winget install -e --id Yubico.YubikeyManager --accept-source-agreements --authentication-mode silent
winget install -e --id Yubico.Authenticator --accept-source-agreements --authentication-mode silent
winget install -e --id Spotify.Spotify --accept-source-agreements --authentication-mode silent

### COMMUNICATION
winget install -e --id Discord.Discord --accept-source-agreements --authentication-mode silent
winget install -e --id SlackTechnologies.Slack --accept-source-agreements --authentication-mode silent
winget install -e --id Zoom.Zoom --accept-source-agreements --authentication-mode silent

### DEVELOPMENT
winget install -e --id JetBrains.Toolbox --accept-source-agreements --authentication-mode silent
winget install -e --id Postman.Postman --accept-source-agreements --authentication-mode silent
winget install -e --id Docker.DockerDesktop --accept-source-agreements --authentication-mode silent
winget install -e --id Git.Git --accept-source-agreements --authentication-mode silent
winget install -e --id Neovim.Neovim --accept-source-agreements --authentication-mode silent
winget install -e --id CoreyButler.NVMforWindows --accept-source-agreements --authentication-mode silent
winget install -e --id GnuPG.GnuPG --accept-source-agreements --authentication-mode silent
winget install -e --id PuTTY.PuTTY --accept-source-agreements --authentication-mode silent
winget install -e --id Mozilla.Firefox.DeveloperEdition --accept-source-agreements --authentication-mode silent
winget install -e --id PortSwigger.BurpSuite.Community --source-agreements --authentication-mode silent
winget install -e --id Microsoft.VisualStudioCode --source-agreements --authentication-mode silent

### UTILITIES
winget install -e --id Microsoft.PowerShell --accept-source-agreements --authentication-mode silent
winget install -e --id JanDeDobbeleer.OhMyPosh --accept-source-agreements --authentication-mode silent
winget install -e --id Piriform.Speccy --accept-source-agreements --authentication-mode silent
winget install -e --id WinDirStat.WinDirStat --accept-source-agreements --authentication-mode silent
winget install -e --id Obsidian.Obsidian --source-agreements --authentication-mode silent
winget install -e --id Mango3D.LycheeSlicer --source-agreements --authentication-mode silent
winget install -e --id FocusriteAudioEngineeringLtd.FocusriteControl2 --source-agreements --authentication-mode silent
winget install -e --id Audacity.Audacity --source-agreements --authentication-mode silent

### ART
winget install -e --id 9P8DVF1XW02V --source-agreements --authentication-mode silent # Affinity Photo 2
winget install -e --id 9N2D0P16C80H --source-agreements --authentication-mode silent # Affinity Designer 2
winget install -e --id 9NTV2DZ11KD9 --source-agreements --authentication-mode silent # Affinity Publisher 2

############ Personal Specific Tools ############
mkdir ~/bin/
mkdir ~/workspaces/

### WARTHUNDER
winget install -e --id GaijinNetwork.WarThunder --source-agreements --authentication-mode silent

### BATTLENET
winget install -e --id Blizzard.BattleNet --source-agreements --authentication-mode silent

### EVE ONLINE
winget install -e --id CCPGames.EVEOnline --accept-source-agreements --authentication-mode silent
winget install -e --id Pidgin.Pidgin --accept-source-agreements --authentication-mode silent
winget install -e --id Mumble.Mumble.Client --accept-source-agreements --authentication-mode silent
winget install -e --id 9NR1KCK86LP3 --accept-source-agreements --authentication-mode silent # RIFT Intel Tool
Invoke-WebRequest -Uri "https://github.com/Slazanger/SMT/releases/download/SMT_141/SMT_1.41a.zip" -OutFile "~/Downloads/SMT.zip"
Expand-Archive -Path "~/Downloads/SMT.zip" -DestinationPath "~/bin/smt/"
Invoke-WebRequest -Uri "https://github.com/Proopai/eve-o-preview/releases/download/8.0.2.1/Release-8.0.2.1-Windows.zip" -OutFile "~/Downloads/eve-o-preview.zip"
Expand-Archive -Path "~/Downloads/eve-o-preview.zip" -DestinationPath "~/bin/eve-o-preview/"
Invoke-WebRequest -Uri "https://github.com/EVEIPH/LatestFiles/raw/master/EVEIPH%20Binaries.zip" -OutFile "~/Downloads/eve-iph.zip"
Expand-Archive -Path "~/Downloads/eve-iph.zip" -DestinationPath "~/bin/eve-iph/"
Invoke-WebRequest -Uri "https://github.com/pyfa-org/Pyfa/releases/download/v2.63.1/pyfa-v2.63.1-win.zip" -OutFile "~/Downloads/pyfa.zip"
Expand-Archive -Path "~/Downloads/pyfa.zip" -DestinationPath "~/bin/pyfa/"
Invoke-WebRequest -Uri "https://github.com/slysmoke/evernus/archive/refs/tags/v4.53.zip" -OutFile "~/Downloads/evernus.zip"
Expand-Archive -Path "~/Downloads/evernus.zip" -DestinationPath "~/bin/evernus/"

### DCS
winget install -e --id EagleDynamics.DCSWorldOpenBeta --accept-source-agreements --authentication-mode silent
winget install -e --id Elgato.StreamDeck --accept-source-agreements --authentication-mode silent

### WSL
wsl --install -d Ubuntu-24.04

### DOWNLOAD BUT CANT INSTALL
Invoke-WebRequest -Uri "https://d2mzlempwep3hb.cloudfront.net/TrackIR5/TrackIR_5.5.3.exe" -OutFile "~/Downloads/TrackIR.exe"
Invoke-WebRequest -Uri "https://support.virpil.com/helpdesk/attachments/47361958510" -OutFile "~/Downloads/VPC_Software_Virpil.zip"

### CONFIGURE WORKSPACES

#### PERSONAL
mkdir personal
cd ~/workspaces/personal
git clone git@github.com:KaydenMiller/kaydenmiller.github.io.git

#### OPSELLA
mkdir opsella
cd ~/workspaces/opsella
git clone git@github.com:opsella/projekter-frontend.git
git clone git@github.com:opsella/projekter_backend.git
git clone git@github.com:opsella/projekter-marketing.git

#### CHURCH
mkdir church
cd ~/workspaces/church
git clone git@github.com:Layton-Utah-YSA/clerk-tools.git