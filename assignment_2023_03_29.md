# Question 1 What is the main difference between SQL and NoSQL databases?

#### Answer

Sql is structured database in which values and variables 
has a realtionship between them
NOSQL is a unstructed database 
Vertical scaling is done in SQl 
Horizonatal scaling is done in NOSQL
Sql follows ACID properties
NOSQL follows CAP theorem

# Question 2 What are some of the benefits of using NoSQL databases over traditional SQL databases?

#### Answer 
Nosql database are easy to maintaain and are accessed very fast since the datas can be fetched easily.
Nosql database are highly scalable as horizontal scaling can be used in which we can increase the amount of servers to allocate more data.
Since there are no realtions within schemas or no creation of table is needed like sql database , NOSQL database are easily customisable and maintainable

# Question 4 What are the four main types of NoSQL databases, and what are their key characteristics?

#### Answer 
* Coloumn-oriented - Here the data is stored in coloumn like fashion one tuple after another in same coloumn unlike the 
traditional row orientation.
* key-value database - Here the data is stored in key value pair, for each particular key of data there is a value 
* Document database - In this type of model the data is stored in document format like the json , bson xml formats in which the single databse can have multiple data types.
* Graph database - All the sets of data is related to other sets of data through different nodes like a graph. In which retrieving of information becomes easy. Redisgraph, Neo4j are few of the examples of graph database.

# Question 5 What is the CAP theorem, and how does it relate to distributed systems?

#### Answer 
CAP theorem is consistency,availabity and partition, and it states that the distributed system can deliver any two of the above characteristics. So, database system gives priority to two of the CAP process at a time.

# Question 6 What are the three properties of the CAP theorem?

#### Answer

* Consistency - It refers that all the data that client views must be identical, irrespective of the nodes that they are in. Data must be replicated to all other nodes.
* Availability - Even if few systems are unavailable ,it ensures that all the clients must recieve response when they request acces for it.
* Partition tolerance - Even if there is failure in one or many nodes which creates a partition where the nodes are only able to communicate with each other , the system still continues to work.

# Question 7 What are the BASE properties, and how do they relate to the CAP theorem?

#### Answer

BASE properties are for NOSQL which are like ACID properties in SQL which provides easy manioulation of data. It means,
* Basically available - The NOSQL database makes the data available across all nodes and not immediately consistent.
* Soft-state - The data can get changed since data is not immediate consistent in BASE properties and this results in inconsistent for a particular time.
* Eventually-consistent - The data will be consistent at some later point of time but without any guarantee.

In CAP thoerem also the data can be either consistent or available same as in BASE where their is inconsistency in data and delay in availabilty of data.

