-- вывести количество инструкторов по каждой секции
SELECT sections.name AS SectionName, COUNT(*) AS NumberOfInstructors
FROM sections
JOIN instructors ON sections.id = instructors.section_id
GROUP BY sections.name;

-- показать количество людей, которые должны заниматься в определенный момент времени в каждой секции
SELECT sections.name AS SectionName, COUNT(*) AS CurrentAttendance
FROM sections
JOIN visitors ON sections.id = visitors.section_id
GROUP BY sections.name;

-- вывести количество посетителей фитнес клуба, которые пользуются услугами определенного мобильного оператора
SELECT mobile_operator, COUNT(*) AS MobileOperatorUsersCount
FROM visitors
GROUP BY mobile_operator;

-- получить количество посетителей, у которых фамилия совпадает с фамилиями из определенного списка
SELECT lastname, COUNT(*) AS LastnameCount
FROM visitors
WHERE lastname IN ('Иванов', 'Петров')
GROUP BY lastname;

-- показать количество людей с одинаковыми именами, которых занимаются у определенного инструктора
SELECT instructors.firstname AS InstructorName, visitors.firstname AS VisitorsFirstname, COUNT(*) AS FirstnameCount
FROM instructors
JOIN visitors ON instructors.id = visitors.section_id
WHERE instructors.firstname = 'Игорь'
GROUP BY visitors.firstname, instructors.firstname;

-- получить информацию о людях, которые посетили фитнес зал минимальное количество раз
SELECT firstname, lastname, attendance
FROM visitors
WHERE attendance = (SELECT MIN(attendance) FROM visitors);

-- вывести количество посетителей, которые занимались в определенной секции за первую половину текущего года
SELECT sections.name AS SectionName, COUNT(*) AS AttendeesCount
FROM sections
JOIN visitors ON sections.id = visitors.section_id
WHERE DATEPART(year, visit_date) = 2024 AND DATEPART(month, visit_date) BETWEEN 1 AND 6
GROUP BY sections.name;

-- определить общее количество людей, посетивших фитнес зал за прошлый год
SELECT COUNT(*) AS TotalVisitsCount
FROM visitors
WHERE DATEPART(year, visit_date) = 2023;