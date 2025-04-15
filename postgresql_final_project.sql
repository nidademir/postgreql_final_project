CREATE TABLE Members(
	member_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categories(
	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Courses (
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(200) NOT NULL,
	description TEXT,
	start_date DATE,
	end_date DATE,
	instructor_name VARCHAR(100),
	category_id INTEGER,
	FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Enrollments(
	enrollment_id SERIAL PRIMARY KEY,
	member_id INTEGER NOT NULL,
	course_id INTEGER NOT NULL,
	enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (member_id) REFERENCES members(member_id),
	FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE Certificates(
	certificate_id SERIAL PRIMARY KEY,
	certificate_code VARCHAR(100) UNIQUE NOT NULL,
	issue_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Certificate_Assignments (
    assignment_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL,
    certificate_id INTEGER NOT NULL,
    received_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (certificate_id) REFERENCES certificates(certificate_id)
);

CREATE TABLE Blog_Posts (
    blog_post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES members(member_id)
);









