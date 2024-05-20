-- A. Interaction with the Oracle server through SQL commands (DDL and DML) in PL/SQL

-- CREATE TABLES 

BEGIN 
    EXECUTE IMMEDIATE 'CREATE TABLE Airlines(
        airline_id NUMBER(3) CONSTRAINT airl_pk PRIMARY KEY,
        airline_name VARCHAR2(100),
        country VARCHAR2(20)
    )';
    
    EXECUTE IMMEDIATE 'CREATE TABLE Airplanes(
        airplane_id NUMBER(3) CONSTRAINT airpl_pk PRIMARY KEY,
        airline_id NUMBER(3) CONSTRAINT airpl_fk_airline REFERENCES Airlines(airline_id),
        airplane_capacity NUMBER(3),
        production_year NUMBER(4)
    )';
    
    EXECUTE IMMEDIATE 'CREATE TABLE Airport(
        airport_id NUMBER(2) CONSTRAINT airp_pk PRIMARY KEY,
        airline_id CONSTRAINT airp_fk_airline REFERENCES Airlines(airline_id),
        airport_name VARCHAR2(100) UNIQUE,
        airport_location VARCHAR2(100) UNIQUE,
        contact_number VARCHAR2(15)
    )';
    
    EXECUTE IMMEDIATE 'CREATE TABLE Flights(
        flight_id NUMBER(2) CONSTRAINT fli_pk PRIMARY KEY,
        airline_id NUMBER(3) CONSTRAINT fli_fk_airline REFERENCES Airlines(airline_id),
        flight_number VARCHAR2(10) NOT NULL,
        departure_airport VARCHAR2(50) NOT NULL,
        arrival_airport VARCHAR2(50) NOT NULL
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE Pilots(
        pilot_id NUMBER(2) CONSTRAINT pils_pk PRIMARY KEY,
        airline_id NUMBER(3) CONSTRAINT pils_fk1_airline REFERENCES Airlines(airline_id),
        flight_id NUMBER(2) CONSTRAINT pils_fk2_flight REFERENCES Flights(flight_id),
        pil_first_name VARCHAR2(50),
        pil_last_name VARCHAR2(50),
        gender VARCHAR2(10),
        email_address VARCHAR2(30),
        hire_date DATE
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE Flight_Attendant(
        attendant_id NUMBER(3) CONSTRAINT flatt_pk PRIMARY KEY,
        flight_id NUMBER(2) CONSTRAINT flatt_fk_flight REFERENCES Flights(flight_id),
        att_first_name VARCHAR2(50),
        att_last_name VARCHAR2(50),
        gender VARCHAR2(10),
        hire_date DATE
    )';
    
    EXECUTE IMMEDIATE 'CREATE TABLE Passengers(
        passenger_id NUMBER(3) CONSTRAINT pass_pk PRIMARY KEY,
        flight_id NUMBER(2) CONSTRAINT pass_pk_flight REFERENCES Flights(flight_id),
        passport_no VARCHAR2(5),
        pass_first_name VARCHAR2(50),
        pass_last_Name VARCHAR2(50),
        gender VARCHAR2(10)
    )';
    
    EXECUTE IMMEDIATE 'CREATE TABLE Contracts(
        contract_id NUMBER(3) CONSTRAINT contr_pk PRIMARY KEY,
        airline_id NUMBER(3) CONSTRAINT contr_fk1_airline REFERENCES Airlines(airline_id),
        airport_id NUMBER(2) CONSTRAINT contr_fk2_airport REFERENCES Airport(airport_id),
        contract_value NUMBER(8, 2),
        con_start_date DATE,
        con_end_date DATE
    )';
END;
/

-- DROP TABLES 

BEGIN 
    EXECUTE IMMEDIATE 'DROP TABLE Airlines CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Airplanes CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Airport CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Flights CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Pilots CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Flight_attendant CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Passengers CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Contracts CASCADE CONSTRAINTS';
END;
/

-- functions at the row and group level

    EXECUTE IMMEDIATE 'ALTER TABLE AIRLINES ADD (CONTINENT VARCHAR2(20))';
    EXECUTE IMMEDIATE 'UPDATE AIRLINES SET CONTINENT = ''Europe'' WHERE AIRLINE_ID IN (2, 4, 6, 8, 10, 12, 14)';

-- INSERT INTO

BEGIN 
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (1, ''Delta Airlines'', ''USA'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (2, ''British Airlines'', ''UK'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (3, ''Singapore Airlines'', ''Singapore'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (4, ''Sigma Airlines'', ''Germany'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (5, ''Pegasus Airlines'', ''Argentina'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (6, ''Kitten Airlines'', ''Hungary'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (7, ''Robin Airlines'', ''Croatia'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (8, ''Cosmos Airlines'', ''California'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (9, ''Starlight Air'', ''Indonesia'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (10, ''Swift Airlines'', ''India'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (11, ''GlobalSky Airlines'', ''Thailand'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (12, ''Celestial Airlines'', ''Montenegro'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (13, ''SunShine Airlines'', ''Zimbabwe'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (14, ''Harmony Airways'', ''Sudan'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (15, ''Hoyoverse Airlines'', ''Armenia'')';

    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (1, 1, 150, 2010)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (2, 2, 190, 2009)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (3, 3, 300, 2020)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (4, 4, 250, 2019)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (5, 5, 275, 2021)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (6, 6, 290, 2022)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (7, 7, 200, 2018)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (8, 8, 170, 2016)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (9, 9, 230, 2014)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (10, 10, 200, 2023)';

    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (1, ''San Francisco'', ''San Francisco Internation Airport'', ''(555) 555-1234'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (2, ''London'', ''London Stansted Airport'', ''44 20 7123 4567'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (3, ''Seletar'', ''Seletar Airport'', ''+65 9123 4567'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (4, ''Frankfurt'', ''Diamond Skyport'', ''+49 69 1234 567'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (5, ''Buenos Aires'', ''Grand Lotus Skyport'', ''+54 11 2345 678'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (6, ''Budapest'', ''Emerald City Airport'', ''+36 1 234 5678'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (7, ''Ljubljana'', ''Golden Gate Airport'', ''+386 1 234 5678'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (8, ''Los Angeles'', ''Sunset Vista Airport'', ''+1 213 555 1234'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (9, ''Jakarta'', ''Radiant Skies Airport'', ''+62 21 9876 543'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (10, ''New Delhi'', ''Crimson Sky Airport'', ''+91 11 8765 432'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (11, ''Bangkok'', ''Tango Skyport'', ''+66 2 3456 7890'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (12, ''Podgorica'', ''Golden Template Skyport'', ''+382 20 123 456'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (13, ''Harare'', ''Emerald Palace Skyway'', ''+263 4 123 4567'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (14, ''Khartoum'', ''Coral Cove International Airport'', ''+249 183 123 45'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (15, ''Yerevan'', ''Phoenix Rising Airport'', ''+374 10 123456'')';
    
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (1, 1, ''AB123'', ''SFIA'', ''CSA'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (2, 2, ''ABC12'', ''RSA'', ''EPS'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (3, 3, ''ABB34'', ''CCIA'', ''TS'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (4, 4, ''DL334'', ''ECA'', ''PRA'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (5, 5, ''FF555'', ''LSA'', ''SFIA'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (6, 6, ''LLO00'', ''GGA'', ''GLS'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (7, 7, ''PA113'', ''DS'', ''SVA'')'; 
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (8, 8, ''TT455'', ''CCIA'', ''SA'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (9, 9, ''HH887'', ''TS'', ''LSA'')';
    EXECUTE IMMEDIATE 'INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (10, 10, ''AR334'', ''GTS'', ''PRA'')';

    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (1, 1, 1, ''Harlan'', ''Peck'', ''Male'', ''harlanpeck@gmail.com'', TO_DATE(''15/04/2016'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (2, 2, 2, ''Cecile'', ''Miranda'', ''Female'', ''cecilemiranda@gmail.com'', TO_DATE(''22/09/2020'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (3, 3, 3, ''Jake'', ''Parker'', ''Male'', ''jakeparker@gmail.com'', TO_DATE(''31/03/2019'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (4, 4, 4, ''Wilbert'', ''Bowman'', ''Male'', ''wilbertbowman@gmail.com'', TO_DATE(''18/07/2010'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (5, 5, 5, ''Margie'', ''Baxter'', ''Female'', ''margiebaxter@yahoo.com'', TO_DATE(''08/09/2023'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (6, 6, 6, ''Bertie'', ''Shea'', ''Female'', ''bertieshea@yahoo.com'', TO_DATE(''23/01/2017'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (7, 7, 7, ''Rodrick'', ''Delago'', ''Male'', ''rodrickdelago@gmail.com'', TO_DATE(''26/05/2020'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (8, 8, 8, ''Garfield'', ''Costa'', ''Male'', ''garfieldcosta@gmail.com'', TO_DATE(''06/05/2014'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (9, 9, 9, ''Lisa'', ''Bartlett'', ''Female'', ''lisabartlett@yahoo.com'', TO_DATE(''14/11/2022'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (10, 10, 10, ''Margey'', ''Casey'', ''Female'', ''margeycasey@gmail.com'', TO_DATE(''01/06/2020'', ''DD-MM-YYYY''))';

    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (1, ''Nicky'', ''Mcdowell'', ''Male'', TO_DATE(''12/05/2019'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (2, ''Draghici'', ''Alexandru-Gabriel'', ''Male'', TO_DATE(''12/06/2022'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (3, ''Jeremy'', ''Strong'', ''Male'', TO_DATE(''22/09/2020'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (4, ''Katina'', ''Coleman'', ''Female'', TO_DATE(''11/01/2023'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (5, ''Keith'', ''Webb'', ''Female'', TO_DATE(''27/04/2019'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (6, ''Valentina'', ''Rother'', ''Female'', TO_DATE(''03/05/2023'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (7, ''Monica'', ''Slabu'', ''Female'', TO_DATE(''05/09/2016'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (8, ''Alberto'', ''Dima'', ''Male'', TO_DATE(''17/10/2019'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (9, ''Sabina'', ''Foster'', ''Female'', TO_DATE(''11/10/2018'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (10, ''Carlos'', ''Oliveira'', ''Male'', TO_DATE(''04/10/2021'', ''DD-MM-YYYY''))';

    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (1, 1, 12345, ''Bruno'', ''Wood'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (2, 2, 55134, ''Taylor'', ''Sims'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (3, 3, 12980, ''Julius'', ''Mills'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (4, 4, 09412, ''Keith'', ''Davila'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (5, 5, 16485, ''Florencio'', ''Love'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (6, 6, 65645, ''Nestor'', ''Kelly'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (7, 7, 64332, ''Lila'', ''Lin'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (8, 8, 09312, ''Donnie'', ''Hill'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (9, 9, 89457, ''Markus'', ''Rose'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (10, 10, 65624, ''Wilfred'', ''Salas'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (11, 5, 76543, ''Elinor'', ''Vaughan'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (12, 1, 21341, ''Gordon'', ''Zimmerman'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (13, 2, 12345, ''Dimulescu'', ''Matei'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (14, 8, 10239, ''Dimitrescu'', ''Alcina'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (15, 9, 11122, ''Khada'', ''Jhin'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (16, 3, 77534, ''Ada'', ''Wong'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (17, 4, 00192, ''Satoru'', ''Gojo'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (18, 6, 99932, ''Suguru'', ''Geto'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (19, 7, 77532, ''Ioana'', ''Monalisa'', ''Female'')';    
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (20, 4, 81923, ''Jica'', ''Stefan'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (21, 1, 45234, ''Liam'', ''Rodriguez'', ''Male'')';  
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (22, 8, 87685, ''Olivia'', ''Brown'', ''Female'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (23, 7, 54212, ''Ethan'', ''Winters'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (24, 10, 00129, ''Chris'', ''Redfield'', ''Male'')';
    EXECUTE IMMEDIATE 'INSERT INTO Passengers (passenger_id, flight_id, passport_no, pass_first_name, pass_last_name, gender) VALUES (25, 10, 54452, ''Claire'', ''Redfield'', ''Female'')';

    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (1, 1, 1, 150000.50, TO_DATE(''15/03/2023'', ''DD-MM-YYYY''), TO_DATE(''15/03/2028'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (2, 2, 2, 180000.25, TO_DATE(''28/09/2022'', ''DD-MM-YYYY''), TO_DATE(''28/09/2027'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (3, 3, 3, 200000.20, TO_DATE(''12/06/2020'', ''DD-MM-YYYY''), TO_DATE(''12/06/2030'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (4, 4, 4, 100000.50, TO_DATE(''24/12/2017'', ''DD-MM-YYYY''), TO_DATE(''24/12/2024'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (5, 5, 5, 175000.75, TO_DATE(''18/12/2011'', ''DD-MM-YYYY''), TO_DATE(''18/12/2023'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (6, 6, 6, 210000.12, TO_DATE(''31/01/2015'', ''DD-MM-YYYY''), TO_DATE(''31/01/2025'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (7, 7, 7, 130000.30, TO_DATE(''19/07/2021'', ''DD-MM-YYYY''), TO_DATE(''19/07/2031'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (8, 8, 8, 162500.20, TO_DATE(''18/04/2024'', ''DD-MM-YYYY''), TO_DATE(''18/04/2029'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (9, 9, 9, 112000.12, TO_DATE(''07/08/2019'', ''DD-MM-YYYY''), TO_DATE(''07/08/2026'', ''DD-MM-YYYY''))';
    EXECUTE IMMEDIATE 'INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (10, 10, 10, 212000.21, TO_DATE(''10/09/2010'', ''DD-MM-YYYY''), TO_DATE(''10/09/2025'', ''DD-MM-YYYY''))';

END;
/

-- B. Alternative and repetitive structures 

-- IF 
-- Count the passengers on the flight

DECLARE 
    V_PASSENGERS_COUNT NUMBER;
BEGIN   
    SELECT COUNT(*) INTO V_PASSENGERS_COUNT FROM PASSENGERS WHERE FLIGHT_ID = 1;

    IF V_PASSENGERS_COUNT > 10 THEN
        DBMS_OUTPUT.PUT_LINE('The airplane on flight ABC123 is almost full.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('The airplane on flight ABC123 is not occupied.');
    END IF;
END;
/

-- Check which flight attendant is on the plane

DECLARE 
    V_FLATT FLIGHT_ATTENDANT.ATT_FIRST_NAME%TYPE;
BEGIN
    SELECT ATT_FIRST_NAME INTO V_FLATT FROM FLIGHT_ATTENDANT WHERE ATTENDANT_ID = 2;
    IF V_FLATT = 'Draghici' THEN
        DBMS_OUTPUT.PUT_LINE('The airplane will crash');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The airplane wont crash');
    END IF;
END;
    /
    
-- Check if the plane is new or not

DECLARE 
    V_AIRPLANE_CAPACITY NUMBER;
BEGIN
    SELECT AIRPLANE_CAPACITY INTO V_AIRPLANE_CAPACITY FROM AIRPLANES WHERE AIRPLANE_ID = 8;
    IF V_AIRPLANE_CAPACITY < 200 THEN
        DBMS_OUTPUT.PUT_LINE('The airplane has been bought recently');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The airplane has been bought years ago');
    END IF;
END;
/
    
-- CASE
-- Case to represent if flight attendant is on board

DECLARE    
    V_ON_BOARD CHAR(10) := 'ON BOARD';
    STATUS VARCHAR2(50);
BEGIN
    STATUS :=
        CASE V_ON_BOARD
            WHEN 'ON BOARD' THEN 'PRESENT'
            WHEN 'NOT ON BOARD' THEN 'NOT PRESENT'
            ELSE 'UNKOWN STATUS'
        END;
    DBMS_OUTPUT.PUT_LINE('Flight attendant ' || V_ON_BOARD || ' is ' || STATUS );
END;
/

-- Case to see flights activity
    
DECLARE    
    V_STATUS FLIGHTS.FLIGHT_NUMBER%TYPE := 'FF555';
    AIRING VARCHAR2(50);
BEGIN
    AIRING :=
        CASE V_STATUS
            WHEN 'ABC123' THEN 'ARRIVING ON TIME'
            WHEN 'ABB34' THEN 'FLIGHT DELAYED'
            WHEN 'FF555' THEN 'DELAYED FOR 5 MINUTES'
            ELSE 'UNKNOWN STATUS'
        END;
    DBMS_OUTPUT.PUT_LINE('The flight ' || V_STATUS || ' is ' || AIRING);
END;
/   

-- FOR LOOP
--Create a log of pilots assigned to flights and store it in a new table.
    
DECLARE
    V_PILOT_ID PILOTS.PILOT_ID%TYPE;
    V_PILOT_NAME PILOTS.PIL_FIRST_NAME%TYPE;
    V_PILOT_LAST_NAME PILOTS.PIL_LAST_NAME%TYPE;
    V_AIRLINE_ID PILOTS.AIRLINE_ID%TYPE;
BEGIN
    FOR PILOT_ON_FLIGHT IN(SELECT P.PIL_FIRST_NAME, P.PIL_LAST_NAME AS PILOT_NAME, P.AIRLINE_ID FROM PILOTS P
        JOIN AIRLINES A ON P.AIRLINE_ID = A.AIRLINE_ID) LOOP
    DBMS_OUTPUT.PUT_LINE('The pilot: '|| PILOT_ON_FLIGHT.PILOT_NAME || 'is on airline: ' || PILOT_ON_FLIGHT.AIRLINE_ID);
    END LOOP;
END;
/

-- WHILE LOOP
-- Display the flights with the number of passengers on the flight is greater than the avg number on all flights

DECLARE
    V_PASS_AVG NUMBER;
    V_FLIGHT_ID FLIGHTS.FLIGHT_ID%TYPE;
    V_FLIGHT_NUMBER FLIGHTS.FLIGHT_NUMBER%TYPE;
    V_PASS_COUNT NUMBER;
BEGIN
    SELECT AVG(PASS_COUNT) INTO V_PASS_AVG FROM (SELECT COUNT(*) AS PASS_COUNT FROM PASSENGERS GROUP BY FLIGHT_ID);
    V_FLIGHT_ID := 1;
    WHILE V_FLIGHT_ID < 5 LOOP
        SELECT COUNT(*) INTO V_PASS_COUNT FROM PASSENGERS WHERE FLIGHT_ID = V_FLIGHT_ID;
        IF V_PASS_COUNT > V_PASS_AVG THEN
        SELECT FLIGHT_NUMBER INTO V_FLIGHT_NUMBER FROM FLIGHTS WHERE FLIGHT_ID = V_FLIGHT_ID;
        DBMS_OUTPUT.PUT_LINE('Flight ' || V_FLIGHT_NUMBER || ' has ' || V_PASS_COUNT || ' passengers');
        END IF;
    V_FLIGHT_ID := V_FLIGHT_ID + 1;
    END LOOP;
END;
/

-- C. DATA COLLECTIONS 

-- INDEX BY TABLE 
-- Display the airlines that go in Europe with index table

DECLARE
    TYPE AIRLINE_INF IS TABLE OF AIRLINES%ROWTYPE INDEX BY PLS_INTEGER;
    V_AIRLINE_INF AIRLINE_INF;
    V_INDEX PLS_INTEGER := 1;
BEGIN
    FOR AIRLINE_CONTINENT IN (SELECT * FROM AIRLINES WHERE CONTINENT = 'Europe') LOOP
    V_AIRLINE_INF(V_INDEX) := AIRLINE_CONTINENT;
    V_INDEX := V_INDEX + 1;
    END LOOP;
    
    FOR I IN 1..V_INDEX - 1 LOOP
    DBMS_OUTPUT.PUT_LINE('The airlines going in Europe are: '|| V_AIRLINE_INF(I).AIRLINE_ID || ' ' || V_AIRLINE_INF(I).AIRLINE_NAME);
    END LOOP;
END;
/

-- NESTED TABLE 
-- Display all passengers name with a nested table

DECLARE 
    CURSOR P_PASSENGERS IS 
        SELECT PASS_FIRST_NAME, PASS_LAST_NAME FROM PASSENGERS;
    TYPE PASSENGER_NAMES IS TABLE OF P_PASSENGERS%ROWTYPE;
    V_PASSENGER_NAMES PASSENGER_NAMES := PASSENGER_NAMES();
BEGIN
    OPEN P_PASSENGERS;
    FETCH P_PASSENGERS BULK COLLECT INTO V_PASSENGER_NAMES;
    CLOSE P_PASSENGERS;
    
    FOR I IN 1..V_PASSENGER_NAMES.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Passenger name: ' || V_PASSENGER_NAMES(I).PASS_FIRST_NAME || ' ' || V_PASSENGER_NAMES(I).PASS_LAST_NAME);
    END LOOP;
END;
/

-- VARRAY 
-- Display the value of each contract ussing varray

DECLARE 
    CURSOR C_VALUE IS SELECT CONTRACT_VALUE FROM CONTRACTS;
    TYPE CONTRACT_VALUES IS VARRAY(10) OF CONTRACTS.CONTRACT_VALUE%TYPE;
    V_CONTRACT_VALUES CONTRACT_VALUES := CONTRACT_VALUES();
BEGIN
    OPEN C_VALUE;
    FETCH C_VALUE BULK COLLECT INTO V_CONTRACT_VALUES;
    CLOSE C_VALUE;
    
    FOR I IN 1..V_CONTRACT_VALUES.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('The value of contract ' || I || ' is: ' || V_CONTRACT_VALUES(I));
    END LOOP;    
END;
/

-- D. Exception handling (minimum 3 implicit, 2 explicit).

-- IMPLICIT
-- Display the airport with the location in Poland 

DECLARE
    V_AIRPORT_ID AIRPORT.AIRPORT_ID%TYPE;
    V_AIRPORT_LOCATION AIRPORT.AIRPORT_LOCATION%TYPE := 'Poland';   
    V_AIRPORT_NAME AIRPORT.AIRPORT_NAME%TYPE;
BEGIN
    SELECT AIRPORT_ID, AIRPORT_NAME INTO V_AIRPORT_ID, V_AIRPORT_NAME FROM AIRPORT WHERE AIRPORT_LOCATION = V_AIRPORT_LOCATION;
    DBMS_OUTPUT.PUT_LINE('The airport ' || V_AIRPORT_ID || ' ' || 'is located in: ' || V_AIRPORT_LOCATION);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('The airport with the location in ' || V_AIRPORT_LOCATION || ' does not exist in this database');
END;
/

-- Display the flight attendant and hire date and display error if cursor is already open

DECLARE
    CURSOR C_FLIGHT_ATT IS SELECT ATTENDANT_ID, ATT_FIRST_NAME, ATT_LAST_NAME, HIRE_DATE FROM FLIGHT_ATTENDANT;
    V_ATTENDANT_ID FLIGHT_ATTENDANT.ATTENDANT_ID%TYPE;
    V_ATT_FIRST_NAME FLIGHT_ATTENDANT.ATT_FIRST_NAME%TYPE;
    V_ATT_LAST_NAME FLIGHT_ATTENDANT.ATT_LAST_NAME%TYPE;
    V_HIRE_DATE FLIGHT_ATTENDANT.HIRE_DATE%TYPE;
BEGIN
    OPEN C_FLIGHT_ATT;
    FETCH C_FLIGHT_ATT INTO V_ATTENDANT_ID, V_ATT_FIRST_NAME, V_ATT_LAST_NAME, V_HIRE_DATE; 
    DBMS_OUTPUT.PUT_LINE(V_ATTENDANT_ID || ' Flight Attendant - ' || V_ATT_FIRST_NAME || ' ' || V_ATT_LAST_NAME || ' was hired on: ' || V_HIRE_DATE); 
    OPEN C_FLIGHT_ATT;
EXCEPTION
    WHEN CURSOR_ALREADY_OPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is already open');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error ' || SQLERRM); 
END;
/

-- Display on what flight are pilots on and give exception if too many rows

DECLARE
    V_PILOT_ID PILOTS.PILOT_ID%TYPE;
    V_FIRST_NAME PILOTS.PIL_FIRST_NAME%TYPE;
    V_LAST_NAME PILOTS.PIL_LAST_NAME%TYPE;
    V_FLIGHT FLIGHTS.FLIGHT_NUMBER%TYPE;
BEGIN
    SELECT P.PILOT_ID, P.PIL_FIRST_NAME, P.PIL_LAST_NAME, F.FLIGHT_NUMBER INTO V_PILOT_ID, V_FIRST_NAME, V_LAST_NAME, V_FLIGHT 
    FROM PILOTS P JOIN FLIGHTS F ON P.FLIGHT_ID = F.FLIGHT_ID 
    WHERE P.PILOT_ID = 1;
    DBMS_OUTPUT.PUT_LINE('Pilot ' || V_FIRST_NAME || ' ' || V_LAST_NAME || 'with the ID: ' || V_PILOT_ID || ' is on flight - ' || V_FLIGHT);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows for pilot 1');
END;
/

-- EXPLICIT 
-- Add new contract, if it exceeds the value of 2500 EUR add exception 

DECLARE 
    V_CONTRACT_ID CONTRACTS.CONTRACT_ID%TYPE := 11;
    V_AIRLINE_ID CONTRACTS.AIRLINE_ID%TYPE := 11;
    V_AIRPORT_ID CONTRACTS.AIRPORT_ID%TYPE := 11;
    V_VALUE CONTRACTS.CONTRACT_VALUE%TYPE := 2350.00;
    E_EXCEPTION_G EXCEPTION;
BEGIN
    IF V_VALUE > 2500 THEN
        RAISE E_EXCEPTION_G;
    END IF;
    INSERT INTO CONTRACTS (CONTRACT_ID, AIRLINE_ID, AIRPORT_ID, CONTRACT_VALUE) VALUES (V_CONTRACT_ID, V_AIRLINE_ID, V_AIRPORT_ID, V_VALUE);
EXCEPTION
    WHEN E_EXCEPTION_G THEN
        DBMS_OUTPUT.PUT_LINE('The contract ' || V_CONTRACT_ID || ' exceeds the value of 2500');
END;
/

-- Update the flight attendant with id 11 throw exception if it does not exist

DECLARE 
    V_ATTENDANT_ID FLIGHT_ATTENDANT.ATTENDANT_ID%TYPE := 11;
    V_FIRST_NAME FLIGHT_ATTENDANT.ATT_FIRST_NAME%TYPE := 'Eric';
    V_LAST_NAME FLIGHT_ATTENDANT.ATT_LAST_NAME%TYPE := 'Gepard';
    V_HIRE_DATE FLIGHT_ATTENDANT.HIRE_DATE%TYPE := '06/05/2024';
    E_EXCEPTION_F EXCEPTION;
BEGIN
    UPDATE FLIGHT_ATTENDANT SET ATT_FIRST_NAME = V_FIRST_NAME, ATT_LAST_NAME = V_LAST_NAME, HIRE_DATE = V_HIRE_DATE
    WHERE ATTENDANT_ID = V_ATTENDANT_ID;
    IF SQL%NOTFOUND THEN
        RAISE E_EXCEPTION_F;
    END IF;
EXCEPTION
    WHEN E_EXCEPTION_F THEN
        DBMS_OUTPUT.PUT_LINE('Flight attendant ' || V_ATTENDANT_ID || ' does not exist');
END;
/

-- E. Cursor management 

-- IMPLICIT CURSOR 
-- Display the airplane with the id 20 if it does not exist throw exception 

DECLARE
    V_AIRPORT_ID AIRPORT.AIRPORT_ID%TYPE := 20;
    V_AIRPORT_NAME AIRPORT.AIRPORT_NAME%TYPE; 
BEGIN
    SELECT AIRPORT_NAME INTO V_AIRPORT_NAME FROM AIRPORT WHERE AIRPORT_ID = V_AIRPORT_ID;
    DBMS_OUTPUT.PUT_LINE('Airport name is: ' || V_AIRPORT_NAME);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Airport does not exist');
END;
/

-- Update flight number and display error if not found

BEGIN   
    UPDATE FLIGHTS SET FLIGHT_NUMBER = 'MN175' WHERE FLIGHT_NUMBER = 'LLO00';
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('The flight number LLO00 doesnt exist');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('The flight number LLO00 has been replaced by MN175');
    END IF;
END;
/

-- EXPLICIT CURSOR 
-- Cursor to update production year with FOR UPDATE 

DECLARE
    CURSOR C_AIRPLANES IS SELECT PRODUCTION_YEAR FROM AIRPLANES WHERE AIRPLANE_ID = 6 FOR UPDATE;
    V_INITIAL_PRODUCTION_YEAR AIRPLANES.PRODUCTION_YEAR%TYPE;
    V_NEW_PRODUCTION_YEAR AIRPLANES.PRODUCTION_YEAR%TYPE := 2024;
BEGIN
    OPEN C_AIRPLANES;
    FETCH C_AIRPLANES INTO V_INITIAL_PRODUCTION_YEAR;
    UPDATE AIRPLANES SET PRODUCTION_YEAR = V_NEW_PRODUCTION_YEAR WHERE CURRENT OF C_AIRPLANES;
    CLOSE C_AIRPLANES;
    DBMS_OUTPUT.PUT_LINE('Airplane with ID 6 has been produced in ' || V_NEW_PRODUCTION_YEAR || ' not ' || V_INITIAL_PRODUCTION_YEAR);
END;
/

-- Display the pilots that are males 

DECLARE 
    CURSOR P_PILOTS IS SELECT PIL_FIRST_NAME, PIL_LAST_NAME, GENDER FROM PILOTS;
BEGIN
    FOR I IN P_PILOTS LOOP
        IF I.GENDER = 'Male' THEN
            DBMS_OUTPUT.PUT_LINE('The pilot - ' || I.PIL_FIRST_NAME || ' ' || I.PIL_LAST_NAME || ' is ' || I.GENDER);
        END IF;
    END LOOP;
END;
/

-- F. Functions, procedures, inclusion in packages 

-- 3 Functions 
-- 1. Return the number of passengers on flight

CREATE OR REPLACE FUNCTION TOTAL_PASS (P_FLIGHT_ID IN FLIGHTS.FLIGHT_ID%TYPE) RETURN NUMBER IS 
V_TOTAL_PASSENGERS NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_TOTAL_PASSENGERS FROM PASSENGERS WHERE FLIGHT_ID = P_FLIGHT_ID;
    RETURN V_TOTAL_PASSENGERS;
END;
/

SELECT TOTAL_PASS(1) /*AS TOTAL_PASSENGERS*/ FROM DUAL;

-- 2. Return the average value of contracts

CREATE OR REPLACE FUNCTION GET_AVG RETURN NUMBER IS 
V_AVG NUMBER;
BEGIN
    SELECT AVG(CONTRACT_VALUE) INTO V_AVG FROM CONTRACTS;
    RETURN V_AVG;
END;
/

SELECT GET_AVG FROM DUAL;
-- SELECT GET_AVG() AS AVG_CONTRACT_VALUE FROM DUAL;

-- 3. Display the number of female passengers on flight

CREATE OR REPLACE FUNCTION FEM_PASS RETURN NUMBER IS 
V_FEMALES NUMBER;
BEGIN 
    SELECT COUNT(*) INTO V_FEMALES FROM PASSENGERS WHERE GENDER = 'Female';
    RETURN V_FEMALES;
END;
/

SELECT FEM_PASS FROM DUAL;

-- 3 Procedures
-- 1. Display passengers list on flight id 1 

CREATE OR REPLACE PROCEDURE PASSENGER_LIST (P_FLIGHT_ID IN PASSENGERS.FLIGHT_ID%TYPE) AS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('These are the passengers of flight ' || P_FLIGHT_ID);
    FOR PASS_LIST IN (SELECT PASS_FIRST_NAME, PASS_LAST_NAME, PASSPORT_NO FROM PASSENGERS WHERE FLIGHT_ID = PASSENGER_LIST.P_FLIGHT_ID) LOOP
        DBMS_OUTPUT.PUT_LINE('Passenger - ' || PASS_LIST.PASS_FIRST_NAME || ' ' || PASS_LIST.PASS_LAST_NAME || ' - ' || PASS_LIST.PASSPORT_NO);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('There are no passengers on this flight');
END;
/

BEGIN
    PASSENGER_LIST(1);
END;
/
    
-- 2.

-- 3.
    
-- Package including different functions and procedures

-- G. Triggers at statement and row level
