/*
Database Teaching Team
applied10_sql_intermediate.sql

student id: 34076352
student name: Ong Jin Xiang
last modified date: 13/05/2025

*/

--1
SELECT max(ENROLMARK) as "Maximum Marks"
FROM UNI.ENROLMENT
WHERE OFSEMESTER = 2 
AND to_char(OFYEAR, 'yyyy') = '2019'
AND upper(unitcode) = 'FIT9136';


--2
SELECT TO_CHAR(avg(enrolmark), '999.00') as "average_mark"
FROM uni.ENROLMENT
WHERE OFSEMESTER = 2 
AND to_char(OFYEAR, 'yyyy') = '2020'
AND upper(unitcode) = 'FIT2094';

-- Find the average mark for FIT2094 in semester 2, 2020. Show the average mark with two decimal places. Name the output column as average_mark.


--3
-- List the average mark for each offering of FIT9136. A unit offering is an instance of a particular unit in a particular semester - for example FIT1045 offered in semester 1 of 2019 - is a unit offering. In the listing, include the year and semester number. Sort the result according to the year then the semester.
SELECT TO_CHAR(AVG(ENROLMARK), '999.00') as "average_mark", ofsemester, to_char(ofyear, 'yyyy') as year
FROM uni.ENROLMENT
WHERE upper(unitcode) = 'FIT9136'
GROUP BY ofsemester, to_char(ofyear, 'yyyy')
ORDER BY year, ofsemester;

--4
-- Find the number of students enrolled in FIT1045 in the year 2019, under the following conditions (note two separate selects are required):


-- a)Repeat students are counted multiple times in each semester of 2019
SELECT COUNT(stuid) as "number_of_students"
FROM uni.ENROLMENT
WHERE to_char(OFYEAR, 'yyyy') = '2019'
AND upper(unitcode) = 'FIT1045';

-- b)Repeat students are only counted once across 2019
SELECT COUNT(DISTINCT(stuid)) as "number_of_students"
FROM uni.ENROLMENT
WHERE to_char(OFYEAR, 'yyyy') = '2019'
AND upper(unitcode) = 'FIT1045';

--5
-- Find the total number of prerequisite units for FIT5145.
SELECT COUNT(*) as "number_of_prerequisites"
FROM uni.PREREQ
WHERE upper(unitcode) = 'FIT5145';



--6
-- Find the total number of enrolments per semester for each unit in the year 2019. The list should include the unit code, semester and the total number of enrolments. Order the list in increasing order of enrolment numbers. For units with the same number of enrolments, display them by the unit code order then by the semester order.
SELECT unitcode, ofsemester, COUNT(*) as number_of_enrolments
FROM uni.ENROLMENT
WHERE to_char(OFYEAR, 'yyyy') = '2019'
GROUP BY unitcode, ofsemester
ORDER BY number_of_enrolments, unitcode, ofsemester;



--7
-- Find the total number of prerequisite units for each unit which has prerequisites. In the list, include the unit code for which the count is applicable. Order the list by unit code.
SELECT unitcode, COUNT(*) as number_of_prerequisites
FROM uni.PREREQ
GROUP BY unitcode
HAVING COUNT(*) > 0
ORDER BY unitcode;


--8
-- Find the total number of students whose marks are being withheld (grade is recorded as WH) for each unit offered in semester 2 2020. In the listing include the unit code for which the count is applicable. Sort the list by descending order of the total number of students whose marks are being withheld, then by the unit code.
SELECT unitcode, COUNT(*) as number_of_withheld
FROM uni.enrolment
WHERE to_char(enrolgrade) = 'WH'
AND ofsemester = 2 
AND to_char(ofyear, 'yyyy') = '2020'
GROUP BY unitcode
ORDER BY number_of_withheld DESC, unitcode;


--9
-- For each prerequisite unit, calculate how many times it has been used as a prerequisite (number of times used). In the listing include the prerequisite unit code, the prerequisite unit name and the number of times used. Sort the output by prerequisite unit code.
SELECT p.prerequnitcode, COUNT(p.unitcode)
FROM uni.PREREQ p
JOIN uni.unit u ON prerequnitcode = u.UNITCODE
GROUP BY prerequnitcode, u.unitname
ORDER BY prerequnitcode;




--10
-- Display the unit code and unit name of units which had at least 2 students who were granted a deferred exam (grade is recorded as DEF) in semester 2 2021. Order the list by unit code.
SELECT unitcode, unitname
FROM uni.enrolment
join uni.unit using(unitcode)
WHERE ofsemester = 2
AND to_char(ofyear, 'yyyy') = 2021
AND upper(enrolgrade) = 'DEF'
GROUP BY unitcode, unitname
HAVING count(stuid) >= 2
ORDER BY unitcode;






--11
-- Find the oldest student/s in FIT9132. Display the student’s id, full name and the date of birth. Sort the list by student id.
select stuid, stufname || ' ' || stulname as "full_name", tochar(studob, 'dd/mm/yy') as dob
from uni.student
join uni.enrolment using(stuid)
where upper(unitcode) = 'FIT9132'
and studob = (
    select min(studob)
    FROM uni.student
    join uni.ENROLMENT using(stuid)
    where upper(unitcode) = 'FIT9132'
)
ORDER BY stuid;


--12
-- A unit offering is an instance of a particular unit in a particular semester - for example FIT1045 offered in semester 1 of 2019 - is a unit offering. All unit offerings are listed in the OFFERING table. Find the unit offering/s with the highest number of enrolments for any unit offering which occurred in the year 2019. Display the unit code, offering semester and number of students enrolled in the offering. Sort the list by semester then by unit code. 
select unitcode, ofsemester, count(stuid) as number_of_students
from uni.ENROLMENT
where to_char(OFYEAR, 'yyyy') = '2019'
group by unitcode, ofsemester
having count(stuid) = (
    select max(count(stuid))
    from uni.ENROLMENT
    where to_char(OFYEAR, 'yyyy') = '2019'
    group by unitcode, ofsemester
)
order by ofsemester, unitcode;




--13







