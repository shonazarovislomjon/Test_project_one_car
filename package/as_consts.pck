CREATE OR REPLACE PACKAGE As_Consts IS

  -- Author  : WA-ISLOMJON.SH
  -- Created : 02.08.2024 12:31:38
  -- Purpose : 

  -- Константы по статусам тасков
  с_Task_State_Created    CONSTANT NUMBER := 1;
  с_Task_State_In_Progres CONSTANT NUMBER := 2;
  с_Task_State_Ready      CONSTANT NUMBER := 3;
  с_Task_State_Closed     CONSTANT NUMBER := 4;
  с_Task_State_Deleted    CONSTANT NUMBER := 5;

  -- Коды ошибок 
  c_Error_Code_Success         CONSTANT NUMBER := 0;
  c_Error_Code_Internal_Server CONSTANT NUMBER := 4;
  c_Error_Code_Validation      CONSTANT NUMBER := 5;
  c_Error_Code_No_Data_Found   CONSTANT NUMBER := 2;
  c_Error_Code_Required_Fields CONSTANT NUMBER := 3;

  -- Текст ошибок 
  с_Error_Message_Success         CONSTANT VARCHAR2(4000) := 'Успешно';
  с_Error_Message_Internal_Server CONSTANT VARCHAR2(4000) := 'Внутренняя ошибка сервера ';
  с_Error_Message_Validation      CONSTANT VARCHAR2(4000) := 'Неверный формат входных данных';
  с_Error_Message_No_Data_Found   CONSTANT VARCHAR2(4000) := 'Данные не найдены';
  с_Error_Message_Required_Fields CONSTANT VARCHAR2(4000) := 'Обязательные поля не заполнены';

END As_Consts;
/
create or replace package body as_consts is

 
end as_consts;
/
