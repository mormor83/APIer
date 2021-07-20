# APIer
Scale API calls from DB using Apache NiFi

The following project is designed to be used with Apache NiFi.
it will allow you to create a scaliable system that can be used on any orginasation to run API call using Apache NiFi reading data directly from the database.

## Installation
1. Create the DB tables and SP from the SQL folder

    a. APIerStatuses

    b. APIerMethods

    c. APIer - Main table 

    d. GetAutomationAPIerData - SP to initial the DB listinig process 


2. Install Nifi 
   
   Use the official documentation at
https://nifi.apache.org/docs/nifi-docs/html/getting-started.html#downloading-and-installing-nifi to install nifi.
The Template was tested on version 1.13.2
