--Select all members
SELECT * FROM members;

--Select all paid bills
SELECT * FROM bills WHERE paiddate IS NOT NULL;

--Select all members participating in weightlifting events
SELECT member_name FROM members 
JOIN participates ON members.id = participates.member_id 
JOIN events ON participates.event_id = events.id 
WHERE events.event_type = 'Weightlifting';

--Select all training sessions and their recipients given by Jason Bourne
SELECT members.member_name, pt_sessions.topic, pt_sessions.session_date, locations.location_name  FROM pt_sessions
JOIN members ON members.id = pt_sessions.member_id 
JOIN trainers ON trainers.id = pt_sessions.trainer_id 
JOIN locations ON locations.id = pt_sessions.session_location 
WHERE trainers.trainer_name = 'Jason Bourne';

--Count the types of equipment in the main gym
SELECT equipment_name, COUNT(equipment_name) FROM equipment
JOIN locations ON equipment.current_location = locations.id 
WHERE location_name = 'Main Gym'
GROUP BY equipment_name;

--Update the location of one of the treadmills to pt room 2
UPDATE equipment 
SET current_location = 3 
WHERE id = 1;