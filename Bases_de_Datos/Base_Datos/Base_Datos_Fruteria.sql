create database Fruteria;
use Fruteria;
-- drop database fruteria;
create table tienda (
ident_tiend int auto_increment primary key,
nombre char(15) not null,
tlfn varchar(17) not null unique,
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$") 
);

create table Proveedor(
ident_prov int auto_increment primary key,
empresa varchar(30) not null,
tlfn varchar(17)not null unique,
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$")  
);

create table Transportista(
ident_trasp int auto_increment primary key,
nombre_trasp char(15) not null,
apellidos char(30) not null,
fecha_nacimiento date not null,
tlfn varchar(17)not null unique , 
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$"),
DNI varchar(9)not null unique,
check(DNI regexp"[0-9]{8}[A-Z]$")
);

create table cliente (
ident_client int auto_increment primary key,
nombre_client char(15) not null,
apellidos char(30) not null,
fecha_nacimiento date not null,
tlfn varchar(17)not null unique,
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$")  ,
DNI varchar(9)not null unique,
check(DNI regexp"[0-9]{8}[A-Z]$") ,
ident_tiend int,
foreign key(ident_tiend) references tienda(ident_tiend)
on update cascade
on delete set null
);

create table Tranportista_tienda(
ident_trasp int,
ident_tiend int,
foreign key (ident_trasp) references transportista(ident_trasp)
on update cascade
on delete cascade,
foreign key (ident_tiend) references tienda(ident_tiend)
on update cascade
on delete cascade,
primary key(ident_tiend, ident_trasp)
);

create table Proveedor_tienda (
ident_prov int,
ident_tiend int,
foreign key (ident_prov) references proveedor(ident_prov)
on update cascade
on delete cascade,
foreign key (ident_tiend) references tienda(ident_tiend)
on update cascade
on delete cascade,
primary key(ident_tiend, ident_prov)
);

create table producto(
ident_product int auto_increment primary key,
nombre_product varchar(30) not null,
fecha_vencimiento date not null,
precios double(4,2) not null,
ident_prov int,
ident_client int,
ident_trasp int,
foreign key (ident_prov) references proveedor(ident_prov)
on update cascade
on delete set null,
foreign key (ident_client) references cliente(ident_client)
on update cascade
on delete set null,
foreign key (ident_trasp) references transportista(ident_trasp)
on update cascade
on delete set null
);

create table Verdura(
ident_Verd int primary key,
part_comestible enum("Raíz","Tallo","Hoja","Flor") default "Tallo",
foreign key (ident_Verd) references producto(ident_product)
);

create table Fruta(
ident_Frut int primary key,
tipo_Semilla enum("Hueso","Pepita","citrico","Sin semilla") default "Hueso",
foreign key (ident_Frut) references producto(ident_product)
);
use Fruteria;
 
insert into tienda(nombre, tlfn) values("U.N.A","+34 910 48 27 35");
insert into proveedor(empresa, tlfn) values("Eurogroup España","+34 612 84 92 57"),("Frutas Peyfi","+34 722 91 04 66"),("Frutas Ibérika","+34 693 55 28 41");
INSERT INTO producto(nombre_product, fecha_vencimiento, precios) VALUES ("Manzanas Fuji",'2026-04-18',12.49),("Peras Conferencia",'2026-04-20',11.29),("Plátanos de Canarias",'2026-04-16',13.85),("Naranjas Valencia",'2026-04-25',14.3),("Fresas frescas",'2026-04-22',15.6),("Kiwi verde",'2026-04-19',16.25),("Uvas blancas",'2026-04-17',17.4),("Tomates rama",'2026-04-13',18.55),("Lechuga iceberg",'2026-04-28',19.1),("Zanahorias frescas",'2026-04-30',21.2),("Patatas nuevas",'2026-05-05',22.45),("Cebollas dulces",'2026-04-15',23.75),("Aguacates Hass",'2026-04-16',24.80),("Pepinos frescos",'2026-04-18',25.95),("Pimientos rojos",'2027-09-08',26.7);
insert into transportista(nombre_trasp, apellidos, fecha_nacimiento,tlfn, dni) values ("Laura","Fernández López",'1999-02-14',"+34 693 48 29 15",'91820463L'),("Sergio","Martínez Gómez",'1988-09-22',"+12 028 84 73 12",'64012958R'),("Daniela","Rodríguez Torres",'2003-05-03',"+52 449 90 35 52",'28471950K'),("Pablo","Sánchez Ruiz",'1995-12-19',"+49 171 88 23 04",'75918420M'),("Andrea","Morales Castillo",'2001-06-28',"+552 198 41 27 30",'49281736Z'),("Hugo","Navarro Días","1984-06-05","+81 705 52 18 82",'18304752H'),("Sofía","Herrera Molina",'1997-10-30',"+33 674 21 98 04",'57392844P');
insert into cliente(nombre_client, apellidos, fecha_nacimiento, tlfn, dni) values ("Maria","Zambrano",'2000-01-01',"+34 648 73 95 21",'49283751J'),("Juan","Marquez",'1990-07-12',"+1 305 77 16 24",'18392044M'),("Carlos","Perez",'2004-10-20',"+52 812 90 34 55",'50719382K'),("José","Hernandez",'2015-02-05',"+49 160 88 31 20",'92841057L'),("Alfredo","Lopez",'1998-03-07',"+55 119 82 41 66",'31485972C'),("Kevin","Rodriguez",'2002-08-17',"+81 805 53 19 04",'76029418H'),("Iker","Gonzalez",'2011-11-11',"+33 672 41 89 55",'24971380S');

#Modificar el telefono de el cliente con id = 3
update cliente
set tlfn = '+34987654321'
where ident_client = 3;

#Modificar el id de el cliente con id = 5
update cliente
set ident_tiend = 2
where ident_client = 5;

#Modificar el id de el producto con id 10
update productos
set ident_prov = 1
where ident_product = 10;

#Modificar el precio de el producto  con id = 4
update productos
set precios = 19.99
where ident_product = 4;

#Elimina el cliente  con id = 2
delete from cliente
where ident_client = 2;

#Elimina el proveedor con id = 3
delete from proveedor
where ident_prov = 3;

#Eliminar producto con id = 7
delete from productos
where ident_product = 7;

#Mostrar los productos con su proveedor
select p.nombre_product, pr.empresa
from productos p
left join proveedor pr on p.ident_prov = pr.ident_prov;

#Ver productos por categoria
select p.nombre_product, c.nombre_categor
from productos p
join categoria c on p.ident_categor = c.ident_categor
order by c.nombre_categor;

# Productos apunto de vencerse
select nombre_product, fecha_vencimiento
from productos
where fecha_vencimiento < '2026-05-01'
order by fecha_vencimiento;
