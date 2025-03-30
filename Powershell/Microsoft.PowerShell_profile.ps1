Write-Output "test"
Function GoToDotFiles { Set-Location -Path "~/.dotfiles/" }
Function GoToProjectFiles { Set-Location -Path "~/.projects/" }
Set-Alias -Name dot -Value GoToDotFiles

Set-Alias -Name proj -Value GoToProjectFiles


