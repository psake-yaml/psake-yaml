
Task Default -Depends Test

Task Test {
    $psake.build.version | Should Be '13.2.0'
    $psake.build.environment | Should Be 'production'
}
