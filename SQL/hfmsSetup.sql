CREATE TABLE members
	(id 		SERIAL,
	 email 			TEXT 	UNIQUE NOT NULL,
	 passwd 		TEXT 	NOT NULL,
	 member_name 	TEXT 	NOT NULL,
	 points 		INTEGER,
	 PRIMARY KEY (id)
	);

CREATE TABLE fitness_goals
	(member_id 	INTEGER,
	 goal 		TEXT 		UNIQUE NOT NULL,
	 progress 	TEXT,
	 target		TEXT		NOT NULL,
	 FOREIGN KEY (member_id) REFERENCES members
	);
	
CREATE TABLE health_metrics
	(member_id		INTEGER,
	 metric_type 	TEXT 		NOT NULL,
	 value			TEXT		NOT NULL,
	 FOREIGN KEY (member_id) REFERENCES members
	);
	
CREATE TABLE locations 
	(id 			SERIAL,
	 location_name	TEXT UNIQUE NOT NULL,
	 PRIMARY KEY (id)
	);
	
CREATE TABLE events
	(id				SERIAL,
	 event_name		TEXT		NOT NULL,
	 event_type		TEXT		NOT NULL,
	 event_date		DATE		NOT NULL,
	 event_location INTEGER,
	 PRIMARY KEY (id),
	 FOREIGN KEY (event_location) REFERENCES locations
	);

CREATE TABLE participates
	(member_id	INTEGER,
	 event_id	INTEGER,
	 FOREIGN KEY (member_id) REFERENCES members,
	 FOREIGN KEY (event_id) REFERENCES events
	);

CREATE TABLE bills
	(id			SERIAL,
	 paidBy		INTEGER,
	 paidFor	TEXT 			NOT NULL,
	 amount		DECIMAL(15,2)	NOT NULL,
	 paidDate	DATE,
	 PRIMARY KEY (id),
	 FOREIGN KEY (paidBy) REFERENCES members
	);

CREATE TABLE trainers
	(id 	SERIAL,
	 trainer_name	TEXT	NOT NULL,
	 email			TEXT 	UNIQUE NOT NULL,
	 passwd			TEXT	NOT NULL,
	 PRIMARY KEY (id)
	);

CREATE TABLE pt_sessions
	(member_id			INTEGER,
	 trainer_id 		INTEGER,
	 topic 				TEXT	NOT NULL,
	 session_date		DATE	NOT NULL,
	 notes				TEXT,
	 session_location	INTEGER,
	 FOREIGN KEY (member_id) REFERENCES members,
	 FOREIGN KEY (trainer_id) REFERENCES trainers,
	 FOREIGN KEY (session_location) REFERENCES locations
	);

CREATE TABLE equipment 
	(id					SERIAL,
	 current_location	INTEGER,
	 equipment_name		TEXT	NOT NULL,
	 PRIMARY KEY (id),
	 FOREIGN KEY (current_location) REFERENCES locations
	);

CREATE TABLE staff
	(id				SERIAL,
	 staff_name		TEXT 	NOT NULL,
	 email			TEXT 	UNIQUE NOT NULL,
	 passwd			TEXT 	NOT NULL,
	 staff_role		TEXT 	NOT NULL,
	 PRIMARY KEY (id)
	);
	

INSERT INTO members (email, passwd, member_name, points) VALUES 
	('johndoe@example.com', 'passwd1', 'John Doe', 125),
	('janesmith@example.com', 'passwd1', 'Jane Smith', 254),
	('chrisli@example.com', 'passwd3', 'Chris Li', 100);
	
INSERT INTO fitness_goals (member_id, goal, progress, target) VALUES 
	(1, 'Pushups 8', '150', '200'),
	(2, 'Running 1', '2.5km', '5km'),
	(3, 'Swimming 3', '20 laps', '30 laps');

INSERT INTO health_metrics (member_id, metric_type, value) VALUES 
	(1, 'Peak Heart Rate', '120bpm'),
	(2, 'Blood Pressure', '120/80 mmHg'),
	(3, 'BMI', '23');

INSERT INTO locations (location_name) VALUES
	('Main Gym'),
	('Training Room 1'),
	('Training Room 2'),
	('Pool Building'),
	('Admin HQ');

INSERT INTO events (event_name, event_type, event_date, event_location) VALUES 
	('Deadlift Competition', 'Weightlifting', '2023-07-10', 1),
	('Free Swim', 'Swimming', '2023-07-15', 4);

INSERT INTO participates (member_id, event_id) VALUES 
	(1, 1),
	(2, 1),
	(3, 2);

INSERT INTO bills (paidBy, paidFor, amount, paidDate) VALUES
	(1, 'Membership Fee', 20.00, '2023-07-03'),
	(2, 'PT Session', 200.00, '2023-07-07'),
	(3, 'Damaged Equipment Bill', 35.00, NULL);

INSERT INTO trainers (trainer_name, email, passwd) VALUES 
	('Jason Bourne', 'jasonbourne@gym.com', 'passwd2'),
	('Chuck Schuldiner', 'chuckschuldiner@gym.com', 'passwd1');

INSERT INTO pt_sessions (member_id, trainer_id, topic, session_date, notes, session_location) VALUES 
	(1, 1, 'Weightlifting', '2023-07-09', NULL, 2),
	(2, 1, 'Weightlifting', '2023-07-01', 'Great Progress.', 2),
	(3, 2, 'Breathing Techniques', '2023-06-29', 'Good Start!', 3);

INSERT INTO equipment (current_location, equipment_name) VALUES 
	(1, 'Treadmill'),
	(1, 'Treadmill'),
	(2, 'Barbell'),
	(1, 'Dumbell Rack');

INSERT INTO staff (staff_name, email, passwd, staff_role) VALUES 
	('Juan GymOwner', 'bigboss@example.com', 'passwd10', 'CEO'),
	('Jason Smith', 'jasonsmith@example.com', 'passwd1', 'Maintainence'),
	('George Constanza', 'georgeconstanza@example.com', 'passwd4', 'Maintainence');

