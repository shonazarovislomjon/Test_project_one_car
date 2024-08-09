CREATE OR REPLACE PACKAGE As_Api IS

  -- Author  : ISLOMJON.SH
  -- Created : 01.08.2024 13:34:49
  -- Purpose : Пакет для работы с внешними сервисами 

  ----------------------------------------------------------------------------------
  -- Метод для вызова по cохранению клиентов 
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Client(i_Request_Id    VARCHAR2,
                        i_User_Id       NUMBER,
                        i_Request       CLOB,
                        o_Response      OUT CLOB,
                        o_Error_Code    OUT VARCHAR2,
                        o_Error_Message OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Метод для вызова по cохранению клиентов 
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Car(i_Request_Id    VARCHAR2,
                     i_User_Id       NUMBER,
                     i_Request       CLOB,
                     o_Response      OUT CLOB,
                     o_Error_Code    OUT VARCHAR2,
                     o_Error_Message OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Метод для вызова по созданию тасков 
  ----------------------------------------------------------------------------------
  PROCEDURE Create_Tasks(i_Request_Id    VARCHAR2,
                         i_User_Id       NUMBER,
                         i_Request       CLOB,
                         o_Response      OUT CLOB,
                         o_Error_Code    OUT VARCHAR2,
                         o_Error_Message OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Метод для вызова по созданию тасков 
  ----------------------------------------------------------------------------------
  PROCEDURE Update_Tasks(i_Request_Id    VARCHAR2,
                         i_User_Id       NUMBER,
                         i_Request       CLOB,
                         o_Error_Code    OUT VARCHAR2,
                         o_Error_Message OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Метод для учёта использованных зап частей по таскам 
  ----------------------------------------------------------------------------------
  PROCEDURE Add_Spare_Part_To_Task(i_Request_Id    VARCHAR2,
                                   i_User_Id       NUMBER,
                                   i_Request       CLOB,
                                   o_Error_Code    OUT VARCHAR2,
                                   o_Error_Message OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о статусе тасков возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Task_States(o_Error_Message OUT VARCHAR2,
                            o_Error_Code    OUT VARCHAR2,
                            o_Result_Cursor OUT SYS_REFCURSOR);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о деталях тасков возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Task_Details(i_Task_Uid      NUMBER,
                             o_Error_Message OUT VARCHAR2,
                             o_Error_Code    OUT VARCHAR2,
                             o_Result        OUT CLOB);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации об услугах возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Services(o_Error_Message OUT VARCHAR2,
                         o_Error_Code    OUT VARCHAR2,
                         o_Result_Cursor OUT SYS_REFCURSOR);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о cотрудниках сервиса возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Employees(i_First_Name    VARCHAR2,
                          i_Last_Name     VARCHAR2,
                          i_Phone         VARCHAR2,
                          o_Error_Message OUT VARCHAR2,
                          o_Error_Code    OUT VARCHAR2,
                          o_Result_Cursor OUT SYS_REFCURSOR);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о клиентах возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Client(i_First_Name    VARCHAR2,
                       i_Last_Name     VARCHAR2,
                       i_Phone         VARCHAR2,
                       o_Error_Message OUT VARCHAR2,
                       o_Error_Code    OUT VARCHAR2,
                       o_Result_Cursor OUT SYS_REFCURSOR);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации об зарегистрированных автомобилях возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Car(i_Vin           VARCHAR2,
                    i_License_Plate VARCHAR2,
                    i_Owner_Id      NUMBER,
                    o_Error_Message OUT VARCHAR2,
                    o_Error_Code    OUT VARCHAR2,
                    o_Result_Cursor OUT SYS_REFCURSOR);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о производителях автомобиля  возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Vehicle_Make(o_Error_Message OUT VARCHAR2,
                             o_Error_Code    OUT VARCHAR2,
                             o_Result_Cursor OUT SYS_REFCURSOR);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о моделях автомобилей  возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Vehicle_Model(o_Error_Message OUT VARCHAR2,
                              o_Error_Code    OUT VARCHAR2,
                              o_Result_Cursor OUT SYS_REFCURSOR);
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о учёте зап частей  возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Spare_Parts(o_Error_Message OUT VARCHAR2,
                            o_Error_Code    OUT VARCHAR2,
                            o_Result_Cursor OUT SYS_REFCURSOR);

END As_Api;
/
CREATE OR REPLACE PACKAGE BODY As_Api IS

  ----------------------------------------------------------------------------------
  -- Метод для вызова по cохранению клиентов 
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Client(i_Request_Id    VARCHAR2,
                        i_User_Id       NUMBER,
                        i_Request       CLOB,
                        o_Response      OUT CLOB,
                        o_Error_Code    OUT VARCHAR2,
                        o_Error_Message OUT VARCHAR2) IS
    -- здесь используется свой кастомный тип для работы с JSON (к сожелению не могу им поделится)
    v_Request_Hash Hashmap := Hashmap();
  BEGIN
    -- Парсим JSON через кастомный парсер ( можно было использовать оракловый )
    Json_Parser.Parse_Json(i_Request, v_Request_Hash);
    -- валидация значений 
    As_Check.Check_Client_Params(i_First_Name    => v_Request_Hash.Get_Optional_Varchar2('First_Name'),
                                 i_Last_Name     => v_Request_Hash.Get_Optional_Varchar2('Last_Name'),
                                 i_Phone         => v_Request_Hash.Get_Optional_Varchar2('Phone'),
                                 i_Email         => v_Request_Hash.Get_Optional_Varchar2('Email'),
                                 i_Address       => v_Request_Hash.Get_Optional_Varchar2('Address'),
                                 i_Date_Of_Birth => v_Request_Hash.Get_Optional_Date('Date_Of_Birth'),
                                 o_Error_Code    => o_Error_Code,
                                 o_Error_Message => o_Error_Message);
    IF o_Error_Code IS NOT NULL THEN
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => o_Response,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
      RETURN;
    END IF;
    -- вызов метода 
    As_Kernel.Save_Client(i_First_Name        => v_Request_Hash.Get_Optional_Varchar2('First_Name'),
                          i_Last_Name         => v_Request_Hash.Get_Optional_Varchar2('Last_Name'),
                          i_Phone             => v_Request_Hash.Get_Optional_Varchar2('Phone'),
                          i_Email             => v_Request_Hash.Get_Optional_Varchar2('Email'),
                          i_Address           => v_Request_Hash.Get_Optional_Varchar2('Address'),
                          i_Registration_Date => v_Request_Hash.Get_Optional_Date('Registration_Date'),
                          i_Date_Of_Birth     => v_Request_Hash.Get_Optional_Date('Date_Of_Birth'));
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
    -- логирование 
    As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                        i_Method_Name   => $$PLSQL_UNIT,
                        i_Request       => i_Request,
                        i_Response      => o_Response,
                        i_Error_Code    => o_Error_Code,
                        i_Error_Message => o_Error_Message,
                        i_Created_By    => i_User_Id);
  
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => o_Response,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
  END Save_Client;
  ----------------------------------------------------------------------------------
  -- Метод для вызова по cохранению клиентов 
  ----------------------------------------------------------------------------------
  PROCEDURE Save_Car(i_Request_Id    VARCHAR2,
                     i_User_Id       NUMBER,
                     i_Request       CLOB,
                     o_Response      OUT CLOB,
                     o_Error_Code    OUT VARCHAR2,
                     o_Error_Message OUT VARCHAR2) IS
    -- здесь используется свой кастомный тип для работы с JSON (к сожелению не могу им поделится)
    v_Request_Hash Hashmap := Hashmap();
  BEGIN
    -- Парсим JSON через кастомный парсер ( можно было использовать оракловый )
    Json_Parser.Parse_Json(i_Request, v_Request_Hash);
    -- валидация значений 
    As_Check.Check_Car_Params(i_Make          => v_Request_Hash.Get_Varchar2('Make'),
                              i_Model         => v_Request_Hash.Get_Varchar2('Model'),
                              i_Mileage       => v_Request_Hash.Get_Number('Mileage'),
                              i_Vin           => v_Request_Hash.Get_Varchar2('Vin'),
                              i_License_Plate => v_Request_Hash.Get_Varchar2('License_Plate'),
                              i_Owner_Id      => v_Request_Hash.Get_Varchar2('Owner_Id'),
                              o_Error_Code    => o_Error_Code,
                              o_Error_Message => o_Error_Message);
    IF o_Error_Code IS NOT NULL THEN
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => o_Response,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
      RETURN;
    END IF;
    -- вызов метода 
    As_Kernel.Save_Car(i_Make          => v_Request_Hash.Get_Varchar2('Make'),
                       i_Model         => v_Request_Hash.Get_Varchar2('Model'),
                       i_Year_Produced => v_Request_Hash.Get_Number('Year_Produced'),
                       i_Colour        => v_Request_Hash.Get_Varchar2('Colour'),
                       i_Mileage       => v_Request_Hash.Get_Number('Mileage'),
                       i_Vin           => v_Request_Hash.Get_Varchar2('Vin'),
                       i_License_Plate => v_Request_Hash.Get_Varchar2('License_Plate'),
                       i_Owner_Id      => v_Request_Hash.Get_Varchar2('Owner_Id'),
                       i_User_Id       => v_Request_Hash.Get_Varchar2('User_Id'));
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
    -- логирование 
    As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                        i_Method_Name   => $$PLSQL_UNIT,
                        i_Request       => i_Request,
                        i_Response      => o_Response,
                        i_Error_Code    => o_Error_Code,
                        i_Error_Message => o_Error_Message,
                        i_Created_By    => i_User_Id);
  
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => o_Response,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
  END Save_Car;
  ----------------------------------------------------------------------------------
  -- Метод для вызова по созданию тасков 
  ----------------------------------------------------------------------------------
  PROCEDURE Create_Tasks(i_Request_Id    VARCHAR2,
                         i_User_Id       NUMBER,
                         i_Request       CLOB,
                         o_Response      OUT CLOB,
                         o_Error_Code    OUT VARCHAR2,
                         o_Error_Message OUT VARCHAR2) IS
    v_Task_Uid NUMBER;
    -- здесь используется свой кастомный тип для работы с JSON (к сожелению не могу им поделится)
    v_Request_Hash  Hashmap := Hashmap();
    v_Response_Hash Hashmap := Hashmap();
  BEGIN
  
    -- Парсим JSON через кастомный парсер ( можно было использовать оракловый )
    Json_Parser.Parse_Json(i_Request, v_Request_Hash);
    -- валидация значений 
    As_Check.Check_Params_Of_Tasks(i_Vehicle_Id        => v_Request_Hash.Get_Number('Vehicle_Id'),
                                   i_Service_Ids_Array => v_Request_Hash.Get_Array_Number('Service_Ids_Array'),
                                   i_Emp_Ids_Array     => v_Request_Hash.Get_Array_Number('Emp_Ids_Array'),
                                   i_Ammounts_Array    => v_Request_Hash.Get_Array_Number('Ammounts_Array'),
                                   o_Error_Code        => o_Error_Code,
                                   o_Error_Message     => o_Error_Message);
    IF o_Error_Code IS NOT NULL THEN
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => o_Response,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
      RETURN;
    END IF;
    -- вызов метода 
    As_Kernel.Create_Tasks(i_Vehicle_Id        => v_Request_Hash.Get_Number('Vehicle_Id'),
                           i_Service_Ids_Array => v_Request_Hash.Get_Array_Number('Service_Ids_Array'),
                           i_Emp_Ids_Array     => v_Request_Hash.Get_Array_Number('Emp_Ids_Array'),
                           i_Start_Time        => v_Request_Hash.Get_Date('Start_Time'),
                           i_Comment           => v_Request_Hash.Get_Optional_Varchar2('Comment'),
                           i_Ammounts_Array    => v_Request_Hash.Get_Array_Number('Ammounts_Array'),
                           o_Taks_Uid          => v_Task_Uid);
    -- При успешном ответе от процедуры 
    v_Response_Hash.Put('Task_Uid', v_Task_Uid);
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
    -- так же возвращаем json c task_uid для дальнейшего использования 
    o_Response := v_Response_Hash.Json;
    -- логирование 
    As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                        i_Method_Name   => $$PLSQL_UNIT,
                        i_Request       => i_Request,
                        i_Response      => o_Response,
                        i_Error_Code    => o_Error_Code,
                        i_Error_Message => o_Error_Message,
                        i_Created_By    => i_User_Id);
  
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => o_Response,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
  END Create_Tasks;
  ----------------------------------------------------------------------------------
  -- Метод для вызова по созданию тасков 
  ----------------------------------------------------------------------------------
  PROCEDURE Update_Tasks(i_Request_Id    VARCHAR2,
                         i_User_Id       NUMBER,
                         i_Request       CLOB,
                         o_Error_Code    OUT VARCHAR2,
                         o_Error_Message OUT VARCHAR2) IS
    -- здесь используется свой кастомный тип для работы с JSON (к сожелению не могу им поделится)
    v_Request_Hash      Hashmap := Hashmap();
    v_Service_Ids_Array Array_Number := Array_Number();
  BEGIN
    -- Парсим JSON через кастомный парсер ( можно было использовать оракловый )
    Json_Parser.Parse_Json(i_Request, v_Request_Hash);
    v_Service_Ids_Array := v_Request_Hash.Get_Array_Number('Service_Ids_Array');
  
    -- вызов метода 
    As_Kernel.Update_Tasks_State(i_Task_State     => v_Request_Hash.Get_Number('Task_State'),
                                 i_Task_Ids_Array => v_Service_Ids_Array);
  
    -- Отправка запроса ( для мобилки например ) если таска по ид готова к сдаче клиенту
    IF v_Request_Hash.Get_Number('Task_State') = As_Consts.с_Task_State_Ready THEN
      FOR i IN v_Service_Ids_Array.First .. v_Service_Ids_Array.Last
      LOOP
        As_Http.Send_Task_Ready_Request(v_Service_Ids_Array(i));
      END LOOP;
    END IF;
  
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  
    -- логирование 
    As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                        i_Method_Name   => $$PLSQL_UNIT,
                        i_Request       => i_Request,
                        i_Response      => NULL,
                        i_Error_Code    => o_Error_Code,
                        i_Error_Message => o_Error_Message,
                        i_Created_By    => i_User_Id);
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => NULL,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
  END;
  ----------------------------------------------------------------------------------
  -- Метод для учёта использованных зап частей по таскам 
  ----------------------------------------------------------------------------------
  PROCEDURE Add_Spare_Part_To_Task(i_Request_Id    VARCHAR2,
                                   i_User_Id       NUMBER,
                                   i_Request       CLOB,
                                   o_Error_Code    OUT VARCHAR2,
                                   o_Error_Message OUT VARCHAR2) IS
    -- здесь используется свой кастомный тип для работы с JSON (к сожелению не могу им поделится)
    v_Request_Hash Hashmap := Hashmap();
  BEGIN
    -- Парсим JSON через кастомный парсер ( можно было использовать оракловый )
    Json_Parser.Parse_Json(i_Request, v_Request_Hash);
    -- валидация 
    As_Check.Check_Part_Params(i_Part_Id       => v_Request_Hash.Get_Number('Part_Id'),
                               i_Task_Id       => v_Request_Hash.Get_Number('Task_Id'),
                               i_Quantity      => v_Request_Hash.Get_Number('Quantity'),
                               i_Task_Uid      => v_Request_Hash.Get_Number('Task_Uid'),
                               o_Error_Code    => o_Error_Code,
                               o_Error_Message => o_Error_Message);
    IF o_Error_Code IS NOT NULL THEN
      -- логирование 
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => NULL,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
      RETURN;
    END IF;
    -- вызов метода 
    As_Kernel.Add_Spare_Parts_To_Task(i_Part_Id  => v_Request_Hash.Get_Number('Part_Id'),
                                      i_Task_Id  => v_Request_Hash.Get_Number('Task_Id'),
                                      i_Quantity => v_Request_Hash.Get_Number('Quantity'),
                                      i_Task_Uid => v_Request_Hash.Get_Number('Task_Uid'));
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
    -- логирование 
    As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                        i_Method_Name   => $$PLSQL_UNIT,
                        i_Request       => i_Request,
                        i_Response      => NULL,
                        i_Error_Code    => o_Error_Code,
                        i_Error_Message => o_Error_Message,
                        i_Created_By    => i_User_Id);
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
      As_Kernel.Save_Logs(i_Request_Id    => i_Request_Id,
                          i_Method_Name   => $$PLSQL_UNIT,
                          i_Request       => i_Request,
                          i_Response      => NULL,
                          i_Error_Code    => o_Error_Code,
                          i_Error_Message => o_Error_Message,
                          i_Created_By    => i_User_Id);
      -- 
  END Add_Spare_Part_To_Task;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о статусе тасков возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Task_States(o_Error_Message OUT VARCHAR2,
                            o_Error_Code    OUT VARCHAR2,
                            o_Result_Cursor OUT SYS_REFCURSOR) IS
  BEGIN
  
    OPEN o_Result_Cursor FOR
      SELECT *
        FROM As_s_Task_States g;
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о деталях тасков возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Task_Details(i_Task_Uid      NUMBER,
                             o_Error_Message OUT VARCHAR2,
                             o_Error_Code    OUT VARCHAR2,
                             o_Result        OUT CLOB) IS
  
    v_Html                 CLOB;
    v_Total_Service_Amount NUMBER := 0;
    v_Total_Parts_Amount   NUMBER := 0;
    v_Last_Service_Id      NUMBER := NULL;
    v_Row_Count            NUMBER := 0;
  
  BEGIN
    v_Html := '<html>' || '<head><title>Task Report</title></head>' || '<body>' ||
              '<h1>Task Report</h1>' || '<table border="1" cellpadding="5" cellspacing="0">' ||
              '<tr>' || '<th>Task ID</th>' || '<th>Task UID</th>' || '<th>Task State</th>' ||
              '<th>Client Name</th>' || '<th>Client Phone</th>' || '<th>Vehicle</th>' ||
              '<th>Year Produced</th>' || '<th>Mileage</th>' || '<th>Service</th>' ||
              '<th>Description</th>' || '<th>Service Price</th>' || '<th>Spare Part Used</th>' ||
              '<th>Quantity</th>' || '<th>Part Price</th>' || '<th>Mechanic</th>' || '</tr>';
  
    FOR Rec IN (SELECT *
                  FROM As_v_Tasks t
                 WHERE t.Task_Uid = i_Task_Uid
                 ORDER BY Service_Id)
    LOOP
      -- Проверяем, является ли текущий SERVICE_ID новым
      IF v_Last_Service_Id IS NULL OR v_Last_Service_Id != Rec.Service_Id THEN
        -- Завершаем предыдущую строку, если это не первая строка
        IF v_Row_Count > 0 THEN
          v_Html := REPLACE(v_Html, '{ROWSPAN}', To_Char(v_Row_Count));
          v_Html := v_Html || '</tr>';
        END IF;
      
        -- В новой строке обнуляем счетчик row_count
        v_Row_Count := 1;
      
        -- Добавляем строку с rowspan
        v_Html := v_Html || '<tr>' || '<td>' || Rec.Task_Id || '</td>' || '<td>' || Rec.Task_Uid ||
                  '</td>' || '<td>' || Rec.Task_State_Name || '</td>' || '<td>' || Rec.Client_Name ||
                  '</td>' || '<td>' || Rec.Client_Phone || '</td>' || '<td>' || Rec.Vehicle ||
                  '</td>' || '<td>' || Rec.Year_Produced || '</td>' || '<td>' || Rec.Mileage ||
                  '</td>' || '<td rowspan="{ROWSPAN}">' || Rec.Name || '</td>' ||
                  '<td rowspan="{ROWSPAN}">' || Rec.Description || '</td>' ||
                  '<td rowspan="{ROWSPAN}">' || Rec.Service_Price || '</td>';
      
        -- Сохраняем service_id и добавляем стоимость к общей сумме за услуги
        v_Total_Service_Amount := v_Total_Service_Amount + Rec.Service_Price;
        v_Last_Service_Id      := Rec.Service_Id;
      ELSE
        -- Увеличиваем счетчик row_count для существующего SERVICE_ID
        v_Row_Count := v_Row_Count + 1;
        -- Добавляем новую строку без rowspan для service_id
        v_Html := v_Html || '</tr><tr>' || '<td>' || Rec.Task_Id || '</td>' || '<td>' ||
                  Rec.Task_Uid || '</td>' || '<td>' || Rec.Task_State_Name || '</td>' || '<td>' ||
                  Rec.Client_Name || '</td>' || '<td>' || Rec.Client_Phone || '</td>' || '<td>' ||
                  Rec.Vehicle || '</td>' || '<td>' || Rec.Year_Produced || '</td>' || '<td>' ||
                  Rec.Mileage || '</td>';
      END IF;
    
      -- Добавляем данные о запчастях и механике
      v_Html := v_Html || '<td>' || Coalesce(Rec.Spare_Part_Used, 'N/A') || '</td>' || '<td>' ||
                Coalesce(To_Char(Rec.Quantity), 'N/A') || '</td>' || '<td>' ||
                Coalesce(To_Char(Rec.Part_Price), 'N/A') || '</td>' || '<td>' || Rec.Mechanic ||
                '</td>';
    
      -- Рассчитываем общую сумму за запчасти
      IF Rec.Part_Price IS NOT NULL AND Rec.Quantity IS NOT NULL THEN
        v_Total_Parts_Amount := v_Total_Parts_Amount + (Rec.Part_Price * Rec.Quantity);
      END IF;
    END LOOP;
  
    -- Завершаем последнюю строку
    IF v_Row_Count > 0 THEN
      v_Html := REPLACE(v_Html, '{ROWSPAN}', To_Char(v_Row_Count));
      v_Html := v_Html || '</tr>';
    END IF;
  
    -- Завершаем HTML-таблицу и добавляем общую сумму
    v_Html := v_Html || '</table>' || '<h2>Total Service Amount: ' ||
              To_Char(v_Total_Service_Amount, 'FM999,999.00') || '</h2>' ||
              '<h2>Total Spare Parts Amount: ' || To_Char(v_Total_Parts_Amount, 'FM999,999.00') ||
              '</h2>' || '<h2>Grand Total Amount: ' ||
              To_Char(v_Total_Service_Amount + v_Total_Parts_Amount, 'FM999,999.00') || '</h2>' ||
              '</body></html>';
  
    -- Выводим или сохраняем сгенерированный HTML
    o_Result := v_Html;
  
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END Get_Task_Details;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации об услугах возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Services(o_Error_Message OUT VARCHAR2,
                         o_Error_Code    OUT VARCHAR2,
                         o_Result_Cursor OUT SYS_REFCURSOR) IS
  BEGIN
  
    OPEN o_Result_Cursor FOR
      SELECT *
        FROM As_Services g;
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END Get_Services;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о cотрудниках сервиса возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Employees(i_First_Name    VARCHAR2,
                          i_Last_Name     VARCHAR2,
                          i_Phone         VARCHAR2,
                          o_Error_Message OUT VARCHAR2,
                          o_Error_Code    OUT VARCHAR2,
                          o_Result_Cursor OUT SYS_REFCURSOR) IS
    v_Sql VARCHAR2(4000) := '  SELECT * FROM As_Employees g where 1=1 ';
  BEGIN
    -- Собераем параметры поиска 
    IF i_First_Name IS NOT NULL THEN
      v_Sql := v_Sql || ' and lower(first_name) like ''' || Lower(i_First_Name) || '''';
    END IF;
    IF i_Last_Name IS NOT NULL THEN
      v_Sql := v_Sql || ' and lower(Last_Name) like ''' || Lower(i_Last_Name) || '''';
    END IF;
    IF i_Phone IS NOT NULL THEN
      v_Sql := v_Sql || ' and Phone = ''' || i_Phone || '''';
    END IF;
    -- если фильтров нет то возвращаем весь список 
    OPEN o_Result_Cursor FOR v_Sql;
  
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о клиентах возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Client(i_First_Name    VARCHAR2,
                       i_Last_Name     VARCHAR2,
                       i_Phone         VARCHAR2,
                       o_Error_Message OUT VARCHAR2,
                       o_Error_Code    OUT VARCHAR2,
                       o_Result_Cursor OUT SYS_REFCURSOR) IS
    v_Sql VARCHAR2(4000) := 'SELECT * FROM As_clients g where 1=1 ';
  
  BEGIN
  
    -- Собераем параметры поиска 
    IF i_First_Name IS NOT NULL THEN
      v_Sql := v_Sql || ' and lower(first_name) like ''' || Lower(i_First_Name) || '''';
    END IF;
    IF i_Last_Name IS NOT NULL THEN
      v_Sql := v_Sql || ' and lower(Last_Name) like ''' || Lower(i_Last_Name) || '''';
    END IF;
    IF i_Phone IS NOT NULL THEN
      v_Sql := v_Sql || ' and Phone = ''' || i_Phone || '''';
    END IF;
    -- если фильтров нет то возвращаем весь список 
    OPEN o_Result_Cursor FOR v_Sql;
  
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации об зарегистрированных автомобилях возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Car(i_Vin           VARCHAR2,
                    i_License_Plate VARCHAR2,
                    i_Owner_Id      NUMBER,
                    o_Error_Message OUT VARCHAR2,
                    o_Error_Code    OUT VARCHAR2,
                    o_Result_Cursor OUT SYS_REFCURSOR) IS
    v_Sql VARCHAR2(4000) := 'SELECT * FROM As_cars g where 1=1 ';
  
  BEGIN
  
    -- Собераем параметры поиска 
    IF i_Vin IS NOT NULL THEN
      v_Sql := v_Sql || ' and Vin = ''' || i_Vin || '''';
    END IF;
    IF i_License_Plate IS NOT NULL THEN
      v_Sql := v_Sql || ' and License_Plate = ''' || i_License_Plate || '''';
    END IF;
    IF i_Owner_Id IS NOT NULL THEN
      v_Sql := v_Sql || ' and Owner_Id = ' || i_Owner_Id;
    END IF;
    -- если фильтров нет то возвращаем весь список 
    OPEN o_Result_Cursor FOR v_Sql;
  
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о производителях автомобиля  возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Vehicle_Make(o_Error_Message OUT VARCHAR2,
                             o_Error_Code    OUT VARCHAR2,
                             o_Result_Cursor OUT SYS_REFCURSOR) IS
  BEGIN
  
    OPEN o_Result_Cursor FOR
      SELECT *
        FROM As_s_Vehicle_Make g;
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о моделях автомобилей  возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Vehicle_Model(o_Error_Message OUT VARCHAR2,
                              o_Error_Code    OUT VARCHAR2,
                              o_Result_Cursor OUT SYS_REFCURSOR) IS
  BEGIN
  
    OPEN o_Result_Cursor FOR
      SELECT *
        FROM As_s_Vehicle_Models g;
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END;
  ----------------------------------------------------------------------------------
  -- Процедура для получение информации о учёте зап частей  возвращает курсор
  ----------------------------------------------------------------------------------
  PROCEDURE Get_Spare_Parts(o_Error_Message OUT VARCHAR2,
                            o_Error_Code    OUT VARCHAR2,
                            o_Result_Cursor OUT SYS_REFCURSOR) IS
  BEGIN
  
    OPEN o_Result_Cursor FOR
      SELECT *
        FROM As_Spare_Parts g;
    -- Вызвращаем код ответа успешно 
    o_Error_Code    := As_Consts.c_Error_Code_Success;
    o_Error_Message := As_Consts.с_Error_Message_Success;
  EXCEPTION
    WHEN OTHERS THEN
      o_Error_Code    := As_Consts.c_Error_Code_Internal_Server;
      o_Error_Message := As_Consts.с_Error_Message_Internal_Server || To_Char(SQLERRM) || ' ' ||
                         Dbms_Utility.Format_Error_Backtrace;
  END;

END As_Api;
/
