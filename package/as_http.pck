CREATE OR REPLACE PACKAGE As_Http IS

  -- Author  : ISLOMJON.SH
  -- Created : 04.08.2024 20:32:09
  -- Purpose : ����� ��� ���������� ������ �� ������� ������� 

  ----------------------------------------------------------------------------------
  -- ��������� �������� ������ � ������ ��� ����������� ������� � ���������� ���������� 
  -----------------------------------------------------------------------------------
  PROCEDURE Send_Task_Ready_Request(i_Task_Id NUMBER);
END As_Http;
/
CREATE OR REPLACE PACKAGE BODY As_Http IS

  ----------------------------------------------------------------------------------
  -- ��������� �������� ������ � ������ ��� ����������� ������� � ���������� ���������� 
  -----------------------------------------------------------------------------------
  PROCEDURE Send_Task_Ready_Request(i_Task_Id NUMBER) IS
    l_Req        Utl_Http.Req;
    l_Resp       Utl_Http.Resp;
    l_Body       CLOB;
    l_Url        VARCHAR2(4000) := 'http://example.com/api/tasks/complete';
    l_Auth_Token VARCHAR2(4000);
  BEGIN
    -- �������� �������
    l_Req := Utl_Http.Begin_Request(Url => l_Url, Method => 'POST', Http_Version => 'HTTP/1.1');
    -- ������ ���� �������
    l_Body := '{"state": "Ready", "task_id": "' || i_Task_Id || '"}';
    -- ��������� ����������
    Utl_Http.Set_Header(l_Req, 'User-Agent', 'Mozilla/4.0');
    Utl_Http.Set_Header(l_Req, 'Content-Type', 'application/json');
    Utl_Http.Set_Header(l_Req, 'Content-Length', Length(l_Body));
  
    -- ��������� Basic Auth ������
    l_Auth_Token := 'dXNlcjp1c2Vy';
    -- ��������� ��������� �����������
    Utl_Http.Set_Header(l_Req, 'Authorization', 'Basic ' || l_Auth_Token);
  
    Utl_Http.Write_Text(l_Req, l_Body);
  
    -- ��������� ������
    l_Resp := Utl_Http.Get_Response(l_Req);
    
  EXCEPTION
    WHEN OTHERS THEN
      Raise_Application_Error(-20000,
                              '������ � Send_Task_Ready_Request �� task_id ' || i_Task_Id || ' ' ||
                              SQLERRM || ' ' || Dbms_Utility.Format_Error_Backtrace);
  END Send_Task_Ready_Request;
END As_Http;
/
