ls
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^nue.*$')} | Remove-Item -Recurse
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^nue\.zip*$')} | Remove-Item -Recurse
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^_xml.*$')} | Remove-Item -Recurse
Rename-Item -Path ($Env:BUILD_REPOSITORY_LOCALPATH +"\mdoc-output") -newName _xml
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^mdoc.*$')} | Remove-Item -Recurse
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^mdoc\.zip*$')} | Remove-Item -Recurse

# Remove the warning, that otherwise breaks the build
git config --global core.safecrlf false

git config --global user.name ($GitHub.CustomUserName)
git config --global user.email ($GitHub.CustomEmail)

ls
git add .
git commit -m ("Updating content based on build " + $Env:BUILD_BUILDNUMBER)
git push origin HEAD:garbage
