$applications = @(
        "Obsidian.Obsidian",
        "OBSProject.OBSStudio",
        "VideoLAN.VLC",
        "ApacheFriends.Xampp.8.2",
        "Starship.Starship",
        "GnuPG.Gpg4win",
        "GIMP.GIMP",
        "Valve.Steam",
        "EpicGames.EpicGamesLauncher",
        "Neovim.Neovim",
        "Microsoft.VisualStudioCode",
        "OpenJS.NodeJS",
        "Python.Python.3.11",
        "Google.AndroidStudio",
        "Oracle.JDK.19",
        "Git.Git",
        "GitHub.GitHubDesktop",
        "MongoDB.Server",
        "WhatsApp.WhatsApp",
        "Brave.Brave",
        "Mozilla.Firefox",
        "Google.Chrome",
        "Discord.Discord",
        "Postman.Postman",
        "Microsoft.WindowsTerminal",
        "Microsoft.PowerShell",
        "Anaconda.Anaconda3"
    )
    
foreach ($app in $applications) {
    Write-Host "⚙️ Installing $app..."
    try {
        winget install --id $app -e -q
        # Use -e to automatically accept the installation prompts, -q for quiet mode
        Write-Host "✅ $app installed successfully."
    } catch {
        Write-Host "❌ Error installing ${app}: $_"
    }
}

scoop install git 7zip
scoop install lsd
scoop install neofetch 