# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int,
    skills_name varchar(256) NOT NULL,
    skills_description varchar(4096) NOT NULL,
    skills_tag varchar(256) NOT NULL,
    skills_time_commitment int,
    PRIMARY KEY (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (1,'Python', 'Powerful, versatile programming language', 'Coding Language', 1000);
insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (2,'Ruby', 'Programming language used for web apps', 'Coding Language', 750);
insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (3,'HTML', 'Programming language for front end development', 'Coding Language', 1000);
insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (4,'Cooking', 'Personal and professional skill to make delicious food', 'Professional', 1500);
insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (5,'Networking', 'Personal and professional skill to make connections', 'Professional', 1000);
insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (6,'Presentation', 'Professional skill to help explain business practices and objectives to others', 'Professional', 100);
insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (7,'Java', 'Very popular programming language for both frontend and backend development', 'Coding Language', 1000);
insert into skills (skills_id, skills_name, skills_description, skills_tag, skills_time_commitment) values (8,'SQL', 'Programming language used for databases', 'Coding Language', 500);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.


CREATE TABLE people (
    people_id int,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(256),
    people_linkedin_url varchar(256) DEFAULT 'linkedin.com',
    people_headshot_url varchar(256) DEFAULT 'hshot.jpg',
    people_brief_bio varchar(4096) DEFAULT 'Passionate Worker',
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (1,'Chad', 'Person 1', 'cbrown1@aol.com', '2021-10-03');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (2,'Brian', 'Person 2', 'bbruce1@aol.com', '2014-03-13');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (3,'Hal', 'Person 3', 'horr1@aol.com', '2005-08-14');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (4,'Ryan', 'Person 4', 'rpurple1@aol.com', '2018-10-03');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (5,'Greg', 'Person 5', 'cGreg1@aol.com', '2021-10-03');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (6,'Beety', 'Person 6', 'bgeorge1@aol.com', '1999-11-07');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (7,'Chad', 'Person 7', 'cbrown2@aol.com', '2022-10-03');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (8,'Brian', 'Person 8', 'bbruce2@aol.com', '2015-03-13');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (9,'Hal', 'Person 9', 'horr2@aol.com', '2006-08-14');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (10,'Ryan', 'Person 10', 'rpurple2@aol.com', '2019-10-03');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (11,'Greg', 'Person 11', 'cbhue2@aol.com', '2021-10-03');
insert into people (people_id,people_first_name,people_last_name,people_email, people_date_joined) values (12,'Beety', 'Person 12', 'bgeorge2@aol.com', '1992-11-07');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id INT NOT NULL,
    peopleskills_skills_id INT NOT NULL,
    peopleskills_people_id INT NOT NULL,
    peopleskills_date_acquired DATE NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (peopleskills_skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (peopleskills_people_id) REFERENCES people(people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (1, 1, 1, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (2, 3, 1, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (3, 6, 1, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (4, 3, 2, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (5, 4, 2, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (6, 5, 2, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (7, 5, 3, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (8, 1, 3, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (9, 3, 5, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (10, 6, 5, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (11, 2, 6, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (12, 3, 6, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (13, 4, 6, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (14, 3, 7, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (15, 5, 7, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (16, 6, 7, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (17, 1, 8, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (18, 3, 8, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (19, 5, 8, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (20, 6, 8, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (21, 2, 9, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (22, 5, 9, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (23, 6, 9, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (24, 1, 10, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (25, 4, 10, '2023-11-08');
insert into peopleskills(peopleskills_id, peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values (26, 5, 10, '2023-11-08');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int not null,
    roles_name varchar(256) not null,
    sort_priority int not null,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(roles_id, roles_name, sort_priority) values (1, 'Designer', 10);
insert into roles(roles_id, roles_name, sort_priority) values (2, 'Developer', 20);
insert into roles(roles_id, roles_name, sort_priority) values (3, 'Recruit', 30);
insert into roles(roles_id, roles_name, sort_priority) values (4, 'Team Lead', 40);
insert into roles(roles_id, roles_name, sort_priority) values (5, 'Boss', 50);
insert into roles(roles_id, roles_name, sort_priority) values (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int not null,
    peopleroles_people_id int not null,
    peopleroles_roles_id int not null,
    peopleroles_date_assigned date not null,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (peopleroles_roles_id) REFERENCES roles(roles_id),
    FOREIGN KEY (peopleroles_people_id) REFERENCES people(people_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (1, 1, 2, '2023-11-08');
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (2, 2, 5, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (3, 2, 6, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (4, 3, 2, '2023-11-08');
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (5, 3, 4, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (6, 4, 3, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (7, 5, 3, '2023-11-08');
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (8, 6, 1, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (9, 6, 2, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (10, 7, 1, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (11, 8, 1, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (12, 8, 4, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (13, 9, 2, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (14, 10, 1, '2023-11-08'); 
INSERT into peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_roles_id, peopleroles_date_assigned) values (15, 10, 2, '2023-11-08'); 