create database NaijaClinics;
use NaijaClinics;

create table Patients (
PatientId int auto_increment primary key,
FullName varchar (100) not null,
PhoneNumber varchar(15) unique not null,
Age int not null,
Gender enum('Male', 'Female') not null,
Address varchar(200),
KinPhone varchar(15),
CreatedAt timestamp default current_timestamp
);

create table Doctors (
DoctorId int auto_increment primary key,
FullName varchar (100) not null,
Department varchar(50) not null,
PhoneNumber varchar(15) unique not null,
ConsultationFee decimal (8,2) not null,
Available enum('Available', 'Not Available') default 'Available'
);

create table Appointments (
AppointmentId int auto_increment primary key,
PatientId int not null,
DoctorId int not null,
AppointmentDate date not null,
AppointmentTime time not null,
status enum('Pending', 'Confirmed', 'Completed', 'Cancelled') default 'Pending',
Complaint text not null,
AmountPaid decimal (10,2) default 0,
PaymentStatus enum('Paid', 'Not Paid', 'Part Payment') default 'Not Paid',
CreatedAt timestamp default current_timestamp,
foreign key (PatientId) references Patients(PatientId),
foreign key (DoctorId) references Doctors(DoctorId)
);

create table Treatments (
TreatmentId int auto_increment primary key,
AppointmentId int not null,
Diagnosis text,
Prescription text,
LabTests text,
Notes text,
FollowUpDate date,
foreign key (AppointmentId) references Appointments(AppointmentId)
);

insert into Patients (FullName, PhoneNumber, Age, Gender, Address, KinPhone) values
('John Lael Blessing OmitewnOjo', '08106476062', '32', 'Female', 'House 116, Gwarimpa, Abuja, Nigeria','08082343115'),
('John Gracious Ayomide', '08106476063', '34', 'Female', 'Plot 8, Television, Kaduna, Nigeria', '08082343116'),
('Abraham Maverick Onyemaechi', '08106476064', '30', 'Male', 'No 6, Ikeja, Lagos, Nigeria', '08082343117');

insert into Doctors (FullName, Department, PhoneNumber, ConsultationFee) values
('Dr. Chukwudi Clinton', 'Physiotherapy', '08106476065', 15000.00),
('Dr. Ademola Olaolu', 'Maternity', '08106476066', 20000.00),
('Dr. Ibrahim Qudeerat', 'General', '08106476067', 25000.00);

insert into Appointments (PatientId, DoctorId, AppointmentDate, AppointmentTime, Complaint, AmountPaid, PaymentStatus) values
('1', '1', '2025-09-20', '09:00:15', 'Wrist Pain', 15000.00, 'Paid'),
('2', '2', '2025-09-22', '07:27:09', 'Pregnancy CheckUp', 20000.00, 'Part Payment'),
('3', '3', '2025-09-22', '02:00:46', 'Malaria and Fever', 25000.00, 'Paid');

insert into Treatments (AppointmentId, Diagnosis, Prescription, LabTests) values
('1', 'Carpal Tunnel Syndrome', 'Nerve and tendon gliding exercises to ensure full, unrestricted mobility of these structures.', 'MRI, X-ray'),
('2', 'Pregnancy, 4 Months', 'Folic Acid 5mg daily x2/52, Ferrous Sulphate', 'UltraSound Scan'),
('2', 'Malaria Fever', 'IM Artemether 80mg 2x daily x3/7, Paracetamol 500mg 3x daily x3/7', 'Malaria Test, Full Blood Count');