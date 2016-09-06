# Copyright 2016 Cloudbase Solutions Srl
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$libDir = Join-Path $here "lib"

function Initialize-Assemblies {
    $assemblyFile = Join-Path $libDir "YamlDotNet.dll"
    try {
        [YamlDotNet.Serialization.Serializer] | Out-Null
    } catch [System.Management.Automation.RuntimeException] {
        if(!(Test-Path $assemblyFile)) {
            Throw "Could not find YamlDotNet assembly on the system"
        }
        return [Reflection.Assembly]::LoadFrom($assemblyFile)
    }
}

Initialize-Assemblies | Out-Null
