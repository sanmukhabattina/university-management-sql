1.
       SELECT Name, Major FROM Students WHERE Age > 19;

2.
       SELECT AVG(Age) AS AvgAge FROM Students;

3. 
SELECT Major, COUNT(*) AS StudentCount
FROM Students
GROUP BY Major
HAVING COUNT(*) > 1;

4.
SELECT * FROM Students WHERE Age > 20 AND Major = 'Computer Science';

5. 
SELECT StudentID, Grade,
       RANK() OVER (ORDER BY Grade DESC) AS RankInClass
FROM Enrollments;

 6.
SELECT s.Name, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

7. 
SELECT s.Name, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

 8. 
SELECT s.Name, c.CourseName FROM Students s CROSS JOIN Courses c;

9. 
SELECT s1.Name AS Student1, s2.Name AS Student2
FROM Students s1
JOIN Students s2 
  ON s1.Major = s2.Major 
 AND s1.StudentID <> s2.StudentID;

10. 
SELECT Name FROM Students
WHERE Age > (SELECT AVG(Age) FROM Students);

11.
SELECT Name FROM Students s
WHERE EXISTS (
   SELECT * FROM Enrollments e
   WHERE e.StudentID = s.StudentID AND e.Grade = 'A'
);

12.
SELECT Name FROM Students
UNION
SELECT CourseName FROM Courses;

 13. 
SELECT StudentID FROM Enrollments
INTERSECT
SELECT StudentID FROM Students;

14.
SELECT StudentID FROM Students
EXCEPT
SELECT StudentID FROM Enrollments;

15.
SELECT * FROM Students LIMIT 3;

16. 
SELECT Name, Age FROM Students ORDER BY Age DESC, Name ASC;
