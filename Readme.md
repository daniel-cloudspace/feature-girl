Feature Girl
============

Goal
----
As a programmer
I want to provider browser for Cucumber feature-files
So that clients can see what features we have implemented and make better feature requests

Abstract
--------
Cucumber testing is made up of Features and Scenarios, where a Feature has_many Scenarios.
Features are a poor way of organizing Scenarios. For instance, a Post Edit scenario could go in both Posts.feature and Admin.feature.
The solution is to use tags, but there is no easy way to navigate failing Scenarios by Tag.
Clients can better understand the development being done on their application and the difficulty of requests they make if they are able to view the layout of the scenario tests we write towards. 

Phase 1
-------
Read Scenarios: feature, tags
Allow CRUD on Scenarios


