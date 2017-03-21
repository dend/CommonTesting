Get-ChildItem

Get-ChildItem $srcFolder | Where-Object {$_.PSIsContainer -and ($_ -match '^nue.*$')} | Remove-Item -Recurse
Get-ChildItem _xml

Write-Output "--------------------------"

Remove-Item _xml -Recurse
Rename-Item mdoc-output -NewName _xml
Get-ChildItem $srcFolder | Where-Object {$_.PSIsContainer -and ($_ -match '^mdoc.*$')} | Remove-Item -Recurse
Remove-Item mdoc.zip
Remove-Item nue.zip
Remove-Item docpac.zip
Remove-Item march-train.zip
Remove-Item _mt
Remove-Item docpack

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
