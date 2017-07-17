# Counter script
# (c) 2017 by Microsoft Corporation
# Created by: Den Delimarsky (dendeli)

$LookupPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\nue-out")
#$LookupPath = "C:\Users\dendeli\Downloads\neuoutput\"
$TempDestination = ($Env:BUILD_REPOSITORY_LOCALPATH + "\tempdrop\")
$TempOutput = ($Env:BUILD_REPOSITORY_LOCALPATH + "\tempout\")
$MdocPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\mdoc\mdoc.exe")
$CounterPath = ($Env:BUILD_REPOSITORY_LOCALPATH + "\counter\")

New-Item $CounterPath -Type Directory -Force
New-Item $TempDestination -Type Directory -Force
New-Item $TempOutput -Type Directory -Force
New-Item ($CounterPath + "count.txt")

$folders = Get-ChildItem -Path $LookupPath | ?{ $_.PSIsContainer }
foreach($folder in $folders)
{
    $FolderCheck = -not($folder.FullName -like "*dependencies*")
    Write-Output $FolderCheck

    if ($FolderCheck)
    {
        Write-Output ("Working on " + $folder)
        Copy-Item $folder.FullName ($TempDestination + $folder) -Recurse -Force

        & $MdocPath fx-bootstrap $TempDestination --debug

        $DependencyPath = ($LookupPath + "dependencies\" + $folder.ToString())
        Write-Output ("Looking for " + $DependencyPath)
        if (Test-Path $DependencyPath)
        {
            Write-Output "We have found the dependencies folder."
            Copy-Item $DependencyPath ($TempDestination + "dependencies\" + $folder.ToString()) -Recurse -Force
        }
        else
        {
            Write-Output "No dependency folder found."
        }

        & $MdocPath update -fx $TempDestination -o $TempOutput --use-docid --debug

        if ($LastExitCode -ne 0)
        {
            exit
        }

        cd $TempOutput

        # Start at -1 to account for the 1 FrameworksIndex file
        $TypeCounter = -1

        dir -recurse |  ?{ $_.PSIsContainer } | %{ $TypeCounter = $TypeCounter + (dir $_.FullName | Measure-Object).Count }

        $TypeSet = ($folder.ToString() + ": " + $TypeCounter)
        Write-Output $TypeSet

        Add-Content ($CounterPath + "count.txt") $TypeSet

        cd ..

        Write-Output "============================================"

        #Cleanup
        Set-Location $TempDestination
        Remove-Item * -Recurse -Force

        Set-Location $TempOutput
        Remove-Item * -Recurse -Force
    }

    gc ($CounterPath + "count.txt") | sort | get-unique > ($CounterPath + "count_sorted.txt")
}