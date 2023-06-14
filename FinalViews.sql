USE ProjectTwo
GO
IF OBJECT_ID('DisplayDoctor') IS NOT NULL
	DROP VIEW DisplayDoctor;
GO
	CREATE VIEW DisplayDoctor WITH SCHEMABINDING
AS
	SELECT People.Patients.PatientID, People.Physicians.PhysicianID, 
		People.Patients.PatientFirstName + ' ' + People.Patients.PatientLastName AS PatientName,
		People.Physicians.PhysicianFirstName + ' ' + People.Physicians.PhysicianLastName AS Physician,
		People.Physicians.PhysicianPhone, People.Physicians.PhysicianEmail, Physicians.PhysicianSpeciality
	FROM People.Patients JOIN People.Physicians ON People.Physicians.PhysicianID = People.Patients.PhysicianID
GO


IF OBJECT_ID('PatientsWithAppointments') IS NOT NULL
	DROP VIEW PatientsWithAppointments;
GO
	CREATE VIEW PatientsWithAppointments WITH SCHEMABINDING
AS
	SELECT People.Patients.PatientID, UniversityMedicalCenter.Appointments.AppointmentID,
		   UniversityMedicalCenter.Appointments.DateAndTime, UniversityMedicalCenter.Appointments.Reason
	FROM People.Patients JOIN UniversityMedicalCenter.Appointments ON 
		 UniversityMedicalCenter.Appointments.AppointmentID = People.Patients.AppointmentID
GO


IF OBJECT_ID('PatientsWithAdmissions') IS NOT NULL
	DROP VIEW PatientsWithAdmissions;
GO
	CREATE VIEW PatientsWithAdmissions WITH SCHEMABINDING
AS
	SELECT People.Patients.PatientID, UniversityMedicalCenter.Admissions.AdmissionID,
		   UniversityMedicalCenter.Admissions.AdmissionDate, UniversityMedicalCenter.Admissions.DischargeDate, 
		   UniversityMedicalCenter.Admissions.Diagonosis,UniversityMedicalCenter.Admissions.RoomNumber
	FROM People.Patients JOIN UniversityMedicalCenter.Admissions ON
		 UniversityMedicalCenter.Admissions.AdmissionID = People.Patients.AdmissionID

GO


IF OBJECT_ID('AdmissionsWithInpatientRoomSchedules') IS NOT NULL
	DROP VIEW AdmissionsWithInpatientRoomSchedules;
GO
	CREATE VIEW AdmissionsWithInpatientRoomSchedules WITH SCHEMABINDING
AS
	SELECT UniversityMedicalCenter.Admissions.AdmissionID, Schedules.InpatientRoomSchedules.InpatientRoomScheduleID,
		   UniversityMedicalCenter.Admissions.AdmissionDate, UniversityMedicalCenter.Admissions.RoomNumber
	FROM UniversityMedicalCenter.Admissions JOIN Schedules.InpatientRoomSchedules ON 
		 Schedules.InpatientRoomSchedules.InpatientRoomScheduleID = UniversityMedicalCenter.Admissions.InpatientRoomScheduleID

GO