Welcome to the psake-yaml project.
==================================

> `psake` is a build automation tool written in PowerShell. **psake-yaml** is fork of [psake](https://github.com/psake/psake) with support for YAML configuration.

**psake** avoids the angle-bracket tax associated with executable XML by leveraging the PowerShell syntax in your build scripts.
**psake** has a syntax inspired by rake (aka make in Ruby) and bake (aka make in Boo), but is easier to script because it
leverages your existing command-line knowledge.

psake is pronounced *sake* – as in Japanese rice wine. It does NOT rhyme with make, bake, or rake.

## Get Started

**Step 1:** Download and extract the project

You will need to "unblock" the zip file before extracting - PowerShell by default does not run files downloaded from the internet.
Just right-click the zip and click on **Properties** and click on the **Unblock** button.

**Step 2:** CD into the directory where you extracted the project (where the `psake.psm1` file is)

```powershell
Import-Module .\psake.psm1
```

If you encounter the following error `Import-Module : ...psake.psm1 cannot be loaded because the execution of scripts is disabled on this system.`
Please see `Get-Help about_signing` for more details.

1. Run PowerShell as administrator
2. Set-ExecutionPolicy RemoteSigned

**Step 3:** Get help

Use `Get-Help` command to show information about psake and examples of how to use it.

```powershell
Get-Help Invoke-psake -Full
```

**Step 3:** Run some examples

```powershell
cd .\examples

# Execute the "default" task from the default build script (default.ps1 file)
Invoke-psake

# Execute the single task "Clean" from the default.ps1 script
Invoke-psake .\default.ps1 Clean
```

## Release Notes

You can find all the information about each release of psake in the [releases section](https://github.com/psake-yaml/psake-yaml/releases).

## How To Contribute, Collaborate, Communicate

Anyone can fork the main repository and submit patches.

Also check out the **[psake-contrib](http://github.com/psake/psake-contrib)** project for scripts, modules and functions to help you with a build.

## License

**psake-yaml** and **psake** is released under the [MIT license](http://www.opensource.org/licenses/MIT).
