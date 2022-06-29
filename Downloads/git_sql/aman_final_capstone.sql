																# FINAL CAPSTONE PROJECT 

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
1. Apply appropriate normalization techniques (upto 3 NF) to divide it into multiple tables.
2. Queries :-
  A. Find the average number of medals won by each country
  B. Display the countries and the number of gold medals they have won in decreasing order
  C. Display the list of people and the medals they have won in descending order, grouped by their country.
  D. Display the list of people with the medals they have won according to their their age.
  E. Which country has won the most number of medals (cumulative).
*/
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
In the given "SUMMER OLYMPICS DATA SET", there are 10 variables and 8618 records. 
After basic cleaning of the dataset, we are left with 8613 records and 10 variables.


To check if our table is normalized, let us check normal forms.

1. First Normal form (1NF):-
Here, we check wheather each cell contains single value or not, If a table contains a  multi-valued attribute, 
it violates the First Normal Form. 

here,in this dataset variable "year" is giving us year value, and we have another variable "Date_given" which has year value as well, therefore dropping the variable "year" 
from the table is the olympic_dataset best way to satisfy 1NF.


2. Second Normal form (2NF):-
The first condition in the 2nd NF is that the table has to be in 1st NF. And the table should also not contain any partial dependency. 
Here partial dependency means that individual prime attributes (subset of candidate key) should not give any new non-prime attributes. 

In our table, each row is uniquely defined by "index" column. Thus, it is our 'primary key'.
So, "index" is our  prime attribute. While others are non prime attributes.  
And since it is the only variable which is our prime attribute, therfore all non prime attributes are derived from it. 
Therefore out table is now satisfying 2NF condition as well.


3. Third Normal form (3NF):- 
The same rule applies here as well i.e, the table has to be in 2NF before proceeding to 3NF. 
The other condition is, there should be no transitive dependency for non-prime attributes. 
It means that non-prime attributes (which are not part of candidate key) should not be dependent on other non-prime attributes in the given table.
example:- A → B and B → C (here, A is primary key) , so B is a non-prime attrinute ,but it gives another non- prime attibute C , which is a "transitive dependency".

since,here all non prime attibutes are derived from prime attibute "index", our table is not having any transitive dependency. 


Thus, our table is in already Normalized form. we can proceed to queries now.
*/

                                                                    # QUERIES #
														
USE  SAKILA;            ## DATABASE "SAKILA" ALREADY CREATED, THERFORE DIRECTLY USING IT WITH "USE" COMMAND.

## A. Find the average number of medals won by each country?
SELECT avg(total_medal),country
FROM olympic_dataset
GROUP BY country ;


## B. Display the countries and the number of gold medals they have won in decreasing order?
SELECT COUNTRY,SUM(GOLD_MEDAL) AS TOTAL_GOLD_MEDAL
FROM olympic_dataset
GROUP BY country 
ORDER BY SUM(GOLD_MEDAL) DESC;  


## C. Display the list of people and the medals they have won in descending order, grouped by their country?
SELECT NAME, COUNTRY,SUM(TOTAL_MEDAL) AS TOTAL_MEDALS_WON
FROM olympic_dataset
GROUP BY country 
ORDER BY SUM(TOTAL_MEDAL) DESC;  


## D. Display the list of people with the medals they have won according to their their age?
SELECT NAME, AGE ,SUM(TOTAL_MEDAL) AS TOTAL_MEDALS_WON
FROM olympic_dataset
GROUP BY AGE
ORDER BY SUM(TOTAL_MEDAL) DESC;  


## E. Which country has won the most number of medals (cumulative) ?
SELECT sum(total_medal),country
FROM olympic_dataset
GROUP BY country 
ORDER BY SUM(TOTAL_MEDAL) DESC;

##----------------------------------------------------------------------------------##-------------------------------------------------------------------------##