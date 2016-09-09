task default -depends FrameworkFunction

task FrameworkFunction  {
	AssertFramework '2.0' '2.0.50727.8745' '2.0.50727.8745'
	AssertFramework '3.5' '3.5.30729.8763' '2.0.50727.8745'
	AssertFramework '4.0' '4.6.1586.0' '4.0.30319.42000'
}

function AssertFramework{
	param(
		[string]$framework,
		[string]$engineVersion,
		[string]$frameworkVersion
	)
	Framework $framework
	$msBuildVersion = msbuild /version
	Assert ($msBuildVersion[0].StartsWith("microsoft (r) build engine version $engineVersion", [System.StringComparison]::InvariantCultureIgnoreCase)) '$msBuildVersion does not contain engine version "$engineVersion"'
	Assert ($msBuildVersion[1].StartsWith("[Microsoft .NET Framework, version $frameworkVersion]", [System.StringComparison]::InvariantCultureIgnoreCase)) '$msBuildVersion does not contains framework version "$framework"'
}