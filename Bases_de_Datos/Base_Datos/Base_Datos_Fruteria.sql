create database Fruteria;
use Fruteria;

create table tienda (
ident_tiend int auto_increment primary key,
nombre char(15) not null,
tlfn smallint(15) check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$") not null unique
);

create table Proveedor(
ident_prov int auto_increment primary key,
empresa varchar(30) not null,
tlfn smallint(15) check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$") not null unique 
);

create table Transportista(
ident_trasp int auto_increment primary key,
nombre_trasp char(15) not null,
apellidos char(30) not null,
fecha_nacimiento date not null,
tlfn smallint(15) check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$") not null unique 
);

create table categoria(
ident_categor int auto_increment primary key,
nombre_categor enum("Frutas","Verduras") default("Frutas")
);

create table cliente (
ident_client int auto_increment primary key,
nombre_client char(15) not null,
apellidos char(30) not null,
fecha_nacimiento date not null,
tlfn smallint(15) check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$") not null unique ,
DNI varchar(9) check(DNI regexp"[0-9]{8} [A-Z]$") not null unique,
ident_tiend int,
foreign key(ident_tiend) references tienda(ident_tiend)
);

create table Tranportista_tienda(
ident_trasp int,
ident_tiend int,
foreign key (ident_trasp) references transportista(ident_trasp),
foreign key (ident_tiend) references tienda(ident_tiend),
primary key(ident_tiend, ident_trasp)
);

create table Proveedor_tienda (
ident_prov int,
ident_tiend int,
foreign key (ident_prov) references proveedor(ident_prov),
foreign key (ident_tiend) references tienda(ident_tiend),
primary key(ident_tiend, ident_prov)
);

create table productos(
ident_product int auto_increment primary key,
nombre_product char(15) not null,
fecha_vencimiento date not null,
precios double(2,2) not null,
ident_prov int,
ident_client int,
ident_trasp int,
ident_categor int,
foreign key (ident_prov) references proveedor(ident_prov),
foreign key (ident_client) references cliente(ident_client),
foreign key (ident_trasp) references transportista(ident_trasp),
foreign key (ident_categor) references categoria(ident_categor)
);
 
insert into tienda(nomber_tiend) values("U.N.A",+34910482735);
insert into proveedor(empresa, tlfn) values("Eurogroup España",+34612849257),("Frutas Peyfi",+34722910466),("Frutas Ibérika",+34693552841);
insert into productos(nombre_product,fecha_vencimiento,precios) values("Manzanas Fuji",18/04/2026,12,49),("Peras Conferencia",20/04/2026,11,29),("Plátanos de Canarias",16/04/2026,13.85),("Naranjas Valencia" ,25/04/2026,14.3),("Fresas frescas" ,22/04/2026,15.6),("Kiwi verde",19/04/2026,16.25),("Uvas blancas" ,17/04/2026,17.4),("Tomates rama",13/04/2026,18.55),("Lechuga iceberg",28/04/2026,19.1),("Zanahorias frescas" ,30/04/2026,21.2),("Patatas nuevas" ,05/05/2026,22.45),("Cebollas dulces" ,15/04/2026,23.75),("Aguacates Hass" ,16/04/2026,24.80),("Pepinos frescos",18/04/2026,25.95),("Pimientos rojos" ,08/09/2027,26.7);
insert into transportista(nombre_trasp,fecha_nacimiento_tlfn,dni)values("Laura","Fernández López",14/02/1999,+34693482915,91820463L),("Sergio","Martínez Gómez",22/09/1988,+1202884731,64012958R),("Daniela","Rodríguez Torres",03/05/2003,+52449903552,28471950K),("Pablo","Sánchez Ruiz",19/12/1995,+49171882304,75918420M),("Andrea","Morales Castillo",28/06/2001,+552198412730,49281736Z),("Hugo","Navarro Días",+81705521882,18304752H),("Sofía","Herrera Molina",30/10/1997,+33674219804,507392844P);
insert into cliente(nombre_client,apellidos,fecha_nacimiento,tlfn,dni)values("Maria","Zambrano",01/01/2000,+34648739521,49283751J),("Juan","Marquez",12/07/1990,+1305771624,18392044M),("Carlos","Perez",20/10/2004,+52812903455,50719382K),("José","Hernandez",05/02/2015,+49160883120,92841057L),("Alfredo","Lopez",07/03/1998,+55119824166,31485972C),("Kevin","Rodriguez",17/08/2002,+81805531904,76029418H),("Iker","Gonzalez",11/11/2011,+33672418955,24971380S);