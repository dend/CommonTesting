$exePath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc\mdoc.exe")
Write-Output $exePath

$libraries = ($Env:BUILD_REPOSITORY_LOCALPATH + "\nue-out\jsonnet-10.0.2")
Write-Output $libraries

$outputFolder = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc-output")
Write-Output $outputFolder

$dependencyPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\nue-out\dependencies\jsonnet-10.0.2")

$dlls = Get-ChildItem -Path ($libraries + "\*") -Include *.dll
foreach($dll in $dlls)
{
    $reflectionTarget = [io.path]::GetFileNameWithoutExtension($dll.FullName)

    $docPath = ($libraries + "\" + $reflectionTarget + ".xml")
    $documentationXmlExists = Test-Path $docPath

    if ($documentationXmlExists)
    {
        Write-Output "Found XML documentation file!"
        Write-Output $dll.FullName
        & $exePath update -i $docPath -o ($outputFolder) -L ($dependencyPath) $dll.FullName --use-docid
    }
    else
    {
        Write-Output "There is no XML documentation file."
        Write-Output $dll.FullName
        & $exePath update -o ($outputFolder) -L ($dependencyPath) $dll.FullName --use-docid
    }
}
