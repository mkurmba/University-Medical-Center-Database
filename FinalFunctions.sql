USE ProjectTwo

IF OBJECT_ID('fnAppointmentsThisMonth') IS NOT NULL
DROP FUNCTION fnAppointmentsThisMonth;
GO
CREATE FUNCTION fnAppointmentsThisMonth()
RETURNS TABLE
RETURN
SELECT * FROM UniversityMedicalCenter.Appointments
WHERE MONTH(UniversityMedicalCenter.Appointments.DateAndTime) = MONTH(GETDATE());
GOIF OBJECT_ID('fnLabResultsThisMonth') IS NOT NULL
DROP FUNCTION fnLabResultsThisMonth;
GO
CREATE FUNCTION fnLabResultsThisMonth()
RETURNS TABLE
RETURN
SELECT * FROM UniversityMedicalCenter.LabResults
WHERE MONTH(UniversityMedicalCenter.LabResults.TestResults) = MONTH(GETDATE());
GO



IF OBJECT_ID('fnProceduresThisMonth') IS NOT NULL
DROP FUNCTION fnProceduresThisMonth;
GO
CREATE FUNCTION fnProceduresThisMonth()
RETURNS TABLE
RETURN
SELECT * FROM UniversityMedicalCenter.Proceduress
WHERE MONTH(UniversityMedicalCenter.Proceduress.ProcedureDate) = MONTH(GETDATE());
GO




IF OBJECT_ID('fnDischargesThisMonth') IS NOT NULL
DROP FUNCTION fnDischargesThisMonth;
GO
CREATE FUNCTION fnDischargesThisMonth()
RETURNS TABLE
RETURN
SELECT * FROM UniversityMedicalCenter.Admissions
WHERE MONTH(UniversityMedicalCenter.Admissions.DischargeDate ) = MONTH(GETDATE());
GO
