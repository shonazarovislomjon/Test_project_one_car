-- Create table
create table AS_CARS
(
  id            NUMBER not null,
  make          VARCHAR2(100) not null,
  model         VARCHAR2(100) not null,
  year_produced NUMBER,
  colour        VARCHAR2(100),
  mileage       NUMBER not null,
  vin           VARCHAR2(4000) not null,
  license_plate VARCHAR2(10) not null,
  owner_id      NUMBER not null,
  created_on    DATE not null,
  created_by    NUMBER
);
-- Create/Recreate indexes 
create unique index AS_CARS_U1 on AS_CARS (VIN);
create index AS_CARS_U2 on AS_CARS (OWNER_ID, LICENSE_PLATE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table AS_CARs add constraint PK_AS_CARS primary key (ID);
alter table AS_CARS add constraint FK1_AS_CARS_OWNER_ID foreign key (OWNER_ID)
  references AS_CLIENTS (CLIENT_ID);
