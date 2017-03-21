$docPack = ($Env:BUILD_REPOSITORY_LOCALPATH + "\docpack")
$azPack = ($Env:BUILD_REPOSITORY_LOCALPATH + "\nue-out")

$xmlFiles = Get-ChildItem $docPack | Where-Object { $_.Extension -Eq ".xml" } | Foreach-Object {$_.Name}
Write-Output $xmlFiles

$existingPackages = Get-ChildItem $azPack | Where-Object { $_.Name -Ne "dependencies" }
Write-Output $existingPackages

foreach($package in $existingPackages)
{
    $pacFile = Get-ChildItem ($package.FullName) | Where-Object { $_.Extension -Eq ".dll" } | Select-Object -First 1
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($pacFile)

    Write-Output ("Trying to find docs for "+ $fileName)

    $docFileTarget = ($fileName + ".xml");
    Write-Output $docFileTarget

    if ($xmlFiles.Contains($docFileTarget))
    {
        Write-Output "We have docs!"
        Write-Output $package.FullName
        Copy-Item ($docPack + "\" + $docFileTarget) ($package.FullName + "\" + $docFileTarget)
    }
}