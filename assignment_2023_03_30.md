# Question 1 What are the main features of redis?

#### Answer 

* Data structures flexibility - lists, sets , hashes ,strings and many more ways of storing data the redis has very flexible way of storing datas thorugh data structures unlike other database where data are generally stored in key value system.
* Performance - All of the data that redis has is in its memory which results in high access of data thus speed of operation increases and the performance increases 
* Scalability - redis can be scaled horizonatally and vertically and is available across 
* Simplicity - Redis supports variety of language such as c/c++,java, javscript, ruby ,python etc.

# Question 2 Write down the limitations of redis?

#### Answer 
* Redis has in memory storage hence all the data must be limited to that storage space only.
* Redis is single threaded and hence cannot use the power of multi-core processors which could have speed up the processing.

# Question 3 Perform a basic CRUD operation using redis

#### Answer 

`Create key
SET name 'new file'
GET name
Read key

GET name
Update key

SET name 'another file'
DEL name
DEL key
`


# Question 4 Explain TTL command with an example.

#### Answer 

TTL is time to leave, this sets the time or the seconds after which a key will be deleted.
Example - 
SET name 'abc'
GET name
"abc"
TTL name
(integer) -1
SET name "bcd" EX 10
TTL name
(integer) 6

# Question 5
Create a transaction in redis to perform the following operations.
Create two keys in a single line and one key differently. (one value should be number)
Read any two value in a single line
Increment the number value
Expire any two keys after some time

#### Answer

MULTI
MSET name "abc" roll 2
MGET name toll
INCR roll
EXPIRE name 5
EXPIRE roll 5
EXEC
