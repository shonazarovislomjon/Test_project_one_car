-- Create table
create table AS_TASKS
(
  task_id       NUMBER not null,
  task_uid      NUMBER not null,
  vehicle_id    NUMBER not null,
  service_id    NUMBER not null,
  employee_id   NUMBER not null,
  task_state_id NUMBER,
  start_time    DATE,
  end_time      DATE,
  comments      VARCHAR2(500),
  ammount       NUMBER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table AS_TASKS add primary key (TASK_ID);
alter table AS_TASKS  add foreign key (VEHICLE_ID)  references AS_CARS (ID);
alter table AS_TASKS  add foreign key (SERVICE_ID)  references AS_SERVICES (SERVICE_ID);
alter table AS_TASKS  add foreign key (EMPLOYEE_ID)  references AS_EMPLOYEES (EMPLOYEE_ID);
alter table AS_TASKS  add foreign key (TASK_STATE_ID)  references AS_S_TASK_STATES (TASK_STATE_ID);
