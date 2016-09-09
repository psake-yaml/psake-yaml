$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$manifestPath   = "$here\..\psake.psd1"

Describe "Psake Module Manifest" {
    $script:manifest = $null

    It "has a valid manifest file" {
        {
            # Note: this may return cached module information: https://psescape.azurewebsites.net/pester-testing-your-module-manifest/
            $script:manifest = Test-ModuleManifest -Path $manifestPath -ErrorAction Stop -WarningAction SilentlyContinue
        } | Should Not Throw
    }

    It "has a valid name in the manifest" {
        $script:manifest.Name | Should Be 'psake'
    }

    It "has a valid guid in the manifest" {
        $script:manifest.Guid | Should Be 'e5482e6b-cdf7-4b28-9f20-18040b02e80e'
    }

    It "has a valid version in the manifest" {
        $script:manifest.Version -as [Version] | Should Not BeNullOrEmpty
    }
}
