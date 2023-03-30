# Question 1

Determine the highest normal form of this relation scheme.
The relation scheme student Performance `(StudentName, CourseNo, EnrollmentNo, Grade)`  
has the following functional dependencies:
StudentName, courseNo → grade  
EnrollmentNo, courseNo → grade  
StudentName →EnrollmentNo  
EnrollmentNo →StudentName

### Answer

`{CourseNo, StudentName}+ -> { CourseNo, StudentName, EntrollmentNo, Grade }`
`{EntrollmentNo, CourseNo}+ -> {EntrollmentNo, CourseNo, StudentName, Grade }`

Candidate key = `{ {CourseNo, StudentName}, {CourseNo, EntrollmentNo} }`

prime attribute = `{ CourseNo, StudentName, EntrollmentNo }`

non-prime attribute = `{ Grade }`

Since, {CourseNo, StudentName} and {EnrollmentNo,CourseNo} are super key hence the first two relations are in BCNF
The 3rd and 4th relation has `StudentName →EnrollmentNo , EnrollmentNo →StudentName` have prime attributes StudentName
and EnrollmentNo in the RHS thus the functional dependency is preserved and it is in 3NF (Prime attributes depending on Prime).


# Question2

### Answer