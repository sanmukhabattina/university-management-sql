-- 1. Select Name and Major where Age > 19
SELECT Name, Major FROM Students WHERE Age > 19;

-- 2. Average Age of Students
SELECT AVG(Age) AS AvgAge FROM Students;

-- 3. Student count per Major (having >1)
SELECT Major, COUNT(*) AS StudentCount
FROM Students
GROUP BY Major
HAVING COUNT(*) > 1;

-- 4. Students older than 20 in Computer Science
SELECT * FROM Students WHERE Age > 20 AND Major = 'Computer Science';

-- 5. Rank students by Grade
SELECT StudentID, Grade,
       RANK() OVER (ORDER BY Grade DESC) AS RankInClass
FROM Enrollments;

-- 6. Student and Course inner join
SELECT s.Name, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- 7. Left Join Students with Courses
SELECT s.Name, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

-- 8. Cross Join Students and Courses
SELECT s.Name, c.CourseName FROM Students s CROSS JOIN Courses c;

-- 9. Students with same Major
SELECT s1.Name AS Student1, s2.Name AS Student2
FROM Students s1
JOIN Students s2 
  ON s1.Major = s2.Major 
 AND s1.StudentID <> s2.StudentID;

-- 10. Students older than AvgAge
SELECT Name FROM Students
WHERE Age > (SELECT AVG(Age) FROM Students);

-- 11. Students with Grade A
SELECT Name FROM Students s
WHERE EXISTS (
   SELECT * FROM Enrollments e
   WHERE e.StudentID = s.StudentID AND e.Grade = 'A'
);

-- 12. Union of Students and Courses
SELECT Name FROM Students
UNION
SELECT CourseName FROM Courses;

-- 13. Intersect Students and Enrollments
SELECT StudentID FROM Enrollments
INTERSECT
SELECT StudentID FROM Students;

-- 14. Students not enrolled in any course
SELECT StudentID FROM Students
EXCEPT
SELECT StudentID FROM Enrollments;

-- 15. Top 3 Students
SELECT * FROM Students LIMIT 3;

-- 16. Order by Age DESC, Name ASC
SELECT Name, Age FROM Students ORDER BY Age DESC, Name ASC;
