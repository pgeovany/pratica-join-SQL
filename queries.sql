-- Q1

SELECT users.id, users.name, cities.name AS city FROM users
JOIN cities
ON users."cityId" = cities.id
WHERE cities.name LIKE 'Rio de Janeiro';

-- Q2

SELECT testimonials.id, u1.name as writer,
u2.name as recipient, testimonials.message FROM testimonials
JOIN users u1
ON testimonials."writerId" = u1.id
JOIN users u2
ON testimonials."recipientId" = u2.id;

-- Q3

SELECT users.id, users.name, courses.name AS course,
schools.name AS school, educations."endDate" FROM users
JOIN educations
ON educations."userId" = users.id
JOIN courses
ON courses.id = educations."courseId"
JOIN schools
ON schools.id = educations."schoolId"
WHERE educations.status = 'finished' AND users.id = 30;

-- Q4

SELECT users.id, users.name, roles.name AS role,
companies.name AS company, experiences."startDate" FROM users
JOIN experiences
ON experiences."userId" = users.id
JOIN companies
ON experiences."companyId" = companies.id
JOIN roles
ON experiences."roleId" = roles.id
WHERE experiences."endDate" IS NULL AND users.id = 50;


-- Bonus
-- This query isn't returning any rows, but I'm not quite sure why.

SELECT schools.id AS id, schools.name AS school, courses.name AS course,
companies.name AS company, roles.name as role FROM users
JOIN educations
ON educations."userId" = users.id
JOIN schools
ON schools.id = educations."schoolId"
JOIN courses
ON courses.id = educations."courseId"
JOIN experiences
ON experiences."userId" = users.id
JOIN companies
ON experiences."companyId" = companies.id
JOIN roles
ON experiences."roleId" = roles.id
JOIN applicants
ON applicants."userId" = users.id
JOIN jobs
ON applicants."jobId" = jobs.id
WHERE jobs.active AND companies.id = 10
AND roles.name LIKE 'Software Engineer';
