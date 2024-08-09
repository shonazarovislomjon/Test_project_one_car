
cREATE TABLE as_s_vehicle_models (
    model varchar2(100),--Unique identifier for each vehicle type
    make varchar2(100),  
    model_name      VARCHAR2(50),                         -- Name of the vehicle type (e.g., sedan, SUV, truck)
    description VARCHAR2(500),                               -- Description of the vehicle type
    PRIMARY KEY (model)
);
