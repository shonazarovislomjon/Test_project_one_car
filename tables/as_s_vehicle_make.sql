CREATE TABLE as_s_vehicle_make (
    make varchar2(100) , -- Unique identifier for each vehicle type
    make_name VARCHAR2(50),                                  -- Name of the vehicle type (e.g., sedan, SUV, truck)
    description VARCHAR2(500),                               -- Description of the vehicle type
    PRIMARY KEY (make)
);
