CREATE OR REPLACE PACKAGE As_Check IS

  -- Author  :ISLOMJON.SH
  -- Created : 01.08.2024 13:35:29
  -- Purpose : пакет для выполнения проверок по методам 

  ----------------------------------------------------------------------------------
  -- Валидация параметров по таскам 
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Params_Of_Tasks(i_Vehicle_Id        NUMBER,
                                  i_Service_Ids_Array Array_Number,
                                  i_Emp_Ids_Array     Array_Number,
                                  i_Ammounts_Array    Array_Number,
                                  o_Error_Code        OUT VARCHAR2,
                                  o_Error_Message     OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Валидация параметров по клиентам
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Client_Params(i_First_Name    VARCHAR2,
                                i_Last_Name     VARCHAR2,
                                i_Phone         VARCHAR2,
                                i_Email         VARCHAR2,
                                i_Address       VARCHAR2,
                                i_Date_Of_Birth DATE,
                                o_Error_Code    OUT VARCHAR2,
                                o_Error_Message OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Валидация параметров по автомобилям
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Car_Params(i_Make          VARCHAR2,
                             i_Model         VARCHAR2,
                             i_Mileage       NUMBER,
                             i_Vin           VARCHAR2,
                             i_License_Plate VARCHAR2,
                             i_Owner_Id      VARCHAR2,
                             o_Error_Code    OUT VARCHAR2,
                             o_Error_Message OUT VARCHAR2);
  ----------------------------------------------------------------------------------
  -- Валидация параметров по учёту зап частей 
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Part_Params(i_Part_Id       NUMBER,
                              i_Task_Id       NUMBER,
                              i_Quantity      NUMBER,
                              i_Task_Uid      NUMBER,
                              o_Error_Code    OUT VARCHAR2,
                              o_Error_Message OUT VARCHAR2);

END As_Check;
/
CREATE OR REPLACE PACKAGE BODY As_Check IS
  g_Dummy VARCHAR2(4000);

  ----------------------------------------------------------------------------------
  -- Валидация параметров по таскам 
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Params_Of_Tasks(i_Vehicle_Id        NUMBER,
                                  i_Service_Ids_Array Array_Number,
                                  i_Emp_Ids_Array     Array_Number,
                                  i_Ammounts_Array    Array_Number,
                                  o_Error_Code        OUT VARCHAR2,
                                  o_Error_Message     OUT VARCHAR2) IS
  BEGIN
    --
    IF i_Vehicle_Id IS NULL THEN
      o_Error_Code    := As_Consts.c_Error_Code_Required_Fields;
      o_Error_Message := As_Consts.с_Error_Message_Required_Fields ||
                         ' (Vehicle_Id) - обязательно к заполенению';
      RETURN;
    ELSE
      BEGIN
        SELECT t.Id
          INTO g_Dummy
          FROM As_Cars t
         WHERE t.Id = i_Vehicle_Id;
      EXCEPTION
        WHEN No_Data_Found THEN
          o_Error_Code    := As_Consts.с_Error_Message_Validation;
          o_Error_Message := As_Consts.с_Error_Message_Validation ||
                             ' (Vehicle_Id) - Введён несуществующий идентификатор автомобиля.';
          RETURN;
      END;
    END IF;
    --
    IF i_Emp_Ids_Array.Count = 0 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Required_Fields;
      o_Error_Message := As_Consts.с_Error_Message_Required_Fields ||
                         ' (Emp_Ids_Array) - обязательно к заполенению';
      RETURN;
    ELSE
      FOR i IN i_Emp_Ids_Array.First .. i_Emp_Ids_Array.Last
      LOOP
        BEGIN
          SELECT t.Employee_Id
            INTO g_Dummy
            FROM As_Employees t
           WHERE t.Employee_Id = i_Emp_Ids_Array(i);
        EXCEPTION
          WHEN No_Data_Found THEN
            o_Error_Code    := As_Consts.с_Error_Message_Validation;
            o_Error_Message := As_Consts.с_Error_Message_Validation ||
                               ' (Emp_Ids_Array) - Введён несуществующий идентификатор услуги.';
            RETURN;
        END;
      END LOOP;
    END IF;
    --
    IF i_Service_Ids_Array.Count = 0 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Required_Fields;
      o_Error_Message := As_Consts.с_Error_Message_Required_Fields ||
                         ' (Service_Ids_Array) - обязательно к заполенению';
      RETURN;
    ELSE
      FOR i IN i_Service_Ids_Array.First .. i_Service_Ids_Array.Last
      LOOP
        BEGIN
          SELECT t.Service_Id
            INTO g_Dummy
            FROM As_Services t
           WHERE t.Service_Id = i_Service_Ids_Array(i);
        EXCEPTION
          WHEN No_Data_Found THEN
            o_Error_Code    := As_Consts.с_Error_Message_Validation;
            o_Error_Message := As_Consts.с_Error_Message_Validation ||
                               ' (Service_Ids_Array) - Введён несуществующий идентификатор услуги.';
            RETURN;
        END;
      END LOOP;
    END IF;
    --
    IF i_Ammounts_Array.Count = 0 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Required_Fields;
      o_Error_Message := As_Consts.с_Error_Message_Required_Fields ||
                         ' (Ammounts_Array) - обязательно к заполенению';
      RETURN;
    END IF;
  END Check_Params_Of_Tasks;
  ----------------------------------------------------------------------------------
  -- Валидация параметров по клиентам
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Client_Params(i_First_Name    VARCHAR2,
                                i_Last_Name     VARCHAR2,
                                i_Phone         VARCHAR2,
                                i_Email         VARCHAR2,
                                i_Address       VARCHAR2,
                                i_Date_Of_Birth DATE,
                                o_Error_Code    OUT VARCHAR2,
                                o_Error_Message OUT VARCHAR2) IS
  BEGIN
    --
    IF i_First_Name IS NULL OR i_Last_Name IS NULL OR i_Phone IS NULL OR i_Email IS NULL THEN
      o_Error_Code    := As_Consts.c_Error_Code_Required_Fields;
      o_Error_Message := As_Consts.с_Error_Message_Required_Fields;
      RETURN;
    END IF;
    --
    IF Length(i_First_Name) > 50 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Validation;
      o_Error_Message := As_Consts.с_Error_Message_Validation ||
                         ' (First_Name) - длинна параметра должна быть 50, вы ввели ' ||
                         Length(i_First_Name);
      RETURN;
    END IF;
    --
    IF Length(i_Last_Name) > 50 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Validation;
      o_Error_Message := As_Consts.с_Error_Message_Validation ||
                         ' (Last_Name) - длинна параметра должна быть 50, вы ввели ' ||
                         Length(i_Last_Name);
      RETURN;
    END IF;
    --
    IF Length(i_Phone) > 50 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Validation;
      o_Error_Message := As_Consts.с_Error_Message_Validation ||
                         ' (Phone) - длинна параметра должна быть 15, вы ввели ' || Length(i_Phone);
      RETURN;
    END IF;
    --
    IF Length(i_Email) > 100 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Validation;
      o_Error_Message := As_Consts.с_Error_Message_Validation ||
                         ' (Email) - длинна параметра должна быть 50, вы ввели ' || Length(i_Email);
      RETURN;
    END IF;
    --
    IF Length(i_Address) > 200 THEN
      o_Error_Code    := As_Consts.c_Error_Code_Validation;
      o_Error_Message := As_Consts.с_Error_Message_Validation ||
                         ' (Address) - длинна параметра должна быть 50, вы ввели ' ||
                         Length(i_Address);
      RETURN;
    END IF;
    IF i_Date_Of_Birth > SYSDATE THEN
      o_Error_Code    := As_Consts.c_Error_Code_Validation;
      o_Error_Message := As_Consts.с_Error_Message_Validation ||
                         ' Значение поля (Date_Of_Birth) не должно быть больше сегодняшней даты';
      RETURN;
    END IF;
  END Check_Client_Params;
  ----------------------------------------------------------------------------------
  -- Валидация параметров по автомобилям
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Car_Params(i_Make          VARCHAR2,
                             i_Model         VARCHAR2,
                             i_Mileage       NUMBER,
                             i_Vin           VARCHAR2,
                             i_License_Plate VARCHAR2,
                             i_Owner_Id      VARCHAR2,
                             o_Error_Code    OUT VARCHAR2,
                             o_Error_Message OUT VARCHAR2) IS
  BEGIN
    --
    IF i_Make IS NULL OR i_Model IS NULL OR i_Mileage IS NULL OR i_Vin IS NULL OR
       i_License_Plate IS NULL OR i_Owner_Id IS NULL THEN
      o_Error_Code    := As_Consts.c_Error_Code_Required_Fields;
      o_Error_Message := As_Consts.с_Error_Message_Required_Fields;
      RETURN;
    END IF;
    --
    BEGIN
      SELECT g.Make
        INTO g_Dummy
        FROM As_s_Vehicle_Make g
       WHERE g.Make = Upper(i_Make);
    EXCEPTION
      WHEN No_Data_Found THEN
        o_Error_Code    := As_Consts.с_Error_Message_Validation;
        o_Error_Message := As_Consts.с_Error_Message_Validation ||
                           ' (make) - Введён несуществующий идентификатор компании производителя автомобиля.';
        RETURN;
    END;
    --
    BEGIN
      SELECT g.Model
        INTO g_Dummy
        FROM As_s_Vehicle_Models g
       WHERE g.Model = Upper(i_Model);
    EXCEPTION
      WHEN No_Data_Found THEN
        o_Error_Code    := As_Consts.с_Error_Message_Validation;
        o_Error_Message := As_Consts.с_Error_Message_Validation ||
                           ' (Model) - Введён несуществующий идентификатор модели автомобиля.';
        RETURN;
    END;
    --
    BEGIN
      SELECT g.Client_Id
        INTO g_Dummy
        FROM As_Clients g
       WHERE g.Client_Id = i_Owner_Id;
    EXCEPTION
      WHEN No_Data_Found THEN
        o_Error_Code    := As_Consts.с_Error_Message_Validation;
        o_Error_Message := As_Consts.с_Error_Message_Validation ||
                           ' (Owner_Id) - Введён несуществующий идентификатор владельца автомобиля.';
        RETURN;
    END;
    --
    --
  END Check_Car_Params;
  ----------------------------------------------------------------------------------
  -- Валидация параметров по учёту зап частей 
  ----------------------------------------------------------------------------------
  PROCEDURE Check_Part_Params(i_Part_Id       NUMBER,
                              i_Task_Id       NUMBER,
                              i_Quantity      NUMBER,
                              i_Task_Uid      NUMBER,
                              o_Error_Code    OUT VARCHAR2,
                              o_Error_Message OUT VARCHAR2) IS
  BEGIN
    --
    IF i_Part_Id IS NULL OR i_Task_Id IS NULL OR i_Quantity IS NULL OR i_Task_Uid IS NULL THEN
      o_Error_Code    := As_Consts.c_Error_Code_Required_Fields;
      o_Error_Message := As_Consts.с_Error_Message_Required_Fields;
      RETURN;
    END IF;
    --
    BEGIN
      SELECT t.Stock_Quantity
        INTO g_Dummy
        FROM As_Spare_Parts t
       WHERE t.Part_Id = i_Part_Id;
      --
      IF g_Dummy < i_Quantity THEN
        o_Error_Code    := As_Consts.с_Error_Message_Validation;
        o_Error_Message := As_Consts.с_Error_Message_Validation ||
                           ' (Quantity) - на складе не достаточно зап частей по вашему запросу ' ||
                           i_Quantity || ' остаток по данной зап части с ид ' || i_Part_Id ||
                           ' составляет ' || g_Dummy;
        RETURN;
      END IF;
    EXCEPTION
      WHEN No_Data_Found THEN
        o_Error_Code    := As_Consts.с_Error_Message_Validation;
        o_Error_Message := As_Consts.с_Error_Message_Validation ||
                           ' (Part_Id) - Введён несуществующий идентификатор зап части.';
        RETURN;
    END;
    --
    IF i_Quantity <= 0 THEN
      o_Error_Code    := As_Consts.с_Error_Message_Validation;
      o_Error_Message := As_Consts.с_Error_Message_Validation ||
                         ' (Quantity) - нельзя вводить 0 или отрицательное значение ';
      RETURN;
    END IF;
    --
    BEGIN
      SELECT t.Task_State_Id
        INTO g_Dummy
        FROM As_Tasks t
       WHERE t.Task_Id = i_Task_Id
         AND t.Task_Uid = i_Task_Uid;
      --
      IF g_Dummy IN (As_Consts.с_Task_State_Closed, As_Consts.с_Task_State_Deleted) THEN
        o_Error_Code    := As_Consts.с_Error_Message_Validation;
        o_Error_Message := As_Consts.с_Error_Message_Validation ||
                           ' (Task_Id и Task_Uid) - нельзя добавлять зап части в таску в состоянии (Удалён или Закрыт)';
        RETURN;
      END IF;
    EXCEPTION
      WHEN No_Data_Found THEN
        o_Error_Code    := As_Consts.с_Error_Message_Validation;
        o_Error_Message := As_Consts.с_Error_Message_Validation ||
                           ' (Task_Id и Task_Uid) - Введён несуществующий идентификатор таски.';
        RETURN;
    END;
  END Check_Part_Params;
END As_Check;
/
