--CREATING TABLES

--Attention Center Table with all its attributes
Create Table AttentionCenter(
	CenterID SERIAL PRIMARY KEY,
	CName VARCHAR(30) NOT NULL,
	CLocation VARCHAR(50) NOT NULL,
	MaxCapacity INTEGER NOT NULL,
	CType VARCHAR(20) NOT NULL CHECK (CType in ('Hospital','Clinica','EBAIS'))
)

--Public Employee Table with all its attributes
Create Table PublicEmployee(
	EmployeeID INTEGER PRIMARY KEY,
	Name1 VARCHAR (10) NOT NULL,
	Name2 VARCHAR (10) NULL,
	LastName1 VARCHAR (15) NOT NULL,
	LastName2 Varchar (15) NULL,
	Area VARCHAR (20) NOT NULL,
	EType VARCHAR (9) NOT NULL CHECK (EType in ('Doctor','Secretario', 'Enfermero'))
	EntryDate DATE NOT NULL,
	CenterID INTEGER NOT NULL,
	FOREIGN KEY (CenterID) REFERENCES AttentionCenter (CenterID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Patients Table with all its attributes
Create Table Patients(
	PatientID INTEGER PRIMARY KEY,
	Name1 VARCHAR (10) NOT NULL,
	Name2 VARCHAR (10) NULL,
	LastName1 VARCHAR (15) NOT NULL,
	LastName2 VARCHAR (15) NULL,
	BloodType VARCHAR (3) NOT NULL CHECK (BloodType in ('A+','A-','B+','B-','O+','O-','AB+','AB-'))
	BirthDate DATE NULL,
	Nationality VARCHAR (25) NULL,
	Province VARCHAR (20) NULL,
	Canton VARCHAR (20) NULL,
	District VARCHAR (20) NULL,
	Signals VARCHAR (30) NULL,
	CenterID INTEGER NOT NULL,
	FOREIGN KEY (CenterID) REFERENCES AttentionCenter (CenterID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Appointment Table with all its attributes
Create Table Appointments(
	AppointmentID VARCHAR (10) PRIMARY KEY,
	AState VARCHAR (25) NOT NULL CHECK (AState in ('Registrada', 'Cancelada por paciente','Cancelada por medico','Asignada','Realizada'))
	ATime TIME NOT NULL,
	ADate DATE NOT NULL,
	Observation VARCHAR (50) NULL,
	Area VARCHAR (20) NOT NULL,
	PatientID INTEGER NOT NULL,
	FOREIGN KEY (PatientID) REFERENCES Patients (PatientID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Diagnosis Table with all its attributes
Create Table Diagnosis(
	DiagnosisID VARCHAR (10) PRIMARY KEY,
	DName VARCHAR (30) NOT NULL,
	DLevel VARCHAR (9) NOT NULL CHECK (DLevel in ('Leve','Grave','Muy grave'))
	Observation VARCHAR (50) NULL
)

--Treatment Table with all its attributes
Create Table Treatment(
	TreatmentID VARCHAR (10) PRIMARY KEY,
	TName VARCHAR (30) NOT NULL,
	Dose VARCHAR (50) NULL
)

--Hospitalization Table with all its attributes
Create Table Hospitalization(
	HospitalizationID Varchar (10) PRIMARY KEY,
	Name1 VARCHAR (10) NOT NULL,
	Name2 VARCHAR (10) NULL,
	LastName1 VARCHAR (15) NOT NULL,
	LastName2 VARCHAR (15) NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Speciality VARCHAR (15) NOT NULL,
	CenterID INTEGER NOT NULL,
	DiagnosisID VARCHAR (10) NOT NULL,
	PatientID INTEGER NOT NULL,
	EmployeeID INTEGER NOT NULL,
	FOREIGN KEY (CenterID) REFERENCES AttentionCenter (CenterID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (DiagnosisID) REFERENCES Diagnosis (DiagnosisID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (PatientID) REFERENCES Patients (PatientID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (EmployeeID) REFERENCES PublicEmployee (EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Hospitalization_Registry Table with all its attributes
Create Table Hospitalization_Registry (
	RegistryID SERIAL PRIMARY KEY,
	Observation VARCHAR (50) NULL,
	RegistryDate DATE NULL,
	HospitalizationID VARCHAR (10) NOT NULL,
	TreatmentID VARCHAR (10) NOT NULL,
	EmployeeID INTEGER NOT NULL,
	FOREIGN KEY (HospitalizationID) REFERENCES Hospitalization (HospitalizationID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (TreatmentID) REFERENCES Treatment (TreatmentID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (EmployeeID) REFERENCES PublicEmployee (EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Employee_Patient Table with all its atributes
Create Table Employee_Patient(
	PatientID INTEGER NOT NULL,
	EmployeeID INTEGER NOT NULL,
	FOREIGN KEY (PatientID) REFERENCES Patients (PatientID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (EmployeeID) REFERENCES PublicEmployee (EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Patients_Phones Table with all attributes
Create Table Patients_Phones(
	PatientID INTEGER NOT NULL,
	Phones INTEGER NULL UNIQUE,
	FOREIGN KEY (PatientID) REFERENCES Patients (PatientID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Patients_Diagnosis Table with all its attributes
Create Table Patients_Diagnosis(
	PatientID INTEGER NOT NULL,
	DiagnosisID VARCHAR (10) NOT NULL,
	FOREIGN KEY (PatientID) REFERENCES Patients (PatientID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (DiagnosisID) REFERENCES Diagnosis (DiagnosisID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Appointments_Diagnosis Table with all its attributes
Create Table Appointments_Diagnosis(
	AppointmentID VARCHAR (10) NOT NULL,
	DiagnosisID VARCHAR (10) NOT NULL,
	FOREIGN KEY (AppointmentID) REFERENCES Appointments (AppointmentID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (DiagnosisID) REFERENCES Diagnosis (DiagnosisID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Employee_Appointments Table with all its attributes
Create Table Employee_Appointments(
	AppointmentID VARCHAR (10) NOT NULL,
	EmployeeID INTEGER NOT NULL,
	FOREIGN KEY (AppointmentID) REFERENCES Appointments (AppointmentID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (EmployeeID) REFERENCES PublicEmployee (EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE
)

--Diagnosis_Treatments Table withh all its attributes
Create Table Diagnosis_Treatment (
	TreatmentID VARCHAR (10) NOT NULL,
	DiagnosisID VARCHAR (10) NOT NULL,
	FOREIGN KEY (TreatmentID) REFERENCES Treatment (TreatmentID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (DiagnosisID) REFERENCES Diagnosis (DiagnosisID) ON DELETE CASCADE ON UPDATE CASCADE
)
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

--DATA INSERTION

--Table AttentionCenter
Insert into AttentionCenter (CName, CLocation, MaxCapacity, CType) values ('Jerusalen','Alto de Guadalupe', 100,'Clínica');
Insert into AttentionCenter (CName, CLocation, MaxCapacity, CType) values ('Calderón Guardia','San José', 200,'Hospital');
Insert into AttentionCenter (CName, CLocation, MaxCapacity, CType) values ('De Fatima','Goicoechea', 50,'EBAIS')
select * from AttentionCenter

--Table PublicEmployee
Insert into PublicEmployee (Name1, Name2, LastName1, LastName2, Area, EType, EntryDate, CenterID) values ('Maria','Celeste','Salinas','Medina','Ginecología','Doctor','01-06-2001',2);
Insert into PublicEmployee (Name1, Name2, LastName1, LastName2, Area, EType, EntryDate, CenterID) values ('Marco','','López','','Emergencias','Enfermero','2003-08-22',3);
Insert into PublicEmployee (Name1, Name2, LastName1, LastName2, Area, EType, EntryDate, CenterID) values ('Emerson','Felipe','Souza','Ribeiro','Oncología','Doctor','2001-05-03',1);
select * from PublicEmployee

--Table Patients
Insert into Patients (Name1, Name2, LastName1, LastName2, BloodType, BirthDate, Nationality, Province, Canton, District, Signals, CenterID) values ('José','Alejandro','Campos','Torres','AB+','06-16-2009','Costarricense','Alajuela','Atenas','San Isidro', 'Casa Amarilla', 1);
Insert into Patients (Name1, Name2, LastName1, LastName2, BloodType, BirthDate, Nationality, Province, Canton, District, Signals, CenterID) values ('Clara','','Rojas','Treminio','O-','02-15-2003','Costarricense','Heredia','Barva','San Pedro', 'Residencial', 2);
Insert into Patients (Name1, Name2, LastName1, LastName2, BloodType, BirthDate, Nationality, Province, Canton, District, Signals, CenterID) values ('Alex','Andrés','Tijerino','','B+','03-27-2000','Costarricense','Puntarenas','Puntarenas','Acapulco', '', 2);
select * from Patients

--Table Appointments
Insert into Appointments (AppointmentID, ATime, ADate, Observation, Area, PatientID) values ('A001','1:00 pm','02-02-2020','','Ginecología', 2);
Insert into Appointments (AppointmentID, ATime, ADate, Observation, Area, PatientID) values ('A002','5:00 pm','03-11-2019','','Oncología', 1);
Insert into Appointments (AppointmentID, ATime, ADate, Observation, Area, PatientID) values ('A003','8:00 am','06-09-2018','Dolor estomacal','Emergencias', 3);
select * from Appointments

--Table Diagnosis
Insert into Diagnosis (DiagnosisID, DName, DLevel, Observation) values ('D001','Infección','Leve','Paciente presenta dolor en el vientre');
Insert into Diagnosis (DiagnosisID, DName, DLevel, Observation) values ('D002','Tumor','Grave','');
Insert into Diagnosis (DiagnosisID, DName, DLevel, Observation) values ('D003','Gastritits','Muy grave','Paciente presenta dolor abdominal');
select * from Diagnosis

--Table Treatment
Insert into Treatment (TreatmentID, TName, Dose) values ('T001','Antibióticos','Una tableta por día');
Insert into Treatment (TreatmentID, TName, Dose) values ('T002','Radioterapia','Una vez al mes');
Insert into Treatment (TreatmentID, TName, Dose) values ('T003','Medicamento','Una tableta antes de cada comida');
select * from Treatment

--Table Hospitalization
Insert into Hospitalization (HospitalizationID, Name1, Name2, LastName1, LastName2, StartDate, EndDate, Speciality, CenterID, DiagnosisID, PatientID, EmployeeID) values ('H001','José','Alejandro','Campos','Torres','06-09-2018','06-15-2019','General',3,'D003',1,2);
Insert into Hospitalization (HospitalizationID, Name1, Name2, LastName1, LastName2, StartDate, EndDate, Speciality, CenterID, DiagnosisID, PatientID, EmployeeID) values ('H002','Clara','','Rojas','Treminio','02-02-2020','02-10-2020','Infecciones',2,'D001',2,1);
select * from Hospitalization

--Table Hospitalization_Registry
Insert into Hospitalization_Registry (Observation, RegistryDate, HospitalizationID, TreatmentID, EmployeeID) values ('Paciente debe estar internado durante 7 días','06-09-2020','H001','T003',2);
Insert into Hospitalization_Registry (Observation, RegistryDate, HospitalizationID, TreatmentID, EmployeeID) values ('Paciente debe estar internado durante 9 días','02-02-2020','H002','T001',1);
select * from Hospitalization_Registry

--Table Employee_Patient
Insert into Employee_Patient (PatientID, EmployeeID) values (1, 3);
Insert into Employee_Patient (PatientID, EmployeeID) values (2, 1);
Insert into Employee_Patient (PatientID, EmployeeID) values (3, 2);
select * from Employee_Patient

--Table Patients_Phones
Insert into Patients_Phones (PatientID, Phones) values (1, 85639562);
Insert into Patients_Phones (PatientID, Phones) values (1, 22569874);
Insert into Patients_Phones (PatientID, Phones) values (2, 22336655);
Insert into Patients_Phones (PatientID, Phones) values (2, 21487935);
Insert into Patients_Phones (PatientID, Phones) values (3, 89562314);
select * from Patients_Phones

--Table Patients_Diagnosis
Insert into Patients_Diagnosis (PatientID, DiagnosisID) values (2, 'D001');
Insert into Patients_Diagnosis (PatientID, DiagnosisID) values (1, 'D002');
Insert into Patients_Diagnosis (PatientID, DiagnosisID) values (3, 'D003');
select * from Patients_Diagnosis

--Table Appointments_Diagnosis
Insert into Appointments_Diagnosis (AppointmentID, DiagnosisID) values ('A001', 'D001');
Insert into Appointments_Diagnosis (AppointmentID, DiagnosisID) values ('A002', 'D002');
Insert into Appointments_Diagnosis (AppointmentID, DiagnosisID) values ('A003', 'D003');
select * from Appointments_Diagnosis

--Table Employee_Appointments
Insert into Employee_Appointments (AppointmentID, EmployeeID) values ('A001', 1);
Insert into Employee_Appointments (AppointmentID, EmployeeID) values ('A002', 3);
Insert into Employee_Appointments (AppointmentID, EmployeeID) values ('A003', 2);
select * from Employee_Appointments

--Table Diagnosis_Treatment
Insert into Diagnosis_Treatment (TreatmentID, DiagnosisID) values ('T001', 'D001');
Insert into Diagnosis_Treatment (TreatmentID, DiagnosisID) values ('T002', 'D002');
Insert into Diagnosis_Treatment (TreatmentID, DiagnosisID) values ('T003', 'D003');
select * from Diagnosis_Treatment
