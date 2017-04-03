$dexPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\nue-out\deviceexplorer\deviceexplorer.exe")
$dexDependencyPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\nue-out\dependencies\deviceexplorer")

New-Item TestDexOutput -Type Directory

$outputFolder = ($Env:BUILD_REPOSITORY_LOCALPATH + "\TestDexOutput")

$exePath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc\mdoc.exe")
& $exePath update -o ($outputFolder) $dexPath -L $dexDependencyPath --use-docid

$dexXmlPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\TestDexOutput\index.xml")
$indexXmlPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc-output\index.xml")

$sourceXml = [xml](Get-Content $dexXmlPath)
$destinationXml = [xml](Get-Content $indexXmlPath)

foreach($assembly in $sourceXml.Overview.Assemblies.ChildNodes){
    Write-Output $assembly.
    $importNode = $destinationXml.ImportNode($assembly, $true)
    $destinationXml.Overview.Assemblies.AppendChild($importNode)
}

foreach($namespace in $sourceXml.Overview.Types.ChildNodes){
    Write-Output $namespace
    $importNode = $destinationXml.ImportNode($namespace, $true)
    $destinationXml.Overview.Types.AppendChild($importNode)
}

$destinationXml.Save("C:\Users\dendeli\Downloads\experimental\index.xml")
