insert into as_s_task_states (TASK_STATE_ID, STATE_NAME)
values (1, 'Создан');

insert into as_s_task_states (TASK_STATE_ID, STATE_NAME)
values (2, 'В работе');

insert into as_s_task_states (TASK_STATE_ID, STATE_NAME)
values (3, 'Готов к выдаче');

insert into as_s_task_states (TASK_STATE_ID, STATE_NAME)
values (4, 'Закрыт');

insert into as_s_task_states (TASK_STATE_ID, STATE_NAME)
values (5, 'Удалён');
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (1, 'Замена масла', 'Полная замена масла с заменой фильтра', 29.99, 30);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (2, 'Ротация шин', 'Ротация всех четырёх шин для равномерного износа', 19.99, 45);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (3, 'Осмотр тормозов', 'Осмотр тормозных колодок, дисков и уровня жидкости', 39.99, 60);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (4, 'Замена аккумулятора', 'Замена автомобильного аккумулятора с тестированием системы зарядки', 89.99, 30);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (5, 'Мойка автомобиля', 'Мойка кузова и уборка салона пылесосом', 14.99, 20);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (6, 'Замена воздушного фильтра', 'Замена воздушного фильтра двигателя', 19.99, 15);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (7, 'Замена свечей зажигания', 'Замена свечей зажигания для улучшения работы двигателя', 49.99, 40);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (8, 'Регулировка сход-развала', 'Регулировка углов установки колёс', 69.99, 60);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (9, 'Замена ремня ГРМ', 'Замена ремня газораспределительного механизма', 199.99, 180);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (10, 'Промывка топливной системы', 'Очистка топливных форсунок и системы', 59.99, 45);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (11, 'Замена тормозных колодок', 'Замена передних или задних тормозных колодок', 79.99, 90);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (12, 'Диагностика двигателя', 'Компьютерная диагностика двигателя на наличие ошибок', 49.99, 30);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (13, 'Замена охлаждающей жидкости', 'Замена антифриза и промывка системы охлаждения', 39.99, 45);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (14, 'Заправка кондиционера', 'Заправка системы кондиционирования автомобиля', 69.99, 60);
INSERT INTO as_services (service_id, name, description, price, duration) VALUES (15, 'Замена трансмиссионного масла', 'Замена масла в коробке передач', 59.99, 45);
INSERT INTO as_employees (employee_id, first_name, last_name, phone, email, position, hire_date, salary) 
VALUES (1, 'Иван', 'Иванов', '89012345678', 'ivan.ivanov@example.com', 'Мастер по ремонту двигателей', TO_DATE('2022-05-01', 'YYYY-MM-DD'), 50000);

INSERT INTO as_employees (employee_id, first_name, last_name, phone, email, position, hire_date, salary) 
VALUES (2, 'Петр', 'Петров', '89087654321', 'petr.petrov@example.com', 'Мастер по ремонту трансмиссий', TO_DATE('2021-07-15', 'YYYY-MM-DD'), 45000);

INSERT INTO as_employees (employee_id, first_name, last_name, phone, email, position, hire_date, salary) 
VALUES (3, 'Сергей', 'Сергеев', '89011223344', 'sergey.sergeev@example.com', 'Мастер по ремонту тормозов', TO_DATE('2020-03-10', 'YYYY-MM-DD'), 55000);

INSERT INTO as_employees (employee_id, first_name, last_name, phone, email, position, hire_date, salary) 
VALUES (4, 'Алексей', 'Алексеев', '89014445566', 'alexey.alekseev@example.com', 'Мастер по ремонту электрики', TO_DATE('2019-11-20', 'YYYY-MM-DD'), 30000);

INSERT INTO as_employees (employee_id, first_name, last_name, phone, email, position, hire_date, salary) 
VALUES (5, 'Мария', 'Марова', '89016667788', 'maria.marova@example.com', 'Мастер по ремонту подвески', TO_DATE('2018-02-28', 'YYYY-MM-DD'), 60000);
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Toyota', 'Toyota', 'Japanese multinational automotive manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Honda', 'Honda', 'Japanese public multinational conglomerate');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Ford', 'Ford', 'American multinational automaker');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Chevrolet', 'Chevrolet', 'American automobile division of General Motors');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Nissan', 'Nissan', 'Japanese multinational automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('BMW', 'BMW', 'German multinational company which produces luxury vehicles');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Audi', 'Audi', 'German automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Mercedes-Benz', 'Mercedes-Benz', 'German global automobile marque and a division of Daimler AG');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Volkswagen', 'Volkswagen', 'German automaker headquartered in Wolfsburg');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Hyundai', 'Hyundai', 'South Korean multinational automotive manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Kia', 'Kia', 'South Korean multinational automotive manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Subaru', 'Subaru', 'Japanese automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Mazda', 'Mazda', 'Japanese multinational automaker');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Chrysler', 'Chrysler', 'American automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Dodge', 'Dodge', 'American automobile brand and a division of Stellantis');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Jeep', 'Jeep', 'American automobile brand and a division of Stellantis');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Land Rover', 'Land Rover', 'British manufacturer of four-wheel-drive vehicles');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Jaguar', 'Jaguar', 'British luxury vehicle manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Porsche', 'Porsche', 'German automobile manufacturer specializing in high-performance sports cars');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Ferrari', 'Ferrari', 'Italian luxury sports car manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Lamborghini', 'Lamborghini', 'Italian brand and manufacturer of luxury sports cars');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Maserati', 'Maserati', 'Italian luxury vehicle manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Alfa Romeo', 'Alfa Romeo', 'Italian luxury car manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Rolls-Royce', 'Rolls-Royce', 'British luxury automobile maker');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Bentley', 'Bentley', 'British luxury automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Bugatti', 'Bugatti', 'French high-performance luxury automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Lexus', 'Lexus', 'Japanese luxury vehicle division of Toyota');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Acura', 'Acura', 'Luxury vehicle division of the Japanese automaker Honda');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Infiniti', 'Infiniti', 'Luxury vehicle division of the Japanese automaker Nissan');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Genesis', 'Genesis', 'Luxury vehicle division of the South Korean automaker Hyundai');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Lincoln', 'Lincoln', 'Luxury vehicle division of the American automaker Ford');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Buick', 'Buick', 'American automobile brand and a division of General Motors');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('GMC', 'GMC', 'American automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Pontiac', 'Pontiac', 'American automobile brand and former division of General Motors');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Saturn', 'Saturn', 'American automobile manufacturer and former division of General Motors');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Tesla', 'Tesla', 'American electric vehicle and clean energy company');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Rivian', 'Rivian', 'American electric vehicle manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Polestar', 'Polestar', 'Swedish electric performance brand and manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('BYD', 'BYD', 'Chinese automobile manufacturer based in Shenzhen');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Great Wall', 'Great Wall', 'Chinese automotive manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Geely', 'Geely', 'Chinese multinational automotive company');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('SAIC', 'SAIC', 'Chinese state-owned automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Changan', 'Changan', 'Chinese state-owned automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Dongfeng', 'Dongfeng', 'Chinese state-owned automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Zotye', 'Zotye', 'Chinese automobile manufacturer');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Haval', 'Haval', 'Chinese automotive marque owned by Great Wall Motors');
INSERT INTO as_s_vehicle_make (make, make_name, description) VALUES
('Wuling', 'Wuling', 'Chinese automotive brand and a joint venture between SAIC Motor, GM, and Liuzhou Wuling Motors Co.');



INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('CAMRY', 'Toyota', 'Camry', 'A midsize sedan known for its reliability and fuel efficiency.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('COROLLA', 'Toyota', 'Corolla', 'A compact car that offers great value and practicality.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('CIVIC', 'Honda', 'Civic', 'A compact car that is renowned for its sporty performance and fuel efficiency.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('ACCORD', 'Honda', 'Accord', 'A midsize sedan offering a comfortable ride and advanced technology features.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MUSTANG', 'Ford', 'Mustang', 'An iconic American muscle car with a range of powerful engines.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('FOCUS', 'Ford', 'Focus', 'A compact car that combines agile handling with a modern interior.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('IMPALA', 'Chevrolet', 'Impala', 'A full-size sedan with spacious interior and smooth ride.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('EQUINOX', 'Chevrolet', 'Equinox', 'A compact SUV that offers a comfortable ride and plenty of cargo space.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('ALTIMA', 'Nissan', 'Altima', 'A midsize sedan known for its stylish design and advanced safety features.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('ROGUE', 'Nissan', 'Rogue', 'A compact SUV with a refined interior and strong fuel economy.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('X5', 'BMW', 'X5', 'A luxury midsize SUV known for its powerful engines and premium interior.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('3 SERIES', 'BMW', '3 Series', 'A compact executive car celebrated for its dynamic driving experience.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('A4', 'Audi', 'A4', 'A compact luxury sedan with a refined interior and advanced technology.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('Q5', 'Audi', 'Q5', 'A compact luxury SUV with a high-quality interior and agile handling.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('C_CLASS', 'Mercedes-Benz', 'C-Class', 'A luxury compact sedan with a sophisticated design and high-end features.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('E_CLASS', 'Mercedes-Benz', 'E-Class', 'A midsize luxury sedan known for its comfort and advanced technology.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('GOLF', 'Volkswagen', 'Golf', 'A compact car with a refined interior and strong performance.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('TIGUAN', 'Volkswagen', 'Tiguan', 'A compact SUV offering a versatile interior and engaging driving experience.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('SONATA', 'Hyundai', 'Sonata', 'A midsize sedan with a stylish design and modern features.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('TUCSON', 'Hyundai', 'Tucson', 'A compact SUV known for its comfort and value for money.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('SPORTAGE', 'Kia', 'Sportage', 'A compact SUV with a user-friendly infotainment system and ample cargo space.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('OPTIMA', 'Kia', 'Optima', 'A midsize sedan with a sleek design and advanced safety features.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('OUTBACK', 'Subaru', 'Outback', 'A rugged wagon with all-wheel drive and off-road capability.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('FORESTER', 'Subaru', 'Forester', 'A compact SUV known for its practicality and all-weather capability.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MX-5', 'Mazda', 'MX-5 Miata', 'A lightweight sports car celebrated for its agile handling.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('CX-5', 'Mazda', 'CX-5', 'A compact SUV with a premium interior and engaging driving dynamics.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('300', 'Chrysler', '300', 'A full-size sedan known for its powerful engines and spacious interior.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('PACIFICA', 'Chrysler', 'Pacifica', 'A minivan with advanced technology and a family-friendly design.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('CHARGER', 'Dodge', 'Charger', 'A full-size sedan with a powerful engine lineup and muscular design.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('DURANGO', 'Dodge', 'Durango', 'A midsize SUV offering robust performance and a spacious interior.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('WRANGLER', 'Jeep', 'Wrangler', 'An iconic off-road SUV with exceptional ruggedness and capability.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('GRAND CHEROKEE', 'Jeep', 'Grand Cherokee', 'A midsize SUV known for its luxury features and off-road prowess.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('DEFENDER', 'Land Rover', 'Defender', 'A robust off-road SUV with a heritage of rugged performance.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('RANGE ROVER', 'Land Rover', 'Range Rover', 'A luxury SUV with a focus on refinement and off-road capability.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('F-PACE', 'Jaguar', 'F-PACE', 'A luxury SUV that combines performance with practicality.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('XE', 'Jaguar', 'XE', 'A compact luxury sedan with a focus on sporty driving dynamics.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('911', 'Porsche', '911', 'A high-performance sports car known for its iconic design and driving pleasure.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MACAN', 'Porsche', 'Macan', 'A compact luxury SUV that delivers a blend of performance and practicality.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('488', 'Ferrari', '488', 'A high-performance sports car with a twin-turbocharged V8 engine.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('PORTOFINO', 'Ferrari', 'Portofino', 'A convertible sports car with elegant design and strong performance.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('HURACÁN', 'Lamborghini', 'Huracán', 'A high-performance sports car with a powerful V10 engine.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('AVENTADOR', 'Lamborghini', 'Aventador', 'A supercar with a dramatic design and a V12 engine.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('GHIBLI', 'Maserati', 'Ghibli', 'A luxury sedan that combines performance with Italian design.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('LEVANTE', 'Maserati', 'Levante', 'A luxury SUV known for its performance and stylish design.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('GIULIA', 'Alfa Romeo', 'Giulia', 'A compact executive sedan with a sporty driving experience.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('STELVIO', 'Alfa Romeo', 'Stelvio', 'A luxury SUV with a focus on driving dynamics and Italian style.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('GHOST', 'Rolls-Royce', 'Ghost', 'A luxury sedan known for its opulent interior and smooth ride.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('PHANTOM', 'Rolls-Royce', 'Phantom', 'An ultra-luxury sedan with unparalleled comfort and prestige.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('CONTINENTAL', 'Bentley', 'Continental', 'A luxury grand tourer known for its performance and refinement.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('FLYING SPUR', 'Bentley', 'Flying Spur', 'A luxury sedan that offers high performance and comfort.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('CHIRON', 'Bugatti', 'Chiron', 'A hypercar with extreme performance and a quad-turbocharged W16 engine.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('VEYRON', 'Bugatti', 'Veyron', 'A high-performance hypercar known for its speed and engineering excellence.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('RX', 'Lexus', 'RX', 'A midsize luxury SUV with a comfortable and well-appointed interior.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('ES', 'Lexus', 'ES', 'A midsize luxury sedan known for its smooth ride and high-quality interior.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MDX', 'Acura', 'MDX', 'A midsize luxury SUV with advanced technology and strong performance.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('RDX', 'Acura', 'RDX', 'A compact luxury SUV with a sport-tuned ride and modern features.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('Q50', 'Infiniti', 'Q50', 'A luxury sedan with a powerful engine lineup and refined interior.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('QX60', 'Infiniti', 'QX60', 'A midsize luxury SUV offering three rows of seating and upscale amenities.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('G80', 'Genesis', 'G80', 'A luxury sedan with a focus on comfort and advanced technology.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('GV70', 'Genesis', 'GV70', 'A compact luxury SUV that combines style with a premium interior.');


INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('AVIATOR', 'Lincoln', 'Aviator', 'A midsize luxury SUV with a strong engine lineup and upscale features.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('ENCLAVE', 'Buick', 'Enclave', 'A midsize SUV offering a spacious and upscale interior.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('REGAL', 'Buick', 'Regal', 'A midsize sedan with a sporty design and comfortable ride.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('SIERRA', 'GMC', 'Sierra', 'A full-size pickup truck known for its ruggedness and high towing capacity.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('ACADIA', 'GMC', 'Acadia', 'A midsize SUV with a comfortable and versatile interior.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('FIREBIRD', 'Pontiac', 'Firebird', 'An American muscle car known for its performance and iconic design.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('GTO', 'Pontiac', 'GTO', 'A classic muscle car renowned for its power and speed.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('ION', 'Saturn', 'Ion', 'A compact car with a practical design and good fuel economy.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('VUE', 'Saturn', 'VUE', 'A compact SUV with a spacious interior and decent handling.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MODEL S', 'Tesla', 'Model S', 'An electric luxury sedan with impressive range and performance.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MODEL 3', 'Tesla', 'Model 3', 'A more affordable electric sedan with a minimalist design and advanced technology.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('R1T', 'Rivian', 'R1T', 'An electric adventure truck designed for off-road capability.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('R1S', 'Rivian', 'R1S', 'An electric SUV with rugged features and a spacious interior.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('2', 'Polestar', 'Polestar 2', 'An electric fastback with a modern design and advanced technology.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('1', 'Polestar', 'Polestar 1', 'A luxury hybrid sports coupe with impressive performance and design.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('TANG', 'BYD', 'Tang', 'A midsize SUV with a focus on electric power and modern features.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('HAN', 'BYD', 'Han', 'An electric sedan with a sleek design and advanced technology.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('H6', 'Great Wall', 'H6', 'A popular compact SUV known for its value and practicality.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('POER', 'Great Wall', 'Poer', 'A pickup truck with a rugged design and strong performance.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('EMGRAND', 'Geely', 'Emgrand', 'A compact sedan offering modern features and a comfortable ride.');


INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MG ZS', 'SAIC', 'MG ZS', 'A compact SUV with a sporty design and modern features.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('MAXUS D60', 'SAIC', 'Maxus D60', 'A midsize SUV with a spacious interior and strong performance.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('CS55', 'Changan', 'CS55', 'A compact SUV with a sleek design and advanced features.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('EADO', 'Changan', 'Eado', 'A compact sedan known for its value and practicality.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('AX7', 'Dongfeng', 'AX7', 'A midsize SUV offering a comfortable ride and modern features.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('VENUCIA T70', 'Dongfeng', 'Venucia T70', 'A compact SUV with a stylish design and advanced technology.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('Z100', 'Zotye', 'Z100', 'A compact city car with a practical and economical design.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('T600', 'Zotye', 'T600', 'A midsize SUV offering a blend of style and practicality.');


INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('F7', 'Haval', 'F7', 'A compact SUV with a sporty design and advanced features.');

INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('S1', 'Wuling', 'S1', 'A compact city car with a practical design and efficient performance.');
INSERT INTO as_s_vehicle_models (model, make, model_name, description) VALUES
('Hongguang MINI', 'Wuling', 'Hongguang MINI', 'A small and affordable electric vehicle with a unique design.');

INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(1, 'Тормозные колодки', 'Высококачественные тормозные колодки для улучшения остановочных характеристик.', 50.00, 100);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(2, 'Масляный фильтр', 'Масляный фильтр, совместимый с различными моделями автомобилей.', 25.00, 150);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(3, 'Воздушный фильтр', 'Воздушный фильтр, предназначенный для улучшения эффективности и производительности двигателя.', 20.00, 120);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(4, 'Свеча зажигания', 'Долговечная свеча зажигания для надежного запуска двигателя.', 15.00, 200);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(5, 'Фара', 'Фара с высокой яркостью для лучшей видимости в ночное время.', 30.00, 80);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(6, 'Аккумулятор', 'Автомобильный аккумулятор с высокой пусковой мощностью и длительным сроком службы.', 120.00, 60);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(7, 'Генератор', 'Генератор, обеспечивающий стабильное питание автомобиля.', 150.00, 40);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(8, 'Стартёр', 'Стартёр для плавного запуска двигателя.', 100.00, 50);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(9, 'Радиатор', 'Радиатор для эффективного охлаждения двигателя.', 200.00, 30);
INSERT INTO as_spare_parts (part_id, name, description, price, stock_quantity) VALUES
(10, 'Ремень ГРМ', 'Ремень ГРМ для точного времени работы двигателя и улучшения производительности.', 75.00, 70);


commit;
