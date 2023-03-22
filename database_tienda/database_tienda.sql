-- -BASE DE DATOS
-- -MARIA DB 

drop database tienda;
create database tienda;
use tienda;

create table producto(
    idProducto int primary key auto_increment not null,
    producto varchar(50),
    precioVenta double,
    precioCompra double,
    fechaCaducidad date,
    stock int,
    disponibilidad boolean,
    categoria enum('Verdura', 'Fruta', 'Carne', 'Abarrote', 'Semillas')
);

create table venta(
    idVenta int primary key auto_increment not null,
    fechaVenta datetime,
    monto double,
    cantidad int
);

create table compra(
    idcompras int primary key not null auto_increment,
    monto double,
    provedor varchar(50),
    fechaCompra date
);

create table usuarios(
    idUsuario int primary key not null auto_increment,
    nombre varchar(50),
    usuarios varchar(50),
    psw varchar(50)
);


create table ventaProducto(
    idVentaProducto int primary key auto_increment not null,
    idVenta int,
    idProducto int,
    foreign key(idVenta)references venta (idVenta),
    foreign key(idProducto) references producto(idProducto)
);

create table compraProducto(
    idCompraProducto int primary key not null auto_increment,
    idProducto int, 
    idcompras int,
    foreign key(idProducto) references producto(idProducto),
    foreign key (idcompras) references compra (idcompras)
);

create table ventaVendedor(
    idVentaVendedor int primary key not null auto_increment,
    idUsuario int,
    idVenta int,
    foreign key(idUsuario) references usuarios (idUsuario),
    foreign key(idVenta) references venta (idVenta)
);


