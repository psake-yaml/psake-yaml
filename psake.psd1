@{
    ModuleToProcess   = 'psake.psm1'
    ModuleVersion     = '4.6.1'
    GUID              = 'e5482e6b-cdf7-4b28-9f20-18040b02e80e'
    Author            = 'Jozef Izso, James Kovacs'
    Copyright         = 'Copyright (c) 2012-2016 James Kovacs, Damian Hickey and Contributors, Copyright (c) 2016 Jozef Izso'
    PowerShellVersion = '2.0'
    Description       = 'psake is a build automation tool written in PowerShell.'
    FunctionsToExport = @('Invoke-psake',
                          'Invoke-Task',
                          'Get-PSakeScriptTasks',
                          'Task',
                          'Properties',
                          'Include',
                          'FormatTaskName',
                          'TaskSetup',
                          'TaskTearDown',
                          'Framework',
                          'Assert',
                          'Exec')
    VariablesToExport = 'psake'
    ScriptsToProcess = @("LoadYaml.ps1")

    PrivateData = @{
        PSData = @{
            LicenseUri = 'https://github.com/psake/psake/blob/master/license.txt'
            ProjectUri = 'https://github.com/psake/psake'
            Tags     = @('Build', 'Task')
            IconUri  = 'https://raw.githubusercontent.com/psake/graphics/master/png/psake-single-icon-teal-bg-256x256.png'
        }
    }
}
