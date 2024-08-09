CREATE TABLE as_spare_parts (
    part_id NUMBER ,    -- Unique identifier for each spare part
    name VARCHAR2(100),                                 -- Name of the spare part
    description VARCHAR2(500),                          -- Description of the spare part
    price NUMBER,                                       -- Price of the spare part
    stock_quantity NUMBER,                              -- Quantity of the spare part in stock
    PRIMARY KEY (part_id)
);
