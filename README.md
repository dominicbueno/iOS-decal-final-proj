# iOS-decal-finalProject

## Checkin ##
## Authors ##
  * Dominic Bueno
  
## Note ##
 For demo purposes, there exists a tab bar controller to switch between student view (left) and intrsuctor view (right).

## Purpose ##
   Checkin is a simple attendance app that expedites the attendance taking procedure through quick and easy to use location based Checkin Spots. It was designed with simplicity, speed and verifiability in mind. In order to have attendance taken a student must be within a certain range of the instructor. This helps instructors verify a student's presence and helps to combat some of the issues of attendance taking that currently exist at UC Berkeley.
   
## Features ##
  * Instructors can set Checkin Spots using their location and adjust the range (in feet) in which attendance can be taken as well as a time limit the students have to check in.
  * Students have quick access to current Checkins and can have attendance recorded with only two presses.
  
## Control Flow 
### Student View ###
  * Upon opening the app the user is immediately shown a list view of their current classes.
  * Selecting a class leads to a Checkin Button appearing if the user is within range of their class Checkin and within the time limit of their Checkin.
  * If a student is not in range or the instructor has not set a Checkin the student will see an “Unavailable” label.
  * Once a Checkin is available and the user presses “Check In” a success icon will appear notifying the user that their attendance has successfully been recorded.
  
### Instructor View ###
  * Upon opening the app the user is immediately shown a list view of the classes for which they are an instructor.
  * Selecting a class leads to a menu which displays a MapView of the user’s location as well as various settings for the Checkin such as range, and time limit.
  * A “Create Check In” button appears at the bottom and upon pressing it a success label will appear notifying the user that they have successfully created a Checkin.

  
## Implementation
### Model ###
   * ClassList.swift - This file will control and mange the courses a student is currently enrolled or the current classes an instructor is teaching.
   * CustomViewCell.swift - Various custom cells are used in this app.
   
### View ###
   * InstructorView - This view displays a table view of the instructor’s courses as well as the menu for creating a Checkin.
   * StudentView - This view displays a table view of the student’s courses as well as an interface for checking in.

   
   
### Controller ###
   * InstructorViewController - Transitions from a table view to a menu for creating a checkin. It is responsible for pushing the instructor’s location to a server as well as any settings for the created Checkin.
   * StudentViewController - Updates the interface that allows students to Checkin. Makes “check in” button appear if student is within range and within time limit of a instructor’s Checkin.
