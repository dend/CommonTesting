Get-ChildItem

Get-ChildItem $srcFolder | Where-Object {$_.PSIsContainer -and ($_ -match '^nue.*$')} | Remove-Item -Recurse
Get-ChildItem _xml

Write-Output "--------------------------"

If (Test-Path _xml){
    Remove-Item _xml -Recurse
}

If (Test-Path _mt){
    Remove-Item _mt -Recurse
}

If (Test-Path docpack){
    Remove-Item docpack -Recurse
}

If (Test-Path mdoc.zip){
    Remove-Item mdoc.zip
}

If (Test-Path nue.zip){
    Remove-Item nue.zip
}

If (Test-Path docpac.zip){
    Remove-Item docpac.zip
}

If (Test-Path march-train.zip){
    Remove-Item march-train.zip
}

Rename-Item mdoc-output -NewName _xml

Get-ChildItem $srcFolder | Where-Object {$_.PSIsContainer -and ($_ -match '^mdoc.*$')} | Remove-Item -Recurse

# Remove the warning, that otherwise breaks the build
git config --global core.safecrlf false

git config --global user.name ($Env:GitHubCustomUserName)
git config --global user.email ($Env:GitHubCustomEmail)

Get-ChildItem

Write-Output "--------------------------"

Get-ChildItem _xml

Write-Output "Attempting to Git ADD..."
git add .

Write-Output "Trying to commit changes."
git commit -m ("Updating content based on build " + $Env:BUILD_BUILDNUMBER) --quiet
git push origin HEAD:garbage --quiet
