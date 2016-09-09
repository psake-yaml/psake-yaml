$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$manifestPath = "$here\..\psake.psd1"

Import-Module $manifestPath -Force

InModuleScope Psake {
    Describe "`$psake global variable" {

        It "should exists" {
            $psake | Should Not Be Null
        }
    }

    Describe "`$psake.config_default" {
        It "should exists" {
            $psake.config_default | Should Not Be Null
        }
        It "property buildFileName has default value" {
            $psake.config_default.buildFileName | Should Be "default.ps1"
        }
        It "property framework has default value" {
            $psake.config_default.framework | Should Be "4.0"
        }
        It "property taskNameFormat has default value" {
            $psake.config_default.taskNameFormat | Should Be "Executing {0}"
        }
        It "property verboseError has default value" {
            $psake.config_default.verboseError | Should Be $false
        }
        It "property coloredOutput has default value" {
            $psake.config_default.coloredOutput | Should Be $true
        }
        It "property modules has default value" {
            $psake.config_default.modules | Should Be $null
        }
        It "property moduleScope has default value" {
            $psake.config_default.moduleScope | Should Be ""
        }
    }
}

