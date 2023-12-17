winget source update
$PackageIdentifiers = @(
  "gerardog.gsudo"
  "Microsoft.Edge"
  "Microsoft.PowerShell"
  "Microsoft.WindowsTerminal"
  "JanDeDobbeleer.OhMyPosh"
  "Parsec.Parsec"
  "SlackTechnologies.Slack"
  "Spotify.Spotify"
)

$wingetList = winget list --accept-source-agreements
foreach ($package in $PackageIdentifiers) {
  if ($wingetList | Select-String -Pattern $package.Replace('+', '\+') -Quiet) {
    "$package already installed"
  } else {
    "Installing $package"
    winget install --exact $package --accept-package-agreements
  }
}
