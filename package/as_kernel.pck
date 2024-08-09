CREATE OR REPLACE PACKAGE As_Kernel IS

  -- Author  : ISLOMJON.SH
  -- Created : 01.08.2024 13:35:03
  -- Purpose : Пакет для ядровых методов

  ----------------------------------------------------------------------------------
  -- Процедура для создание таксков 
  ----------------------------------------------------------------------------------
  PROCEDURE Create_Tasks(i_Vehicle_Id        NUMBER,
                         i_Service_Ids_Array Array_Number,
                         i_Emp_Ids_Array     Array_Number,
                         i_Start_Time        DATE,
                         i_Comment           VARCHAR2,
                         i_Ammounts_Array    Array_Number,
                         o_Taks_Uid          OUT NUMBER);
  ----------------------------------------------------------------------------------
  -- Процедура для cохранения запросов  (логирование)
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Logs(i_Request_Id    VARCHAR2,
                      i_Method_Name   VARCHAR2,
                      i_Request       CLOB,
                      i_Response      CLOB,
                      i_Error_Code    VARCHAR2,
                      i_Error_Message VARCHAR2,
                      i_Created_By    NUMBER);
  ----------------------------------------------------------------------------------
  -- Процедура для обновления статусов таксков 
  ----------------------------------------------------------------------------------
  PROCEDURE Update_Tasks_State(i_Task_State     NUMBER,
                               i_Task_Ids_Array Array_Number);
  ----------------------------------------------------------------------------------
  -- Процедура для сохранения клиентов  
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Client(i_First_Name        VARCHAR2,
                        i_Last_Name         VARCHAR2,
                        i_Phone             VARCHAR2,
                        i_Email             VARCHAR2,
                        i_Address           VARCHAR2,
                        i_Registration_Date DATE,
                        i_Date_Of_Birth     DATE);
  ----------------------------------------------------------------------------------
  -- Процедура для сохранения автомобилей  
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Car(i_Make          VARCHAR2,
                     i_Model         VARCHAR2,
                     i_Year_Produced NUMBER,
                     i_Colour        VARCHAR2,
                     i_Mileage       NUMBER,
                     i_Vin           VARCHAR2,
                     i_License_Plate VARCHAR2,
                     i_Owner_Id      VARCHAR2,
                     i_User_Id       NUMBER);
  ----------------------------------------------------------------------------------
  -- Процедура для учёта зап частей по таскам 
  ----------------------------------------------------------------------------------
  PROCEDURE Add_Spare_Parts_To_Task(i_Part_Id  NUMBER,
                                    i_Task_Id  NUMBER,
                                    i_Quantity NUMBER,
                                    i_Task_Uid NUMBER);

END As_Kernel;
/
CREATE OR REPLACE PACKAGE BODY As_Kernel IS

  ----------------------------------------------------------------------------------
  -- Процедура для создание таксков 
  ----------------------------------------------------------------------------------
  PROCEDURE Create_Tasks(i_Vehicle_Id        NUMBER,
                         i_Service_Ids_Array Array_Number,
                         i_Emp_Ids_Array     Array_Number,
                         i_Start_Time        DATE,
                         i_Comment           VARCHAR2,
                         i_Ammounts_Array    Array_Number,
                         o_Taks_Uid          OUT NUMBER) IS
    v_Task_Uid NUMBER := As_Tasks_Uid_Sq.Nextval; -- это на случай если клиент попросит несколько задач по 1 автомобилю
  BEGIN
    FOR i IN i_Service_Ids_Array.First .. i_Service_Ids_Array.Last
    LOOP
      INSERT INTO As_Tasks
        (Task_Id,
         Task_Uid,
         Vehicle_Id,
         Service_Id,
         Employee_Id,
         Task_State_Id,
         Start_Time,
         End_Time,
         Comments,
         Ammount)
      VALUES
        (As_Tasks_Sq.Nextval,
         v_Task_Uid,
         i_Vehicle_Id,
         i_Service_Ids_Array(i),
         i_Emp_Ids_Array(i),
         As_Consts.с_Task_State_Created,
         i_Start_Time,
         NULL,
         i_Comment,
         i_Ammounts_Array(i));
    END LOOP;
    o_Taks_Uid := v_Task_Uid;
  EXCEPTION
    WHEN OTHERS THEN
      Raise_Error(-20000,
                  'Ошибка в Create_Tasks ' || SQLERRM || ' ' || Dbms_Utility.Format_Error_Backtrace);
  END Create_Tasks;
  ----------------------------------------------------------------------------------
  -- Процедура для cохранения запросов (логирование)
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Logs(i_Request_Id    VARCHAR2,
                      i_Method_Name   VARCHAR2,
                      i_Request       CLOB,
                      i_Response      CLOB,
                      i_Error_Code    VARCHAR2,
                      i_Error_Message VARCHAR2,
                      i_Created_By    NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    INSERT INTO As_Request_Logs
      (Id,
       Method_Name,
       Request_Id,
       Request_Clob,
       Response,
       ERROR_CODE,
       Error_Message,
       Created_On,
       Created_By)
    VALUES
      (As_Request_Logs_Sq.Nextval,
       i_Method_Name,
       i_Request_Id,
       i_Request,
       i_Response,
       i_Error_Code,
       i_Error_Message,
       SYSDATE,
       i_Created_By);
    COMMIT;
  END Save_Logs;
  ----------------------------------------------------------------------------------
  -- Процедура для обновления статусов таксков 
  ----------------------------------------------------------------------------------
  PROCEDURE Update_Tasks_State(i_Task_State     NUMBER,
                               i_Task_Ids_Array Array_Number) IS
  BEGIN
    UPDATE As_Tasks g
       SET g.Task_State_Id = i_Task_State,
           g.End_Time = CASE
                          WHEN i_Task_State = As_Consts.с_Task_State_Closed THEN
                           SYSDATE
                          ELSE
                           NULL
                        END
     WHERE g.Task_Id MEMBER OF i_Task_Ids_Array;
  EXCEPTION
    WHEN OTHERS THEN
      Raise_Error(-20000,
                  'Ошибка в Update_Tasks_State ' || SQLERRM || ' ' ||
                  Dbms_Utility.Format_Error_Backtrace);
  END Update_Tasks_State;
  ----------------------------------------------------------------------------------
  -- Процедура для сохранения клиентов  
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Client(i_First_Name        VARCHAR2,
                        i_Last_Name         VARCHAR2,
                        i_Phone             VARCHAR2,
                        i_Email             VARCHAR2,
                        i_Address           VARCHAR2,
                        i_Registration_Date DATE,
                        i_Date_Of_Birth     DATE) IS
  BEGIN
    INSERT INTO As_Clients
      (Client_Id,
       First_Name,
       Last_Name,
       Phone,
       Email,
       Address,
       Registration_Date,
       Date_Of_Birth,
       Membership_Status)
    VALUES
      (As_Clients_Sq.Nextval,
       i_First_Name,
       i_Last_Name,
       i_Phone,
       i_Email,
       i_Address,
       i_Registration_Date,
       i_Date_Of_Birth,
       'A');
  EXCEPTION
    WHEN OTHERS THEN
      Raise_Error(-20000,
                  'Ошибка в Save_Client ' || SQLERRM || ' ' || Dbms_Utility.Format_Error_Backtrace);
  END Save_Client;
  ----------------------------------------------------------------------------------
  -- Процедура для сохранения автомобилей  
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Car(i_Make          VARCHAR2,
                     i_Model         VARCHAR2,
                     i_Year_Produced NUMBER,
                     i_Colour        VARCHAR2,
                     i_Mileage       NUMBER,
                     i_Vin           VARCHAR2,
                     i_License_Plate VARCHAR2,
                     i_Owner_Id      VARCHAR2,
                     i_User_Id       NUMBER) IS
  BEGIN
    INSERT INTO As_Cars
      (Id,
       Make,
       Model,
       Year_Produced,
       Colour,
       Mileage,
       Vin,
       License_Plate,
       Owner_Id,
       Created_On,
       Created_By)
    VALUES
      (As_Cars_Sq.Nextval,
       i_Make,
       i_Model,
       i_Year_Produced,
       i_Colour,
       i_Mileage,
       i_Vin,
       i_License_Plate,
       i_Owner_Id,
       SYSDATE,
       i_User_Id);
  END;
  ----------------------------------------------------------------------------------
  -- Процедура для учёта зап частей по таскам 
  ----------------------------------------------------------------------------------
  PROCEDURE Add_Spare_Parts_To_Task(i_Part_Id  NUMBER,
                                    i_Task_Id  NUMBER,
                                    i_Quantity NUMBER,
                                    i_Task_Uid NUMBER) IS
  BEGIN
    INSERT INTO As_Task_Spare_Parts
      (Id, Part_Id, Task_Id, Quantity, Task_Uid)
    VALUES
      (As_Task_Spare_Parts_Sq.Nextval, i_Part_Id, i_Task_Id, i_Quantity, i_Task_Uid);
  
    -- Уменьшаем остаток на складе 
    UPDATE As_Spare_Parts g
       SET g.Stock_Quantity =
           (g.Stock_Quantity - i_Quantity)
     WHERE g.Part_Id = i_Part_Id;
  END;

END As_Kernel;
/
