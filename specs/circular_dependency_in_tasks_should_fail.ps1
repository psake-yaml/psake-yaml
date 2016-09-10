# Pester test: Task.Tests.ps1

task default -depends A
task A -depends B { }
task B -depends A { }
