-- Sukursime duomenų bazę, kurioje bus saugoma visa svarbi informacija, reikalinga planuojant SDA veikla. 
-- Pagalvokite apie destytojus, studentus, grupes, klases, modulius ir lankomumo sąrašą. 
-- Yra keli studentai komandoje. Treneris gali mokyti vieno ar kelių modulių. Komanda gali turėti klases vienoje ar keliose klasėse. 
-- Dėl lankomumo paprastai sakome, kad studentas buvo ar nebuvo dalyvauja konkrečią dieną. 
-- Koks skirtumas tarp trenerių ir studentų? 
-- Ar mums reikia kelių lentelių jų saugojimui informacijos ar ar jos pakaktų? 
-- Jei komandą sudaro keli studentai, bet koks studentas gali priklausyti tik vienai komandai santykius, kuriuos mes naudotume? 
-- Jei modulis atstovauja treneriui, mokančiam konkrečią temą, konkrečiai komandai, konkrečioje vietoje, tarp tam tikrų datų, 
--    kaip jūs tai modeliuotumėte?

create database SDA_scheduler;
show databases;
use SDA_scheduler;


create table modules (
modulId int not null auto_increment,
startDate date not null
`endDate` date not null,
teamId int not null,
trainerId int not null,
topicId int not null,
classroomId int not null,
primary key(modulId)
constraint fk_module_classroom foreign key classroomId references classrooms (clasroomsId),
constraint fk_module_team foreign key teamId references teams (teamId),
constraint fk_module_topic foreign key topicId references topics (topicId),
constraint fk_module_trainer foreign key trainerId references persons (personId),
);

insert into modules (
	modulId,
	startDate,
    endDate,
    teamId,
    trainerId,
    topicId,
    clasroomId
)
 values 
	(1, '2020-03-02', '2020-09-02', 1, 3, 3, 2),
    (2, '2020-05-02', '2020-08-02', 2, 4, 3, 2),
    (3, '2020-03-02', '2020-09-02', 3, 6, 3, 3),
    (4, '2020-06-02', '2020-12-02', 4, 16, 3, 2),
    (5, '2020-01-02', '2020-06-02', 5, 17, 3, 2),
    (6, '2020-01-02', '2020-06-02', 6, 19, 3, 1),
  ;





create table teams (
teamsId int not null auto_increment,
`name` varchar(128) not null default '',
primary key(teamId)
);

insert into teams (
	teamId,
	`name`
)
 values 
	(1, 'Python1Gdansk'),
    (2, 'Python1Tallin'),
    (3, 'Java2Tallin'),
    (4, 'Java1Tallin'),
    (5, 'Python1Vilnius'),
    (6, 'Phyton2Vilnius')
  ;

create table classrooms (
classroomId int not null auto_increment,
`name` varchar(128) not null default '',
`address` varchar(128) not null default '',
primary key(classroomId)
);

insert into classrooms (
	clasroomId,
	`name`,
    `address`
)
 values 
	(1, 'Tallin Cozy Space', 'Talin, Estonia'),
    (2, 'VilniusSpace', 'Vilnius, Lithuania'),
    (3, 'GdanskCowork', 'Gdansk, Poland')
  ;

create table persons (
studentId int not null auto_increment,
firsName varchar(128) not null,
lastName varchar(128) not null,
phoneNumber char not null,
email varchar(128) not null,
dateOfBirdh date not null,
isTrainer tinyint not null,
teamId int not null,
primary key(studentId)
constraint fk_studentTeam foreign key(teamId) references teams(teamId),
);

insert into persons (
	personId,
	firstName,
    lastName,
    phoneNumber,
    email,
    dateOfBitdh,
    isTrainer
    teamId
)
 values 
	(1, 'Tanel', 'Kiik', '+37052084696', 't.kiik@gmail.com', '1967-12-09', 0, 2),
    (2, 'Rasa', 'Vaitiekuniene', '+37065690337','rasa.vait@gmail.com', '1988-03-19', 0, 2),
    (3, 'Jonas', 'Kreivys',  '+37060050418', 'jonas.kreivys@gmail.com', '1955-11-11', 1, 5),
    (4, 'Jonas', 'Kreivys',  '+37060050418', 'jonas.kreivys@gmail.com', '1955-11-11', 1, 6),
    (5, 'Annet', 'Kontaveit',  '+37034549213', 'annet.k@gmail.com', '1992-10-16', 0, 2),
    (6, 'Miroslav', 'Avizenis',  '+37060972750', 'miroslav.av@gmail.com', '1985-02-14', 1, 1),
	(7, 'Irja', 'Lustar',  '+37064798639', 'irja.lustar@gmail.com', '1979-04-29', 0, 4),
    (8, 'Valentin', 'Silobrit',  '+37069500333', 'valentin.silobrit@gmail.com', '1982-01-03', 0, 2),
    (9, 'Lineta', 'Puskonyte',  '+37052140370', 'lineta.p@gmail.com', '1990-05-25', 0, 5),
    (10, 'Ilja', 'Karuzis',  '+37062319800', 'i.karuzis@gmail.com', '1983-08-12', 0, 2),
    (11, 'Kristina', 'Sutkute',  '+37060781823', 'sutkute@gmail.com', '1982-10-19', 0, 6),
    (12, 'Deividas', 'Sarocka',  '+37067400603', 'deivydas.s@gmail.com', '1992-07-03', 0, 2),
    (13, 'Raimedas', 'Virsilas',  '+37062432767', 'raimedas@gmail.com', '1976-11-10', 0, 1),
    (14, 'Salvijus', 'Vosylius',  '+37064798492', 's.vosylius@gmail.com', '1989-03-01', 0, 2),
    (15, 'Katrina', 'Gelyte',  '+37062500038', 'katiusha@gmail.com', '1993-11-11', 0, 1),
    (16, 'Renata', 'Puidokaite', '+37062500069', 'renata@gmail.com', '1978-06-13', 1, 6),
    (17, 'Mantas', 'Meska',  '+37062500141', 'mantas.meska@gmail.com', '1984-01-28', 1, 2),
    (18, 'Barbara', 'Juode',  '+37062500200', 'b.juode@gmail.com', '1983-12-03', 0, 2),
    (19, 'Heiti', 'Kaal',  '+37062500292', 'heiti.kaal@gmail.com', '1975-10-08', 1, 4),
    (20, 'Heiti', 'Kaal',  '+37062500292', 'heiti.kaal@gmail.com', '1975-10-08', 1, 3)
;

create table attendances (
attendanceId int(11) not null auto_increment, -- int(x) max 11
`date` date not null,
moduleId int(11) not null, 
studentId int(11) not null,
primary key(attendanceId),
constraint fk_attendanceModule foreign key(moduleId) references modules(moduleId),
constraint fk_attendanceStudent foreign key(studentId) references students(studentId),
);

insert into attendances (
	attendanceId,
	`date`,
    moduleId,
    personId    
)
 values 
	(1, '2020-02-02' Python1Tallin, 'Tanel Kiik'),
    (2, '2020-03-12' Python1Vilnius, 'Jonas Kreivys'),
	(3, '2020-08-08' Java1Tallin, 'Irja Lustar'),
    (4, '2020-09-09' Python1Vilnius, 'Lineta Puskonyte'),
    (5, '2020-01-18' Python2TVilnius, 'Kristina Sutkute'),
    (6, '2020-02-22' Python2Tallin, 'Heiti Kaal')
;


-- List all students.

select * from persons where isTrainer = 0; 

-- List all students for team Python1Tallin.

select * from persons where isTrainer = 0; 

-- List all groups that had classes in location BucharestCowork.


-- List all groups that had classes in location Tallin Cozy Space in March 2020.


-- List all students that already finished the SQL module.


-- List all students with 100% attendance rate.


-- List all trainers that teach Java Fundamentals.


-- List all trainers that teach at BucharestCowork location.


-- List all trainers that taught students with 100% attendance rate.


-- List the trainer that taught the highest number of modules.




