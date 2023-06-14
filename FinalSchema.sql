USE ProjectTwo
GO

/******* People Schema (16 tables) ******/
CREATE SCHEMA People
GO

ALTER SCHEMA People TRANSFER dbo.Patients
GO
ALTER SCHEMA People TRANSFER dbo.Physicians
GO
ALTER SCHEMA People TRANSFER dbo.Nurses
GO

/******* UniversityMedicalCenter Schema (16 tables) ******/

CREATE SCHEMA UniversityMedicalCenter
GO

ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.Admissions
GO
ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.Appointments
GO
ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.Insurance
GO
ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.Billing
GO
ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.LabResults
GO
ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.Notes
GO
ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.Proceduress
GO
ALTER SCHEMA UniversityMedicalCenter TRANSFER dbo.Medications
GO

/******* Schedules Schema (16 tables) ******/
CREATE SCHEMA Schedules
GO

ALTER SCHEMA Schedules TRANSFER dbo.PhysicianSchedules
GO
ALTER SCHEMA Schedules TRANSFER dbo.InpatientRoomSchedules
GO
ALTER SCHEMA Schedules TRANSFER dbo.NurseSchedules
GO
ALTER SCHEMA Schedules TRANSFER dbo.SurgeryRoomSchedules
GO
