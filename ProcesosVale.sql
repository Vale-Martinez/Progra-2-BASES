--function to insert in the diagnosis table
CREATE FUNCTION AddDiagnosis(DiagnosisID VARCHAR (10),DName VARCHAR (30),DLevel VARCHAR (9),Observation VARCHAR (50)) RETURNS VOID 
AS $$
BEGIN
INSERT INTO public.diagnosis(
	diagnosisid, dname, dlevel, observation)
	VALUES (DiagnosisID, DName, DLevel, Observation);
END;$$
LANGUAGE plpgsql;

--function to query in the diagnosis table
CREATE FUNCTION ConsultDiagnosis() RETURNS SETOF Diagnosis AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.diagnosis );
END;$$
LANGUAGE plpgsql;
--Execution 
select * from consultdiagnosis();

--function to query in the diagnosis with name
CREATE FUNCTION ConsultDiagnosisName (DName VARCHAR (30)) RETURNS SETOF Diagnosis AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.diagnosis 
WHERE public.diagnosis.dname= $1); -- o puede ser con el nombre del parametro pDiagnosis, cualquiera de las dos la lee
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultDiagnosisName ('Tumor');

--function to query in the diagnosis with nivel
CREATE FUNCTION ConsultDiagnosisLevel(pDLevel VARCHAR (9)) RETURNS SETOF Diagnosis AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.diagnosis 
where public.diagnosis.dlevel = pDLevel );
END;$$
LANGUAGE plpgsql;
--Execution 
select * from consultdiagnosislevel('Grave');

---------------------------------------------------------------------------------------------------------------
--function to insert in the employee_appointments table
CREATE FUNCTION AddEmployee_appointments(AppointmentID VARCHAR (10),EmployeeID INTEGER) RETURNS VOID 
AS $$
BEGIN
INSERT INTO public.employee_appointments(
	appointmentid, employeeid)
	VALUES (AppointmentID, EmployeeID);
END;$$
LANGUAGE plpgsql;

--function to query in the employee_appointments table
CREATE FUNCTION ConsultEmployee_appointments() RETURNS SETOF employee_appointments AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.employee_appointments );
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultEmployee_appointments();

--function to query in the employee_appointments table with AppointmentID
CREATE FUNCTION ConsultEmployee_appointmentsAppointmentID (pAppointmentID VARCHAR (10)) RETURNS SETOF employee_appointments AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.employee_appointments 
WHERE public.employee_appointments.AppointmentID= $1); -- o puede ser con el nombre del parametro pDiagnosis, cualquiera de las dos la lee
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultEmployee_appointmentsAppointmentID ('A001');

--function to query in the employee_appointments table with EmployeeID
CREATE FUNCTION ConsultEmployee_appointmentsEmployeeID (EmployeeID INTEGER) RETURNS SETOF employee_appointments AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.employee_appointments 
WHERE public.employee_appointments.EmployeeID = $1); -- o puede ser con el nombre del parametro pDiagnosis, cualquiera de las dos la lee
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultEmployee_appointmentsEmployeeID ('901220797')

-----------------------------------------------------------------------------------------------------------------
--function to insert in the  Hospitalization table
CREATE FUNCTION AddHospitalization(HospitalizationID Varchar (10),
	Name1 VARCHAR (10),
	Name2 VARCHAR (10),
	LastName1 VARCHAR (15),
	LastName2 VARCHAR (15),
	StartDate DATE,
	EndDate DATE,
	Speciality VARCHAR (15),
	CenterID INTEGER,
	DiagnosisID VARCHAR (10),
	PatientID INTEGER,
	EmployeeID INTEGER) RETURNS VOID 
AS $$
BEGIN
INSERT INTO public.hospitalization(
	hospitalizationid, name1, name2, lastname1, lastname2, startdate, enddate, speciality, centerid, diagnosisid, patientid, employeeid)
	VALUES (HospitalizationID, Name1, Name2, LastName1, LastName2, StartDate, EndDate, Speciality, CenterID, DiagnosisID, PatientID, EmployeeID);
END;$$
LANGUAGE plpgsql;

--function to query in the hospitalization table
CREATE FUNCTION ConsultHospitalization() RETURNS SETOF hospitalization AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.hospitalization );
END;$$
LANGUAGE plpgsql;
--Execution 
select * from ConsultHospitalization();

--function to query in the hospitalization table with Area
CREATE FUNCTION ConsultHospitalizationArea (Speciality VARCHAR (15)) RETURNS SETOF hospitalization AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.hospitalization 
WHERE public.hospitalization.Speciality = $1); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultHospitalizationArea ('General');

--function to query in the hospitalization table  with PatientID
CREATE FUNCTION ConsultHospitalizationPatienID (PatientID INTEGER) RETURNS SETOF hospitalization AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.hospitalization 
WHERE public.hospitalization.PatientID = $1); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultHospitalizationPatienID ('208100002');

--function to query in the hospitalization table
CREATE FUNCTION ConsultHospitalizationCount() RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.hospitalization.hospitalizationid) FROM public.hospitalization); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultHospitalizationCount ();

---------------------------------------------------------------------------------------------------------------------------------------
--function to insert in the  Patients table
CREATE FUNCTION AddPatients(PatientID INTEGER,
	Name1 VARCHAR (10),
	Name2 VARCHAR (10),
	LastName1 VARCHAR (15),
	LastName2 VARCHAR (15),
	BloodType VARCHAR (3),
	BirthDate DATE,
	Nationality VARCHAR (25),
	Province VARCHAR (20),
	Canton VARCHAR (20),
	District VARCHAR (20) ,
	Signals VARCHAR (30) ,
	CenterID INTEGER) RETURNS VOID 
AS $$
BEGIN
INSERT INTO public.patients(
	patientid, name1, name2, lastname1, lastname2, bloodtype, birthdate, nationality, province, canton, district, signals, centerid)
	VALUES (PatientID, Name1, Name2, LastName1,LastName2,BloodType,BirthDate,Nationality,Province, Canton,District, Signals,CenterID);
END;$$
LANGUAGE plpgsql;

--function to query in the Patients table
CREATE FUNCTION ConsultPatients() RETURNS SETOF Patients AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.Patients );
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultPatients();

------------------------------------------------------------------------------------------------------------------------------------------------
--function to insert in the Patients
CREATE FUNCTION AddPatients_diagnosis(PatientID INTEGER,
	DiagnosisID VARCHAR (10)) RETURNS VOID 
AS $$
BEGIN
	INSERT INTO public.patients_diagnosis(
		patientid, diagnosisid)
		VALUES (PatientID, DiagnosisID);
END;$$
LANGUAGE plpgsql;

--function to query in the PatientsDiagnosis table
CREATE FUNCTION ConsultPatientsDiagnosis() RETURNS SETOF patients_diagnosis AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.patients_diagnosis );
END;$$
LANGUAGE plpgsql;
--Execution
select * from ConsultPatientsDiagnosis();

--------------------------------------------------------------------------------------------------------------------------------------------------
--function to insert in the  publicemployee
CREATE FUNCTION Addpublicemployee(EmployeeID INTEGER,
	Name1 VARCHAR (10),
	Name2 VARCHAR (10),
	LastName1 VARCHAR (15),
	LastName2 Varchar (15),
	Area VARCHAR (20),
	EType VARCHAR (9),
	EntryDate DATE,
	CenterID INTEGER) RETURNS VOID 
AS $$
BEGIN
	INSERT INTO public.publicemployee(
	employeeid, name1, name2, lastname1, lastname2, area, etype, entrydate, centerid)
	VALUES (EmployeeID, Name1, Name2, LastName1, LastName2, Area, EType, EntryDate, CenterID);
END;$$
LANGUAGE plpgsql;

--function to query in the publicemployee table
CREATE FUNCTION Consultpublicemployee() RETURNS SETOF publicemployee AS $$
BEGIN 
RETURN QUERY (SELECT * FROM public.publicemployee );
END;$$
LANGUAGE plpgsql;
--Execution
select * from Consultpublicemployee();




