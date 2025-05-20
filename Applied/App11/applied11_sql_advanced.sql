/*
Database Teaching Team
applied11_sql_advanced.sql

student id: 34076352
student name: Ong Jin Xiang
last modified date: 20/05/2025

*/
--1
-- Assuming that the student's name is unique, display Claudette Serman’s academic record. Include the unit code, unit name, year, semester, mark and explained_grade in the listing. The Explained Grade column must show Fail for N, Pass for P, Credit for C, Distinction for D and High Distinction for HD. Order by year, within the same year order the list by semester, and within the same semester order the list by the unit code.
SELECT unitcode, unitname, to_char(ofyear, 'yyyy') as year, ofsemester, enrolmark, 
case enrolgrade
when 'N' then 'Fail'
when 'P' then 'Pass'
when 'C' then 'Credit'
when 'D' then 'Distinction'
when 'H' then 'High Distinction'
else 'Unknown'
end as explained_grade
FROM uni.enrolment
JOIN uni.unit using(unitcode)
JOIN uni.student using(stuid)
WHERE upper(stufname) = upper('Claudette')
and upper(stulname) = upper('Serman')
ORDER BY year, ofsemester, unitcode;

-- Sample output
-- FIT9132	Introduction to databases	2019	1	56	Pass
-- FIT9136	Algorithms and programming foundations in Python	2019	1	16	Fail
-- FIT9136	Algorithms and programming foundations in Python	2019	2	81	Unknown
-- FIT9137	Introduction to computer architecture and networks	2019	2	77	Distinction
-- FIT5196	Data wrangling	2020	1	64	Credit

--2
--  Find the number of scheduled classes assigned to each staff member for each semester in 2019. If the number of classes is 2 then this should be labelled as a correct load, more than 2 as an overload and less than 2 as an underload. Include the staff id, staff first name, staff last name, semester, number of scheduled classes and load in the listing. Sort the list by decreasing order of the number of scheduled classes and when the number of classes is the same, sort by the staff id then by the semester.


--3
-- 3. Find the total number of prerequisite units for all units. Include in the list the unit code of units that do not have a prerequisite. Order the list in descending order of the number of prerequisite units and where several units have the same number of prerequisites order then by unit code.

--4
-- 4. Display the unit code and unit name for units that do not have a prerequisite. Order the list by unit code. There are many approaches that you can take in writing an SQL statement to answer this query. You can use the SET OPERATORS, OUTER JOIN and a SUBQUERY. Write SQL statements based on all three approaches. 

/* Using outer join */



/* Using set operator MINUS */



/* Using subquery */



--5
-- 5. List the unit code, semester, number of enrolments and the average mark for each unit offering in 2019. A unit offering is a particular unit in a particular semester for a particular year - for example the offering of FIT3176 in semester 2 of 2019 is one offering. Include offerings without any enrolment in the list. Round the average to 2 digits after the decimal point. If the average result is 'null', display the average as 0.00. The average must be shown with two decimal digits and right aligned. Order the list by the average mark, and when the average mark for several offerings is the same, sort by the semester then by the unit code.


--6
-- 6. List all units offered in semester 2 2019 which do not have any students enrolled. Include the unit code, unit name, and the chief examiner's name in a single column titled ce_name. Order the list based on the unit code.


--7
-- 7. List the id and full name (in a single column titled student_full_name) of students who are enrolled in both Introduction to databases and Introduction to computer architecture and networks (note: both unit names are unique) in semester 1 2020. You should note that the case provided for these unit names does not necessarily match the case in the database. Order the list by the student id.


--8
-- 8. Given that the payment rate for a tutorial is $42.85 per hour and the payment rate for a lecture is $75.60 per hour, calculate the weekly payment per type of class for each staff member in semester 1 2020. In the display, include staff id, staff name, type of class (lecture - L or tutorial - T), number of classes, number of hours (total duration), and weekly payment (number of hours * payment rate). The weekly payment must be displayed to two decimal points and right aligned. Order the list by the staff id and for a given staff id by the type of class.

    
--9
-- 9. Given that the payment rate for a tutorial is $42.85 per hour and the payment rate for a lecture is $75.60 per hour, calculate the total weekly payment (the sum of both tutorial and lecture payments) for each staff member in semester 1 2020. In the display, include staff id, staff name, total weekly payment for tutorials, total weekly payment for lectures and the total weekly payment as a single line of output. If the payment is null, show it as $0.00. The tutorial payment, lecture payment and total weekly payment must be displayed to two decimal points and right aligned. Order the list by the staff id.

    
--10
-- 10. Assume that all units are worth 6 credit points each, calculate each student’s Weighted Average Mark (WAM) and GPA. Please refer to these Monash websites: https://www.monash.edu/exams/results/wam and https://www.monash.edu/exams/results/gpa for more information about WAM and GPA respectively. Do not include NULL, WH or DEF grade in the calculation.







