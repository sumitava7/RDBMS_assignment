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
So, the highest normal form of the relation is 3NF.


# Question2

Suppose you are given a relation R= (A, B, C, D, E ) with the following functional  
dependencies:{CE →D, D→B, C →A}
a. Find all candidate keys.
b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).
c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a  
new relation, decompose and re-compute the keys and the normal forms they satisfy.

### Answer

#### a
Closure of `CE = {C,E,D,B,A}` hence the candiate key is `CE`. Prime attribute are `{C,E}` and Non-Prime are `{D,B,A}`.

#### b

The relation CE->D is in BCNF as the CE is candidate key so any attribute depending on C.K the form is BCNF.
The realtion D->B is in 1NF as D and B both are non-prime, so non-prime depending on non-prime gives 1NF form.
The relation C->A is in 2NF as C is a component of candidate key and is prime also the A is non-prime.

#### c

The relation ABCDE can be broke into 2 tables CEDB and CA since CA is in 2NF and has `C->A` as f.d which result in BCNF form of this table so we kept it in separate table 
CEDB can be decomposed into tables CED and DB having f.d's `CE->D` and `D->B` respetively. This will result in the realtion 
in being BCNF form.


# Question 3

You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):
F={ABC →D, ABD→E,CD→F,CDF →B,BF →D}
a. Find all keys of R based on these functional dependencies.
b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers.

#### Answer

Closure of `ABC -> {A,B,C,D,F,E}` and of `ACD->{A,C,D,F,B,E}` 
So, candidate keys are ABC and ACD. Prime attributes are `{ABCD}` and non-prime attributes are `{E,F}`
The realtion ABC->D is in BCNF 
ABD->E is in BCNF
CD->F in 1NF as F is non-prime attribute and CD is a part of candidate key
CDF->B is in 3NF since B is prime attribute which is depending on CDF
BF->D is also in 3NF since D is also prime.

# Question 4

Write the advantages and disadvantages of normalization.

#### Answer

Advantages of Normalization
* Reduces the redundancy of the data as they split the data in different tables which decreases duplicate data from table
* Helps to increase the data integrity while updation, insertion or deletion operation which decreases the loss of data from the table

Disadvantages of Normalization
* Complexity increases as the relation of the tables and the number of tables increases 
* It decreases the speed of operation on tables such as updation, deletion, or insetion of data.

# Question 5

Determine the decomposition.
Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.  
Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅.

#### Answer


All the f.d's of the relation R are in BCNF form since S,T,U,V all are candidate keys 
Hence, we can decompose the table R(S,T,U,V) in two tables R1(S,T,U) and R2(U,V) which also satisfies R1 ∩ R2 ≠ ∅ as there is common attribute between R1 and R2 which is U.