--function to query amount of appointments in the appointments table
CREATE FUNCTION AppointmentsCount() RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.appointments.appointmentid) FROM public.appointments); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from AppointmentsCount ();
-------------------------------------------------------------------------------------------------
--function to query amount of date range depending on idpatient in the appointments table
CREATE FUNCTION AppDateRangeCount(pADate Date) RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.appointments.appointmentid) FROM public.appointments where public.appointments.adate = pADate); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from AppDateRangeCount ('6/9/2018');
-------------------------------------------------------------------------------------------------
--function to query amount of state depending on idpatient in the appointments table
CREATE FUNCTION AppointStateCount(pState VARCHAR(25)) RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.appointments.appointmentid) FROM public.appointments where public.appointments.astate = pState); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from AppointStateCount ('Registrada');
-------------------------------------------------------------------------------------------------
--function to query amount of area depending on idpatient in the appointments table
CREATE FUNCTION AppAreaCount(pArea VARCHAR(20)) RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.appointments.appointmentid) FROM public.appointments where public.appointments.area = pArea); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from AppAreaCount ('Emergencias');
-------------------------------------------------------------------------------------------------
--function to query amount of diagnosisid in the diagnosis table
CREATE FUNCTION DiagnosisCount() RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.diagnosis.diagnosisid) FROM public.diagnosis); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from DiagnosisCount ();
-------------------------------------------------------------------------------------------------
--function to query amount of level depending on diagnosisid in the diagnosis table
CREATE FUNCTION DiagnosisLevelCount(Level VARCHAR(9)) RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.diagnosis.diagnosisid) FROM public.diagnosis where public.diagnosis.dlevel = Level); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from DiagnosisLevelCount ('Leve');
-------------------------------------------------------------------------------------------------
--function to query amount of type depending on treatmentid in the treatment table
CREATE FUNCTION TreatmentTypeCount(pType VARCHAR(15)) RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.treatment.treatmentid) FROM public.treatment where public.treatment.ttype = pType); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from TreatmentTypeCount ('Medicamento');
-------------------------------------------------------------------------------------------------
--function to query amount of treatmentid in the treatment table
CREATE FUNCTION TreatmentCount() RETURNS int AS $$
BEGIN 
RETURN (SELECT count(public.treatment.treatmentid) FROM public.treatment); 
END;$$
LANGUAGE plpgsql;
--Execution
select * from TreatmentCount ();



