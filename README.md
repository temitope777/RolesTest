Introduction

This is the AWS Roles and IAM test
The tasks have been broken down into Modules for reusability

For ease of operation using CICD Pipeline, a MakeFile using bash is attached

Assumption
It is assumed that a secret_string with the name testkey is stored in the secret manager to be used 
as external id 

Pre-requisite
1. Replace variable account_id with the targeted account
2. make sure that your aws credentials are set up

Procedure

There are two ways the IAC code could be run to simulate real life scenario
1. you can run 'make create-all' assuming there are no infrastructures at all ( the user groups are not yet created)
2. you can run the IAC in order
Run the make file in this order - 
 a. create the groups by running 'make create-group'
 b. create either the internal user by running 'make create-internal-users' or the external user by running 'make 
 create-external-users'
 
Notes:
 
 The user details including their departments to be created have been passed in through -var map variable
 in the command line in a real life CICD scenario, this could be read from 
 a secured file storage with awk or sed and still fed in the 
 
 the created IAM User has been added to a membership group to simulate real life scenarion
 the membership groups have permissions policy attached 
 
 options to apply the output plan 
 restricting access based on environment tag - other means of separation could be used too - vpc, separate region, etc