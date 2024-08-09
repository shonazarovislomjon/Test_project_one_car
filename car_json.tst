PL/SQL Developer Test script 3.0
20
begin
  -- Call the procedure
  As_Api.Save_Car(i_Request_Id => :i_Request_Id,
                  i_User_Id => :i_User_Id,
                  i_Request => '{
  "Make": "Toyota",
  "Model": "Camry",
  "Year_Produced": 2020,
  "Colour": "Blue",
  "Mileage": 15000,
  "Vin": "1HGCM82633A123456",
  "License_Plate": "ABC123",
  "Owner_Id": "1",
  "User_Id": "123456789"
}
',
                  o_Response => :o_Response,
                  o_Error_Code => :o_Error_Code,
                  o_Error_Message => :o_Error_Message);
end;
5
i_Request_Id
0
5
i_User_Id
0
5
o_Response
0
5
o_Error_Code
1
0
5
o_Error_Message
1
Успешно
5
0
