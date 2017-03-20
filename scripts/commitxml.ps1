ls
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^nue.*$')} | Remove-Item -Recurse
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^_xml.*$')} | Remove-Item -Recurse
Rename-Item -Path ($Env:BUILD_REPOSITORY_LOCALPATH +"\mdoc-output") -newName _xml
Get-ChildItem $srcFolder | Where {$_.PSIsContainer -and ($_ -match '^_mdoc.*$')} | Remove-Item -Recurse

ls
git add .
git commit -m ("Updating content based on build " + $Env:BUILD_BUILDNUMBER)
git push origin HEAD:garbage
