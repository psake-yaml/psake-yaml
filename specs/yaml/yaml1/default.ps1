
Task Default -Depends Test

Task Test {
    $psake.build.version | Should Be '1.0'
    $psake.build.environment | Should Be 'development'
}
