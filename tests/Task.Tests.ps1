$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$base = Split-Path -Parent $here

$manifestPath = "$base\psake.psd1"
Import-Module $manifestPath -Force

InModuleScope Psake {
    Describe "Task" {

        It "circular tasks definition should fail" {
            $ex = Invoke-Psake "$here\specs\circular_dependency_in_tasks_should_fail.ps1" -nologo | Out-String

            $psake.build_success | Should be $false
            $ex | Should Match ([regex]::Escape('Exception: Assert: Circular reference found for task A.'))
        }
    }
}

