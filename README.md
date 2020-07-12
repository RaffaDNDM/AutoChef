# AutoChef
Creation of a Database from theorical definition to implementation, using the following steps:
1. [Requirement Analysis](https://github.com/RaffaDNDM/AutoChef/blob/master/HW1_RequirementAnalysis.pdf)
   - Analysis of all the requirements needed by the client and filtering of them. 
   - Evaluation of functional and non functional requirements.
   - Specification of which tools are going to be used to implement the final application (PostgreSQL, Java, etc.).
   - Definition of Operating Systems on which the application will be developed.
2. [ER model](https://github.com/RaffaDNDM/AutoChef/blob/master/HW2_ER_Model.pdf)
   - Definition of all the entity needed in the database with their attributes.
   - Definition of relations, made by entities.
   - Entity-Relationship Schema
   - External constraints needed in future implementation of the database.
   - Functional requirements satisfaction check.
3. [Relational model](https://github.com/RaffaDNDM/AutoChef/blob/master/HW3_RelationalModel.pdf)
   - Transformation of the Entity-Relationship Schema
   - Redundancy Analysis
   - Removal of multi-valued and composite attributes
   - Removal of IS-A Relations and Generalizations
   - Choice of principal identifiers
   - Specification of additional external constraints
   - Variation to the Data Dictionary
   - Analysis of Database Load
   - Relational Schema and its normalization
   - Data Dictionary
   - External constrains
4. [Physical Design](https://github.com/RaffaDNDM/AutoChef/blob/master/HW4_SQL%26Java.pdf)
   - Variations to the Relational Schema.
   - Physical Schema.
   - Population of Database and Trigger function.
   - Queries
   - JDBC implementation of the principal queries

### Implementation
The implementation of the database is made in PostgreSQL and its code is reported [here](https://github.com/RaffaDNDM/AutoChef/blob/master/Implementation). You can find also the implementation of the 
application layer made in Java using JDBC [here](https://github.com/RaffaDNDM/AutoChef/blob/master/Implementation/AutoChef.java).
You can also find the [presentation](https://github.com/RaffaDNDM/AutoChef/blob/master/HW4_Presentation.pptx) of all the main phases of the project.
