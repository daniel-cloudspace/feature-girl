# user_groups.feature

### Ticket #9 involves user_groups, however I've been told to hold off on coding, as this may
### not be actually used in production

Feature: User Groups
  As a user or administrator of Punk-Grok
  I want to be able to manage users into groups
  So that we can coordinate their education
  
	#   Background: 
	#     Given I am logged in as "administrator"
	#  
	#   @culerity @users @groups
	#   Scenario: Create A User Group
	#     When I am on the user groups page
	#     And I follow "New Group" within "div#new_group_link"
	#     Then I should see "New User Group"
	#     When I fill in "The Mod Squad" for "user_group_name"
	#     And I press "Create"
	#     Then I should see "UserGroup was successfully created."

### Ticket #8 Create and add users to groups in the system

	#   @culerity @users @groups
	#   Scenario: Add Users to a User Group
	#     Given a user "Adam" exists
	#     And a user "Billy" exists
	#     When I am on the user groups page
	#     And I follow "New Group" within "div#new_group_link"
	#     Then I should see "New User Group"
	#     When I fill in "The Mod Squad" for "user_group_name"
	#     And I press "Create"
	#     Then I should see "UserGroup was successfully created."
	#     When I follow "Modify Users and Courses"
	#     Then I should see "No users were found on this group."
	#     When I follow "Add User"
	# 	Then I should see "Select the user"
	#     When I select "Adam" from "user_id"
	#     And I press "Continue"
	#     Then I should see "Adam"
	#     When I follow "Add User"
	# 	Then I should see "Select the user"
	#     When I select "Billy" from "user_id"
	#     And I press "Continue"
	#     And I wait for the AJAX call to finish
	#     Then I should see "Billy"
	#     When I will confirm on the next step
	#     And I follow "Remove"
	#     And I wait for the AJAX call to finish
	#     When I will confirm on the next step
	#     And I follow "Remove"
	#     Then I should not see "Adam" within "table#users_table"
	#     And I should not see "Billy" within "table#users_table"
	#   
	#   @culerity @users @groups
	#   Scenario: Add Users to a User Group with Deadline for Completion
	#     Given a user "Adam" exists
	#     And a user "Billy" exists
	#     And a course "A Course" exists
	#     When I am on the user groups page
	#     And I follow "New Group"
	#     Then I should see "New User Group"
	#     When I fill in "The Mod Squad" for "user_group_name"
	#     And I press "Create"
	#     Then I should see "UserGroup was successfully created."
	#     When I follow "Modify Users and Courses"
	#     Then I should see "No users were found on this group."
	#     When I follow "Add User"
	#   Then I should see "Select the user"
	#     When I select "Adam" from "user_id"
	#     And I press "Continue"
	#     Then I should see "Adam"
	#     When I follow "Add User"
	#   Then I should see "Select the user"
	#     When I select "Billy" from "user_id"
	#     And I press "Continue"
	#       Then I should see "Billy"
	#     When I follow "Add Course"
	#       Then I should see "Select the course"
	# When I select "A Course" from "course_id"
	# And I click "deadline_date" in a "text_field" tag
	# And I follow "29"
	# And I wait for the AJAX call to finish
	# And I press "Continue"
	# Then I should see "A Course"
	# 
	
