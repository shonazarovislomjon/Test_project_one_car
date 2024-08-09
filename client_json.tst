PL/SQL Developer Test script 3.0
18
begin
  -- Call the procedure
  As_Api.Save_Client(i_Request_Id => :i_Request_Id,
                     i_User_Id => :i_User_Id,
                     i_Request =>'{
  "First_Name": "John",
  "Last_Name": "Doe",
  "Phone": "+1234567890",
  "Email": "john.doe@example.com",
  "Address": "123 Main St, Anytown, USA",
  "Registration_Date": "01.08.2024",
  "Date_Of_Birth": "01.01.1990"
}
',
                     o_Response => :o_Response,
                     o_Error_Code => :o_Error_Code,
                     o_Error_Message => :o_Error_Message);
end;
6
i_Request_Id
1
test1
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
