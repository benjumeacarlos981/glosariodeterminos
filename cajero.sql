
CREATE DATABASE Cajero;
use Cajero;

CREATE TABLE Proveedores(
  IdProveedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Nombreproveedor VARCHAR(50),
  Nit INT,
  NombreDelContacto VARCHAR(50),
  CargoContacto VARCHAR(50),
  Direccion VARCHAR(50),
  Ciudad VARCHAR(50),
  Telefono VARCHAR(50)
);

CREATE TABLE Articulos(
  IdArticulo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  Idproveedor INT, FOREIGN KEY (Idproveedor) REFERENCES Proveedores(Idproveedor),
  NoFactura VARCHAR(50),
  FechaCompra DATE
);

CREATE TABLE GrupoProductos(
  IdGproducto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  GrupoProducto VARCHAR(50),
  Clase VARCHAR(50)
);


CREATE TABLE Productos(
  IdProducto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  NombreProducto VARCHAR(100),
  IdGproducto INT, FOREIGN KEY (IdGproducto) REFERENCES GrupoProductos(IdGproducto),
  VrUnd INT,
  Existencias INT,
  Bloqueado INT,
  Foto  VARCHAR(255)
);

CREATE TABLE FacturaCompras(
  IdArticulo INT, FOREIGN KEY (IdArticulo) REFERENCES Articulos(IdArticulo),
  IdProducto INT, FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
  Serie INT PRIMARY KEY NOT NULL,
  Cantidad INT,
  Valor INT,
  VrTotal INT,
  Existencias INT,
  Mostrar INT
);

CREATE TABLE Facturas(
  IdFactura INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  FechaVenta DATE,
  Turno VARCHAR(50)
);

CREATE TABLE Detalle(
  IdDetalle INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  IdFactura INT, FOREIGN KEY (IdFactura) REFERENCES Facturas(IdFactura),
  Serie INT, FOREIGN KEY (Serie) REFERENCES FacturaCompras(Serie),
  Cantidad INT,
  Valor INT,
  Vrtotal INT
);
