--function to insert in the Employee_Patient table
CREATE FUNCTION AddEmployeePatient(PatientID INTEGER, EmployeeID INTEGER) RETURNS VOID
AS $$
BEGIN
INSERT INTO public.employee_patient(
	patientid, employeeid)
	VALUES (PatientID, EmployeeID);
END; $$
LANGUAGE plpgsql;

--function to query in the Employee_Patient table
CREATE FUNCTION queryEmployeePatient() RETURNS SETOF Employee_Patient AS $$
BEGIN
RETURN QUERY (SELECT * FROM public.employee_patient);
END; $$
LANGUAGE plpgsql;
--Execution
select * from queryemployeepatient();

------------------------------------------------------------------------
--function to insert in the Hospitalization_registry table
CREATE FUNCTION AddHospitalizationRegistry(RegistryID INTEGER, Observation VARCHAR (50), RegistryDate Date, HospitalizationID VARCHAR (10), TreatmentID VARCHAR (10), EmployeeID INTEGER) RETURNS VOID
AS $$
BEGIN
INSERT INTO public.hospitalization_registry(
	registryid, observation, registrydate, hospitalizationid, treatmentid, employeeid)
	VALUES (RegistryID, Observation, RegistryDate, HospitalizationID, TreatmentID, EmployeeID);
END; $$
LANGUAGE plpgsql;

--function to query in the Hospitalization_registry table
CREATE FUNCTION queryHospitalizationRegistry() RETURNS SETOF Hospitalization_Registry AS $$
BEGIN
RETURN QUERY (SELECT * FROM public.hospitalization_registry);
END; $$
LANGUAGE plpgsql;
--Execution
select * from queryhospitalizationregistry();

------------------------------------------------------------------------
--function to insert in the Patients_phones table
CREATE FUNCTION AddPatientsPhones(PatientID INTEGER, Phones INTEGER) RETURNS VOID AS $$
BEGIN
INSERT INTO public.patients_patient(
	patientid, phones)
	VALUES (PatientID, Phones);
END; $$
LANGUAGE plpgsql;

------------------------------------------------------------------------
--function to insert in the treatment table
CREATE FUNCTION AddTreatment(TreatmentID VARCHAR (10), TName VARCHAR (30), DOSE VARCHAR (50)) RETURNS VOID AS $$
BEGIN
INSERT INTO public.treatment(
	treatmentid, tname, dose)
	VALUES (TreatmentID, TName, Dose);
END; $$
LANGUAGE plpgsql;

--function to query in the treatment table (without parameters)
CREATE FUNCTION queryTreatment() RETURNS SETOF Treatment AS $$
BEGIN
RETURN QUERY (SELECT * FROM public.treatment);
END; $$
LANGUAGE plpgsql;
--Execution
select * from querytreatment();

--function to query by the parameter "id" in the treatment table
CREATE FUNCTION queryTreatmentID (TreatmentID VARCHAR (10)) RETURNS SETOF Treatment AS $$
BEGIN
RETURN QUERY (SELECT * FROM public.treatment WHERE public.treatment.treatmentid = $1);
END; $$
LANGUAGE plpgsql;
--Execution
select * from queryTreatmentID ('T001');

--function to query by the parameter "name" in the treatment table
CREATE FUNCTION queryTreatmentName (TName VARCHAR (30)) RETURNS SETOF Treatment AS $$
BEGIN
RETURN QUERY (SELECT * FROM public.treatment WHERE public.treatment.tname = $1);
END; $$
LANGUAGE plpgsql;
--Execution
select * from queryTreatmentName ('Antibióticos');

--function to query by the parameter "dose" in the treatment table 
CREATE FUNCTION queryTreatmentDose (Dose VARCHAR (50)) RETURNS SETOF Treatment AS $$
BEGIN
RETURN QUERY (SELECT * FROM public.treatment WHERE public.treatment.dose = $1);
END; $$
LANGUAGE plpgsql;
--Execution
select * from queryTreatmentDose ('Una tableta por día');