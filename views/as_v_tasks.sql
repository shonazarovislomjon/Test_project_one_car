CREATE OR REPLACE VIEW AS_V_TASKS AS
SELECT t.Task_Id,
       t.Task_Uid,
       Ts.State_Name AS Task_State_Name,
       Cl.Last_Name || ' ' || Cl.First_Name AS Client_Name,
       Cl.Phone AS Client_Phone,
       c.Make || ' ' || c.Model AS Vehicle,
       c.Year_Produced,
       c.Mileage,
       s.Name,
       s.Description,
       s.Price as service_price,
       t.Ammount,
       Sp.Name AS Spare_Part_Used,
       p.Quantity,
       Sp.Price as part_price,
       (s.Price * t.Ammount) + Nvl((p.Quantity * Sp.Price), 0) AS Total_Ammount,
       e.Last_Name || ' ' || e.First_Name || ' ' || e.Position AS Mechanic,
       t.service_id
  FROM As_Tasks t
  JOIN As_Services s
    ON t.Service_Id = s.Service_Id
  JOIN As_Employees e
    ON t.Employee_Id = e.Employee_Id
  JOIN As_s_Task_States Ts
    ON Ts.Task_State_Id = t.Task_State_Id
  JOIN As_Cars c
    ON c.Id = t.Vehicle_Id
  JOIN As_Clients Cl
    ON Cl.Client_Id = c.Owner_Id
  LEFT OUTER JOIN As_Task_Spare_Parts p
    ON t.Task_Id = p.Task_Id
  LEFT OUTER JOIN As_Spare_Parts Sp
    ON p.Part_Id = Sp.Part_Id;
