create database QuanLyVatTu;
use QuanLyVatTu;

create table VatTu(
    vtID int not null auto_increment primary key ,
    MaVT int ,
    TenVT varchar(50),
    DonViVT varchar(20),
    GiaTien int
);

create table TonKho(
    tkID int not null auto_increment primary key ,
    vtID int,
    slBanDau varchar(250),
    tongSLN varchar(250),
    tongSLX varchar(250),
    foreign key (vtID) references VatTu(vtID)
);

create table NhaCungCap(
    nccID int not null auto_increment primary key ,
    MaCc int ,
    TenNcc varchar(50),
    DiaChi varchar(50),
    SDT varchar(50)
);

create table DonDatHang(
    ddhID int not null auto_increment primary key ,
    MaDdh int,
    NgayDat date,
    nccID int,
    foreign key (nccID) references NhaCungCap(nccID)
);

create table PhieuNhap(
    pnID int not null auto_increment primary key ,
    MaPN int,
    NgayNhap date,
    ddhID int,
    foreign key (ddhID) references DonDatHang(ddhID)
);

create table PhieuXuat(
    pxID int not null auto_increment primary key ,
    MaPX int,
    NgayXuat date,
    TenKH varchar(50)
);

create table ChiTietDonHang(
    CtDhID int not null auto_increment primary key ,
    ddhID int,
    vtID int,
    SLDat varchar(250),
    foreign key (ddhID) references DonDatHang(ddhID),
    foreign key (vtID) references VatTu(vtID)
);

create table ChiTietPhieuNhap(
    CtPnID int not null auto_increment primary key ,
    pnID int,
    vtID int,
    SLNhap varchar(250),
    DonGiaNhap int,
    GhiChu varchar(250),
    foreign key (pnID) references PhieuNhap(pnID),
    foreign key (vtID) references VatTu(vtID)
);

create table ChiTietPhieuXuat(
    CtPxID int not null auto_increment primary key ,
    pxID int,
    vtID int,
    SLXuat varchar(250),
    DonGiaXuat int,
    GhiChu varchar(250),
    foreign key (pxID) references PhieuXuat(pxID),
    foreign key (vtID) references VatTu(vtID)
);

#5 ban ghi vat tu
insert into VatTu values (1,01,'gach','vien',3000);
insert into VatTu values (2,02,'ngoi','vien',3000);
insert into VatTu values (3,03,'thuoc do','cai',50000);
insert into VatTu values (4,04,'bay','cai',100000);
insert into VatTu values (5,05,'xi mang','bao',300000);

#5 ban ghi ton kho
insert into TonKho values (1,1,'2000 vien gach','3000 vien gach','1000 vien gach');
insert into TonKho values (2,2,'1000 vien ngoi','20000 vien ngoi','3000 vien ngoi');
insert into TonKho values (3,3,'20 cai thuoc','300 cai thuoc','100 cai thuoc');
insert into TonKho values (4,4,'2 cai bay','2000 cai bay','1000 cai bay');
insert into TonKho values (5,5,'1000 bao','4000 bao','2000 bao');

# 3 nh?? cung c???p
insert into NhaCungCap values (1,001,'NCC1','Ha Nam','0123786545');
insert into NhaCungCap values (2,002,'NCC2','Hai Phong','0123486545');
insert into NhaCungCap values (3,003,'NCC3','Thanh Hoa','0123734545');

# 3 ????n h??ng
insert into DonDatHang values (1,111,'2022/3/25',1);
insert into DonDatHang values (2,222,'2022/3/30',2);
insert into DonDatHang values (3,333,'2022/3/28',3);

# 3 phi???u nh???p
insert into PhieuNhap values (1,10,'2022/2/12',1);
insert into PhieuNhap values (2,11,'2022/2/14',2);
insert into PhieuNhap values (3,12,'2022/2/16',3);

# 3 phi???u xu???t
insert into PhieuXuat values (1,12,'2022/3/11','Nam');
insert into PhieuXuat values (2,13,'2022/3/16','Hung');
insert into PhieuXuat values (3,14,'2022/3/18','Tuan');

# 6 CT ????n h??ng
insert into ChiTietDonHang values (1,1,2,'1000 vien ngoi');
insert into ChiTietDonHang values (2,3,3,'100 cai thuoc');
insert into ChiTietDonHang values (3,2,1,'2000 vien gach');
insert into ChiTietDonHang values (4,1,4,'10 cai thuoc');
insert into ChiTietDonHang values (5,2,5,'1000 bao');
insert into ChiTietDonHang values (6,1,1,'100 vien gach');
# 6 CT Phi???u nh???p
insert into ChiTietPhieuNhap values (1,1,1,'4000 vien gach',2000,'gach 4 lo');
insert into ChiTietPhieuNhap values (2,2,2,'3000 vien ngoi',1000,'ngoi dai');
insert into ChiTietPhieuNhap values (3,3,3,'100 thuoc do',30000,'thuoc 500m');
insert into ChiTietPhieuNhap values (4,2,4,'1000 cai bay',70000,'bay to');
insert into ChiTietPhieuNhap values (5,1,1,'1000 vien gach',3000,'gach 6 lo');
insert into ChiTietPhieuNhap values (6,3,5,'3000 bao ',100000,'loai 30kg');

# 6 CT Phi???u xu???t
insert into ChiTietPhieuXuat values (1,1,1,'200 vien gach',3000,'gach 4 lo');
insert into ChiTietPhieuXuat values (2,2,3,'50 cai thuoc do',50000,'thuoc 500m');
insert into ChiTietPhieuXuat values (3,2,4,'300 bay',80000,'bay to');
insert into ChiTietPhieuXuat values (4,1,2,'2000 vien ngoi',2000,'ngoi dai');
insert into ChiTietPhieuXuat values (5,3,1,'1000 vien gach',4000,'gacg 6 lo');
insert into ChiTietPhieuXuat values (6,3,5,'1000 bao',150000,'loai 30kg');

#T???o view c?? t??n vw_CTPNHAP bao g???m c??c th??ng tin sau: s??? phi???u nh???p h??ng, m?? v???t t??, s??? l?????ng nh???p, ????n gi?? nh???p, th??nh ti???n nh???p.
create view CTPNhap_view as select PN.pnID,MaVT,SLNhap,DonGiaNhap from ChiTietPhieuNhap C join VatTu VT on VT.vtID = C.vtID join PhieuNhap PN on PN.pnID = C.pnID group by PN.pnID, SLNhap, DonGiaNhap;
select pnID,MaVT,SLNhap,DonGiaNhap,sum(SLNhap*DonGiaNhap)  as 'Thanh tien' from ChiTietPhieuNhap join VatTu VT on VT.vtID = ChiTietPhieuNhap.vtID group by MaVT, pnID, SLNhap, DonGiaNhap;

#T???o view c?? t??n vw_CTPNHAP_VT bao g???m c??c th??ng tin sau: s??? phi???u nh???p h??ng, m?? v???t t??, t??n v???t t??, s??? l?????ng nh???p, ????n gi?? nh???p, th??nh ti???n nh???p.
create view vw_CTPNHAP_VT as select pnID,MaVT,TenVT,DonGiaNhap ,SLNhap from ChiTietPhieuNhap join VatTu VT on VT.vtID = ChiTietPhieuNhap.vtID;
select pnID,MaVT,TenVT,SLNhap,DonGiaNhap,sum(SLNhap*ChiTietPhieuNhap.DonGiaNhap) as 'Thanh tien' from ChiTietPhieuNhap join VatTu VT on VT.vtID = ChiTietPhieuNhap.vtID group by pnID, MaVT, TenVT, SLNhap, DonGiaNhap;

#T???o view c?? t??n vw_CTPNHAP_VT_PN bao g???m c??c th??ng tin sau: s??? phi???u nh???p h??ng, ng??y nh???p h??ng, s??? ????n ?????t h??ng, m?? v???t t??, t??n v???t t??, s??? l?????ng nh???p, ????n gi?? nh???p, th??nh 	ti???n nh???p.
create view vw_CTPNHAP_VT_PN as select C.pnID,NgayNhap,ddhID,MaVT,TenVT,SLNhap,DonGiaNhap from ChiTietPhieuNhap C join VatTu VT on VT.vtID = C.vtID join PhieuNhap PN on C.pnID = PN.pnID;
select C.pnID,NgayNhap,ddhID,MaVT,TenVT,SLNhap,DonGiaNhap,sum(SLNhap*C.DonGiaNhap) as 'Thanh tien' from ChiTietPhieuNhap C join VatTu VT on VT.vtID = C.vtID join PhieuNhap PN on C.pnID = PN.pnID group by pnID, NgayNhap, ddhID, MaVT,TenVT, SLNhap, DonGiaNhap;

#T???o view c?? t??n vw_CTPNHAP_VT_PN_DH bao g???m c??c th??ng tin sau: s??? phi???u nh???p h??ng, ng??y nh???p h??ng, s??? ????n ?????t h??ng, m?? nh?? cung c???p, m?? v???t t??, t??n v???t t??, s??? l?????ng nh???p, ????n gi?? nh???p, th??nh ti???n nh???p.
create view vw_CTPNHAP_VT_PN_DH as select NgayNhap,DDH.ddhID,MaCc,MaVT,TenVT,SLNhap,DonGiaNhap from vw_CTPNHAP_VT_PN v join DonDatHang DDH on v.ddhID = DDH.ddhID join NhaCungCap NCC on NCC.nccID = DDH.nccID;
select NgayNhap,DDH.ddhID,MaCc,MaVT,TenVT,SLNhap,DonGiaNhap,sum(SLNhap*DonGiaNhap) as 'Thanh tien' from vw_CTPNHAP_VT_PN v join DonDatHang DDH on v.ddhID = DDH.ddhID join NhaCungCap NCC on NCC.nccID = DDH.nccID group by NgayNhap, DDH.ddhID, MaCc, MaVT, TenVT, SLNhap, DonGiaNhap;

#T???o view c?? t??n vw_CTPNHAP_loc  bao g???m c??c th??ng tin sau: s??? phi???u nh???p h??ng, m?? v???t t??, s??? l?????ng nh???p, ????n gi?? nh???p, th??nh ti???n nh???p. V?? ch??? li???t k?? c??c chi ti???t nh???p c?? s??? l?????ng nh???p > 2000.
create view vw_CTPNHAP_loc as select pnID,MaVT,SLNhap,DonGiaNhap from ChiTietPhieuNhap C join VatTu VT on VT.vtID = C.vtID;
select pnID,MaVT,SLNhap,DonGiaNhap ,sum(SLNhap*DonGiaNhap) as 'Thanh tien' from ChiTietPhieuNhap C join VatTu VT on VT.vtID = C.vtID group by pnID, MaVT, SLNhap, DonGiaNhap having (SLNhap)>2000;
# T???o view c?? t??n vw_CTPNHAP_VT_loc bao g???m c??c th??ng tin sau: s??? phi???u nh???p h??ng, m?? v???t t??, t??n v???t t??, s??? l?????ng nh???p, ????n gi?? nh???p, th??nh ti???n nh???p. V?? ch??? li???t k?? c??c chi ti???t nh???p v???t t?? c?? ????n v??? t??nh l?? vien.
create view vw_CTPNHAP_VT_loc as select pnID,MaVT,TenVT,SLNhap,DonGiaNhap from ChiTietPhieuNhap C join VatTu VT on VT.vtID = C.vtID;
select pnID,MaVT,TenVT,SLNhap,DonGiaNhap,DonViVT,sum(SLNhap*C.DonGiaNhap) as 'Thanh tien'  from ChiTietPhieuNhap C  join VatTu VT on VT.vtID = C.vtID group by pnID, MaVT, TenVT, SLNhap, DonGiaNhap,DonViVT having (DonViVT)='vien';
#T???o view c?? t??n vw_CTPXUAT_VT bao g???m c??c th??ng tin sau: s??? phi???u xu???t h??ng, m?? v???t t??, t??n v???t t??, s??? l?????ng xu???t, ????n gi?? xu???t.
create view vw_CTPXUAT_VT as select pxID,MaVT,TenVT,SLXuat,DonGiaXuat from ChiTietPhieuXuat c join VatTu VT on c.vtID = VT.vtID;
select  pxID,MaVT,TenVT,SLXuat,DonGiaXuat from ChiTietPhieuXuat c join VatTu VT on c.vtID = VT.vtID group by pxID, MaVT, TenVT, SLXuat, DonGiaXuat;
#T???o view c?? t??n vw_CTPXUAT_VT_PX bao g???m c??c th??ng tin sau: s??? phi???u xu???t h??ng, t??n kh??ch h??ng, m?? v???t t??, t??n v???t t??, s??? l?????ng xu???t, ????n gi?? xu???t.
create view  vw_CTPXUAT_VT_PX as select P.pxID,TenKH,MaVT,TenVT,SLXuat,DonGiaXuat from ChiTietPhieuXuat c join VatTu VT on c.vtID = VT.vtID join PhieuXuat p on c.pxID = p.pxID;
select P.pxID,TenKH,MaVT,TenVT,SLXuat,DonGiaXuat from ChiTietPhieuXuat c join VatTu VT on c.vtID = VT.vtID join PhieuXuat p on c.pxID = p.pxID group by P.pxID,TenKH,MaVT,TenVT,SLXuat,DonGiaXuat;


#T???o Stored procedure (SP) cho bi???t t???ng s??? l?????ng cu???i c???a v???t t?? v???i m?? v???t t?? l?? tham s??? v??o.
delimiter \\
create procedure TongSoLuongCuoi(
in vtID int,
out total int
)
begin
    select sum(slBanDau+(TonKho.tongSLN-TonKho.tongSLX)) into total from TonKho where vtID>0;
end \\
call TongSoLuongCuoi('1',@total);
select @total;
#T???o SP cho bi???t t???ng ti???n xu???t c???a v???t t?? v???i m?? v???t t?? l?? tham s??? v??o.


# T???o SP cho bi???t t???ng s??? l?????ng ?????t theo s??? ????n h??ng v???i s??? ????n h??ng l?? tham s??? v??o.


#T???o SP d??ng ????? th??m m???t ????n ?????t h??ng nha.
delimiter //
create procedure addDonDatHang()
begin
    insert into DonDatHang values (4,444,'2022/6/26',2);
end //
call addDonDatHang();
#T???o SP d??ng ????? th??m m???t chi ti???t ????n ?????t h??ng nghen.
delimiter //
create procedure addChiTietDonDatHang()
begin
    insert into ChiTietDonHang values (9,2,2,'100 vien');
end //
call addChiTietDonDatHang();
