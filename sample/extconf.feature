Feature: Write and test C-extensions
  In order to leverage existing C libraries
  As a RubyGems developer
  I want to generate a scaffold with test/spec support for writing Ruby C-extensions

  Scenario: Run extconf generator with name of extension
    Given an existing newgem scaffold [called "my_project"]
    When I invoke "extconf" generator with arguments "my_ext"
    Then folder "ext/my_ext" is created
    And file "ext/my_ext/extconf.rb" is created
    And file "ext/my_ext/my_ext.c" is created
    And file "test/test_my_ext_extn.rb" is created
    And file ".autotest" is created
    And file ".autotest" contents does match /test\/test_.*_extn\.rb/

  Scenario: Run extconf generator with name of extension on rspec project
  Given an existing newgem scaffold using options "-T rspec" [called "my_project"]
    When I invoke "extconf" generator with arguments "my_ext"
    Then folder "ext/my_ext" is created
    And file "ext/my_ext/extconf.rb" is created
    And file "ext/my_ext/my_ext.c" is created
    And file "spec/my_ext_extn_spec.rb" is created
    And file ".autotest" is created
    And file ".autotest" contents does match /spec\/.*_extn_spec\.rb/

  Scenario: Run unit tests after executable generator should all pass for test/unit
    Given an existing newgem scaffold [called "my_project"]
    And I invoke "extconf" generator with arguments "my_ext"
    When I invoke task "rake compile"
    And I run unit tests for test file "test/test_my_ext_extn.rb"
    Then I should see all 1 tests pass

  Scenario: Run examples after executable generator should all pass for rspec
    Given an existing newgem scaffold using options "-T rspec" [called "my_project"]
    And I invoke "extconf" generator with arguments "my_ext"
    When I invoke task "rake compile"
    And I enable rspec autorun
    And I run unit tests for test file "spec/my_ext_extn_spec.rb"
    Then I should see all 1 examples pass
