$exePath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc\mdoc.exe")
Write-Output $exePath

$azureLibs = ($Env:BUILD_REPOSITORY_LOCALPATH + "\nue-out")
Write-Output $azureLibs

$outputFolder = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc-output")
Write-Output $outputFolder
New-Item ($outputFolder + "\docs") -Type Directory -force

$individualPackages = Get-ChildItem -Path $azureLibs -Directory

Write-Output "Current packages:"
foreach($package in $individualPackages)
{
    if (-Not ($package.Name -Eq 'dependencies')){
        $finalPackageOutput = ($outputFolder + "\" + $package + "\" + $package)
        $packageDocOutput = ($outputFolder + "\docs\" + $package)

        # Default the dependency folder.
        $finalDependencyOutput = ($azureLibs + "\dependencies\" + $package)

        # Create a new folder for the package, and related subfolders.
        # We treat individual Azure packages as if those are "frameworks" on their own.
        New-Item ($packageDocOutput) -Type Directory -force

        New-Item ($outputFolder + "\" + $package) -Type Directory -force
        New-Item ($finalPackageOutput) -Type Directory -force

        $dlls = Get-ChildItem -Path $package.FullName -Filter *.dll
        $dependencies = Get-ChildItem -Path ($azureLibs + "\dependencies\" + $package) -Filter *.dll
        
        # Copy all dependencies locally into the package folder.
        if ($dependencies.count -gt 0)
        {
            $finalDependencyOutput = ($outputFolder + "\" + $package + "\" + $package + "\dependencies\" + $package)

            New-Item ($outputFolder + "\" + $package + "\" + $package + "\dependencies") -Type Directory -force
            New-Item ($finalDependencyOutput) -Type Directory -force

            foreach($dependency in $dependencies)
            {
                $depFileName = [io.path]::GetFileName($dependency.FullName)
                Copy-Item $dependency.FullName ($finalDependencyOutput + "\" + $depFileName)
            }
        }

        foreach($dll in $dlls)
        {
            # Write-Output $dll.FullName
            $dllName = [io.path]::GetFileName($dll.FullName)
            $packageFullName = [io.path]::GetFileNameWithoutExtension($dll.FullName)

            Copy-Item $dll.FullName ($finalPackageOutput + "\" + $dllName)

            # When we ran NUE, we might've already obtained the XML that is shipped with the package.
            # If that is the case, we want to generate the output for the DLL from it, but we need to
            # test the path first.
            $docPath = ($package.FullName + "\" + $packageFullName + ".xml")
            $newDocPath = ($finalPackageOutput + "\" + $packageFullName + ".xml")
            $documentationXmlExists = Test-Path $docPath

            if ($documentationXmlExists)
            {
                Write-Output "Found XML documentation file!"
                Copy-Item $docPath $newDocPath
                
                # Run the standard import of the existing doc file.
                & $exePath update -i $newDocPath -o ($packageDocOutput) $dll.FullName -L $finalDependencyOutput --use-docid

                # Now run the framework tooling.
                & $exePath fx-bootstrap $finalPackageOutput
                New-Item ($finalPackageOutput + "\temp") -Type Directory -force
                & $exePath update -fx $finalPackageOutput -o ($finalPackageOutput + "\temp") --use-docid
                Copy-Item ($finalPackageOutput + "\temp\FrameworksIndex") ($packageDocOutput + "\FrameworksIndex")
            }
            else
            {
                Write-Output "There is no XML documentation file."
                & $exePath fx-bootstrap $finalPackageOutput
                & $exePath update -fx $finalPackageOutput -o ($packageDocOutput) --use-docid
            }
        }
    }
}
