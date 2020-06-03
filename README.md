## Bookmark Manager
Pairing with Sophie B
<br>
First user story:

```
As a user
So that I can view a list of useful websites
I want to be shown a list of bookmarks
```
<br><br>

Domain model for first user story:
<p align="center">
<img src=/images/Updated_1stDomain_Model.png width=60%>
</p>

### SQL instructions used to create bookmark_manager database

1. Connect to psql
2. Create a database: CREATE DATABASE "bookmark_manager";
3. Connect to the database: \c bookmark_manager;
4. Create table: run query we have saved in file 01_create_bookmarks_table.sql

### Initial table:

 id |                url                
----+-----------------------------------
  1 | http://www.makersacademy.com
  3 | http://www.google.com
  2 | http://www.destroyallsoftware.com