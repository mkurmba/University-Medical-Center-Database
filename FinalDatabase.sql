USE master;
GO

IF DB_ID('ProjectTwo') IS NOT NULL
   DROP DATABASE ProjectTwo;
GO

CREATE DATABASE ProjectTwo;
GO

USE ProjectTwo
GO


IF OBJECT_ID('Patients') IS NOT NULL
DROP TABLE Patients;
CREATE TABLE Patients(
	PatientID					int					PRIMARY KEY IDENTITY(1,1),
	PatientFirstName			varchar(20)			NOT NULL,
	PatientLastName				varchar(20)			NOT NULL,
	PatientStreet				varchar(50)			NOT NULL,
	PatientCity					varchar(50)			NOT NULL,
	PatientZip					varchar(5)			NOT NULL,
	PatientPhone				varchar(11)			NOT NULL,
	PatientEmail				varchar(20)			NOT NULL,
	PatientDateOfBirth			DATETIME			NOT NULL,
	PatientWeight				FLOAT(2)			NOT NULL,
	PatientHeight				INT					NOT NULL,
	PatientHeartRate			FLOAT(2)			NOT NULL,
	PatientBloodPressure		varchar(7)			NOT NULL,
	PhysicianID					int					NOT NULL,
	InsuranceID					int					NOT NULL,
	LabResultID					int					NOT NULL, 
	MedicationID				int					NOT NULL,
	ProcedureID					int					NOT NULL,
	AdmissionID					int					NOT NULL, 
	AppointmentID				int					NOT NULL

)
GO

IF OBJECT_ID('Physicians') IS NOT NULL
DROP TABLE Physicians;
CREATE TABLE Physicians(
	PhysicianID					 int					PRIMARY KEY IDENTITY(1,1),
	PatientID					 int					NOT NULL REFERENCES Patients (PatientID),
	MedicationID				 int					NOT NULL,
	ProcedureID			         int					NOT NULL,
	LabResultID					 int					NOT NULL,
	PhysicianScheduleID          int				    NOT NULL,
	PhysicianFirstName			 varchar(20)			NOT NULL,
	PhysicianLastName			 varchar(20)			NOT NULL,
	PhysicianPhone				 varchar(11)			NOT NULL,
	PhysicianEmail				 varchar(20)			NOT NULL,
	PhysicianSpeciality			 varchar(20)			NOT NULL,
	PhysicianLicensingInfo		 varchar(50)			NOT NULL

)
GO

IF OBJECT_ID('Nurses') IS NOT NULL
DROP TABLE Nurses;
CREATE TABLE Nurses(
	NurseID						 int					PRIMARY KEY IDENTITY(1,1),
	NurseScheduleID				 int					NOT NULL,
	NoteID						 int					NOT NULL,
	NurseFirstName				 varchar(20)			NOT NULL,
	NurseLastName				 varchar(20)			NOT NULL,
	NursePhone					 varchar(11)			NOT NULL,
	NurseEmail					 varchar(20)			NOT NULL,
	NurseDepartment				 varchar(20)			NOT NULL,
	NurseJobTitle				 varchar(20)			NOT NULL,	
	NurseHireDate				 DATETIME				NOT NULL

)
GO


IF OBJECT_ID('Admissions') IS NOT NULL
DROP TABLE Admissions;
CREATE TABLE Admissions(
	AdmissionID					 int					PRIMARY KEY IDENTITY(1,1),
	PatientID					 int					NOT NULL REFERENCES Patients (PatientID),
	InpatientRoomScheduleID      int					NOT NULL,
	SurgeryRoomScheduleID		 int					NOT NULL,
	AdmissionDate				 DATETIME				NOT NULL,
	DischargeDate				 DATETIME				NOT NULL,
	Diagonosis					 varchar(50)			NOT NULL,
	PhysicianID					 int					NOT NULL REFERENCES Physicians (PhysicianID),
	RoomNumber					 varchar(10)			NOT NULL

)
GO


IF OBJECT_ID('Appointments') IS NOT NULL
DROP TABLE Appointments;
CREATE TABLE Appointments(
	AppointmentID				 int					PRIMARY KEY IDENTITY(1,1),
	DateAndTime					 DATETIME				NOT NULL, 
	PatientID					 int					NOT NULL REFERENCES Patients (PatientID),
	PhysicianID					 int					NOT NULL REFERENCES Physicians (PhysicianID),
	Reason						 varchar(50)			NOT NULL	
)
GO


IF OBJECT_ID('Insurance') IS NOT NULL
DROP TABLE Insurance;
CREATE TABLE Insurance(            
	InsuranceID					 int					PRIMARY KEY IDENTITY(1,1),
	PatientID					 int					NOT NULL REFERENCES Patients (PatientID),
	BillingID					 int					NOT NULL,
	CompanyName                  varchar(50)			NOT NULL,
	InsurancePhone				 varchar(11)			NOT NULL,
	Coverage					 varchar(20)			NOT NULL

)
GO


IF OBJECT_ID('Billing') IS NOT NULL
DROP TABLE Billing;
CREATE TABLE Billing(            
	BillingID					 int					PRIMARY KEY IDENTITY(1,1),
	InsuranceID					 int					NOT NULL REFERENCES Insurance (InsuranceID),
	MedicalServicesCost			 varchar(50)			NOT NULL,
	PaymentInfo					 varchar(50)			NOT NULL

)
GO



IF OBJECT_ID('LabResults') IS NOT NULL
DROP TABLE LabResults;
CREATE TABLE LabResults(
	LabResultID					 int					PRIMARY KEY IDENTITY(1,1),
	TestName					 varchar(50)			NOT NULL,
	DateOfTheTest				 DATETIME				NOT NULL,
	PatientID					 int					NOT NULL REFERENCES Patients (PatientID),
	PhysicianID					 int					NOT NULL REFERENCES Physicians (PhysicianID),
	TestResults					 varchar(50)			NOT NULL,

)
GO


IF OBJECT_ID('Notes') IS NOT NULL
DROP TABLE Notes;
CREATE TABLE Notes(
	NoteID						int						PRIMARY KEY IDENTITY(1,1),
	Notes					 	varchar(100)			NOT NULL,	
	Comments					varchar(100)			NOT NULL,
	PhysicianID					int						NOT NULL REFERENCES Physicians (PhysicianID),
	NurseID						int						NOT NULL REFERENCES Nurses (NurseID),
)
GO



IF OBJECT_ID('Proceduress') IS NOT NULL
DROP TABLE Proceduress;
CREATE TABLE Proceduress(
	ProcedureID					int						PRIMARY KEY IDENTITY(1,1),
	ProcedureDate				DATETIME				NOT NULL,
	PatientID					int						NOT NULL REFERENCES Patients (PatientID),
	PhysicianID					int						NOT NULL REFERENCES Physicians (PhysicianID),
	ProcedureNotes				varchar(100)			NOT NULL

)
GO



IF OBJECT_ID('Medications') IS NOT NULL
DROP TABLE Medications;
CREATE TABLE Medications(
	MedicationID				int						PRIMARY KEY IDENTITY(1,1),
	MedicationName				varchar(50)				NOT NULL,		
	MedicationDosage			varchar(50)				NOT NULL,
	MedicationFrequency			varchar(50)				NOT NULL,
	PhysicianID					int						NOT NULL REFERENCES Physicians (PhysicianID),						
)
GO



IF OBJECT_ID('PhysicianSchedules') IS NOT NULL
DROP TABLE PhysicianSchedules;
CREATE TABLE PhysicianSchedules(
	PhysicianScheduleID			int						PRIMARY KEY IDENTITY(1,1),
	PhysicianID					int						NOT NULL REFERENCES Physicians (PhysicianID),
	StartTime					smalldatetime			NOT NULL,
	EndTime						smalldatetime			NOT NULL,

)
GO

IF OBJECT_ID('NurseSchedules') IS NOT NULL
DROP TABLE NurseSchedules;
CREATE TABLE NurseSchedules(
	NurseScheduleID				int						PRIMARY KEY IDENTITY(1,1),
	NurseID						int						NOT NULL REFERENCES Nurses (NurseID),
	StartTime					smalldatetime			NOT NULL,
	EndTime						smalldatetime			NOT NULL,

)
GO


IF OBJECT_ID('SurgeryRoomSchedules') IS NOT NULL
DROP TABLE SurgeryRoomSchedules;
CREATE TABLE	SurgeryRoomSchedules(
	SurgeryRoomScheduleID		int						PRIMARY KEY IDENTITY(1,1),
	AdmissionID					int						NOT NULL REFERENCES Admissions (AdmissionID),
	StartTime					smalldatetime			NOT NULL,
	EndTime						smalldatetime			NOT NULL,

)
GO


IF OBJECT_ID('InpatientRoomSchedules') IS NOT NULL
DROP TABLE InpatientRoomSchedules;
CREATE TABLE	InpatientRoomSchedules(
	InpatientRoomScheduleID		int						PRIMARY KEY IDENTITY(1,1),
	AdmissionID					int						NOT NULL REFERENCES Admissions (AdmissionID),
	StartTime					smalldatetime			NOT NULL,
	EndTime						smalldatetime			NOT NULL,

)
GO


/**************** FK Constraints ****************/


/*******Patients***********/


ALTER TABLE Patients WITH NOCHECK
ADD CONSTRAINT FK_Patients_Physician
FOREIGN KEY (PhysicianID)
REFERENCES Physicians (PhysicianID)
GO

ALTER TABLE Patients CHECK CONSTRAINT FK_Patients_Physician
GO


ALTER TABLE Patients WITH NOCHECK
ADD CONSTRAINT FK_Patients_Insurance
FOREIGN KEY (InsuranceID)
REFERENCES Insurance (InsuranceID)
GO

ALTER TABLE Patients CHECK CONSTRAINT FK_Patients_Insurance
GO

ALTER TABLE Patients WITH NOCHECK
ADD CONSTRAINT FK_Patients_LabResults
FOREIGN KEY (LabResultID)
REFERENCES LabResults (LabResultID)
GO

ALTER TABLE Patients CHECK CONSTRAINT FK_Patients_LabResults
GO

ALTER TABLE Patients WITH NOCHECK
ADD CONSTRAINT FK_Patients_Medications
FOREIGN KEY (MedicationID)
REFERENCES Medications (MedicationID)
GO

ALTER TABLE Patients CHECK CONSTRAINT FK_Patients_Medications
GO


ALTER TABLE Patients WITH NOCHECK
ADD CONSTRAINT FK_Patients_Proceduress
FOREIGN KEY (ProcedureID)
REFERENCES Proceduress (ProcedureID)
GO

ALTER TABLE Patients CHECK CONSTRAINT FK_Patients_Proceduress
GO

ALTER TABLE Patients WITH NOCHECK
ADD CONSTRAINT FK_Patients_Admissions
FOREIGN KEY (AdmissionID)
REFERENCES Admissions (AdmissionID)
GO

ALTER TABLE Patients CHECK CONSTRAINT FK_Patients_Admissions
GO

ALTER TABLE Patients WITH NOCHECK
ADD CONSTRAINT FK_Patients_Appointments
FOREIGN KEY (AppointmentID)
REFERENCES Appointments (AppointmentID)
GO

ALTER TABLE Patients CHECK CONSTRAINT FK_Patients_Appointments
GO


/*********admissions******/

ALTER TABLE Admissions WITH NOCHECK
ADD CONSTRAINT FK_Admissions_Patients
FOREIGN KEY (PatientID)
REFERENCES Patients (PatientID)
GO
ALTER TABLE Admissions CHECK CONSTRAINT FK_Admissions_Patients
GO




ALTER TABLE Admissions WITH NOCHECK
ADD CONSTRAINT FK_Admissions_InpatientRoomSchedules
FOREIGN KEY (InpatientRoomScheduleID)
REFERENCES InpatientRoomSchedules (InpatientRoomScheduleID)
GO
ALTER TABLE Admissions CHECK CONSTRAINT FK_Admissions_InpatientRoomSchedules
GO


ALTER TABLE Admissions WITH NOCHECK
ADD CONSTRAINT FK_Admissions_SurgeryRoomSchedules
FOREIGN KEY (SurgeryRoomScheduleID)
REFERENCES SurgeryRoomSchedules (SurgeryRoomScheduleID)
GO
ALTER TABLE Admissions CHECK CONSTRAINT FK_Admissions_SurgeryRoomSchedules
GO


/*********Appointments******/

ALTER TABLE Appointments WITH NOCHECK
ADD CONSTRAINT FK_Appointments_Patients
FOREIGN KEY (PatientID)
REFERENCES Patients (PatientID)
GO
ALTER TABLE Appointments CHECK CONSTRAINT FK_Appointments_Patients
GO


ALTER TABLE Appointments WITH NOCHECK
ADD CONSTRAINT FK_Appointments_Physicians
FOREIGN KEY (PhysicianID)
REFERENCES Physicians (PhysicianID)
GO
ALTER TABLE Appointments CHECK CONSTRAINT FK_Appointments_Physicians
GO

/*********notes******/

ALTER TABLE Notes WITH NOCHECK
ADD CONSTRAINT FK_Notes_Physicians
FOREIGN KEY (PhysicianID)
REFERENCES Physicians (PhysicianID)
GO
ALTER TABLE Notes CHECK CONSTRAINT FK_Notes_Physicians
GO

ALTER TABLE Notes WITH NOCHECK
ADD CONSTRAINT FK_Notes_Nurses
FOREIGN KEY (NurseID)
REFERENCES Nurses (NurseID)
GO
ALTER TABLE Notes CHECK CONSTRAINT FK_Notes_Nurses
GO


/*********Nurses******/
ALTER TABLE Nurses WITH NOCHECK
ADD CONSTRAINT FK_Nurses_NurseSchedules
FOREIGN KEY (NurseScheduleID)
REFERENCES NurseSchedules (NurseScheduleID)
GO
ALTER TABLE Nurses CHECK CONSTRAINT FK_Nurses_NurseSchedules
GO

ALTER TABLE Nurses WITH NOCHECK
ADD CONSTRAINT FK_Nurses_Notes
FOREIGN KEY (NoteID)
REFERENCES Notes (NoteID)
GO
ALTER TABLE Nurses CHECK CONSTRAINT FK_Nurses_Notes
GO



/*********NurseSchedule******/


ALTER TABLE NurseSchedules WITH NOCHECK
ADD CONSTRAINT FK_NurseSchedules_Nurses
FOREIGN KEY (NurseID)
REFERENCES Nurses (NurseID)
GO
ALTER TABLE NurseSchedules CHECK CONSTRAINT FK_NurseSchedules_Nurses
GO

/*********Insurance*********/


ALTER TABLE Insurance WITH NOCHECK
ADD CONSTRAINT FK_Insurance_Patients
FOREIGN KEY (PatientID)
REFERENCES Patients (PatientID)
GO
ALTER TABLE Insurance CHECK CONSTRAINT FK_Insurance_Patients
GO


ALTER TABLE Insurance WITH NOCHECK
ADD CONSTRAINT FK_Insurance_Billings
FOREIGN KEY (BillingID)
REFERENCES Billing (BillingID)
GO
ALTER TABLE Insurance CHECK CONSTRAINT FK_Insurance_Billings
GO

/*********Billing*********/

ALTER TABLE Billing WITH NOCHECK
ADD CONSTRAINT FK_Billing_Insurance
FOREIGN KEY (InsuranceID)
REFERENCES Insurance (InsuranceID)
GO
ALTER TABLE Billing CHECK CONSTRAINT FK_Billing_Insurance
GO

/*********Medications*********/


ALTER TABLE Medications WITH NOCHECK
ADD CONSTRAINT FK_Medications_Physicians
FOREIGN KEY (PhysicianID)
REFERENCES Physicians (PhysicianID)
GO
ALTER TABLE Medications CHECK CONSTRAINT FK_Medications_Physicians
GO

/*********Proceduress*********/


ALTER TABLE Proceduress WITH NOCHECK
ADD CONSTRAINT FK_Proceduress_Physicians
FOREIGN KEY (PhysicianID)
REFERENCES Physicians (PhysicianID)
GO
ALTER TABLE Proceduress CHECK CONSTRAINT FK_Proceduress_Physicians
GO



ALTER TABLE Proceduress WITH NOCHECK
ADD CONSTRAINT FK_Proceduress_Patients
FOREIGN KEY (PatientID)
REFERENCES Patients (PatientID)
GO
ALTER TABLE Proceduress CHECK CONSTRAINT FK_Proceduress_Patients
GO

/*********PhysicianSchedules*********/


ALTER TABLE PhysicianSchedules WITH NOCHECK
ADD CONSTRAINT FK_PhysicianSchedules_Physicians
FOREIGN KEY (PhysicianID)
REFERENCES Physicians (PhysicianID)
GO
ALTER TABLE PhysicianSchedules CHECK CONSTRAINT FK_PhysicianSchedules_Physicians
GO

/********* LabResults*********/



ALTER TABLE LabResults WITH NOCHECK
ADD CONSTRAINT FK_LabResults_Patients
FOREIGN KEY (PatientID)
REFERENCES Patients (PatientID)
GO
ALTER TABLE LabResults CHECK CONSTRAINT FK_LabResults_Patients
GO



ALTER TABLE LabResults WITH NOCHECK
ADD CONSTRAINT FK_LabResults_Physicians
FOREIGN KEY (PhysicianID)
REFERENCES Physicians (PhysicianID)
GO
ALTER TABLE LabResults CHECK CONSTRAINT FK_LabResults_Physicians
GO

/*********SurgeryRoomSchedules*********/


ALTER TABLE SurgeryRoomSchedules WITH NOCHECK
ADD CONSTRAINT FK_SurgeryRoomSchedules_Admissions
FOREIGN KEY (AdmissionID)
REFERENCES Admissions (AdmissionID)
GO

ALTER TABLE SurgeryRoomSchedules CHECK CONSTRAINT FK_SurgeryRoomSchedules_Admissions
GO

/*********InpatientRoomSchedules*********/


ALTER TABLE InpatientRoomSchedules WITH NOCHECK
ADD CONSTRAINT FK_InpatientRoomSchedules_Admissions
FOREIGN KEY (AdmissionID)
REFERENCES Admissions (AdmissionID)
GO

ALTER TABLE InpatientRoomSchedules CHECK CONSTRAINT FK_InpatientRoomSchedules_Admissions
GO

/*********Physicians*********/

ALTER TABLE Physicians WITH NOCHECK
ADD CONSTRAINT FK_Physicians_Patients
FOREIGN KEY (PatientID)
REFERENCES Patients (PatientID)
GO

ALTER TABLE Physicians CHECK CONSTRAINT FK_Physicians_Patients
GO

ALTER TABLE Physicians WITH NOCHECK
ADD CONSTRAINT FK_Physicians_Proceduress
FOREIGN KEY (ProcedureID)
REFERENCES Proceduress (ProcedureID)
GO

ALTER TABLE Physicians CHECK CONSTRAINT FK_Physicians_Proceduress
GO


ALTER TABLE Physicians WITH NOCHECK
ADD CONSTRAINT FK_Physicians_Medications
FOREIGN KEY (MedicationID)
REFERENCES Medications (MedicationID)
GO

ALTER TABLE Physicians CHECK CONSTRAINT FK_Physicians_Medications
GO



ALTER TABLE Physicians WITH NOCHECK
ADD CONSTRAINT FK_Physicians_LabResults
FOREIGN KEY (LabResultID)
REFERENCES LabResults (LabResultID)
GO

ALTER TABLE Physicians CHECK CONSTRAINT FK_Physicians_LabResults
GO

ALTER TABLE Physicians WITH NOCHECK
ADD CONSTRAINT FK_Physicians_PhysicianSchedules
FOREIGN KEY (PhysicianScheduleID)
REFERENCES PhysicianSchedules (PhysicianScheduleID)
GO

ALTER TABLE Physicians CHECK CONSTRAINT FK_Physicians_PhysicianSchedules
GO


ALTER TABLE Physicians WITH NOCHECK
ADD CONSTRAINT FK_Physicians_Notes
FOREIGN KEY (PhysicianScheduleID)
REFERENCES Notes (NoteID)
GO

ALTER TABLE Physicians CHECK CONSTRAINT FK_Physicians_Notes
GO




USE master
GO
ALTER DATABASE ProjectTwo SET READ_WRITE
GO