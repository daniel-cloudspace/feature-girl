Feature: Generate an executable/CLI scaffold

  As a RubyGem developer
  I want a scaffold for executable/CLI scripts
  So that I know the structure for constructing CLIs and can create them quickly

  Scenario: Run executable generator with name of executable
    Given an existing newgem scaffold [called "my_project"]
    When I invoke "executable" generator with arguments "my_app"
    Then folder "bin/my_app" is created
    And file "bin/my_app" is created
    And file "lib/my_app/cli.rb" is created
    And file "test/test_my_app_cli.rb" is created
    When I run unit tests for test file "test/test_my_app_cli.rb"
    Then I should see all 1 tests pass

  Scenario: Run executable generator with name of executable on rspec project
    Given an existing newgem scaffold using options "-T rspec" [called "my_project"]
    When I invoke "executable" generator with arguments "my_app"
    Then folder "bin/my_app" is created
    And file "bin/my_app" is created
    And file "lib/my_app/cli.rb" is created
    And file "spec/my_app_cli_spec.rb" is created
    When I enable rspec autorun
    And I run unit tests for test file "spec/my_app_cli_spec.rb"
    Then I should see all 1 examples pass
  
  Scenario: Run executable generator with name of executable on shoulda project
    Given an existing newgem scaffold using options "-T shoulda" [called "my_project"]
    When I invoke "executable" generator with arguments "my_app"
    Then folder "bin/my_app" is created
    And file "bin/my_app" is created
    And file "lib/my_app/cli.rb" is created
    And file "test/test_my_app_cli.rb" is created
  
  Scenario: Run CLI app from executable generator to show help
    Given an existing newgem scaffold [called "my_project"]
    Given I invoke "executable" generator with arguments "my_app"
    When I run project executable "bin/my_app" with arguments "-h"
    Then help options "-h" and "--help" are displayed
    Then help options "-p" and "--path" are displayed

  Scenario: Run CLI app from executable generator should not fail
    Given an existing newgem scaffold [called "my_project"]
    And I invoke "executable" generator with arguments "my_app"
    When I run project executable "bin/my_app" with arguments ""
    Then I should see
      """
      lib/my_app/cli.rb
      """
  
  Scenario: Run unit tests after executable generator should all pass for test/unit
    Given an existing newgem scaffold [called "my_project"]
    And I invoke "executable" generator with arguments "my_app"
    When I run unit tests for test file "test/test_my_app_cli.rb"
    Then I should see all 1 tests pass

  Scenario: Run examples after executable generator should all pass for rspec
    Given an existing newgem scaffold using options "-T rspec" [called "my_project"]
    And I invoke "executable" generator with arguments "my_app"
    When I enable rspec autorun
    And I run unit tests for test file "spec/my_app_cli_spec.rb"
    Then I should see all 1 examples pass
