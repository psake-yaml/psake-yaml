task default -depends FrameworkFunction

task FrameworkFunction  {
	AssertFramework '2.0' '2.0' '2.0'
	AssertFramework '3.5' '3.5' '2.0'
	AssertFramework '4.0' '4.6' '4.0'
}

function AssertFramework{
	param(
		[string]$framework,
		[string]$engineVersion,
		[string]$frameworkVersion
	)
	Framework $framework
	$msBuildVersion = msbuild /version
	Assert ($msBuildVersion[0].StartsWith("microsoft (r) build engine version $engineVersion", [System.StringComparison]::InvariantCultureIgnoreCase)) '$msBuildVersion engine version does not start with "$engineVersion"'
	Assert ($msBuildVersion[1].StartsWith("[Microsoft .NET Framework, version $frameworkVersion", [System.StringComparison]::InvariantCultureIgnoreCase)) '$msBuildVersion framework version does not start with "$framework"'
}