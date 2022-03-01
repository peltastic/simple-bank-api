DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS transfers;
DROP TABLE IF EXISTS accounts;

/*
 drop for down sql migration file deletes them from the database 
 entrie and transfers comes before accounts because of the forieign key contraints
*/