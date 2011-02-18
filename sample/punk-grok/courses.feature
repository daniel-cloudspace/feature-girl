# courses.feature

Feature:
  In order to instruct students
  As an instructor
  I want to manage courses

### Ticket #7 View a directory of courses available to take in the system

  @javascript
  Scenario: View the Courses Index
    Given I am logged in as "user"
    When I go to the courses page
    Then I should see "Sample Course 1"

### Ticket #1 has now been grouped under Ticket #2.  It is not possible to create a lesson unless it
### is tied to a course
### Ticket #2 Add a new course with text and a badge added.  Badge functionality not available at
### coding.  Placeholder step added to be filled in later.
### Ticket #32 is also represented in this test.  Lessons must be made with a Course, and lesson
### creation is done within course creation.

  @javascript
  Scenario: Creating a course with one lesson
    Given I am logged in as "instructor"
    When I go to the courses page
    Then I should not see "My brand new course"
    And I follow "Add a new course"
    Then I should see "Add New Course"
    When I fill in "course_name" with "My brand new course"
	And I fill in "course_description" with "My brand new course's description"
    When I press "Save Course"
    Then I should see "Course was successfully created."
    When I follow "Add a lesson"
    And I fill in "lesson_title" with "My brand new lesson"
	And I follow "Add a question"
	And I fill in the following:
		| lesson[questions_attributes][0][text] 						| Question 1 |
    	| lesson[questions_attributes][0][answers_attributes][0][text]	| Answer 1.1 |
    	| lesson[questions_attributes][0][answers_attributes][1][text]	| Answer 1.2 |
		| lesson[questions_attributes][0][answers_attributes][2][text]	| Answer 1.3 |
		| lesson[questions_attributes][0][answers_attributes][3][text]	| Answer 1.4 |
 	And I follow "Add a question"
 	And I fill in the following:
		| lesson[questions_attributes][1][text]							| Question 2 |
		| lesson[questions_attributes][1][answers_attributes][0][text]  | Answer 2.1 |
		| lesson[questions_attributes][1][answers_attributes][1][text]  | Answer 2.2 |
		| lesson[questions_attributes][1][answers_attributes][2][text]  | Answer 2.3 |
		| lesson[questions_attributes][1][answers_attributes][3][text]  | Answer 2.4 |
	And I follow "Add a question"
	And I fill in the following:
		| lesson[questions_attributes][2][text]							| Question 3 |
		| lesson[questions_attributes][2][answers_attributes][0][text]  | Answer 3.1 |
		| lesson[questions_attributes][2][answers_attributes][1][text]  | Answer 3.2 |
		| lesson[questions_attributes][2][answers_attributes][2][text]  | Answer 3.3 |
		| lesson[questions_attributes][2][answers_attributes][3][text]  | Answer 3.4 |
	And I follow "Add a question"
	And I fill in the following:
		| lesson[questions_attributes][3][text] 						| Question 4 |
		| lesson[questions_attributes][3][answers_attributes][0][text]  | Answer 4.1 |
		| lesson[questions_attributes][3][answers_attributes][1][text]  | Answer 4.2 |
		| lesson[questions_attributes][3][answers_attributes][2][text]  | Answer 4.3 |
		| lesson[questions_attributes][3][answers_attributes][3][text]  | Answer 4.4 |
    And I type "Lesson Content" in the wiki area "lesson_contents"
    And I press "Save"
    Then I should see "Lesson was successfully created."
    Then I should see "My brand new lesson"
# 	When I add a badge
 	And I press "Save Course"
# 	Then I should see "My brand new course"
    And I should see "Course was successfully updated."

### Ticket #30 & 34 Add an additional question while creating a course

    @javascript
	Scenario: Creating a course lesson with more than four questions
	Given I am logged in as "instructor"
	When I go to the courses page
	And I follow "Add a new course"
	When I fill in "course_name" with "My brand new course"
	When I press "Save Course"
	Then I should see "Course was successfully created."
	When I follow "Add a lesson"
	And I fill in "Extra Long Lesson" for "lesson_title"
	And I type "This is so educational, we need more questions" in the wiki area "lesson_contents"
	And I fill in the default lesson questions
	And I press "Save"
	Then I should see "Lesson was successfully created."
	And I follow "Launch Course"
	Then I should see "Course successfully launched."
	Then "5" users take the test
	When I logout and login as "instructor"
	And I go to the new Course page
	Then I should see "Edit"
	When I follow "Edit"
	And I follow "Edit"
	When I follow "Add a question"
	And I fill in the following:
	      | lesson[questions_attributes][4][text]                        | Question 5 |
	      | lesson[questions_attributes][4][answers_attributes][0][text] | TRUE       |
	      | lesson[questions_attributes][4][answers_attributes][1][text] | false      |
	      | lesson[questions_attributes][4][answers_attributes][2][text] | false      |
	      | lesson[questions_attributes][4][answers_attributes][3][text] | false      |
	And I follow "Add a question"
	And I fill in the following:
	      | lesson[questions_attributes][5][text]                        | Question 6 |
	      | lesson[questions_attributes][5][answers_attributes][0][text] | TRUE       |
	      | lesson[questions_attributes][5][answers_attributes][1][text] | false      |
	      | lesson[questions_attributes][5][answers_attributes][2][text] | false      |
	      | lesson[questions_attributes][5][answers_attributes][3][text] | false      |
	And I follow "Add a question"
	And I fill in the following:	
	      | lesson[questions_attributes][6][text]                        | Question 7 |
	      | lesson[questions_attributes][6][answers_attributes][0][text] | TRUE       |
	      | lesson[questions_attributes][6][answers_attributes][1][text] | false      |
	      | lesson[questions_attributes][6][answers_attributes][2][text] | false      |
	      | lesson[questions_attributes][6][answers_attributes][3][text] | false      |
	And I follow "Add a question"
	And I fill in the following:
	      | lesson[questions_attributes][7][text]                        | Question 8 |
	      | lesson[questions_attributes][7][answers_attributes][0][text] | TRUE       |
	      | lesson[questions_attributes][7][answers_attributes][1][text] | false      |
	      | lesson[questions_attributes][7][answers_attributes][2][text] | false      |
	      | lesson[questions_attributes][7][answers_attributes][3][text] | false      |
	And I press "Submit"
	Then I should see "Lesson was successfully updated."
	When I press "Save Course"
	Then I should see "Course was successfully updated."
	When I go to the new Course page
	And I follow "Take this Course"
	And I press "Take Test"
	Then I should not see "Question 1"
	And I should not see "Question 2"
	And I should not see "Question 3"
	And I should not see "Question 4"
	Then I should see "Question 5"
	And I should see "Question 6"
	And I should see "Question 7"
	And I should see "Question 8"

### Ticket #22 Allow courses to create a course with multiple lessons

  @javascript
  Scenario: Creating a course with more than one lesson
    Given I am logged in as "instructor"
    When I go to the courses page
    Then I should not see "My brand new course"
    And I follow "Add a new course"
    Then I should see "Add New Course"
    When I fill in "course_name" with "My brand new course"
    When I press "Save Course"
    Then I should see "Course was successfully created."
    And I should not see "Lesson num 1"
    And I should not see "Lesson num 2"
    When I follow "Add a lesson"
    And I fill in "Lesson num 1" for "lesson_title"
    And I type "Content for Lesson num 1" in the wiki area "lesson_contents"
    And I fill in the default lesson questions
    And I press "Save"
    Then I should see "Lesson was successfully created."
    And I should see "Lesson num 1"
    And I should not see "Lesson num 2"
    When I follow "Add a lesson"
    And I fill in "Lesson num 2" for "lesson_title"
    And I type "Content for Lesson num 2" in the wiki area "lesson_contents"
    And I fill in the default lesson questions
    And I press "Save"
    Then I should see "Lesson was successfully created."
    And I should see "Lesson num 1"
    And I should see "Lesson num 2"
    And I press "Save Course"
    Then I should see "My brand new course"
    And I should see "Course was successfully updated"

### Ticket #3 View a course.  This assumes that Test Course 1 has been seeded into the database

  @javascript
  Scenario: Viewing a course
    Given I am logged in as "user"
    When I go to the courses page
    Then I should see "Sample Course 1"
    When I follow "Sample Course 1"
    Then I should see "Sample Course 1"
    When I follow "Take this Course"
    Then I should see "Sample Lesson 1"
    And I should see "Something dang educational"

### Ticket #4 Take a course.  This assumes that Test Course 1 has been seeded into the database
### Ticket #5 Take a course test.
### Ticket #54 Have course box migrate based off of placement in course
### not yet functional

  @javascript
  Scenario: Taking a course
    Given I am logged in as "user"
	Then I should be on user profile page
    Then I should see "You aren't taking any courses."
    And I should see "You have not completed any courses."
    And I should not see "Sample Course 1" within "#current_courses"
    And I should not see "Sample Course 1" within "#completed_courses"
    When I go to the courses page
    And I follow "Sample Course 1"
    And I follow "Take this Course"
    And I go to the user profile page
    Then I should not see "You aren't taking any courses."
    And I should see "You have not completed any courses."
    And I should see "Sample Course 1" within "#current_courses"
    And the progress bar should be at "0.0"%
    And I should not see "Sample" within "#completed_courses"
    When I go to the "Sample Course 1" page
    And I follow "Take this Course"
    And I press "Take Test"
    Then I should see "Sample Lesson 1"
    And I should see "Question 1"
    When I choose "answers_1_true"
    Then I should see "Question 2"
    When I choose "answers_2_true"
    Then I should see "Question 3"
    When I choose "answers_3_true"
    Then I should see "Question 4"
    When I choose "answers_4_true"
    When I press "Submit Answers"
    Then I should see "Congratulations!!! You have passed this lesson."
    When I press "Complete test"
    Then I should see "Course Passed"
    And I should see "Percentage of tests passed: 100.0%"
    When I go to the user profile page
    Then I should see "You aren't taking any courses."
    And I should not see "You have not completed any courses"
    # And I should see "Sample Course 1" within "#current_courses"
    And I should see "Sample Course 1" within "#completed_courses"

### Ticket #24 Ensuring there is a difference in the actions of the different course types.  Example
### You should see an image when given one with the image lesson, but not with the test lesson.
# ### Cucumber testing is unpossible 
# 
#   @javascript
#   Scenario: Making a text lesson
#     Given I am logged in as "instructor"
#     When I go to the courses page
#     And I follow "Add a new course"
#     And I fill in "Sample Text Course" for "course_name"
#     And I press "Save Course"
#     And I follow "Add a lesson"
#     And I fill in "Sample Text Lesson" for "lesson_title"
#     And I type "Test text <br> http://www.google.com should link to google.com <br> and <code><b>This should not be bolded</b</code> <br>" through the HTML edit
#     And I fill in the default lesson questions
#     And I press "Save"
#     And I press "Save Course"
#     Then I should see "Course was successfully updated."
#     And I should see "Sample Text Course"
#     When I go to the new Course page
#     When I follow "Take this Course"
#     Then I should see "Test text"
#     And I should see "http://www.google.com should link to google.com"
# #    And I should see "<code><b>This should not be bolded</b</code>"	
# 


### Ticket #42 Functionality for editing a Course

  @javascript
  Scenario: Editing a Course
    Given I am logged in as "instructor"
    When I go to the courses page
    Then I should see "Sample Course 1"
    And I should not see "My New Course"
    When I go to the "Sample Course 1" page
    Then I should see "Edit"
    When I follow "Edit"
    Then the "course_name" field should contain "Sample Course 1"
    When I fill in "My New Course" for "course_name"
    And I press "Save Course"
    Then I should see "Course was successfully updated."
    And I should see "My New Course"
    And I should not see "Sample Course 1"

### Adding Course State Functionality

  @javascript
  Scenario: Viewing a pending course
    Given I am logged in as "instructor"
    When I go to the courses page
	Then I should see "Sample Course 1"
	Then I should see "Sample Course 2"
	Then I should see "Sample Course 3"

  @javascript
  Scenario: Not being able to view a pending course
	Given I am logged in as "user"
	When I go to the courses page
	Then I should see "Sample Course 1"
	And I should see "Sample Course 2"
	And I should not see "Sample Course 3"

  @javascript
  Scenario: Making a pending course active
	Given I am logged in as "user"
	When I go to the courses page
	Then I should not see "Sample Course 3"
	When I logout and login as "instructor"
	When I go to the "Sample Course 3" page
	And I follow "Edit Course"
	Then I should see "Launch Course"
	When I follow "Launch Course"
	Then I should see "Course successfully launched."
	When I go to the courses page
	Then I should see "Sample Course 3"
	When I logout and login as "user"
	And I go to the courses page
	Then I should see "Sample Course 3"
	
	@javascript
	Scenario: Hiding a launched course
		Given I am logged in as "user"
		When I go to the courses page
		Then I should see "Sample Course 1"
		When I logout and login as "instructor"
		And I go to the "Sample Course 1" page
		And I follow "Edit Course"
		Then I should see "Hide Course"
		When I follow "Hide Course"
		Then I should see "Course is now pending."
		When I logout and login as "user"
		And I go to the courses page
		Then I should not see "Sample Course 1"