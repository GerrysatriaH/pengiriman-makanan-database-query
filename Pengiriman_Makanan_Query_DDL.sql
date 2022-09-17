--DDL Pengeiriman Makanan(Kelompok 7)
--Anggota Kelompok
--1. Agus Setiawan
--2. Annisa Marfadilla
--3. Gerry Satria Halim

--CREATE USER 
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER pengiriman1 IDENTIFIED BY aag;

GRANT ALL PRIVILEGES TO pengiriman1;


--CREATE TABLE perusahaan
CREATE TABLE perusahaan(
	PID NUMBER (10) PRIMARY KEY,
	PNama VARCHAR (50), 
	PIJ NUMBER (10)
);

DROP SEQUENCE perusahaan_seq;
CREATE SEQUENCE perusahaan_seq START WITH 1;

CREATE OR REPLACE TRIGGER perusahaan_on_insert
	 BEFORE INSERT ON perusahaan
	 FOR EACH ROW
BEGIN
	 SELECT perusahaan_seq.nextval
	 INTO :new.PID
	 FROM dual;
END;

--CREATE TABLE perusahaan_alamat
CREATE TABLE perusahaan_alamat (
	PID NUMBER (10),
	Jalan VARCHAR (100),
	RT VARCHAR (5),
	RW VARCHAR (5),
	Kelurahan VARCHAR (20),
	Kecamatan VARCHAR (20),
	Kab_Kota VARCHAR (30),
	Provinsi VARCHAR (20),
	KodePos VARCHAR(6)
);

--ADD FK 
ALTER TABLE perusahaan_alamat ADD CONSTRAINT perusahaan_fk FOREIGN KEY (PID) REFERENCES perusahaan(PID) ON DELETE CASCADE;
	
--CREATE TABLE perusahaan_telp
CREATE TABLE perusahaan_telp(
	PID NUMBER (10),
	PTelp VARCHAR (15),
	CONSTRAINT perusahaan_telp_fk FOREIGN KEY (PID) REFERENCES perusahaan(PID) 
	ON DELETE CASCADE
);

--CREATE TABLE customer
CREATE TABLE customer(
	CID NUMBER (10)PRIMARY KEY,
	CNIK VARCHAR (15) UNIQUE,
	CNama VARCHAR (50),
	CGender VARCHAR (10),
	CTelp VARCHAR (15),
	CWaktuPesan TIMESTAMP
);

DROP SEQUENCE customer_seq;
CREATE SEQUENCE customer_seq START WITH 1;

CREATE OR REPLACE TRIGGER customer_on_insert
	 BEFORE INSERT ON customer
	 FOR EACH ROW
BEGIN
	 SELECT customer_seq.nextval
	 INTO :new.CID
	 FROM dual;
END;

--CREATE TABLE customer_alamat
CREATE TABLE customer_alamat (
	CID NUMBER (10),
	Jalan VARCHAR (100),
	RT VARCHAR (5),
	RW VARCHAR (5),
	Kelurahan VARCHAR (20),
	Kecamatan VARCHAR (20),
	Kab_Kota VARCHAR (30),
	Provinsi VARCHAR (20),
	KodePos VARCHAR (6),
	CONSTRAINT customer_fk FOREIGN KEY (CID) REFERENCES customer(CID) 
	ON DELETE CASCADE
);

--CREATE TABLE kurir
CREATE TABLE kurir(
	KID NUMBER (10) PRIMARY KEY,
	KNIK VARCHAR (20) UNIQUE,
	KNama VARCHAR (50),
	KGender VARCHAR (10),
	KStatus CHAR (1),
	KLokasi VARCHAR (50),
	kTelp VARCHAR (12),
	PID NUMBER (10),
	CONSTRAINT perusahaan_kurir_fk FOREIGN KEY (PID) REFERENCES perusahaan(PID)
	ON DELETE CASCADE
);

DROP SEQUENCE kurir_seq;
CREATE SEQUENCE kurir_seq START WITH 1;

CREATE OR REPLACE TRIGGER kurir_on_insert
	 BEFORE INSERT ON kurir
	 FOR EACH ROW
BEGIN
	 SELECT kurir_seq.nextval
	 INTO :new.KID
	 FROM dual;
END;

--CREATE TABLE kurir_alamat
CREATE TABLE kurir_alamat(
	KID NUMBER (10),
	Jalan VARCHAR (100),
	RT VARCHAR (5),
	RW VARCHAR (5),
	Kelurahan VARCHAR (20),
	Kecamatan VARCHAR (20),
	Kab_Kota VARCHAR (30),
	Provinsi VARCHAR (20),
	KodePos VARCHAR (6),
	CONSTRAINT kurir_alamat_fk FOREIGN KEY (KID) REFERENCES kurir(KID) 
	ON DELETE CASCADE
);

--CREATE TABLE kendaraan
CREATE TABLE kendaraan(
	KID NUMBER (10),
	KenNoPol VARCHAR (10),
	KenMerk VARCHAR (10),
	CONSTRAINT kendaraan_fk FOREIGN KEY (KID) REFERENCES kurir(KID)
	ON DELETE CASCADE
);

--CREATE TABLE restoran
CREATE TABLE restoran(
	RID NUMBER (10) PRIMARY KEY,
	RNama VARCHAR (50),
	RJamBuka TIMESTAMP,
	RJamTutup TIMESTAMP,
	PID NUMBER (10),
	CONSTRAINT perusahaan_restoran_fk FOREIGN KEY (PID) REFERENCES perusahaan(PID)
	ON DELETE CASCADE
);

DROP SEQUENCE restoran_seq;
CREATE SEQUENCE restoran_seq START WITH 1;

CREATE OR REPLACE TRIGGER restoran_on_insert
	 BEFORE INSERT ON restoran
	 FOR EACH ROW
BEGIN
	 SELECT restoran_seq.nextval
	 INTO :new.RID
	 FROM dual;
END;

--CREATE TABLE restoran_alamat
CREATE TABLE restoran_alamat (
	RID NUMBER (10),
	Jalan VARCHAR (100),
	RT VARCHAR (5),
	RW VARCHAR (5),
	Kelurahan VARCHAR (20),
	Kecamatan VARCHAR (20),
	Kab_Kota VARCHAR (30),
	Provinsi VARCHAR (20),
	KodePos VARCHAR (6),
	CONSTRAINT restoran_alamat_fk FOREIGN KEY (RID) REFERENCES restoran(RID) 
	ON DELETE CASCADE
);

--CREATE TABLE restoran_telp
CREATE TABLE restoran_telp(
	RID NUMBER (10),
	RTelp VARCHAR (20),
	CONSTRAINT restoran_telp_fk FOREIGN KEY (RID) REFERENCES restoran(RID) 
	ON DELETE CASCADE
);

--CREATE TABLE makanan
CREATE TABLE makanan(
	MID NUMBER (10) PRIMARY KEY,
	MNama VARCHAR (50),
	MStock NUMBER (2),
	MHarga NUMBER (10),
	RID NUMBER (10),
	CONSTRAINT restoran_fk FOREIGN KEY (RID) REFERENCES restoran(RID)
	ON DELETE CASCADE
);

DROP SEQUENCE makanan_seq;
CREATE SEQUENCE makanan_seq START WITH 1;

CREATE OR REPLACE TRIGGER makanan_on_insert
	 BEFORE INSERT ON makanan
	 FOR EACH ROW
BEGIN
	 SELECT makanan_seq.nextval
	 INTO :new.MID
	 FROM dual;
END;

	
--CREATE TABLE order
CREATE TABLE order_makanan(
	OID NUMBER (10) PRIMARY KEY,
	OResi VARCHAR (15) UNIQUE,
	OWaktuKirim TIMESTAMP,
	OWaktuTerima TIMESTAMP,
	OJarak NUMBER (3),
	KID NUMBER (10),
	CID NUMBER (10),
	PID NUMBER (10),
	MID NUMBER (10),
	CONSTRAINT kurir_order_fk FOREIGN KEY (KID) REFERENCES kurir(KID) 
	ON DELETE CASCADE,
	CONSTRAINT customer_order_fk FOREIGN KEY (CID) REFERENCES customer(CID) 
	ON DELETE CASCADE,
	CONSTRAINT perusahaan_order_fk FOREIGN KEY (PID) REFERENCES perusahaan (PID)
	ON DELETE CASCADE,
	CONSTRAINT makanan_order_fk FOREIGN KEY (MID) REFERENCES makanan(MID) 
	ON DELETE CASCADE
);

DROP SEQUENCE order_seq;
CREATE SEQUENCE order_seq START WITH 1;

CREATE OR REPLACE TRIGGER order_on_insert
	 BEFORE INSERT ON order_makanan
	 FOR EACH ROW
BEGIN			
	 SELECT order_seq.nextval
	 INTO :new.OID
	 FROM dual;
END;

--CREATE TABLE transaksi
CREATE TABLE transaksi(
	TID NUMBER (10) PRIMARY KEY,
	CID NUMBER (10),
	OID NUMBER (10),
	RID NUMBER (10),
	TMetode VARCHAR (50),
	TTanggal DATE,
	TPembayaran NUMBER (10),
	CONSTRAINT customer_transaksi_fk FOREIGN KEY (CID) REFERENCES customer (CID)
	ON DELETE CASCADE,
	CONSTRAINT order_transaksi_fk FOREIGN KEY (OID) REFERENCES order_makanan (OID)
	ON DELETE CASCADE,
	CONSTRAINT restoran_transaksi_fk FOREIGN KEY (RID) REFERENCES restoran (RID)
	ON DELETE CASCADE
);

DROP SEQUENCE transaksi_seq;
CREATE SEQUENCE transaksi_seq START WITH 1;

CREATE OR REPLACE TRIGGER transaksi_on_insert
	 BEFORE INSERT ON transaksi
	 FOR EACH ROW
BEGIN
	 SELECT transaksi_seq.nextval
	 INTO :new.TID
	 FROM dual;
END;

--END OF QUERY TABLE--


--drop sequence table
DROP SEQUENCE perusahaan_seq;

--drop table
DROP TABLE perusahaan;

--drop column
ALTER TABLE kurir DROP KenNopol;

--drop FK
ALTER TABLE restoran DROP FOREIGN KEY perusahaan_fk;

--Add Column 
ALTER TABLE restoran ADD rating INT(10);

--Modify data type
ALTER TABLE kurir MODIFY Ktelp NUMBER(15);

--Add Foreign Key to table
ALTER TABLE kurir ADD CONSTRAINT perusahaan_fk FOREIGN KEY (PID) REFERENCES perusahaan (PID);

--Add Foreign Key to table with Action
ALTER TABLE kurir ADD CONSTRAINT perusahaan_fk FOREIGN KEY (PID) REFERENCES perusahaan (PID) 
ON UPDATE CASCADE ON DELETE CASCADE;