
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

### UTILITIES
winget install -e --id Microsoft.PowerShell --accept-source-agreements --authentication-mode silent
winget install -e --id JanDeDobbeleer.OhMyPosh --accept-source-agreements --authentication-mode silent
winget install -e --id Piriform.Speccy --accept-source-agreements --authentication-mode silent
winget install -e --id WinDirStat.WinDirStat --accept-source-agreements --authentication-mode silent


############ Personal Specific Tools ############
mkdir ~/bin/
mkdir ~/workspaces/

### EVE ONLINE
winget install -e --id CCPGames.EVEOnline --accept-source-agreements --authentication-mode silent
Invoke-WebRequest -Uri "https://github.com/Slazanger/SMT/releases/download/SMT_141/SMT_1.41a.zip" -OutFile "~/Downloads/SMT.zip"
Expand-Archive -Path "~/Downloads/SMT.zip" -DestinationPath "~/bin/smt"

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