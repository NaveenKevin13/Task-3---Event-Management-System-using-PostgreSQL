/*Task 3
Project: Event Management System using PostgreSQL
Objective: To develop the application that allows users to create and manage events, track attendees, and handle event registrations efficiently. The project will include the following tasks:
1. Database Creation
Create a database named "EventsManagement."
Create tables for Events, Attendees, and Registrations.
Events-Event_Id, Event_Name, Event_Date, Event_Location, Event_Description
Attendees-Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City
Registrations-Registration_id, Event_Id, Attendee_Id,Registration_Date, Registration_Amount.
The FOREIGN KEY constraint in the Registrations table references the Event_Id column in the Events table and the Attendee_Id column in the Attendees table.*/

CREATE DATABASE EventsManagement;


-- Create the Events table
CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name VARCHAR(255) NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Location VARCHAR(255) NOT NULL,
    Event_Description TEXT
);

-- Create the Attendees table
CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name VARCHAR(255) NOT NULL,
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(255) UNIQUE,
    Attendee_City VARCHAR(255)
);

-- Create the Registrations table
CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INT NOT NULL,
    Attendee_Id INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Registration_Amount DECIMAL(10, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);


select * from  events;
select * from  Registrations;
select * from  Attendees;


/*2. Data Creation
Insert some sample data for Events, Attendees, and Registrations tables with respective fields.*/

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
('LMES Tech fest 2024', '2024-10-15', 'RMZ, Chennai-one', 'A conference focusing on the latest in technology and innovation.'),
('Marakuma Nenjam', '2024-11-20', 'Adithyapalace, OMR', 'An open-air music festival featuring AR Rahman and Musicians.'),
('Art Exhibition', '2024-12-05', 'Museum, Coimbatore', 'An exhibition showcasing contemporary art from around Tamilnadu.');

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
('Sam', '9895551234', 'Sam12@fb.com', 'Chennai'),
('Pam', '9765555678', 'PAM144@orkut.com', 'Coimbatore'),
('Saul goodman', '8895518765', 'Saulgoodman23@netflix.com', 'Salem'),
('Mike', '3455554321', 'Mike006@netflix.com', 'Chennai');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
(2, 1, '2024-09-01', 2500.00),  -- PAM registers for Marakuma Nenjam
(2, 2, '2024-09-02', 2500.00),  -- SAM registers for Marakuma Nenjam
(1, 3, '2024-10-01', 2000.00),   -- Saul goodman registers for LMES Tech fest 2024
(3, 4, '2024-11-01', 1000.00);   -- Mike registers for Art Exhibition

select * from Events;


/*3. Manage Event Details
a) Inserting a new event.*/

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
('Annual amazon Bash 2024', '2024-12-15', 'Leela Palace, ECR, Chennai', 'Annual celebrations held for Amazon employees. The event will feature a dinner and entertainment.');

select * from events;

-- b) Updating an event's information.

UPDATE Events
SET Event_Location = 'WTC, OMR',
    Event_Description = 'A conference focusing on the latest in technology and innovation (Focusing largely on LLM).'
WHERE Event_Id = 1;

SELECT * FROM EVENTS
WHERE EVENT_ID = 1;

-- c) Deleting an event.

SELECT * FROM Registrations WHERE Event_Id = 3; -- Checking for registered attentees in event id 3 (Mike registered for Art Exhibition)
DELETE FROM Registrations WHERE Event_Id = 3;  -- deleted entry value for registered attentees in event id 3
DELETE FROM Registrations WHERE Event_Id = 3; -- deleted event id 3

select * from registrations;


/*4) Manage Track Attendees & Handle Events
a) Inserting a new attendee.*/

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES ('Chuck', '9876543210', 'Chuck@HHMadvocates.com', 'Bangalore');

select * from Attendees;


-- b) Registering an attendee for an event.

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (2, 5, '2024-09-15', 2500.00);

-- To display the added event.
SELECT
    a.Attendee_Name,
    e.Event_Id,
    e.Event_Name,
    e.Event_Date,
    a.Attendee_Id,
    r.Registration_Amount
FROM
    Registrations r
JOIN
    Events e ON r.Event_Id = e.Event_Id
JOIN
    Attendees a ON r.Attendee_Id = a.Attendee_Id
WHERE
    r.Event_Id = 2 AND r.Attendee_Id = 5;


-- 5.Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics.

SELECT
    e.Event_Id,
    e.Event_Name,
    COUNT(r.Attendee_Id) AS Total_Attendees
FROM
    Events e
LEFT JOIN
    Registrations r ON e.Event_Id = r.Event_Id
GROUP BY
    e.Event_Id, e.Event_Name;




