Create DataBase IF NOT EXISTS TP_FINAL;
Use TP_FINAL;


Create table TipoSancion(
    Id int AUTO_INCREMENT,
    Tipo varchar(20) not null,
    primary key (Id)
);


Create table EstadoSocio(
    Id int AUTO_INCREMENT,
    Tipo varchar(20) not null,
    primary key (Id)
);


Create table Sexo(
    Id int AUTO_INCREMENT,
    Tipo varchar(20) not null,
    primary key (Id)
);


Create table Nacionalidad(
    Id int AUTO_INCREMENT,
    Pais varchar(60) not null,
    primary key (Id)
);


Create table EstadoEjemplar(
    Id int AUTO_INCREMENT,
    Tipo varchar(20) not null,
    primary key (Id)
);


Create table EstadoPrestamo(
    Id int AUTO_INCREMENT,
    Tipo varchar(20) not null,
    primary key (Id)
);


Create table GeneroLibro(
    Id int AUTO_INCREMENT,
    Nombre varchar(60) not null,
    Descripcion text not null,
    primary key (Id)
);


Create table Libro(
    Isbn decimal(13,0),
    Titulo varchar(60) not null,
    Año year not null,
    StockTotal int not null default 0,
    StockDisponible int not null default 0,
    primary key(Isbn),
    CHECK (StockDisponible >= 0 AND StockDisponible <= StockTotal),
    CHECK (Año <= 2026) 
);


Create table Socio(
    Id int AUTO_INCREMENT,
    Dni int not null unique,
    Nombre varchar(60) not null,
    Apellido varchar(60) not null,
    Mail varchar(250) not null unique,
    FechaAlta date not null,
    IdSexo int not null,
    IdEstadoSocio int not null,
    primary key(Id),
    foreign key (IdSexo) references Sexo(Id) ON UPDATE CASCADE ON DELETE RESTRICT,
    foreign key (IdEstadoSocio) references EstadoSocio(Id) ON UPDATE CASCADE ON DELETE RESTRICT
);


Create table Autor(
    Id int AUTO_INCREMENT,
    Nombre varchar(60) not null,
    Apellido varchar(60) not null,
    IdSexo int not null,
    IdNacionalidad int not null,
    primary key(Id),
    foreign key (IdSexo) references Sexo(Id) ON UPDATE CASCADE ON DELETE RESTRICT,
    foreign key (IdNacionalidad) references Nacionalidad(Id) ON UPDATE CASCADE ON DELETE RESTRICT
);


Create table Ejemplar(
    Numero int AUTO_INCREMENT,
    FechaAlta date not null,
    IsbnLibro decimal(13,0) not null,
    IdEstadoEjemplar int not null,
    primary key(Numero),
    foreign key (IsbnLibro) references Libro(Isbn) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (IdEstadoEjemplar) references EstadoEjemplar(Id) ON UPDATE CASCADE ON DELETE RESTRICT
);


Create table Prestamo(
    Id int AUTO_INCREMENT,
    FechaPrestamo date not null,
    FechaVencimiento date not null,
    FechaDevolucion date,
    IdSocio int not null,
    IdEjemplar int not null,
    IdEstadoPrestamo int not null,
    primary key(Id),
    foreign key (IdSocio) references Socio(Id) ON UPDATE CASCADE ON DELETE RESTRICT,
    foreign key (IdEstadoPrestamo) references EstadoPrestamo(Id) ON UPDATE CASCADE ON DELETE RESTRICT,
    foreign key (IdEjemplar) references Ejemplar(Numero) ON UPDATE CASCADE ON DELETE RESTRICT,
    CHECK (FechaVencimiento >= FechaPrestamo AND (FechaDevolucion IS NULL OR FechaDevolucion >= FechaPrestamo))
);


Create table Sancion(
    Id int AUTO_INCREMENT,
    FechaInicio date not null,
    FechaFin date not null,
    Motivo text not null,
    IdTipoSancion int not null,
    IdPrestamo int,
    IdSocio int not null,
    primary key (Id),
    foreign key (IdTipoSancion) references TipoSancion(Id) ON UPDATE CASCADE ON DELETE RESTRICT,
    foreign key (IdPrestamo) references Prestamo(Id) ON UPDATE CASCADE ON DELETE SET NULL,
    foreign key (IdSocio) references Socio(Id) ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK (FechaFin >= FechaInicio)
);


Create table Autor_Libro(
    IdAutor int,
    IsbnLibro decimal(13,0),
    primary key(IdAutor, IsbnLibro),
    foreign key (IdAutor) references Autor(Id) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (IsbnLibro) references Libro(Isbn) ON UPDATE CASCADE ON DELETE CASCADE
);


Create table GeneroLibro_Libro(
    IdGeneroLibro int,
    IsbnLibro decimal(13,0),
    primary key(IdGeneroLibro, IsbnLibro),
    foreign key (IdGeneroLibro) references GeneroLibro(Id) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (IsbnLibro) references Libro(Isbn) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Auditoria_Prestamos ( 
IdAuditoria INT AUTO_INCREMENT PRIMARY KEY, 
IdPrestamo INT, Accion VARCHAR(20) NOT NULL,
Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
UsuarioBD VARCHAR(100) NOT NULL, 
IdEstadoAnterior INT, 
IdEstadoNuevo INT 
); 


CREATE INDEX busqueda_dni ON Socio(Dni);
CREATE INDEX busqueda_email ON Socio(Mail);
CREATE INDEX busqueda_isbn_ejemplar ON Ejemplar(Isbn