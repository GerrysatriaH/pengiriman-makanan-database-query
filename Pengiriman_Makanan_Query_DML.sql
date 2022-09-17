--DML Pengeiriman Makanan(Kelompok 7)
--Anggota Kelompok
--1. Agus Setiawan
--2. Annisa Marfadilla
--3. Gerry Satria Halim


--INSERT DATA perusahaan
INSERT ALL 

	INTO PERUSAHAAN (PNama,PIJ) VALUES ('Si Cepat',2000)
	INTO PERUSAHAAN (PNama,PIJ) VALUES ('Shoppe Food',2000)
	INTO PERUSAHAAN (PNama,PIJ) VALUES ('GoFood',2000)
	INTO PERUSAHAAN (PNama,PIJ) VALUES ('GrabFood',2000)
SELECT * FROM dual;

--INSERT DATA perusahaan_alamat
INSERT ALL 
	INTO PERUSAHAAN_ALAMAT (PID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) 
		VALUES (1, 'Pabuaran', '05', '02', 'Sukamaju', 'Cilodong', 'Depok', 'Jawa Barat', '16415')
	INTO PERUSAHAAN_ALAMAT (PID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) 
		VALUES (2, 'Reformasi', '02', '01', 'Sukamaju', 'Tapos', 'Depok', 'Jawa Barat', '16424')
	INTO PERUSAHAAN_ALAMAT (PID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) 
		VALUES (3, 'Sudirman', '07', '03', 'Serdang', 'Kemayoran', 'Jakarta Pusat', 'DKI Jakarta', '16531')
	INTO PERUSAHAAN_ALAMAT (PID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) 
		VALUES (4, 'Veteran', '02', '02', 'Cikini', 'Menteng', 'Jakarta Pusat', 'DKI Jakarta', '16710')
		
SELECT * FROM dual;
		

--INSERT DATA perusahaan_telp
INSERT ALL
	INTO PERUSAHAAN_TELP (PID, PTelp) VALUES (1, '081214202128')
	INTO PERUSAHAAN_TELP (PID, PTelp) VALUES (1, '085137100200')
	INTO PERUSAHAAN_TELP (PID, PTelp) VALUES (2, '085634302112')
	INTO PERUSAHAAN_TELP (PID, PTelp) VALUES (3, '081323988767')
	INTO PERUSAHAAN_TELP (PID, PTelp) VALUES (4, '081234876493')
SELECT * FROM dual;

-- RIGHT OUTER JOIN
INSERT INTO PERUSAHAAN_TELP (PID) VALUES (4)
SELECT perusahaan_telp.PTELP, perusahaan_TELP.PID, perusahaan.PNAMA FROM PERUSAHAAN_TELP
	RIGHT JOIN perusahaan ON perusahaan_telp.PID = perusahaan.PID

-- LEFT OUTER JOIN
INSERT INTO perusahaan_telp (Ptelp) VALUES ('08123412562')
SELECT perusahaan_telp.PTELP, perusahaan_TELP.PID, perusahaan.PNAMA FROM PERUSAHAAN_TELP
	LEFT JOIN perusahaan ON perusahaan_telp.PID = perusahaan.PID

UPDATE PERUSAHAAN_TELP
	SET PTELP = '08515630421'
WHERE PID = 4;

--INNER JOIN Perusahaan dengan Alamat Perusahaan
SELECT perusahaan.PID, perusahaan.PNAMA, perusahaan_alamat.JALAN, perusahaan_alamat.RT, perusahaan_alamat.RW, perusahaan_alamat.KELURAHAN, 
perusahaan_alamat.KECAMATAN , perusahaan_alamat.KAB_KOTA , perusahaan_alamat.PROVINSI , perusahaan_alamat.KODEPOS 
FROM PERUSAHAAN_ALAMAT
	JOIN perusahaan ON perusahaan_alamat.PID = perusahaan.PID
	
--INNER JOIN Perusahaan dengan Nomor Telepon Perusahaan
SELECT perusahaan.PID, perusahaan.PNAMA, perusahaan_telp.PTELP FROM PERUSAHAAN_TELP
	JOIN perusahaan ON perusahaan_telp.PID = perusahaan.PID

--Testing ON DELETE CASCADE
INSERT INTO PERUSAHAAN (PNama) 
	VALUES ('Tokopedia');
INSERT INTO PERUSAHAAN_ALAMAT (PID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) 
	VALUES (8, 'Mayor Oking', '03', '06', 'Ciriung', 'Cibinong', 'Bogor', 'Jawa Barat', '16681');
DELETE FROM perusahaan 
	WHERE PID = 8;
	
--INSERT DATA Customer
INSERT ALL 
	INTO CUSTOMER (CNik, CNama, CGender, CTelp, CWaktuPesan) 
		VALUES ('327510047210003', 'Agus', 'Pria', '088213715343', TO_TIMESTAMP('2022/07/02 09:30:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'))
	INTO CUSTOMER (CNik, CNama, CGender, CTelp, CWaktuPesan) 
		VALUES ('327510053760004', 'Annisa', 'Wanita', '089561819207', TO_TIMESTAMP('2022/06/17 14:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'))
	INTO CUSTOMER (CNik, CNama, CGender, CTelp, CWaktuPesan) 
		VALUES ('327510064390001', 'Gerry', 'Pria', '085156309401', TO_TIMESTAMP('2022/05/31 12:45:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'))
SELECT * FROM dual;

--INSERT DATA Customer_Alamat
INSERT ALL 
	INTO CUSTOMER_ALAMAT (CID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (1,'Mayor Oking', '03', '06', 'Ciriung', 'Cibinong', 'Bogor', 'Jawa Barat', '16681')
	INTO CUSTOMER_ALAMAT (CID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (2,'Jaya Atmaja', '06', '04', 'Kukusan', 'Beji', 'Depok', 'Jawa Barat', '16325')
	INTO CUSTOMER_ALAMAT (CID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (3, 'Raya Bogor', '08', '01', 'Cimande', 'Caringin', 'Bogor', 'Jawa Barat', '16792')
SELECT * FROM dual;

--INNER JOIN Customer dengan Alamat Customer
SELECT customer.CID, customer.CNIK, customer.CNAMA, customer.CGENDER, customer.CTELP, customer.CWAKTUPESAN, customer_alamat.JALAN, customer_alamat.RT, 
customer_alamat.RW, customer_alamat.KELURAHAN, customer_alamat.KECAMATAN , customer_alamat.KAB_KOTA , customer_alamat.PROVINSI , customer_alamat.KODEPOS 
FROM CUSTOMER_ALAMAT
	JOIN CUSTOMER ON customer_alamat.CID = customer.CID 

--INSERT DATA kurir
INSERT ALL
	INTO kurir(KNik, KNama, KGender, KStatus, KLokasi, KTelp, PID) 
		VALUES ('327510046030001', 'Bayu', 'Pria', 'Y', 'Beji', '089522102291', 2)
	INTO kurir(KNik, KNama, KGender, KStatus, KLokasi, KTelp, PID) 
		VALUES ('327510039480007', 'Yuda', 'Pria', 'N', 'Sudirman','082167210880', 3)
	INTO kurir(KNik, KNama, KGender, KStatus, KLokasi, KTelp, PID) 
		VALUES ('327510038290001', 'Dito', 'Pria', 'Y', 'Cikini', '081821231240', 4)
	INTO kurir(KNik, KNama, KGender, KStatus, KLokasi, KTelp, PID) 
		VALUES ('327510085540009', 'Kayla', 'Wanita', 'N', 'Jatinegara', '081821231240', 1)
SELECT * FROM dual;

--INSERT DATA Kurir_Alamat
INSERT ALL 
	INTO KURIR_ALAMAT (KID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (1, 'Mangga Besar','01', '05', 'Mangga Besar', 'Jayakarta', 'Jakarta Pusat', 'DKI Jakarta', '10745')
	INTO KURIR_ALAMAT (KID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (2, 'Karang Anyar','02', '05', 'Karang Anyar', 'Sawah Besar', 'Jakarta Pusat', 'DKI Jakarta', '10452')
	INTO KURIR_ALAMAT (KID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (3, 'Kartini','04', '05', 'Kartini', 'Sawah Besar', 'Jakarta Utara', 'DKI Jakarta', '10256')
	INTO KURIR_ALAMAT (KID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (4, 'Waringin Sari','02', '07', 'Waringin sari', 'Langen Sari', 'Banjar', 'Jawa Barat', '12045')
SELECT * FROM dual;

--INNER JOIN data kurir dengan perusahaan
SELECT kurir.KID, kurir.KNIK, kurir.KNAMA, kurir.KGENDER, kurir.KSTATUS, kurir.KLOKASI, kurir.KTELP, perusahaan.PNAMA 
FROM KURIR
	JOIN perusahaan ON kurir.PID = perusahaan.PID 

--INNER JOIN data kurir dengan alamat kurir
SELECT kurir.KID, kurir.KNIK, kurir.KNAMA, kurir.KGENDER, kurir.KSTATUS, kurir.KLOKASI, kurir.KTELP, kurir_alamat.JALAN, kurir_alamat.RT, 
kurir_alamat.RW, kurir_alamat.KELURAHAN, kurir_alamat.KECAMATAN , kurir_alamat.KAB_KOTA , kurir_alamat.PROVINSI , kurir_alamat.KODEPOS 
FROM KURIR_ALAMAT
	JOIN KURIR ON kurir_alamat.KID = kurir.KID 

--INSERT DATA Kendaraan
INSERT ALL
	INTO KENDARAAN (KID, KenNoPol, KenMerk) VALUES (1, 'B 5218 IBM', 'Yamaha')
	INTO KENDARAAN (KID, KenNoPol, KenMerk) VALUES (2, 'f 4124 IBM', 'Honda')
	INTO KENDARAAN (KID, KenNoPol, KenMerk) VALUES (3, 'Z 5122 IBM', 'Kawasaki')
	INTO KENDARAAN (KID, KenNoPol, KenMerk) VALUES (4, 'A 4131 IBM', 'Suzuki')
SELECT * FROM dual;

--INNER JOIN Kurir dengan Kendaraan
SELECT kurir.KID, kurir.KNIK, kurir.KNAMA, kurir.KGENDER, kurir.KSTATUS, kurir.KLOKASI, kurir.KTELP, kendaraan.KENNOPOL, kendaraan.KENMERK 
FROM kendaraan
	JOIN kurir ON kendaraan.KID = kurir.KID 

--INSERT DATA Restoran
INSERT ALL
	INTO RESTORAN (RNAMA, RJAMBUKA, RJAMTUTUP, PID) VALUES ('Piring Kecil Resto', TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'), TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),1)
	INTO RESTORAN (RNAMA, RJAMBUKA, RJAMTUTUP, PID) VALUES ('Hanamasa', TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'), TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),2)
	INTO RESTORAN (RNAMA, RJAMBUKA, RJAMTUTUP, PID) VALUES ('Masakan Madura Pak Kris', TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'), TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),3)
	INTO RESTORAN (RNAMA, RJAMBUKA, RJAMTUTUP, PID) VALUES ('Rumah Makan Jogja', TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'), TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),4)
	SELECT * FROM dual;

--INNER JOIN Restoran dengan Perusahaan
SELECT restoran.RID, restoran.RNAMA, restoran.RJAMBUKA, restoran.RJAMTUTUP, perusahaan.PNAMA 
FROM RESTORAN
	JOIN PERUSAHAAN ON restoran.PID = perusahaan.PID 

--INSERT DATA Restoran_Alamat
INSERT ALL
	INTO RESTORAN_ALAMAT (RID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (1, 'Batu Atas','07', '05', 'Manggarai barat', 'Manggarai', 'Jakarta Selatan', 'DKI Jakarta', '10845')
	INTO RESTORAN_ALAMAT (RID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (2, 'jl indah', '01','07', 'tebet utara','Tebet','Jakarta Selatan', 'DKI Jakarta','10574')
	INTO RESTORAN_ALAMAT (RID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (3, 'jl jelek', '02','07', 'tebet utara','Tebet','Jakarta Selatan', 'DKI Jakarta','10574')
	INTO RESTORAN_ALAMAT (RID, Jalan, RT, RW, Kelurahan, Kecamatan, Kab_Kota, Provinsi, KodePos) VALUES (4, 'jl Permai indah', '07','07', 'tebet pusat','Tebet','Jakarta Selatan', 'DKI Jakarta','1057')

SELECT * FROM dual;

--INNER JOIN Restoran dengan Alamat Restoran
SELECT restoran.RID, restoran.RNAMA, restoran.RJAMBUKA, restoran.RJAMTUTUP, restoran_alamat.JALAN, restoran_alamat.RT, restoran_alamat.RW, 
restoran_alamat.KELURAHAN, restoran_alamat.KECAMATAN , restoran_alamat.KAB_KOTA , restoran_alamat.PROVINSI , restoran_alamat.KODEPOS 
FROM RESTORAN_ALAMAT
	JOIN restoran ON restoran_alamat.RID = restoran.RID 
	
--INSERT DATA Restoran_Telp
INSERT ALL
	INTO RESTORAN_TELP (RID, RTELP) VALUES (1, '021 214215')
	INTO RESTORAN_TELP (RID, RTELP) VALUES (2, '021 741525')
	INTO RESTORAN_TELP (RID, RTELP) VALUES (3, '021 215121')
	INTO RESTORAN_TELP (RID, RTELP) VALUES (4, '021 125456')

SELECT * FROM dual;

--INNER JOIN Restoran dengan Nomor Telepon
SELECT restoran.RID, restoran.RNAMA, restoran.RJAMBUKA, restoran.RJAMTUTUP, restoran_telp.RTELP 
FROM RESTORAN_TELP
	JOIN restoran ON restoran_telp.RID = restoran.RID

--LEFT JOIN 
INSERT INTO restoran(RjamBuka, PID) VALUES (TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'), 1)


SELECT 
--INSERT DATA Makanan
INSERT ALL 
	INTO MAKANAN (MNama, MStock, MHarga, RID) VALUES ('Nasi Ayam Mentega', 20, 25000, 1)
	INTO MAKANAN (MNama, MStock, MHarga, RID) VALUES ('Yakiniku', 14, 188000,2)
	INTO MAKANAN (MNama, MStock, MHarga, RID) VALUES ('Nasi Cumi Hitam',10, 30000,3) 
	INTO MAKANAN (MNama, MStock, MHarga, RID) VALUES ('Gudeg Jogja', 12, 35000, 4)
SELECT * FROM dual;

--INNER JOIN Makanan dengan Restoran
SELECT makanan.MID , makanan.MNama, makanan.MStock, makanan.MHarga, restoran.RID 
FROM MAKANAN
	JOIN restoran ON makanan.RID = restoran.RID


--INSERT DATA Order_Makanan
INSERT ALL 
	INTO ORDER_MAKANAN (OResi, OJarak,  OWaktuKirim, OWaktuTerima,  KID, CID, MID,PID) VALUES ('000001',10,TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),1,1,1,1 )
	INTO ORDER_MAKANAN (OResi, OJarak,  OWaktuKirim, OWaktuTerima,  KID, CID, MID,PID) VALUES ('000002',15,TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),2,2,2,2 )
	INTO ORDER_MAKANAN (OResi, OJarak,  OWaktuKirim, OWaktuTerima,  KID, CID, MID,PID) VALUES ('000003',20,TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),TO_TIMESTAMP('09:30:00.00', 'HH24:MI:SS.FF'),3,3,3,3 )
SELECT * FROM dual;

--INNER JOIN data kurir, customer, order, dan makanan 
SELECT kurir.KNAMA, customer.CNAMA, order_makanan.ORESI, makanan.MNAMA, makanan.MHARGA , order_makanan.OJARAK, (PIJ * OJarak) AS OPharga, (MHarga + (PIJ * OJarak)) AS OHarga
FROM ORDER_MAKANAN
	JOIN CUSTOMER ON order_makanan.CID = customer.CID
	JOIN KURIR ON order_makanan.KID = kurir.KID 
	JOIN MAKANAN ON order_makanan.MID = makanan.MID 
	JOIN PERUSAHAAN ON order_makanan.PID = Perusahaan.PID 
	

--INSERT DATA Transaksi
INSERT ALL 
	INTO TRANSAKSI (CID, OID, RID, TMetode, TPembayaran, TTanggal) VALUES (1,1,1,'COD',100000,'10-aug-2025')
	INTO TRANSAKSI (CID, OID, RID, TMetode, TPembayaran, TTanggal) VALUES (1,1,1,'Transfer',150000,'12-aug-2025')
	INTO TRANSAKSI (CID, OID, RID, TMetode, TPembayaran, TTanggal) VALUES (1,1,1,'COD',240000,'13-aug-2025')
SELECT * FROM dual;

--INNER JOIN data customer, order, restoran, dan transaksi
SELECT customer.CNAMA, order_makanan.ORESI, restoran.RNAMA, transaksi.TMETODE, transaksi.TPEMBAYARAN, transaksi.TTANGGAL 
FROM TRANSAKSI
	JOIN CUSTOMER ON transaksi.CID = customer.CID 
	JOIN ORDER_MAKANAN ON transaksi.CID = order_makanan.OID 
	JOIN RESTORAN ON transaksi.CID = restoran.RID 
	
--Delete Data from table	
Delete FROM perusahaan WHERE PID =1;
--Delete All Data from table
TRUNCATE TABLE perusahaan; 