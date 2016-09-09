Properties {
    $currentDir = Resolve-Path .
    $baseDir = $psake.build_script_dir
    $version = "4.6.1-alpha$($env:APPVEYOR_BUILD_NUMBER)"
    $nuget = "$baseDir\NuGet.exe"
}

Task Default -Depends Package
Task Package -Depends Clean, Pack-Nuget

Task Pack-Nuget {
    New-Item "$baseDir\artifacts" -Type Directory | Out-Null

    Exec {
      .$nuget pack "$baseDir\psake.nuspec" -OutputDirectory "$baseDir\artifacts" -NoPackageAnalysis -version $version
    }
}

Task Clean {
    if (Test-Path "$baseDir\artifacts") {
        Remove-Item "$baseDir\artifacts" -Recurse -Force
    }
}
