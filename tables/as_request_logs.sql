-- Create table
create table AS_REQUEST_LOGS
(
  id            NUMBER not null,
  method_name   VARCHAR2(4000),
  request_id    VARCHAR2(4000),
  request_clob  CLOB,
  response      CLOB,
  error_code    VARCHAR2(4000),
  error_message VARCHAR2(4000),
  created_on    DATE,
  created_by    NUMBER
);
alter table AS_REQUEST_LOG  add constraint AS_REQUEST_LOGS_PK primary key (ID);
create index AS_REQUEST_LOGS_I1 on AS_REQUEST_LOGS (METHOD_NAME);
create index AS_REQUEST_LOGS_I2 on AS_REQUEST_LOGS (REQUEST_ID);
create index AS_REQUEST_LOGS_I3 on AS_REQUEST_LOGS (CREATED_ON);

