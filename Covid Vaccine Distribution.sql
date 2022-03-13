DROP TABLE vaccine;
DROP TABLE distributor;
DROP TABLE demography;
DROP TABLE comp_manu;
DROP TABLE medical_info;
DROP TABLE distributions;


/*table ceate vaccine*/

CREATE TABLE vaccine(
	vac_id INT PRIMARY KEY,
	manufacturer VARCHAR(20),
	type VARCHAR(20)
);

/*Adding another column*/

ALTER TABLE vaccine ADD country VARCHAR(20);

DESCRIBE vaccine;

/*table ceate distributor*/

CREATE TABLE distributor(
	batch_id INT,
	comp_name VARCHAR(20),
	comp_id INT ,
	area_provide_zip INT PRIMARY KEY,
	FOREIGN KEY (batch_id) REFERENCES vaccine(vac_id) ON DELETE SET NULL
);

DESCRIBE distributor;

/*table ceate demography*/

CREATE TABLE demography(
	national_id_demo INT PRIMARY KEY,
	name VARCHAR(20),
	age INT,
	profession VARCHAR(20),
	freedomfighter VARCHAR(20),
	area_zip INT,
	FOREIGN KEY (area_zip) REFERENCES distributor(area_provide_zip) ON DELETE SET NULL
);

DESCRIBE demography;

/*table ceate comp_manu*/

CREATE TABLE comp_manu(
	company_name VARCHAR(20),
	manufacturer VARCHAR(20)
);
DESCRIBE comp_manu;


-- /*table ceate medical_info*/


CREATE TABLE medical_info(
	national_id_med INT,
	name VARCHAR(20),
	age INT,
	gender VARCHAR(20),
	previous_difficulties VARCHAR(20),
	possible_date DATE,
	area_code_med INT,
	FOREIGN KEY (area_code_med) REFERENCES distributor(area_provide_zip) ON DELETE SET NULL,
	FOREIGN KEY (national_id_med) REFERENCES demography(national_id_demo) ON DELETE SET NULL
);

DESCRIBE medical_info;

-- /*table ceate distributions*/

CREATE TABLE distributions(
	area_code INT,
	comp_id INT,
	population INT,
	hospital VARCHAR(20),
	possible_date DATE,
	FOREIGN KEY (area_code) REFERENCES distributor(area_provide_zip) ON DELETE CASCADE
	);

DESCRIBE distributions;



-- /*VALUE INSERTION in vaccine*/

INSERT INTO vaccine VALUES (1, 'Pfizer', 'Whole Virus', 'USA');
INSERT INTO vaccine VALUES (2, 'Sinopharm', 'Protein Submit', 'Beijing');
INSERT INTO vaccine VALUES (3, 'Astrazenca', 'Nucleic Acid', 'Oxford');

SELECT * FROM vaccine;

-- /*Row DELETION AND UPDATE*/

DELETE FROM vaccine WHERE vac_id = 4 ;

SELECT * FROM vaccine;

DELETE FROM vaccine WHERE vac_id = 5 ;

SELECT * FROM vaccine;

INSERT INTO vaccine VALUES (4, 'JohnsonAndJohnson', 'Viral Vector', 'Europe');

 SELECT * FROM vaccine;

-- /*VALUE INSERTION in distributor*/

INSERT INTO distributor VALUES (1, 'Beximco', '512', '1205');
INSERT INTO distributor VALUES (2, 'Drug International', '513', '1206');
INSERT INTO distributor VALUES (3, 'Ambee', '514', '1207');
INSERT INTO distributor VALUES (4, 'Square', '515', '1208');
INSERT INTO distributor VALUES (3, 'Dhaka Pharmacy', '517', '1210');
INSERT INTO distributor VALUES (1, 'IBN SINA', '518', '1211');	
INSERT INTO distributor VALUES (2, 'Businesspoint', '516', '1209');

SELECT * FROM distributor;

/*VALUE INSERTION in demography*/
INSERT INTO demography VALUES (1027, 'Bashar', '55', 'Worker', 'Y', 1206);
INSERT INTO demography VALUES (1028, 'Ibrahim', '20', 'Student', 'N', 1210);
INSERT INTO demography VALUES (1029, 'Khalil', '60', 'Govt. Service', 'Y', 1208);
INSERT INTO demography VALUES (1031, 'Naima', '65', 'Retd', 'Y', 1211);
INSERT INTO demography VALUES (1024, 'Rahim', '30', 'Doctor', 'N', 1211);
INSERT INTO demography VALUES (1025, 'Sultan', '45', 'Govt. Service', 'Y', 1211);
INSERT INTO demography VALUES (1026, 'Fatema', '18', 'Student', 'N', 1211);

 SELECT * FROM demography;

-- /*Creating new tables from join operation*/

-- /*Which Company will distribute which manufacturer's vaccine(Inner Join)*/

-- SELECT distributor.comp_name, distributor.comp_id, vaccine.manufacturer
-- FROM distributor
--  JOIN vaccine
-- ON distributor.batch_id = vaccine.vac_id;


-- -- /*Which Company will distribute which manufacturer's vaccine(Right Join)*/

--  SELECT distributor.comp_name, distributor.comp_id, vaccine.manufacturer
-- FROM distributor
-- RIGHT JOIN vaccine
--  ON distributor.batch_id = vaccine.vac_id;


-- -- -- /*Which Company will distribute which manufacturer's vaccine(Left Join)*/

--  SELECT distributor.comp_name, distributor.comp_id, vaccine.manufacturer
--  FROM distributor
--  LEFT JOIN vaccine
--  ON distributor.batch_id = vaccine.vac_id;

-- -- /*Which Company will distribute which manufacturer's vaccine(FULL OUTER Join)*/

--  SELECT distributor.comp_name, distributor.comp_id, vaccine.manufacturer
--  FROM distributor
--  FULL OUTER JOIN vaccine
--  ON distributor.batch_id = vaccine.vac_id;

-- /*VALUE INSERTION in medical_info*/

INSERT INTO medical_info VALUES (1027, 'Bashar', 55, 'M', 'diabetes', to_DATE('2021-05-10', 'YYYY-MM-DD'), 1206 );
INSERT INTO medical_info VALUES (1029, 'Khalil', 60, 'M', 'diabetes', to_DATE('2021-05-11', 'YYYY-MM-DD'), 1208 );
INSERT INTO medical_info VALUES (1031, 'Naima', 65, 'F', 'diabetes', to_DATE('2021-05-12', 'YYYY-MM-DD'), 1211);
INSERT INTO medical_info VALUES (1026, 'Fatema', 18, 'F', 'healthy', to_DATE('2021-05-13', 'YYYY-MM-DD'), 1207);
INSERT INTO medical_info VALUES (1024, 'Rahim', 30, 'M', 'stress', to_DATE('2021-05-14', 'YYYY-MM-DD'), 1205);
INSERT INTO medical_info VALUES (1025, 'Sultan', 45, 'M', 'healthy', to_DATE('2021-05-14', 'YYYY-MM-DD'), 1209);
INSERT INTO medical_info VALUES (1028, 'Ibrahim', 20, 'M', 'healthy', to_DATE('2021-05-11', 'YYYY-MM-DD'), 1210);

SELECT * FROM medical_info;


-- /*VALUE INSERTION in distribution*/

-- INSERT INTO distributions VALUES (1205 , 512 , 10000, 'SADAR', to_DATE('2021-05-14', 'YYYY-MM-DD'));
INSERT INTO distributions VALUES (1206 , 513 , 5000, 'Mohsin', to_DATE('2021-05-10', 'YYYY-MM-DD'));
INSERT INTO distributions VALUES (1208 , 515 , 100000, 'Ali Azgar', to_DATE('2021-05-11', 'YYYY-MM-DD'));
INSERT INTO distributions VALUES (1211 , 517 , 8000, 'SADAR', to_DATE('2021-05-12', 'YYYY-MM-DD'));
INSERT INTO distributions VALUES (1207 , 514 , 2000, 'tipu sultan', to_DATE('2021-05-13', 'YYYY-MM-DD'));
INSERT INTO distributions VALUES (1206 , 513 , 15000, 'tipu sultan', to_DATE('2021-05-10', 'YYYY-MM-DD'));
INSERT INTO distributions VALUES (1205 , 512 , 1500, 'Ali Azgar', to_DATE('2021-05-14', 'YYYY-MM-DD'));
INSERT INTO distributions VALUES (1208 , 515 , 2500, 'IBN SINA', to_DATE('2021-05-11', 'YYYY-MM-DD'));

SELECT * FROM distributions;

-- /*Aliasing and Sub queries*/

-- /*Using queries FIND ELIGIBLE CANDIDATE FROM DEMOGRAPHY TABLE*/

SELECT * 
FROM demography
WHERE age > 40 OR freedomfighter = 'Y'; 


-- /*Using queries FIND No. of DIABETIC PAITENT FROM medical_info TABLE*/

SELECT COUNT(national_id_med)
FROM medical_info
WHERE previous_difficulties = 'diabetes';

-- /*Using queries FIND the population of places from where all the healthy people are from*/

SELECT dis.population,dis.hospital
FROM distributions dis
WHERE dis.area_code IN(
	SELECT medi.area_code_med
	FROM medical_info medi
	WHERE medi.previous_difficulties = 'healthy'
);

-- /*Using queries FIND the population and hospitals of places from where all the freedomfighters are from*/

-- SELECT dis.population,dis.hospital
-- FROM distributions dis
-- WHERE dis.area_code IN(
-- 	SELECT demo.area_zip
-- 	FROM demography demo
-- 	WHERE demo.freedomfighter = 'Y'
-- );

-- /*Using queries FIND Eligible people (Doctor, 40+ age, govt service ) and their corresponding vaccine*/

-- SELECT vac.manufacturer
-- FROM vaccine vac
-- WHERE vac.vac_id IN (
-- 	SELECT dis.batch_id
-- 	FROM distributor dis
-- 	WHERE dis.area_provide_zip IN(
-- 		SELECT dem.area_zip
-- 		FROM demography dem
-- 		WHERE dem.age > 40 OR dem.profession = 'Doctor' OR dem.profession = 'Govt. Service'
-- )
-- );

-- /*Using UNIONS FIND a list of people who are aged under 40 and their gender from Demography and Medical_info */


-- SELECT dem.name
-- FROM demography dem
-- WHERE dem.national_id_demo IN (
-- 	SELECT dem.national_id_demo
-- 	FROM demography dem
-- 	WHERE dem.age >= 40
-- )
-- UNION ALL
-- SELECT me.gender
-- FROM medical_info me
-- WHERE me.age >=40;

-- /*Using UNIONS FIND a list of people their profession and their name from Demography and Medical_info */


-- SELECT profession
-- FROM demography
-- UNION
-- SELECT name
-- FROM medical_info;

-- /*Using INTERSECTION FIND a list of people who have dibetes with their profession, name, age,  from Demography and Medical_info */


-- SELECT d.name,d.age,d.profession
-- FROM demography d

-- INTERSECT

-- SELECT m.name,m.age,m.gender
-- FROM medical_info m
-- WHERE m.name IN(
-- 	SELECT m.name
-- 	FROM medical_info m
-- 	WHERE m.age >= 40
-- );


-- /*Using PLSQL Find out most aged vaccine receiver */


-- SET SERVEROUTPUT ON
-- DECLARE
-- most_aged_vaccine_receiver medical_info.age%type;
-- BEGIN
-- SELECT MAX(age) INTO most_aged_vaccine_receiver
-- FROM medical_info;
-- DBMS_OUTPUT.PUT_LINE('The Most aged Vaccine Receiver is : ' ||
-- most_aged_vaccine_receiver);
-- END;
-- /

-- /*Using PLSQL Find out most aged vaccine receiver. Just change names in paitent name from medical_info table */


-- SET SERVEROUTPUT ON
-- DECLARE
-- status medical_info.previous_difficulties%type;
-- paitent_name medical_info.name%type := 'Naima';
-- BEGIN
-- SELECT previous_difficulties INTO status
-- FROM medical_info
-- WHERE medical_info.name = paitent_name; 
-- DBMS_OUTPUT.PUT_LINE('Paitent Name : ' || paitent_name || ' Status '|| status);
-- END;
-- /


-- /*Using PLSQL Find out the total population of areas where vaccination campaign is goin to be held  */

-- SET SERVEROUTPUT ON
-- DECLARE
-- total_population distributions.population%type;
-- BEGIN
-- SELECT SUM(population) INTO total_population
-- FROM distributions;
-- DBMS_OUTPUT.PUT_LINE('Total population : ' || total_population );
-- END;
-- /

-- /*Using PLSQL and IF/ELSE Find out the AGE and VERDICT of a person who's name will be provided from user */


-- SET SERVEROUTPUT ON
-- DECLARE
-- paitent_age medical_info.age%type;
-- paitent_name medical_info.name%type;
-- verdict medical_info.gender%type;
-- BEGIN
-- paitent_name := '&paitent_name';
-- SELECT medical_info.age INTO paitent_age
-- FROM medical_info
-- WHERE medical_info.name LIKE paitent_name;
-- IF paitent_age >= 65 THEN
-- verdict := 'Most priority';
-- ELSIF paitent_age < 60 and paitent_age > 40 THEN
-- verdict := 'Priority';
-- ELSE
-- verdict := 'Later';
-- END IF;
-- DBMS_OUTPUT.PUT_LINE ( 'Paitent Name: '||paitent_name||' Paitent Age: '|| paitent_age ||' Verdict: '|| verdict );
-- EXCEPTION
-- WHEN others THEN
-- DBMS_OUTPUT.PUT_LINE ('Not Found');
-- END;
-- /

-- /*Using PLSQL and Simple Loop Find out the Area code, total population and hospital from the first 7 rows of the distribuution table */



-- SET SERVEROUTPUT ON
-- DECLARE
-- CURSOR distribution_cur IS
-- SELECT area_code, population, hospital FROM distributions;
-- dis_record distribution_cur%ROWTYPE;
-- BEGIN
-- 	OPEN distribution_cur;
-- 		LOOP
-- 		FETCH distribution_cur INTO dis_record;
-- 		EXIT WHEN distribution_cur%ROWCOUNT > 7;
-- 		DBMS_OUTPUT.PUT_LINE ('Area Code : ' || dis_record.area_code || ' Total Population ' ||
-- 		dis_record.population || ' Hospital ' || dis_record.hospital);
-- 		END LOOP;
-- 	CLOSE distribution_cur;
-- END;
-- /


-- /*Using PLSQL and WHILE Loop Find out the Area code, total population and hospital from the first 7 rows of the distribuution table */


-- SET SERVEROUTPUT ON
-- DECLARE
-- CURSOR distribution_cur IS
-- SELECT area_code, population, hospital FROM distributions;
-- dis_record distribution_cur%ROWTYPE;
-- BEGIN
-- 	OPEN distribution_cur;
-- 		WHILE distribution_cur%ROWCOUNT < 7
-- 		LOOP
-- 		FETCH distribution_cur INTO dis_record;
-- 		DBMS_OUTPUT.PUT_LINE ('Area Code : ' || dis_record.area_code || ' Total Population ' ||
-- 		dis_record.population || ' Hospital ' || dis_record.hospital);
-- 		END LOOP;
-- 	CLOSE distribution_cur;
-- END;
-- /


-- /*Using PLSQL and FOR Loop Find out the Area code, total population and hospital from the first 7 rows of the distribuution table */

-- SET SERVEROUTPUT ON
-- DECLARE
-- CURSOR distribution_cur IS
-- SELECT area_code, population, hospital FROM distributions;
-- dis_record distribution_cur%ROWTYPE;
-- BEGIN
-- 	OPEN distribution_cur;
-- 		FOR i IN 1..7
-- 		LOOP
-- 		FETCH distribution_cur INTO dis_record;
-- 		DBMS_OUTPUT.PUT_LINE ('Area Code : ' || dis_record.area_code || ' Total Population ' ||
-- 		dis_record.population || ' Hospital ' || dis_record.hospital);
-- 		END LOOP;
-- 	CLOSE distribution_cur;
-- END;
-- /


-- /*Procedures : Use procedures to find area code when you input name*/

-- SET SERVEROUTPUT ON;
-- CREATE OR REPLACE PROCEDURE getnme IS
-- paitent_name medical_info.name%type;
-- a_code medical_info.area_code_med%type;
-- BEGIN
-- paitent_name := '&paitent_name';
-- SELECT medical_info.area_code_med INTO a_code
-- FROM medical_info
-- WHERE medical_info.name = paitent_name;
-- DBMS_OUTPUT.PUT_LINE ('Name : ' ||  paitent_name || 'Area Code  : ' ||  a_code);
-- END;
-- /
-- BEGIN
-- getnme;
-- END;
-- /


-- /*Procedures : Use procedures to Insert a whole row in table - Vaccine*/



-- SET SERVEROUTPUT ON;
-- CREATE OR REPLACE PROCEDURE add_vaccine 
-- (v_id vaccine.vac_id%type,
-- manu vaccine.manufacturer%type,
-- t vaccine.type%type,
-- c vaccine.country%type) IS
-- BEGIN
-- 	INSERT INTO vaccine VALUES (v_id, manu , t, c); 	
-- DBMS_OUTPUT.PUT_LINE(' Vaccine Added ');
-- END;
-- /
-- EXECUTE add_vaccine(5, 'Pfizer2', 'Whole Virus', 'UK');





