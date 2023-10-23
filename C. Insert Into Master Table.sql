
--C
INSERT INTO MsStaff VALUES
('MS001','Felix Novando','felixn@mail.com','Male','089708330491','10000000'),
('MS002','Andre Setiawan Wijaya','andreSW@mail.com','Male','080230986111','16000000'),
('MS003','Cody Tanaka','codyT@mail.com','Male','085523727807','25000000'),
('MS004','Erwin Christian','erwin@mail.com','Male','081404389241','50000000'),
('MS005','Veronica Fujiono','veronica@mail.com','Female','0839900642','13000000'),
('MS006','Julieta Tanto Kurniawan','julieta@mail.com','Female','08784589788','21000000'),
('MS007','Maverick Sean Therry','mavST@mail.com','Male','083182989811','30000000'),
('MS008','Kevin Nguyen','knguyen@mail.com','Male','08121271628','27500000'),
('MS009','Jonathan Christopher','jcrhis@mail.com','Male','084829238','34200000'),
('MS010','Satine Zaneta','szaneta@mail.com','Female','083133232','91000000')

INSERT INTO MsCustomer VALUES
('MC001','Hansen Artajaya','Male','08619411417','Palmerah Street 21'),
('MC002','Adewirya Niko Shidarta','Male','0869084379','Angrek Street 05'),
('MC003','Chelsey Islan','Female','08400532496','Meruya Hilir Street 54'),
('MC004','Jose Gian Carlos','Male','0814673884','Sriwijaya Street 100'),
('MC005','Clarissa Chuardi Salim','Female','08802360652','Gambiran Street 20'),
('MC006','Lionel Ritchie','Male','08080204827','Syahdan Street 03'),
('MC007','Brandon Julio Thenaro','Male','083294891981','Stasiun Senen Street 17 A'),
('MC008','Voldemort Maisha','Male','08129812092','Alam Loka Street 32 B'),
('MC009','Aryasatya Karsen','Male','08128738733','Gading Street 29'),
('MC010','Marisa Rochefort','Female','0812884282','Sutera Loka Street 201')

INSERT INTO MsVendor VALUES
('MV001','Alv Karin','alvkarin@mail.com','0829498928','Bandung Street'),
('MV002','Ramona Artus','ramartus@mail.com','082121322','Jayapura Street'),
('MV003','Neon Nevio','neonvio@mail.com','0812277332','Kalimantan Street'),
('MV004','Jerard Walela','j.walela@mail.com','0889239293','Palembang Street'),
('MV005','Kaja','kaja@mail.com','0823987293','Jogja Street'),
('MV006','Sylvaine','sylvaine@mail.com','0813908293','Surabaya Street'),
('MV007','Lux Octavia','lux.o@mail.com','0823891283','Serpong Street'),
('MV008','Stace Hamisu','staceham@mail.com','0823972389','Jakarta Street'),
('MV009','Pridson Lason','p.lason@mail.com','0812874728','Mampang Street'),
('MV010','Kornelija','kornel@mail.com','0823917392','Kasablanka Street')

INSERT INTO MsJacketBrand VALUES
('JB001','Guccy'),
('JB002','Balencyaga'),
('JB003','Uniqla'),
('JB004','Niku'),
('JB005','Adidus'),
('JB006','H&N'),
('JB007','Versauce'),
('JB008','Hermas'),
('JB009','Prady'),
('JB010','Suprene')

INSERT INTO MsJacketType VALUES
('JT001','Bomber'),
('JT002','Trucker'),
('JT003','Denim'),
('JT004','Hoodie'),
('JT005','Parka'),
('JT006','Pea Coat'),
('JT007','Trench Coat'),
('JT008','Rain Coat'),
('JT009','Crombie Coat'),
('JT010','Varsity')

INSERT INTO MsJacket VALUES
('MJ001',100000,200000,300,'JB001','JT001'),
('MJ002',200000,300000,200,'JB002','JT002'),
('MJ003',300000,400000,700,'JB003','JT003'),
('MJ004',400000,500000,300,'JB004','JT004'),
('MJ005',500000,600000,500,'JB005','JT005'),
('MJ006',600000,700000,300,'JB006','JT006'),
('MJ007',700000,800000,600,'JB007','JT007'),
('MJ008',800000,900000,300,'JB008','JT008'),
('MJ009',600000,700000,200,'JB009','JT009'),
('MJ010',400000,500000,800,'JB010','JT010')