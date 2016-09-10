$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$base = Split-Path -Parent $here

$manifestPath = "$base\psake.psd1"
Import-Module $manifestPath -Force

InModuleScope Psake {
    Describe "Yaml configuration" {

        It "psake.config_defaults should use psake.yml" {
            $psake.config_default.buildConfigFileName | Should be 'psake.yml'
        }

        It "Invoke-Psake should read the psake.yml by default" {
            Invoke-Psake "$here\specs\yaml\yaml1\default.ps1"

            $psake.build_success | Should be $true
        }

        It "Invoke-Psake should read the build.yml when configured in psake-config.ps1" {
            Invoke-Psake "$here\specs\yaml\yaml2\default.ps1"

            $psake.build_success | Should be $true
        }
    }
}

