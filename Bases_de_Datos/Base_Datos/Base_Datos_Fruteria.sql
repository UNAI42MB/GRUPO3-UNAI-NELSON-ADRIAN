create database Fruteria;
use Fruteria;

create table tienda (
ident_tiend int auto_increment primary key,
nombre char(15) not null,
tlfn smallint(15)not null unique,
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$") 
);

create table Proveedor(
ident_prov int auto_increment primary key,
empresa varchar(30) not null,
tlfn smallint(15)not null unique,
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$")  
);

create table Transportista(
ident_trasp int auto_increment primary key,
nombre_trasp char(15) not null,
apellidos char(30) not null,
fecha_nacimiento date not null,
tlfn smallint(15)not null unique , 
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$") 
);

create table cliente (
ident_client int auto_increment primary key,
nombre_client char(15) not null,
apellidos char(30) not null,
fecha_nacimiento date not null,
tlfn smallint(15)not null unique,
check (tlfn regexp "^\\+[0-9]{1,3}[ ]?[0-9]{3}[ ]?[0-9]{2}[ ]?[0-9]{2}[ ]?[0-9]{2}$")  ,
DNI varchar(9)not null unique,
check(DNI regexp"[0-9]{8} [A-Z]$") ,
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
nombre_product char(15) not null,
fecha_vencimiento date not null,
precios double(2,2) not null,
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
 
insert into tienda(nomber_tiend) values("U.N.A",+34910482735);
insert into proveedor(empresa, tlfn) values("Eurogroup España",+34612849257),("Frutas Peyfi",+34722910466),("Frutas Ibérika",+34693552841);
insert into productos(nombre_product,fecha_vencimiento,precios) values("Manzanas Fuji",18/04/2026,12,49),("Peras Conferencia",20/04/2026,11,29),("Plátanos de Canarias",16/04/2026,13.85),("Naranjas Valencia" ,25/04/2026,14.3),("Fresas frescas" ,22/04/2026,15.6),("Kiwi verde",19/04/2026,16.25),("Uvas blancas" ,17/04/2026,17.4),("Tomates rama",13/04/2026,18.55),("Lechuga iceberg",28/04/2026,19.1),("Zanahorias frescas" ,30/04/2026,21.2),("Patatas nuevas" ,05/05/2026,22.45),("Cebollas dulces" ,15/04/2026,23.75),("Aguacates Hass" ,16/04/2026,24.80),("Pepinos frescos",18/04/2026,25.95),("Pimientos rojos" ,08/09/2027,26.7);
insert into transportista(nombre_trasp,fecha_nacimiento_tlfn,dni)values("Laura","Fernández López",14/02/1999,+34693482915,91820463L),("Sergio","Martínez Gómez",22/09/1988,+1202884731,64012958R),("Daniela","Rodríguez Torres",03/05/2003,+52449903552,28471950K),("Pablo","Sánchez Ruiz",19/12/1995,+49171882304,75918420M),("Andrea","Morales Castillo",28/06/2001,+552198412730,49281736Z),("Hugo","Navarro Días",+81705521882,18304752H),("Sofía","Herrera Molina",30/10/1997,+33674219804,507392844P);
insert into cliente(nombre_client,apellidos,fecha_nacimiento,tlfn,dni)values("Maria","Zambrano",01/01/2000,+34648739521,49283751J),("Juan","Marquez",12/07/1990,+1305771624,18392044M),("Carlos","Perez",20/10/2004,+52812903455,50719382K),("José","Hernandez",05/02/2015,+49160883120,92841057L),("Alfredo","Lopez",07/03/1998,+55119824166,31485972C),("Kevin","Rodriguez",17/08/2002,+81805531904,76029418H),("Iker","Gonzalez",11/11/2011,+33672418955,24971380S);