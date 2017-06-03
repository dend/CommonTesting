$exePath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc\mdoc.exe")
Write-Output $exePath

$libraries = ($Env:BUILD_REPOSITORY_LOCALPATH + "\sql\sqlserver-2017")
Write-Output $libraries

$outputFolder = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc-output")
Write-Output $outputFolder


$dlls = Get-ChildItem -Path ($libraries + "\*") -Include *.dll
foreach($dll in $dlls)
{
    # Write-Output $dll.FullName
    $reflectionTarget = [io.path]::GetFileNameWithoutExtension($dll.FullName)

    $docPath = ($libraries + "\" + $reflectionTarget + ".xml")
    $documentationXmlExists = Test-Path $docPath

    $resolutionPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\sql\dependencies\sqlserver-2017")
    #Write-Output ("Resolving from " + $resolutionPath)

    if ($documentationXmlExists)
    {
        Write-Output "Found XML documentation file!"
        Write-Output $dll.FullName
        & $exePath update -i $docPath -o ($outputFolder) $dll.FullName --use-docid -L ($resolutionPath) --debug
    }
    else
    {
        Write-Output "There is no XML documentation file."
        Write-Output $dll.FullName
        & $exePath update -o ($outputFolder) $dll.FullName --use-docid -L ($resolutionPath) --debug
    }
}
