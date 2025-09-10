CREATE DATABASE IT220DRIVINGSCHOOL;

USE IT220DRIVINGSCHOOL;

CREATE TABLE CAR 
(
CarNo VARCHAR(15),
DateLastInspected DATE, 
Status VARCHAR(30),
TotalMileage INT,
PRIMARY KEY(CarNo)
);

CREATE TABLE OFFICE 
(
OfficeNo INT,
StaffNo INT,
OfficeName VARCHAR(150),
City VARCHAR(20),
Country/State VARCHAR(20),
ManagerNo INT, 
Primary Key(OfficeNo),
);

CREATE TABLE STAFF 
(
StaffNo INT,
StaffType VARCHAR(150),
OfficeNo INT,
DOB DATE,
Gender CHAR(1) NOT NULL,
PhoneNumber VARCHAR(12),
StaffName VARCHAR(100),
CarNo VARCHAR(15),
Primary Key(StaffNo),
Foreign Key(OfficeNo) REFERENCES OFFICE(OfficeNo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LESSON_TYPE
(
LessonType INT,
LessonName VARCHAR(100),
LessonCost DECIMAL(11,2),
LessonTIme DECIMAL(11,2),
PRIMARY KEY(LessonType)
);

CREATE TABLE LESSONS 
(
LessonID INT,
ClientNo INT,
StaffNo INT,
Mileage INT,
LessonType INT,
LessonDateTime DATETIME,
CompletionStatus VARCHAR(20),
Notes VARCHAR(400),
Primary Key(LessonID),
Foreign Key(ClientNo) REFERENCES CLIENT(ClientNo),
Foreign Key(StaffNo) REFERENCES STAFF(StaffNo),
Foreign Key(LessonType) REFERENCES LESSON_TYPE(LessonType)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CLIENT 
(
ClientNo INT,
ClientName VARCHAR(100),
RegistrationStatus VARCHAR(25),
DOB DATE,
ClientAddress VARCHAR(100),
StaffNo INT,
Gender CHAR(1),
Primary Key(ClientNo),
Foreign Key(StaffNo) REFERENCES STAFF(StaffNo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DRIVING_TEST 
(
TestNo VARCHAR(10),
DropOffTime TIME,
PickUpTime TIME, 
ReasonForFailure VARCHAR(50), 
ClientNo INT, 
DrivingTestPass VARCHAR(10), 
TestDate DATE, 
PRIMARY KEY(TestNo), 
FOREIGN KEY ClientNo REFERENCES CLIENT(ClientNo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE WRITTEN_TEST 
(
WrittenTestNo INT,
ReasonForFailure VARCHAR(30),
ClientNo INT,
WrittenTestPass VARCHAR(10),
TestDate DATE,
Primary Key(WrittenTestNo),
Foreign Key(ClientNo) REFERENCES CLIENT(ClientNo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE REGISTRATION
(
RegistrationID INT,
RegistrationStatus VARCHAR(35),
OfficeNo INT,
Meeting VARCHAR(20),
MeetingNotes VARCHAR(50),
Primary Key (RegistrationID),
Foreign Key (OfficeNo) REFERENCES Office(OfficeNo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OFFICE_ADDRESS
(
OfficeNo INT,
Address VARCHAR(50),
PRIMARY KEY(OfficeNo),
FOREIGN KEY(OfficeNo) REFERENCES OFFICE(OfficeNo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CLIENT_REGISTRATION
(
ClientNo INT, 
RegistrationID VARCHAR(10), 
PRIMARY KEY(ClientNo), 
FOREIGN KEY(ClientNo) REFERENCES CLIENT(ClientNo)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE REGISTRATION_LICENSE
(
RegistrationID INT,
ProvisionalLicense INT,
Primary Key (RegistrationID),
Foreign Key (RegistrationID) REFERENCES Registration(RegistrationID)
);

CREATE TABLE LESSON_CAR
(
LessonID INT,
CarNo VARCHAR(15),
Primary Key(LessonID),
Foreign Key(CarNo) REFERENCES CAR(CarNo)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT STATEMENTS
INSERT INTO CAR VALUES 
('VWB-4262', '2021-09-11', 'Good condition', 13998),
('WUE-0703', '2022-07-14', 'Needs new tires', 54001),
('SJO-5432', '2023-01-29', 'Good condition', 21233),
('QOS-4118', '2019-06-23', 'Needs inspection', 71793),
('XLH-9125', '2014-11-13', 'Needs inspection', 89445),
('AVJ-4308', '2020-10-22', 'Needs oil change', 61034),
('YNX-3338', '2024-03-30', 'Good condition', 0),
('TOS-4222', '2023-12-29', 'Good condition', 13976),
('PYJ-9312', '2020-08-21', 'Good condition', 59887),
('WXA-2039', '2019-07-20', 'Good condition', 10390);

INSERT INTO OFFICE VALUES
(1, 1, 'Vista Corporate Center', 'Glasgow', 'Scotland', 1, 1),
(2, 4, 'Orchard Business Park', 'Edinburgh', 'Scotland', 4, 2),
(3, 5, 'Emerald Towers', 'Inverness', 'Scotland', 5, 3),
(4, 8, 'Skyline Executive Suites', 'Aberdeen', 'Scotland', 8, 4),
(5, 11, 'Horizon Plaza', 'Stirling', 'Scotland', 11, 5),
(6, 12, 'Sapphire Business Loft', 'Bearsden', 'Scotland', 12, 6),
(7, 13, 'Diamond Plaza', 'Bearsden', 'Scotland', 13, 7),
(8, 15, 'Oakwood Enterprise Building', 'Inverness', 'Scotland', 15, 8),
(9, 16, 'Crystal Commerce Court', 'Aberdeen', 'Scotland', 16, 9),
(10, 17, 'Summit Tower Complex', 'Glasgow', 'Scotland', 17, 10);

INSERT INTO STAFF VALUES
(10, 'Instructor', 1, '1969-07-11', 'M', '111-111-1111', 'John Smith', 'VWB-4262', '111-111-1111', 10),
(2, 'Instructor', 2, '1952-11-14', 'M', '222-222-2222', 'Grayson Daniel', 'WUE-0703', '222-222-2222', 2),
(3, 'Instructor', 3, '1994-12-29', 'M', '333-333-3333', 'Jimmy Curtis', 'SJO-5432', '333-333-3333', 3),
(4, 'Manager/Instructor', 2, '1973-05-31', 'F', '444-444-4444', 'Jack Johnston', NULL, '444-444-4444', 4),
(5, 'Manager/Instructor', 3, '1971-05-31', 'M', '555-555-5555', 'Tiger Woods', NULL, '555-555-5555', 5),
(6, 'Janitor', 4, '1981-12-23', 'F', '666-666-6666', 'Tamathy Stevens', NULL, '666-666-6666', 6),
(7, 'Instructor', 5, '1999-02-14', 'M', '777-777-7777', 'Lebron James', 'QOS-4118', '777-777-7777', 7),
(8, 'Manager/Instructor', 4, '1959-06-22', 'M', '888-888-8888', 'Michael Phelps', NULL, '888-888-8888', 8),
(9, 'Janitor', 6, '1958-08-08', 'F', '999-999-9999', 'Marcus Bradley', NULL, '999-999-9999', 9),
(1, 'Owner/Manager', 1, '1968-10-11', 'M', '101-010-1010', 'Steven Bearslaw', NULL, '101-010-1010', 1),
(11, 'Manager/Instructor', 5, '1967-12-02', 'M', '123-456-7890', 'Morton Tomas', NULL, '123-456-7890', 11),
(12, 'Manager/Instructor', 6, '1982-07-29', 'F', '0987-654-321', 'Tamashaw Storeston', NULL, '0987-654-321', 12),
(13, 'Manager/Instructor', 7, '1950-01-31', 'F', '246-810-1214', 'Holay Mores', NULL, '246-810-1214', 13),
(15, 'Manager/Instructor', 8, '1972-12-24', 'F', '369-121-5181', 'Brock Powell', NULL, '369-121-5181', 15),
(16, 'Manager/Instructor', 9, '1989-11-08', 'F', '435-647-8833', 'Ryann Honea', NULL, '435-647-8833', 16),
(17, 'Manager/Instructor', 10, '1984-03-29', 'M', '120-337-7234', 'Jenna Keeley', NULL, '120-337-7234', 17),
(18, 'Janitor', 7, '1991-04-28', 'M', '999-777-0000', 'Tomas Sands', NULL, '999-777-0000', 18),
(19, 'Instructor', 9, '1994-10-14', 'M', '435-567-1234', 'Issac Newton', 'WXA-2039', '435-567-1234', 19);

INSERT INTO LESSONS VALUES
(1, 15, 1, 0, 1, '2024-01-10 09:15:00', 'Complete', 'Confused the steering wheel for a snack at first, but figured it out eventually.'),
(2, 15, 1, 15, 2, '2024-02-18 14:30:00', 'Complete', 'Took slightly big right turns, but considered a non issue.'),
(3, 15, 1, 34, 3, '2024-03-25 11:45:00', 'Complete', 'Passed, but recommended the client for further practice regarding parallel parking.'),
(4, 15, 1, 22, 4, '2024-04-28 08:30:00', 'Complete', 'When given the option, always parked in the spot that required the smallest amount of turning, but can turn to park if required.'),
(5, 15, 1, 87, 5, '2024-05-03 12:45:00', 'Complete', 'Continuously tried to just go forwards and turn around, rather than reverse, but could do it when told to do so.'),
(6, 15, 1, 5, 6, '2024-05-04 12:34:00', 'Complete', NULL),
(7, 15, 1, 21, 7, '2024-06-10 15:20:00', 'Complete', 'When the client hit traffic, they asked to "jump the curb." They were told no.'),
(8, 15, 1, 56, 8, '2024-06-15 13:22:00', 'Complete', 'Client got hungry, and ate the instructor\'s food.'),
(9, 15, 1, 5, 9, '2024-07-15 09:00:00', 'Complete', NULL),
(10, 15, 1, 33, 10, '2024-07-20 03:20:00', 'Complete', NULL),
(11, 17, 4, 1, 1, '2024-08-22 14:10:00', 'In Progress', NULL),
(12, 18, 5, 89, 1, '2024-08-25 15:50:00', 'Not Complete', NULL),
(13, 14, 2, 13, 1, '2024-09-05 10:25:00', 'Complete', 'Seemed to know the information'),
(14, 17, 4, 44, 2, '2024-10-11 13:55:00', 'Complete', 'Almost turned into traffic at first, but corrected in time'),
(15, 19, 16, 27, 1, '2024-10-17 14:45:00', 'Not Complete', NULL),
(16, 14, 2, 15, 2, '2024-11-19 11:30:00', 'In Progress', 'Forgot the seatbelt until they hit the brakes. Mild head injury, but nothing serious, thankfully'),
(17, 11, 13, 13, 1, '2024-12-24 16:40:00', 'Not Complete', 'Had a bizarre taste in music, but drove pretty well'),
(18, 16, 12, 56, 1, '2024-12-31 17:50:00', 'In Progress', NULL),
(19, 14, 2, 23, 3, '2024-09-05 03:55:00', 'Complete', 'Client was able to park successfully.'),
(20, 14, 2, 27, 4, '2024-09-05 13:12:30', 'Complete', 'No issues.');

INSERT INTO CLIENT VALUES
(11, 'Jane Doe', 'Complete', '1998-04-12', '123 Happy Lane', 13, 'M'),
(12, 'Karen Schultz', 'Incomplete', '2003-07-07', '257 Hilltop Crest', NULL, 'M'),
(13, 'Mary Jane', 'Incomplete', '2021-05-06', '145 Lincoln Lane', NULL, 'M'),
(14, 'John Manly', 'Complete', '1965-07-03', '1446 Tsunami Street', 2, 'M'),
(15, 'Shawn Mendes', 'Complete', '2001-03-02', '798 Smith Street', 1, 'M'),
(16, 'Georgia Siegel', 'Complete', '1997-03-06', '886 Willow Street', 12, 'F'),
(17, 'Emily Keeley', 'Complete', '2004-04-04', '9876 Lilly Lane', 4, 'F'),
(18, 'Steve Sandy', 'Complete', '2017-12-24', '87 Elbo Lake Lane', 5, 'F'),
(19, 'Lilly Wilson', 'Incomplete', '2015-08-15', '55 SuperStar Street', 16, 'F'),
(20, 'Arisoa Randrianasolo', 'Incomplete', '1990-08-27', 'EN 11th Street', NULL, 'F');

INSERT INTO DRIVING_TEST VALUES
('D100', '17:50:00', '19:50:00', 'Didn\'t arrive', 15, 'Fail', '2012-11-11'),
('D101', '12:30:00', '14:30:00', 'Didn\'t arrive', 15, 'Fail', '2012-11-13'),
('D102', '9:50:00', '11:50:00', 'Fell asleep in car while driving', 15, 'Fail', '2012-11-17'),
('D103', '13:54:00', '15:54:00', 'Hit cone while parallel parking', 15, 'Fail', '2012-11-24'),
('D104', '14:13:00', '16:13:00', 'Hit cone while parallel parking', 15, 'Fail', '2012-11-30'),
('D105', '16:40:00', '18:40:00', 'Hit a car and ran away', 15, 'Fail', '2012-12-01'),
('D106', '16:30:00', '18:30:00', 'Tried to eat the steering wheel', 15, 'Fail', '2012-12-08'),
('D107', '15:30:00', '17:30:00', 'Hit a child with car', 15, 'Fail', '2012-12-19'),
('D108', '16:00:00', '18:00:00', 'Hit a police officer after speeding', 15, 'Fail', '2013-01-04'),
('D109', '13:30:00', '15:30:00', NULL, 15, 'Pass', '2013-01-13'),
('D110', '14:00:00', '16:00:00', 'Hit cone while parallel parking', 14, 'Fail', '2013-03-04'),
('D111', '15:30:00', '17:30:00', 'Speeding', 14, 'Fail', '2013-03-10'),
('D112', '9:45:00', '11:45:00', 'Picked up phone', 14, 'Fail', '2013-04-02');

INSERT INTO WRITTEN_TEST VALUES
('W100', 'Didn't arrive', 15, 'Fail', '2012-09-02'),
('W101', 'Late for test', 15, 'Fail', '2012-09-09'),
('W102', 'Couldn't recognize signs', 15, 'Fail', '2020-09-16'),
('W103', 'Couldn't identify shapes', 15, 'Fail', '2012-09-23'),
('W104', 'Forgot glasses', 15, 'Fail', '2012-09-30'),
('W105', 'Couldn't identify parallel parking steps', 15, 'Fail', '2012-10-07'),
('W106', 'Couldn't describe how to enter highway', 15, 'Fail', '2012-10-14'),
('W107', 'Didn't arrive', 15, 'Fail', '2012-10-21'),
('W108', 'Didn't know what to do when pulled over', 15, 'Fail', '2012-10-28'),
('W109', NULL, 15, 'Pass', '2012-11-11'),
('W110', NULL, 14, 'Pass', '2013-02-23');

INSERT INTO LESSON_TYPE VALUES
(1, 'Basic Car Knowledge', 20, 2),
(2, 'Neighborhood Driving', 35, 1),
(3, 'Parallel Parking', 50, 1),
(4, 'Parking Lot Parking', 20, 1.5),
(5, 'Reversing', 15, 1),
(6, 'Changing Lanes', 5, 1.5),
(7, 'Highway Driving', 75, 1.5),
(8, 'Drive-thru Practice', 20, 1),
(9, 'Railroad Tracks', 15, 1.5),
(10, 'Practice Test', 100, 2);

INSERT INTO REGISTRATION VALUES
('R001', 'Registered', 10, 'Complete', 'Client does not have a preference for Instructor. First lesson is scheduled.'),
('R002', 'Not Registered', 4, 'Scheduled', NULL),
('R003', 'Not Registered', 3, 'Scheduled', NULL),
('R004', 'Registered', 2, 'Complete', 'Client requested that their Instructor have valid experience but did not necessitate a particular Instructor.'),
('R005', 'Registered', 9, 'Complete', 'Client requested that they start lessons as soon as possible. Did not care which Instructor they were assigned to.'),
('R006', 'Registered', 9, 'Complete', 'Client did not have any particular requests. Ready to start lessons.'),
('R007', 'Registered', 6, 'Complete', 'Client was problematic and claimed they had to start lessons right then. I instructed them to wait until an Instructor was available.'),
('R008', 'Registered', 7, 'Complete', 'Client was polite and registered fully. They are ready to start lessons.'),
('R009', 'Not Registered', 8, 'Not Scheduled', NULL),
('R010', 'Not Registered', 8, 'Scheduled', NULL);

INSERT INTO OFFICE_ADDRESS VALUES
(1, '123 Maple Ave'),
(2, '456 Oak Street'),
(3, '789 Lucky Rd'),
(4, '1010 Elm Road'),
(5, '222 Willow Lane'),
(6, '333 Cedar Street'),
(7, '444 Birch Ave'),
(8, '555 Sycamore Dr'),
(9, '666 Magnolia Ct'),
(10, '777 Ash Street');

INSERT INTO REGISTRATION_LICENSE VALUES
('R001', 'A726BZ'),
('R002', 'P348XY'),
('R003', 'K972HL'),
('R004', 'R615DW'),
('R005', 'T209FJ'),
('R006', 'M503GK'),
('R007', 'S817NP'),
('R008', 'Q624EC'),
('R009', 'W409RJ'),
('R010', 'L735VX');

INSERT INTO LESSON_CAR VALUES
(1, 'VWB-4262'),
(2, 'VWB-4262'),
(3, 'VWB-4262'),
(4, 'VWB-4262'),
(5, 'VWB-4262'),
(6, 'VWB-4262'),
(7, 'VWB-4262'),
(8, 'VWB-4262'),
(9, 'VWB-4262'),
(10, 'VWB-4262'),
(11, 'WUE-0703'),
(12, 'SJO-5432'),
(13, 'QOS-4118'),
(14, 'XLH-9125'),
(15, 'AVJ-4308'),
(16, 'YNX-3338'),
(17, 'TOS-4222'),
(18, 'PYJ-9312'),
(19, 'QOS-4118'),
(20, 'QOS-4118');

INSERT INTO CLIENT_REGISTRATION VALUES
(11, 'R001'),
(12, 'R002'),
(13, 'R003'),
(14, 'R004'),
(15, 'R005'),
(16, 'R006'),
(17, 'R007'),
(18, 'R008'),
(19, 'R009'),
(20, 'R010');

QUERYING
1. The names and the telephone numbers of the Managers of each office.
SELECT StaffNo, StaffName, PhoneNumber FROM STAFF WHERE StaffType LIKE “%Manager%” GROUP BY StaffNo;

2. The full address of all offices in Glasgow.
SELECT Address, City, Country/State FROM OFFICE WHERE City = ‘Glasgow’;

3. The names of all female Instructors based in the Glasgow, Bearsden office.
SELECT StaffName FROM STAFF WHERE Gender = ‘F’ AND OfficeNo IN(SELECT OfficeNo FROM OFFICE WHERE City IN(Glasgow, Bearsden));

4. The total number of staff at each office.
SELECT OfficeNo, COUNT(*) FROM STAFF GROUP BY OfficeNo;

5. The total number of clients (past and present) in each city.
SELECT O.City, COUNT(*) FROM 
CLIENT_REGISTRATION C JOIN REGISTRATION R
ON C.RegistrationID = R.RegistrationID
JOIN OFFICE O 
ON R.OfficeNo = O.OfficeNo 
GROUP BY O.City;

6. The timetable of appointments for a given Instructor next week.
select LessonDateTime from LESSONS where StaffNo = 11111111 and LessonDateTime between ‘2024-05-05 00:00:00’ and ‘2024-05-11 11:59:59’;

7. The details of interviews conducted by a given Instructor.
Select MeetingNotes from REGISTRATION where RegistrationID = (select RegistrationID from CLIENT_REGISTRATION where ClientNo = (select ClientNo from CLIENT where StaffNo = 1));

SELECT MeetingNotes, StaffNo FROM REGISTRATION R JOIN CLIENT_REGISTRATION C 
ON R.RegistrationID = C.RegistrationID 
JOIN CLIENT 
ON C.ClientNo = Client.ClientNo 
WHERE StaffNo = 1;

8. The total number of female and male clients (past and present) in the
Glasgow, Bearsden office.
SELECT C.Gender, COUNT(*) 
FROM CLIENT C JOIN CLIENT_REGISTRATION CR 
ON C.ClientNo = CR.ClientNo 
JOIN REGISTRATION R
ON CR.RegistrationID = R.RegistrationID
JOIN OFFICE O
ON O.OfficeNo = R.OfficeNo
WHERE O.OfficeNo IN(‘Glasgow’, ‘Bearsden’)
GROUP BY GENDER; 

9. The numbers and name of staff who are Instructors and over 55 years old.
SELECT PhoneNumber, StaffName FROM STAFF 
WHERE StaffType LIKE “%Instructor%” AND
DOB < ‘1969-05-03’;

10. The registration number of cars that have had no faults found.
SELECT CarNo FROM CAR 
WHERE Status LIKE “Good Condition”;

11. The registration number of the cars used by Instructors at the Glasgow,
Bearsden office.
SELECT S.CarNo FROM STAFF S JOIN OFFICE O 
ON S.OfficeNo = O.OfficeNo 
WHERE City IN(Glasgow, Bearsden);

12. The names of clients who passed the driving test in January 2013.
SELECT C.ClientName FROM CLIENT C JOIN DRIVING_TEST D
ON C.ClientNo = D.ClientNo 
WHERE DrivingTestPass LIKE ‘Pass’ 
AND TestDate LIKE “2013%”; # Should be Shawn Mendes

13. The names of clients who have sat the driving test more than three times
and have still not passed.
SELECT ClientNo, ClientName 
FROM DRIVING_TEST D JOIN CLIENT C 
ON D.ClientNo = C.ClientNo 
WHERE DrivingTestPass LIKE “FAIL”
GROUP BY ClientNo
HAVING COUNT(DrivingTest) > 3;  # Should be John Manly 

14. The average number of miles driven during a one-hour lesson.
SELECT AVG(Mileage) FROM LESSONS L JOIN LESSON_TYPE T
ON L.LessonType = T.LessonType 
WHERE T.LessonTime = 1;

15. The number of administrative staff located at each office.
SELECT OfficeNo, COUNT(*) FROM STAFF 
WHERE StaffType LIKE “%Manager%” 
OR StaffType LIKE “%Owner%”
GROUP BY OfficeNo;

