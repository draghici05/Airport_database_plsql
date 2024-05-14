-- A. DDL and DML commands in PL/SQL

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
        airline_id NUMBER(3) CONSTRAINT pils_fk_airline REFERENCES Airlines(airline_id),
        flight_id NUMBER(2) CONSTRAINT pils_fk_flight REFERENCES Flights(flight_id),
        pil_first_name VARCHAR2(50),
        pil_last_name VARCHAR2(50),
        gender VARCHAR2(10),
        email_adress VARCHAR2(30),
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
        airline_id NUMBER(3) CONSTRAINT contr_fk_airline REFERENCES Airlines(airline_id),
        airport_id NUMBER(2) CONSTRAINT contr_fk_airport REFERENCES Airport(airport_id),
        contract_value NUMBER(8, 2),
        con_start_date DATE,
        con_end_date DATE
    )';
END;
/

-- INSERT INTO
BEGIN 
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (1, ''Delta Airlines'', ''USA'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (2, ''British Airlines'', ''UK'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (3, ''Singapore Airlines'', ''Singapore'')';
    EXECUTE IMMEDIATE 'INSERT INTO Airlines (airline_id, airline_name, country) VALUES (4, ''Sigma Airlines'', ''Germany'');
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

    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (1, 1, 150, 20, 10)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (2, 2, 190, 2009)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (3, 3, 300, 2020)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (4, 4, 250, 2019)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (5, 5, 275, 2021)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (6, 6, 290, 2022)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (7, 7, 200, 2018)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (8, 8, 170, 2016)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (9, 9, 230, 2014)';
    EXECUTE IMMEDIATE 'INSERT INTO Airplanes (airplane_id, airline_id, airplane_capacity, production_year) VALUES (10, 10, 200, 2023)';

    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (1,'San Francisco', 'San Francisco Internation Airport', '(555) 555-1234)')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (2, 'London', 'London Stansted Airport', '44 20 7123 4567')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (3, 'Seletar', 'Seletar Airport', '+65 9123 4567')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (4, 'Frankfurt', 'Diamond Skyport', '+49 69 1234 567')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (5, 'Buenos Aires', 'Grand Lotus Skyport', '+54 11 2345 678')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (6, 'Budapest', 'Emerald City Airport', '+36 1 234 5678')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (7, 'Ljubljana', 'Golden Gate Airport', '+386 1 234 5678')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (8, 'Los Angeles', 'Sunset Vista Airport', '+1 213 555 1234')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (9, 'Jakarta', 'Radiant Skies Airport', '+62 21 9876 543')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (10, 'New Delhi', 'Crimson Sky Airport', '+91 11 8765 432')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (11, 'Bangkok', 'Tango Skyport', '+66 2 3456 7890')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (12, 'Podgorica', 'Golden Template Skyport', '+382 20 123 456')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (13, 'Harare', 'Emerald Palace Skyway', '+263 4 123 4567')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (14, 'Khartoum', 'Coral Cove International Airport', '+249 183 123 45')';
    EXECUTE IMMEDIATE 'INSERT INTO Airport (airport_id, airport_location, airport_name, contact_number) VALUES (15, 'Yerevan', 'Phoenix Rising Airport', '+374 10 123456')';

    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (1, 1, 'AB123', 'SFIA', 'CSA');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (2, 2, 'ABC12', 'RSA', 'EPS');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (3, 3, 'ABB34', 'CCIA', 'TS');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (4, 4, 'DL334', 'ECA', 'PRA');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (5, 5, 'FF555', 'LSA', 'SFIA');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (6, 6, 'LLO00', 'GGA', 'GLS');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (7, 7, 'PA113', 'DS', 'SVA'); 
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (8, 8, 'TT455', 'CCIA', 'SA');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (9, 9, 'HH887', 'TS', 'LSA');
    EXECUTE IMMEDIATE INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport, arrival_airport) VALUES (10, 10, 'AR334', 'GTS', 'PRA');

    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (1, 1, 1, 'Harlan', 'Peck', 'Male', 'harlanpeck@gmail.com','04/15/2016');
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (2, 2, 2, 'Cecile', 'Miranda', 'Female', 'cecilemiranda@gmail.com', '09/22/2020' );
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (3, 3, 3, 'Jake', 'Parker', 'Male', 'jakeparker@gmail.com', '03/31/2019');
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (4, 4, 4, 'Wilbert', 'Bowman', 'Male', 'wilbertbowman@gmail.com', '07/18/2010' );
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (5, 5, 5, 'Margie', 'Baxter', 'Female', 'margiebaxter@yahoo.com', '08/09/2023');
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (6, 6, 6, 'Bertie', 'Shea', 'Female', 'bertieshea@yahoo.com', '01/23/2017');
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (7, 7, 7, 'Rodrick', 'Delago', 'Male', 'rodrickdelago@gmail.com', '05/26/2020');
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (8, 8, 8, 'Garfield', 'Costa', 'Male', 'garfieldcosta@gmail.com', '06/05/2014');
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (9, 9, 9, 'Lisa', 'Bartlett', 'Female', 'lisabartlett@yahoo.com', '11/14/2022');
    EXECUTE IMMEDIATE INSERT INTO Pilots (pilot_id, airline_id, flight_id, pil_first_name, pil_last_name, gender, email_address, hire_date) VALUES (10, 10, 10, 'Margey', 'Casey', 'Female', 'margeycasey@gmail.com', '01/06/2020');

    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (1, 'Nicky', 'Mcdowell', 'Male', '05/12/2019');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (2, 'Draghici', 'Alexandru-Gabriel', 'Male', '12/06/2022');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (3, 'Jeremy', 'Strong', 'Male', '09/22/2020');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (4, 'Katina', 'Coleman', 'Female', '11/01/2023');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (5, 'Keith', 'Webb', 'Female', '04/27/2019');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (6, 'Valentina', 'Rother', 'Female', '03/05/2023');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (7, 'Monica', 'Slabu', 'Female', '05/09/2016');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (8, 'Alberto', 'Dima', 'Male', '10/17/2019');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (9, 'Sabina', 'Foster', 'Female', '11/10/2018');
    EXECUTE IMMEDIATE INSERT INTO Flight_Attendant (attendant_id, att_first_name, att_last_name, gender, hire_date) VALUES (10, 'Carlos', 'Oliveira', 'Male', '04/10/2021');

    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (1, 1, 12345, 'Bruno', 'Wood', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (2, 2, 55134, 'Taylor', 'Sims', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (3, 3, 12980, 'Julius', 'Mills', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (4, 4, 09412, 'Keith', 'Davila', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (5, 5, 16485, 'Florencio', 'Love', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (6, 6, 65645, 'Nestor', 'Kelly', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (7, 7, 64332, 'Lila', 'Lin', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (8, 8, 09312, 'Donnie', 'Hill', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (9, 9, 89457, 'Markus', 'Rose', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (10, 10, 65624, 'Wilfred', 'Salas', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (11, 5, 76543, 'Elinor', 'Vaughan', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (12, 1, 21341, 'Gordon', 'Zimmerman', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (13, 2, 12345, 'Dimulescu', 'Matei', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (14, 8, 10239, 'Dimitrescu', 'Alcina', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (15, 9, 11122, 'Khaeda', 'Jhin', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (16, 3, 77534, 'Ada', 'Wong', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (17, 4, 00192, 'Satoru', 'Gojo', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (18, 6, 99932, 'Suguru', 'Geto', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (19, 7, 77532, 'Ioana', 'Monalisa', 'Female');    
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (20, 4, 81923, 'Jica', 'Stefan', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (21, 1, 45234, 'Liam', 'Rodriguez', 'Male');  
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (22, 8, 87685, 'Olivia', 'Brown', 'Female');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (23, 7, 54212, 'Ethan', 'winters', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (24, 10, 00129, 'Chris', 'Redfield', 'Male');
    EXECUTE IMMEDIATE INSERT INTO Passengers (passenger_id, flight_id, passaport_no, pass_first_name, pass_last_name, gender) VALUES (25, 10, 54452, 'Claire', 'Redfield', 'Female');

    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (1, 1, 1, 150000.50, '03/15/2023', '03/15/2028'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (2, 2, 2, 180000.25, '09/28/2022', '09/28/2027'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (3, 3, 3, 200000.20, '12/06/2020', '12/06/2030'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (4, 4, 4, 100000.50, '12/24/2017', '12/24/2024'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (5, 5, 5, 175000.75, '12/18/2011', '12/18/2023'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (6, 6, 6, 210000.12, '01/31/2015', '01/31/2025'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (7, 7, 7, 130000.30, '07/19/2021', '07/19/2031'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (8, 8, 8, 162500.20, '04/18/2024', '04/18/2029'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (9, 9, 9, 112000.12, '07/08/2019', '07/08/2026'); 
    EXECUTE IMMEDIATE INSERT INTO Contracts (contract_id, airline_id, airport_id, contract_value, con_start_date, con_end_date) VALUES (10, 10, 10, 212000.21, '10/09/2010', '10/09/2025'); 
END;
/