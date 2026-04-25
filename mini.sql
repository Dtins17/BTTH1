-- Hệ thống học trực tuyến
CREATE DATABASE course_online;
USE course_online;
-- Sinh viên (Student) 
CREATE TABLE student(
	student_id int primary key auto_increment,
    fullname varchar(255) not null,
    birthday date,
    email varchar(255) not null unique
);
-- Giảng viên (Teacher)
CREATE TABLE teacher(
	teacher_id int primary key auto_increment,
    fullname varchar(255) not null,
    email varchar(255) not null unique
   -- Một giảng viên có thể dạy nhiều khóa học
);
-- Khóa học (Course)
CREATE TABLE course(
	course_id int primary key auto_increment,
    course_name varchar(100) not null,
    description varchar(255) not null,
    number_of_lesson int not null,
    teacher_id int,
    foreign key(teacher_id) references teacher(teacher_id)
);
-- Đăng ký học (Enrollment)
CREATE TABLE enrollment(
	enrollment_id int primary key auto_increment,
    student_id int, 
    course_id int,
    created_at timestamp default current_timestamp,
    unique(student_id, course_id),
	foreign key(student_id) references student(student_id),
    foreign key(course_id) references course(course_id)
);
-- Kết quả học tập (Score)
CREATE TABLE score(
	score_id int primary key auto_increment,
    student_id int, 
    course_id int,
    middle_score int check(middle_score >= 0 AND middle_score <= 10) not null,
    final_score int check(final_score >= 0 AND final_score <= 10) not null,
	unique(student_id, course_id),
    foreign key(student_id) references student(student_id),
    foreign key(course_id) references course(course_id)
);

INSERT INTO student(fullname, birthday, email) VALUES
('Nguyen Van A', '2000-01-01', 'a@gmail.com'),
('Tran Thi B', '2001-02-02', 'b@gmail.com'),
('Le Van C', '2000-03-03', 'c@gmail.com'),
('Pham Thi D', '2002-04-04', 'd@gmail.com'),
('Hoang Van E', '2001-05-05', 'e@gmail.com');
INSERT INTO teacher(fullname, email) VALUES
('Thay X', 'x@gmail.com'),
('Thay Y', 'y@gmail.com'),
('Co Z', 'z@gmail.com'),
('Co M', 'm@gmail.com'),
('Thay N', 'n@gmail.com');
INSERT INTO course(course_name, description, number_of_lesson, teacher_id) VALUES
('SQL', 'Hoc SQL co ban', 20, 1),
('Java', 'Lap trinh Java', 25, 2),
('Python', 'Lap trinh Python', 30, 3),
('Web', 'Phat trien Web', 22, 4),
('AI', 'Tri tue nhan tao', 28, 5);
INSERT INTO enrollment(student_id, course_id) VALUES
(1,1),(1,2),
(2,2),(2,3),
(3,1),(3,3),
(4,4),(5,5);
INSERT INTO score(student_id, course_id, middle_score, final_score) VALUES
(1,1,8,9),
(1,2,7,8),
(2,2,6,7),
(2,3,9,9),
(3,1,5,6);

UPDATE student
SET email = 'newemail@gmail.com'
WHERE student_id = 1;
UPDATE course
SET description = 'Hoc SQL nang cao'
WHERE course_id = 1;
UPDATE score
SET final_score = 10
WHERE student_id = 1 AND course_id = 1;

DELETE FROM enrollment
WHERE student_id = 5 AND course_id = 5;
DELETE FROM score
WHERE student_id = 5 AND course_id = 5;

SELECT * FROM student;
SELECT * FROM teacher;
SELECT * FROM course;
SELECT * FROM enrollment;
SELECT * FROM score;