# Task-3---Event-Management-System-using-PostgreSQL
Task 3 Project: Event Management System using PostgreSQL Objective: To develop the application that allows users to create and manage events, track attendees, and handle event registrations efficiently.

The project will include the following tasks:

1.) Database Creation

Create a database named "EventsManagement."

Create tables for Events, Attendees, and Registrations.
Events-Event_Id, Event_Name, Event_Date, Event_Location, Event_Description
Attendees-Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City
Registrations-Registration_id, Event_Id, Attendee_Id,Registration_Date, Registration_Amount.
The FOREIGN KEY constraint in the Registrations table references the Event_Id column in the Events table and the Attendee_Id column in the Attendees table.

2.) Data Creation

Insert some sample data for Events, Attendees, and Registrations tables with respective fields.

3.) Manage Event Details

a) Inserting a new event.
b) Updating an event's information.
c) Deleting an event.

4.) Manage Track Attendees & Handle Events

a) Inserting a new attendee.
b) Registering an attendee for an event.

5.) Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics.
