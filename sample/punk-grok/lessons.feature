# lessons.feature

Feature:
  In order to instruct students
  As an instructor
  I want to manage lessons

### Ticket #14 - This ticket asked for a user to be able to edit a lesson that they created.
### In this scenario, we're assuming user "instructor" created the lesson "Sample Course 1"

  @javascript
  Scenario: Ensuring a Lesson is Editable
    Given I am logged in as "instructor"
    When I go to the "Sample Course 1" page
    And I follow "Take this Course"
    Then I should see "Something dang educational"
    And I should not see "Something even MORE educational"
    When I go to the "Sample Course 1" page
    Then I should see "Edit"
    When I follow "Edit"
    And I follow "Edit"
    And I type "Something even MORE educational" in the wiki area "lesson_contents"
    And I press "Submit"
    Then I should see "Lesson was successfully updated."
	When I go to the "Sample Course 1" page
	And I follow "Take this Course"
    And I should see "Something even MORE educational"
    And I should not see "Something dang educational"

### As a continuation of this ticket, I wanted to show that a lesson NOT created by that user
### wasn't editable.  We're assuming "user" did not create "Sample Course 1"

  @javascript
  Scenario: Ensuring a Lesson isn't Editable
    Given I am logged in as "user"
    When I go to the "Sample Course 1" page
    Then I should see "Sample Course 1"
    And I should not see "Edit"

  @javascript
  Scenario: Making a video lesson
    Given I am logged in as "instructor"
    When I go to the courses page
    And I follow "Add a new course"
    And I fill in "Sample Video Course" for "course_name"
    And I press "Save Course"
    And I follow "Add a lesson"
    And I fill in "Sample Video Lesson" for "lesson_title"
    And I type "http://www.youtube.com/watch?v=dhebl9oD5Lc" in the wiki area "lesson_contents"
    And I fill in the default lesson questions
    And I press "Save"
    And I press "Save Course"
    Then I should see "Course was successfully updated."
    And I should see "Sample Video Course"
    When I go to the new Course page
    When I follow "Take this Course"
    Then I should see the video

	### Ticket #33 Rating a lesson utilizing a stars application
	### Ticket #40 Actually shows real Avg. Rating

  @javascript
  Scenario: Rating a lesson
    Given I am logged in as "user"
    When I go to the courses page
    And I follow "Sample Course 1"
    Then I should see "Average Rating: N.R."
    And I should not see "Average Rating: 5/5"
    When I take the course
    Then I should see "Rate Sample Lesson 1:"
    When I follow "Rate 5 out of 5"
    Then I should not see "Rate Sample Lesson 1:"
    When I press "Complete test"
    And I go to the courses page
    And I follow "Sample Course 1"
    Then I should see "Average Rating: 5/5"
    And I should not see "Average Rating: N.R."

### Ticket #12 While taking a test edit the wiki content and ensure that it is still there.
### Ticket #31 Edit existing lesson wikis.  This was tested here as well for comprehension
### Ticket #23 Wiki information should save.

  @javascript
  Scenario: Editing Wiki Content While Taking a Lesson
    Given I am logged in as "user"
    When I go to the courses page
    And I follow "Sample Course 1"
    And I follow "Take this Course"
    And I should not see "Some wiki content"
    And I should not see "Some more wiki content"
    When I type "Some wiki content" in the wiki area "1_note"
    And I save the wiki
    Then I should see "Wiki successfully edited."
    When I go to the courses page
    And I follow "Sample Course 1"
    And I follow "Take this Course"
    Then I should see "Some wiki content"
    And I should not see "Some more wiki content"
    When I type "Some more wiki content" in the wiki area "1_note"
    And I save the wiki
    Then I should see "Wiki successfully edited."
    And I go to the courses page
    And I follow "Sample Course 1"
    And I follow "Take this Course"
    Then I should see "Some more wiki content"
    And I should not see "Some wiki content"

### Ticket #43 Editing the wiki notes area during lesson creation

  @javascript
  Scenario: Editing the wiki area during course creation
    Given I am logged in as "instructor"
    When I go to the courses page
    And I follow "Add a new course"
    And I fill in "course_name" with "My brand new course"
    And I press "Save Course"
    And I follow "Add a lesson"
    And I fill in "Wiki Lesson" for "lesson_title"
    And I type "Content for wiki lesson" in the wiki area "lesson_contents"
    And I fill in the default lesson questions
    When I type "Some wiki content" in the wiki area "lesson_note"
    And I press "Save"
    And I follow "Launch Course"
    Then I should see "My brand new course"
    And I should see "Course successfully launched"
    When I logout and login as "user"
    When I go to the new Course page
    And I follow "Take this Course"
    Then I should see "Some wiki content"

	@javascript
	Scenario: Hiding questions in a lesson
		Given I am logged in as "user"
		When I go to the "Sample Course 1" page
		And I follow "Take this Course"
		And I press "Take Test"
		Then I should see "Question 1"
		And I should see "Question 2"
		And I should see "Question 3"
		And I should see "Question 4"
		When I logout and login as "instructor"
		And I go to the "Sample Course 1" page
		And I follow "Edit Course"
		And I follow "Edit"
		And I follow "remove_link_2"
		And I follow "remove_link_3"
		And I press "Submit"
		Then I should see "Lesson was successfully updated."
		When I logout and login as "admin"
		And I go to the "Sample Course 1" page
		And I follow "Take this Course"
		And I press "Take Test"
		Then I should see "Question 1"
		And I should see "Question 2"
		And I should not see "Question 3"
		And I should not see "Question 4"
		
	@javascript
	Scenario: Failing a lesson by time out
		Given I am logged in as "user"
		When I go to the "Sample Course 1" page
		And I follow "Take this Course"
		And I press "Take Test"
		And I sleep for a while
		Then I should see "Sorry, you didn't get the minimum 75% right to pass the test."
		
	@javascript
	Scenario: Failing a lesson by answering incorrectly
		Given I am logged in as "user"
		When I go to the "Sample Course 1" page
		And I follow "Take this Course"
		And I press "Take Test"
		And I choose "answers_1_false"
		And I choose "answers_2_false"
		And I choose "answers_3_false"
		And I choose "answers_4_false"
		And I press "Submit Answers"
		Then I should see "Sorry, you didn't get the minimum 75% right to pass the test."