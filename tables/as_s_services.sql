CREATE TABLE as_services (
    service_id NUMBER, -- Unique identifier for each service
    name VARCHAR2(100),                                 -- Name of the service
    description VARCHAR2(500),                          -- Description of the service
    price NUMBER,                                       -- Price of the service
    duration NUMBER,                                    -- Duration of the service in minutes
    PRIMARY KEY (service_id)
);
