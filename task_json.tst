PL/SQL Developer Test script 3.0
17
BEGIN
  -- Call the procedure
  As_Api.Create_Tasks(i_Request_Id    => :i_Request_Id,
                      i_User_Id       => :i_User_Id,
                      i_Request       => '{
  "Vehicle_Id": 1,
  "Service_Ids_Array": [1, 2, 3],
  "Emp_Ids_Array": [1, 2, 3],
  "Start_Time": "04.08.2024 10:00:00",
  "Comment": "Scheduled maintenance",
  "Ammounts_Array": [1, 1, 1]
}
',
                      o_Response      => :o_Response,
                      o_Error_Code    => :o_Error_Code,
                      o_Error_Message => :o_Error_Message);
END;
6
i_Request_Id
1
2
5
i_User_Id
1
1
4
i_Request
1
<CLOB>
-112
o_Response
1
<CLOB>
112
o_Error_Code
1
0
5
o_Error_Message
1
Успешно
5
0
