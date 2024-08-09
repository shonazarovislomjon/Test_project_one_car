-- Create table
create table AS_CLIENTS
(
  client_id         NUMBER not null,
  first_name        VARCHAR2(50) not null,
  last_name         VARCHAR2(50) not null,
  phone             VARCHAR2(15) not null,
  email             VARCHAR2(100) not null,
  address           VARCHAR2(200),
  registration_date DATE default SYSDATE,
  date_of_birth     DATE,
  membership_status VARCHAR2(20) not null
)
-- Create/Recreate indexes 
create unique index AS_CLIENTS_U1 on AS_CLIENTS (PHONE);
create unique index AS_CLIENTS_U2 on AS_CLIENTS (EMAIL);
-- Create/Recreate primary, unique and foreign key constraints 
alter table AS_CLIENTS add constraint PK_AS_CLIENTS primary key (CLIENT_ID);
