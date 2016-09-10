$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$base = Split-Path -Parent $here

$manifestPath = "$base\psake.psd1"
Import-Module $manifestPath -Force

InModuleScope Psake {
    Describe "Invoke-Psake -docs" {

        $expectedDoc = @"

Name             Alias Depends On                         Default Description        
----             ----- ----------                         ------- -----------        
Compile                CompileSolutionA, CompileSolutionB    True                    
CompileSolutionA                                                  Compiles solution A
CompileSolutionB                                                                     
IntegrationTests                                                                     
Test                   UnitTests, IntegrationTests           True                    
UnitTests        ut                                                                  



"@

        $expectedLogoDoc = @"
psake-yaml version {0}`nCopyright (c) 2010-2016 James Kovacs & Contributors`n

Name             Alias Depends On                         Default Description        
----             ----- ----------                         ------- -----------        
Compile                CompileSolutionA, CompileSolutionB    True                    
CompileSolutionA                                                  Compiles solution A
CompileSolutionB                                                                     
IntegrationTests                                                                     
Test                   UnitTests, IntegrationTests           True                    
UnitTests        ut                                                                  



"@ -f $psake.version

        $expectedDetailedDoc = @"


Name        : Compile
Alias       : 
Description : 
Depends On  : CompileSolutionA, CompileSolutionB
Default     : True

Name        : CompileSolutionA
Alias       : 
Description : Compiles solution A
Depends On  : 
Default     : 

Name        : CompileSolutionB
Alias       : 
Description : 
Depends On  : 
Default     : 

Name        : IntegrationTests
Alias       : 
Description : 
Depends On  : 
Default     : 

Name        : Test
Alias       : 
Description : 
Depends On  : UnitTests, IntegrationTests
Default     : True

Name        : UnitTests
Alias       : ut
Description : 
Depends On  : 
Default     : 




"@

        It "should return expected documentation without logo" {
            $doc = Invoke-Psake "$here\specs\nested\docs.ps1" -docs -nologo | Out-String

            $doc | Should BeExactly $expectedDoc
        }

        It "should return expected documentation with logo" {
            $doc = Invoke-Psake "$here\specs\nested\docs.ps1" -docs | Out-String

            $doc | Should BeExactly $expectedLogoDoc
        }

        It "should return expected detailed documentation without logo" {
            $doc = Invoke-Psake "$here\specs\nested\docs.ps1" -detailedDocs -nologo | Out-String

            $doc | Should BeExactly $expectedDetailedDoc
        }
    }
}

