Get-ChildItem

Get-ChildItem $srcFolder | Where-Object {$_.PSIsContainer -and ($_ -match '^nue.*$')} | Remove-Item -Recurse
Remove-Item _xml -Recurse
Rename-Item -Path ($Env:BUILD_REPOSITORY_LOCALPATH +"\mdoc-output") -newName _xml
Get-ChildItem $srcFolder | Where-Object {$_.PSIsContainer -and ($_ -match '^mdoc.*$')} | Remove-Item -Recurse
Remove-Item mdoc.zip
Remove-Item nue.zip

# Remove the warning, that otherwise breaks the build
git config --global core.safecrlf false

git config --global user.name ($Env:GITHUB_CUSTOMUSERNAME)
git config --global user.email ($Env:GITHUB_CUSTOMEMAIL)

Get-ChildItem

git add .
git commit -m ("Updating content based on build " + $Env:BUILD_BUILDNUMBER)
git push origin HEAD:garbage
