--Crea DATAFILE(base datos)
CREATE TABLESPACE BIBLIOPROYEC DATAFILE 'BIBLIOPROYEC.dbf'
  2  size 20M;
--Permiso para el datafile
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--Creacion de usuario
CREATE USER BibliPRO23 IDENTIFIED BY biblioteca123
DEFAULT TABLESPACE BIBLIOPROYEC
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON BIBLIOPROYEC;
--Permiso  para el usuario (BibliPRO23 contraseña biblioteca123)
GRANT DBA, CONNECT, RESOURCE TO BibliPRO23;



-- Crear tabla Autor
CREATE TABLE Autor (
  idAutor NUMBER(10) PRIMARY KEY,
  Nombre VARCHAR2(30) NOT NULL,
  Apellidos VARCHAR2(30) NOT NULL,
  Nacionalidad VARCHAR2(30) NOT NULL
);
COMMIT;

-- Crear tabla Editorial
CREATE TABLE Editorial (
  idEditorial NUMBER(10) PRIMARY KEY,
  Editorial VARCHAR2(30) NOT NULL,
  Telefono VARCHAR2(20),
  Correo_Electronico VARCHAR2(50),
  Direccion VARCHAR2(70)
);
COMMIT;


-- Crear tabla Libro
CREATE TABLE Libro (
  ISBN NUMBER(10) PRIMARY KEY,
  Titulo VARCHAR2(50) NOT NULL,
  Genero VARCHAR2(30) NOT NULL,
  Anio_Publicacion NUMBER(4) NOT NULL,
  Num_Ejemplar NUMBER(10) NOT NULL,
  idAutor NUMBER(10) NOT NULL REFERENCES Autor(idAutor),
  idEditorial NUMBER(10) NOT NULL REFERENCES Editorial(idEditorial)
);
COMMIT;

 

-- Crear tabla Socio
CREATE TABLE Socio (
  idSocio NUMBER(10) PRIMARY KEY,
  Nombre VARCHAR2(30) NOT NULL,
  Apellidos VARCHAR2(30) NOT NULL,
  Direccion VARCHAR2(255) NOT NULL,
  Telefono VARCHAR2(20) NOT NULL,
  Fecha_nacimiento DATE NOT NULL,
  Fecha_ingreso DATE NOT NULL,
  Correo VARCHAR2(50) NOT NULL UNIQUE
);
COMMIT;

 
-- Crear tabla Rol
CREATE TABLE Rol (
  idRol NUMBER(10) PRIMARY KEY,
  Nombre VARCHAR2(30) NOT NULL,
  Funcion VARCHAR2(50) NOT NULL
);
COMMIT;

-- Crear tabla Usuario
CREATE TABLE Usuario (
  idUsuario NUMBER(10) PRIMARY KEY,
  Nombre VARCHAR2(30) NOT NULL UNIQUE,
  Contrasena VARCHAR2(30) NOT NULL,
  idRol NUMBER(10) NOT NULL REFERENCES Rol(idRol)
);
COMMIT;

-- Crear tabla Préstamo
CREATE TABLE Prestamo (
  idPrestamo NUMBER(10) PRIMARY KEY,
  Fecha_Prestamo DATE NOT NULL,
  Fecha_devolucion DATE,
  Estado VARCHAR2(30) NOT NULL,
  Usuario VARCHAR2(30) NOT NULL,
  Rol NUMBER(10) REFERENCES Rol(idRol),
  idSocio NUMBER(10) NOT NULL REFERENCES Socio(idSocio),
  ISBN NUMBER(10) NOT NULL REFERENCES Libro(ISBN)
);
COMMIT;

 -- Insertar datos en la tabla Autor
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (1, 'Jose María García', 'López', 'Española');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (2, 'J.K', 'Rowling', 'Europea');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (3, 'Antoine de', 'Saint-exupery', 'Francesa');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (4, 'Arthur', 'Golden', 'Estadounidense');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (5, 'Joaquin', 'Gutierrez Mangel', 'Costarricense');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (6, 'Olga', 'Lengyel', 'Rumana');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (7, 'Lewis', 'Carrol', 'Británico');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (8, 'Pedro Antonio de', 'Alarcón', 'Español');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad)VALUES (9, 'John', 'Boyne', 'Irlandés');
INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad) VALUES (10, 'Gabriel', 'García Márquez', 'Colombiano');


COMMIT;

-- Insertar datos en la tabla Editorial
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (1, 'Nocturna', '914 16 15 30', 'info@nocturnaediciones.com', 'Calle Lope La Rueda España');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (2, 'Bloomsburry Publishing', '+44 (0)20 7631 5600', 'contact@bloomsbury.com', '50 Bedford Square Londres');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (3, 'Salamandra', '934674387', 'info@salamandra.info', 'Calle Travessera Barcelona');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (4, 'Alfred A. Knopf', '(212) 940-7390', 'info@knopfdoubleday.com', '1745 Broadway New York');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (5, 'Rapa Nui Editorial', '+56 9 9539 0130', 'info@rapanuipress.com', '1380 Las Condes, Metropolitana de Santiago Chile'); 
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (6, 'Editorial Diana', '(55) 3000 6200', 'info@dianaeditorial.es', 'Diagonal, 662-664 7ª planta 08034 Barcelona, España');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (7, 'Alianza Editorial', '+34 913 93 88 88', 'info@alianzaeditorial.es', 'Juan Ignacio Luca de Tena, 15, 28027, Madrid');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (8, 'Editorial Porrua', '+52 55 5584 8177', 'info@porrua.mx', 'Delegación Cuahutémoc, 06020 Mexico City, Distrito Federal');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (9, 'Editorial Salamandra', '+34 937 18 77 53', 'info@penguinlibros.com', 'Marie Curie, 13, 08210, Barberà del Vallès (Barcelona)');
INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion) VALUES (10, 'Editorial Planeta', '+34 932 64 79 88', 'info@editorialplaneta.com', 'Avenida Diagonal, 662-664, 08034, Barcelona');
COMMIT;

-- Insertar datos en la tabla Libro
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (1, 'El corazón de la piedra', 'Ficción', 2014, 1, 1, 1);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (2, 'Harry Potter', 'Realismo Mágico', 1997, 2, 2, 2);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (3, 'El Principito', 'Novela', 1943, 3, 3, 3);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (4, 'Memorias de una Geisha', 'Drama', 1997, 4, 4, 4);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (5, 'Cocorí', 'Ficción', 1947, 5, 5, 5);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (6, 'Los hornos de Hitler', 'Lírico', 1951, 6, 6, 6); 
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (7, 'Alicia en el país de las maravillas', 'Fantasía', 1865, 7, 7, 7);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (8, 'El niño de la bola', 'Novela de Tesis', 1880, 8, 8, 8);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (9, 'El niño de la pijama de rayas', 'Drama', 2006, 9, 9, 9);
INSERT INTO Libro (ISBN, Titulo, Genero, ANIO_PUBLICACION, Num_Ejemplar, idAutor, idEditorial) VALUES (10, 'Cien años de soledad', 'Realismo mágico', 1967, 5, 8, 4);

COMMIT;

-- Insertar Rol
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (1, 'Administrador', 'Administrador');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (2, 'Colaborador', 'Incluye datos');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (3, 'Moderador', 'Supervisar y moderar contenidos');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (4, 'Analista', 'Análisis de datos y generación de reportes');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (5, 'Editor', 'Editar y actualizar contenidos');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (6, 'Consultor', 'Consulta de datos y asesoramiento');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (7, 'Soporte', 'Asistencia técnica y solución de problemas');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (8, 'Invitado', 'Acceso limitado a contenidos');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (9, 'Bibliotecario', 'Gestión de libros y préstamos');
INSERT INTO Rol (idRol, Nombre, Funcion) VALUES (10, 'Comunicaciones', 'Gestión de comunicaciones internas y externas');
COMMIT;



-- Insertar datos en la tabla Socio
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (1, 'Adriana', 'Ruiz Marín', 'Calle Lope La Rueda España', '83010234', TO_DATE('1990-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'aruizm@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (2, 'Luis', 'Umaña Alpizar', '50 Bedford Square Londres', '22234543', TO_DATE('1992-02-14', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'lumanaa@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (3, 'Luis', 'Hernandez Cruz', 'Calle Travessera Barcelona', '87654567', TO_DATE('1985-06-10', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'lhernandezc@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (4, 'Jonathan', 'Martinez Montoya', '1745 Broadway New York', '87569631', TO_DATE('1990-03-20', 'YYYY-MM-DD'), TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'jonamartmon@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (5, 'Patricio', 'Garcia Rosales', '1380 Las Condes, Metropolitana de Santiago Chile', '78541225', TO_DATE('1995-07-15', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'pagarciar@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (6, 'Carlos', 'Monge Chacon', 'Delegación Cuahutémoc, 06020 Mexico City, Distrito Federal', '89520023', TO_DATE('1988-12-01', 'YYYY-MM-DD'), TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'camongech@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (7, 'María', 'Alas Mejías', 'Juan Ignacio Luca de Tena, 15, 28027, Madrid', '22445588', TO_DATE('1993-04-01', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'malasmej@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (8, 'Ricardo', 'Barboza Vindas', 'Delegación Cuahutémoc, 06020 Mexico City, Distrito Federal', '70119626', TO_DATE('1986-11-21', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'rdodoa@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (9, 'Jose', 'Alberto Mora Mora', 'Marie Curie, 13, 08210, Barberà del Vallès (Barcelona)', '71329961', TO_DATE('1992-09-12', 'YYYY-MM-DD'), TO_DATE('2023-01-05', 'YYYY-MM-DD'), 'jmora@gmail.com');
INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo) VALUES (10, 'Ana', 'García López', 'Calle Falsa, 24, 08001, Barcelona', '634567890', TO_DATE('1985-07-15', 'YYYY-MM-DD'), TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'ana.garcia@gmail.com');
COMMIT; 
 -- Insertar Usuario
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (1, 'aruizm', '1234', 1);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (2, 'lhernadezc', '5678', 1);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (3, 'lumanaa', '9876', 2);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (4, 'rbarbozav', '5432', 2);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (5, 'jgonzalez', '1234', 1);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (6, 'mramirez', '2345', 2);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (7, 'aperez', '3456', 1);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (8, 'lrodriguez', '6543', 2);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (9, 'jcordero', '7654', 1);
INSERT INTO Usuario (idusuario, Nombre, Contrasena, idRol) VALUES (10, 'mfernandez', '8765', 2);
COMMIT;

 

 -- Insertar datos en la tabla Prestamo
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (1, 1, 1, TO_DATE('31/03/2023', 'DD/MM/YYYY'), TO_DATE('15/05/2023', 'DD/MM/YYYY'), 'Devuelto', 'aruizm', '1');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (2, 2, 2, TO_DATE('15/03/2023', 'DD/MM/YYYY'), TO_DATE('22/03/2023', 'DD/MM/YYYY'), 'Devuelto', 'aruizm', '1');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (3, 3, 3, TO_DATE('22/03/2023', 'DD/MM/YYYY'), TO_DATE('05/04/2023', 'DD/MM/YYYY'), 'Sin Devolución', 'aruizm', '1');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (4, 4, 4, TO_DATE('02/03/2023', 'DD/MM/YYYY'), TO_DATE('02/04/2023', 'DD/MM/YYYY'), 'Devuelto', 'lhernadezc', '2');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (5, 5, 5, TO_DATE('05/01/2023', 'DD/MM/YYYY'), TO_DATE('15/02/2023', 'DD/MM/YYYY'), 'Atrasado', 'lumanaa', '2');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (6, 6, 6, TO_DATE('12/11/2022', 'DD/MM/YYYY'), TO_DATE('06/01/2023', 'DD/MM/YYYY'), 'Sin Devolución', 'lhernadezc', '2');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (7, 1, 7, TO_DATE('02/03/2023', 'DD/MM/YYYY'), TO_DATE('15/03/2023', 'DD/MM/YYYY'), 'Atrasado', 'lumanaa', '2');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (8, 7, 8, TO_DATE('02/02/2023', 'DD/MM/YYYY'), TO_DATE('02/03/2023', 'DD/MM/YYYY'), 'Devuelto', 'rbarbozav', '1');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (9, 4, 9, TO_DATE('10/09/2022', 'DD/MM/YYYY'), TO_DATE('15/01/2023', 'DD/MM/YYYY'), 'Sin Devolución', 'rbarbozav', '1');
INSERT INTO Prestamo (idPrestamo, idSocio, ISBN, Fecha_prestamo, Fecha_devolucion, Estado, Usuario, Rol) VALUES (10, 4, 9, TO_DATE('10/09/2022', 'DD/MM/YYYY'), TO_DATE('15/01/2023', 'DD/MM/YYYY'), 'Sin Devolución', 'rbarbozav', '1');
COMMIT;





--INICIO CRUD TABLA AUTOR

--INSERTAR AUTOR
CREATE OR REPLACE PROCEDURE Crear_Autor (
  p_idAutor IN Autor.idAutor%TYPE,
  p_Nombre IN Autor.Nombre%TYPE,
  p_Apellidos IN Autor.Apellidos%TYPE,
  p_Nacionalidad IN Autor.Nacionalidad%TYPE
) AS
BEGIN
  INSERT INTO Autor (idAutor, Nombre, Apellidos, Nacionalidad)
  VALUES (p_idAutor, p_Nombre, p_Apellidos, p_Nacionalidad);
  COMMIT;
END Crear_Autor;

--ACTUALIZAR AUTOR
CREATE OR REPLACE PROCEDURE Actualizar_Autor (
  p_idAutor IN Autor.idAutor%TYPE,
  p_Nombre IN Autor.Nombre%TYPE,
  p_Apellidos IN Autor.Apellidos%TYPE,
  p_Nacionalidad IN Autor.Nacionalidad%TYPE
) AS
BEGIN
  UPDATE Autor
  SET Nombre = p_Nombre,
      Apellidos = p_Apellidos,
      Nacionalidad = p_Nacionalidad
  WHERE idAutor = p_idAutor;
  COMMIT;
END Actualizar_Autor;

--ELIMINAR AUTOR
CREATE OR REPLACE PROCEDURE Eliminar_Autor (
  p_idAutor IN Autor.idAutor%TYPE
) AS
BEGIN
  DELETE FROM Autor
  WHERE idAutor = p_idAutor;
  COMMIT;
END Eliminar_Autor;

--SELECCIONAR AUTOR
CREATE OR REPLACE PROCEDURE Obtener_Autor (
  p_idAutor IN Autor.idAutor%TYPE,
  p_Nombre OUT Autor.Nombre%TYPE,
  p_Apellidos OUT Autor.Apellidos%TYPE,
  p_Nacionalidad OUT Autor.Nacionalidad%TYPE
) AS
BEGIN
  SELECT Nombre, Apellidos, Nacionalidad
  INTO p_Nombre, p_Apellidos, p_Nacionalidad
  FROM Autor
  WHERE idAutor = p_idAutor;
END Obtener_Autor;

--FIN CRUD TABLA AUTOR



--INICIO CRUD TABLA LIBRO

--INSERTAR LIBRO
CREATE OR REPLACE PROCEDURE Insertar_Libro (
  v_ISBN IN Libro.ISBN%TYPE,
  v_Titulo IN Libro.Titulo%TYPE,
  v_Genero IN Libro.Genero%TYPE,
  v_Anio_Publicacion IN Libro.Anio_Publicacion%TYPE,
  v_Num_Ejemplar IN Libro.Num_Ejemplar%TYPE,
  v_idAutor IN Libro.idAutor%TYPE,
  v_idEditorial IN Libro.idEditorial%TYPE
) AS
BEGIN
  INSERT INTO Libro (ISBN, Titulo, Genero, Anio_Publicacion, Num_Ejemplar, idAutor, idEditorial)
  VALUES (v_ISBN, v_Titulo, v_Genero, v_Anio_Publicacion, v_Num_Ejemplar, v_idAutor, v_idEditorial);
END insertar_libro;

--ACTUALIZAR LIBRO
CREATE OR REPLACE PROCEDURE actualizar_libro (
  v_ISBN IN Libro.ISBN%TYPE,
  v_Titulo IN Libro.Titulo%TYPE
) AS
BEGIN
  UPDATE Libro
  SET Titulo = v_Titulo
  WHERE ISBN = v_ISBN;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se encontr� el libro con ISBN ' || v_ISBN);
END actualizar_libro;

--ELIMINAR LIBRO
CREATE OR REPLACE PROCEDURE borrar_libro (v_ISBN IN Libro.ISBN%TYPE) AS
BEGIN
  DELETE FROM Libro
  WHERE ISBN = v_ISBN;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se encontr� el libro con ISBN ' || v_ISBN);
END borrar_libro;

--SELECCIONAR LIBRO
CREATE OR REPLACE PROCEDURE leer_libro (v_ISBN IN Libro.ISBN%TYPE) AS
  v_Titulo Libro.Titulo%TYPE;
  v_Genero Libro.Genero%TYPE;
  v_Anio_Publicacion Libro.Anio_Publicacion%TYPE;
BEGIN
  SELECT Titulo, Genero, Anio_Publicacion
  INTO v_Titulo, v_Genero, v_Anio_Publicacion
  FROM Libro
  WHERE ISBN = v_ISBN;

  DBMS_OUTPUT.PUT_LINE('Titulo: ' || v_Titulo || ', Genero: ' || v_Genero || ', A�o de Publicacion: ' || v_Anio_Publicacion);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se encontr� el libro con ISBN ' || v_ISBN);
END leer_libro;


--FIN CRUD TABLA LIBRO


--INICIO CRUD TABLA EDITORIAL

--INSERTAR EDITORIAL
CREATE OR REPLACE PROCEDURE insertar_editorial (
  v_idEditorial IN Editorial.idEditorial%TYPE,
  v_Editorial IN Editorial.Editorial%TYPE,
  v_Telefono IN Editorial.Telefono%TYPE,
  v_Correo_Electronico IN Editorial.Correo_Electronico%TYPE,
  v_Direccion IN Editorial.Direccion%TYPE
) AS
BEGIN
  INSERT INTO Editorial (idEditorial, Editorial, Telefono, Correo_Electronico, Direccion)
  VALUES (v_idEditorial, v_Editorial, v_Telefono, v_Correo_Electronico, v_Direccion);
  COMMIT;
END insertar_editorial;

--ACTUALIZAR EDITORIAL
CREATE OR REPLACE PROCEDURE actualizar_editorial (
  v_idEditorial IN Editorial.idEditorial%TYPE,
  v_Editorial IN Editorial.Editorial%TYPE,
  v_Telefono IN Editorial.Telefono%TYPE,
  v_Correo_Electronico IN Editorial.Correo_Electronico%TYPE,
  v_Direccion IN Editorial.Direccion%TYPE
) AS
BEGIN
  UPDATE Editorial
  SET Editorial = v_Editorial, Telefono = v_Telefono, Correo_Electronico = v_Correo_Electronico, Direccion = v_Direccion
  WHERE idEditorial = v_idEditorial;
  COMMIT;
END actualizar_editorial;

--ELIMINAR EDITORIAL
CREATE OR REPLACE PROCEDURE eliminar_editorial (
  v_idEditorial IN Editorial.idEditorial%TYPE
) AS
BEGIN
  DELETE FROM Editorial
  WHERE idEditorial = v_idEditorial;
  COMMIT;
END eliminar_editorial;

--SELECCIONAR EDITORIAL
CREATE OR REPLACE PROCEDURE seleccionar_editorial (
  v_idEditorial IN Editorial.idEditorial%TYPE
) AS
  v_Editorial Editorial.Editorial%TYPE;
  v_Telefono Editorial.Telefono%TYPE;
  v_Correo_Electronico Editorial.Correo_Electronico%TYPE;
  v_Direccion Editorial.Direccion%TYPE;
BEGIN
  SELECT Editorial, Telefono, Correo_Electronico, Direccion INTO v_Editorial, v_Telefono, v_Correo_Electronico, v_Direccion
  FROM Editorial
  WHERE idEditorial = v_idEditorial;
  DBMS_OUTPUT.PUT_LINE('Editorial: ' || v_Editorial || ', Telefono: ' || v_Telefono || ', Correo Electronico: ' || v_Correo_Electronico || ', Direccion: ' || v_Direccion);
END seleccionar_editorial;


--FIN CRUD TABLA EDITORIAL


--INICIO CRUD TABLA SOCIO

--INSERTAR SOCIO
CREATE OR REPLACE PROCEDURE insertar_socio (
  v_idSocio IN Socio.idSocio%TYPE,
  v_Nombre IN Socio.Nombre%TYPE,
  v_Apellidos IN Socio.Apellidos%TYPE,
  v_Direccion IN Socio.Direccion%TYPE,
  v_Telefono IN Socio.Telefono%TYPE,
  v_Fecha_nacimiento IN Socio.Fecha_nacimiento%TYPE,
  v_Fecha_ingreso IN Socio.Fecha_ingreso%TYPE,
  v_Correo IN Socio.Correo%TYPE
) AS
BEGIN
  INSERT INTO Socio (idSocio, Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo)
   VALUES (v_idSocio, v_Nombre, v_Apellidos, v_Direccion, v_Telefono, v_Fecha_nacimiento, v_Fecha_ingreso, v_Correo);
  COMMIT;
END insertar_socio;

--ACTUALIZAR SOCIO
CREATE OR REPLACE PROCEDURE actualizar_socio (
  v_idSocio IN Socio.idSocio%TYPE,
  v_Nombre IN Socio.Nombre%TYPE,
  v_Apellidos IN Socio.Apellidos%TYPE,
  v_Direccion IN Socio.Direccion%TYPE,
  v_Telefono IN Socio.Telefono%TYPE,
  v_Fecha_nacimiento IN Socio.Fecha_nacimiento%TYPE,
  v_Fecha_ingreso IN Socio.Fecha_ingreso%TYPE,
  v_Correo IN Socio.Correo%TYPE
) AS
BEGIN
  UPDATE Socio
  SET Nombre = v_Nombre, Apellidos = v_Apellidos, Direccion = v_Direccion, Telefono = v_Telefono, Fecha_nacimiento = v_Fecha_nacimiento, Fecha_ingreso = v_Fecha_ingreso, Correo = v_Correo
  WHERE idSocio = v_idSocio;
  COMMIT;
END actualizar_socio;

--ELIMINAR SOCIO
CREATE OR REPLACE PROCEDURE eliminar_socio (
  v_idSocio IN Socio.idSocio%TYPE
) AS
BEGIN
  DELETE FROM Socio
  WHERE idSocio = v_idSocio;
  COMMIT;
END eliminar_socio;

--SELECCIONAR SOCIO
CREATE OR REPLACE PROCEDURE seleccionar_socio (
  v_idSocio IN Socio.idSocio%TYPE
) AS
  v_Nombre Socio.Nombre%TYPE;
  v_Apellidos Socio.Apellidos%TYPE;
  v_Direccion Socio.Direccion%TYPE;
  v_Telefono Socio.Telefono%TYPE;
  v_Fecha_nacimiento Socio.Fecha_nacimiento%TYPE;
  v_Fecha_ingreso Socio.Fecha_ingreso%TYPE;
  v_Correo Socio.Correo%TYPE;
BEGIN
  SELECT Nombre, Apellidos, Direccion, Telefono, Fecha_nacimiento, Fecha_ingreso, Correo INTO v_Nombre, v_Apellidos, v_Direccion, v_Telefono, v_Fecha_nacimiento, v_Fecha_ingreso, v_Correo
  FROM Socio
  WHERE idSocio = v_idSocio;
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_Nombre || ', Apellidos: ' || v_Apellidos || ', Direccion: ' || v_Direccion || ', Telefono: ' || v_Telefono || ', Fecha_nacimiento: ' || v_Fecha_nacimiento || ', Fecha_ingreso: ' || v_Fecha_ingreso || ', Correo: ' || v_Correo);
END seleccionar_socio;

--FIN CRUD TABLA SOCIO


--INICIO CRUD TABLA ROL

--INSERTAR ROL
CREATE OR REPLACE PROCEDURE insertar_rol (
  v_idRol IN Rol.idRol%TYPE,
  v_Nombre IN Rol.Nombre%TYPE,
  v_Funcion IN Rol.Funcion%TYPE
) AS
BEGIN
  INSERT INTO Rol (idRol, Nombre, Funcion)
  VALUES (v_idRol, v_Nombre, v_Funcion);
  COMMIT;
END insertar_rol;

--ACTUALIZAR ROL
CREATE OR REPLACE PROCEDURE actualizar_rol (
  v_idRol IN Rol.idRol%TYPE,
  v_Nombre IN Rol.Nombre%TYPE,
  v_Funcion IN Rol.Funcion%TYPE
) AS
BEGIN
  UPDATE Rol
  SET Nombre = v_Nombre, Funcion = v_Funcion
  WHERE idRol = v_idRol;
  COMMIT;
END actualizar_rol;

--ELIMINAR ROL
CREATE OR REPLACE PROCEDURE eliminar_rol (
  v_idRol IN Rol.idRol%TYPE
) AS
BEGIN
  DELETE FROM Rol
  WHERE idRol = v_idRol;
  COMMIT;
END eliminar_rol;

--SELECCIONAR ROL
CREATE OR REPLACE PROCEDURE seleccionar_rol (
  v_idRol IN Rol.idRol%TYPE
) AS
  v_Nombre Rol.Nombre%TYPE;
  v_Funcion Rol.Funcion%TYPE;
BEGIN
  SELECT Nombre, Funcion INTO v_Nombre, v_Funcion
  FROM Rol
  WHERE idRol = v_idRol;
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_Nombre || ', Funcion: ' || v_Funcion);
END seleccionar_rol;

--FIN CRUD TABLA ROL


--INICIO CRUD TABLA USUARIO

--INSERTAR USUARIO
CREATE OR REPLACE PROCEDURE insertar_usuario (
  v_idUsuario IN Usuario.idUsuario%TYPE,
  v_Nombre IN Usuario.Nombre%TYPE,
  v_Contrasena IN Usuario.Contrasena%TYPE,
  v_idRol IN Usuario.idRol%TYPE
) AS
BEGIN
  INSERT INTO Usuario (idUsuario, Nombre, Contrasena, idRol)
  VALUES (v_idUsuario, v_Nombre, v_Contrasena, v_idRol);
  COMMIT;
END insertar_usuario;

--ACTUALIZAR USUARIO
CREATE OR REPLACE PROCEDURE actualizar_usuario (
  v_idUsuario IN Usuario.idUsuario%TYPE,
  v_Nombre IN Usuario.Nombre%TYPE,
  v_Contrasena IN Usuario.Contrasena%TYPE,
  v_idRol IN Usuario.idRol%TYPE
) AS
BEGIN
  UPDATE Usuario
  SET Nombre = v_Nombre, Contrasena = v_Contrasena, idRol = v_idRol
  WHERE idUsuario = v_idUsuario;
  COMMIT;
END actualizar_usuario;

--ELIMINAR USUARIO
CREATE OR REPLACE PROCEDURE eliminar_usuario (
  v_idUsuario IN Usuario.idUsuario%TYPE
) AS
BEGIN
  DELETE FROM Usuario
  WHERE idUsuario = v_idUsuario;
  COMMIT;
END eliminar_usuario;

--SELECCIONAR USUARIO
CREATE OR REPLACE PROCEDURE seleccionar_usuario (
  v_idUsuario IN Usuario.idUsuario%TYPE
) AS
  v_Nombre Usuario.Nombre%TYPE;
  v_Contrasena Usuario.Contrasena%TYPE;
  v_idRol Usuario.idRol%TYPE;
BEGIN
  SELECT Nombre, Contrasena, idRol INTO v_Nombre, v_Contrasena, v_idRol
  FROM Usuario
  WHERE idUsuario = v_idUsuario;
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_Nombre || ', Contrasena: ' || v_Contrasena || ', idRol: ' || v_idRol);
END seleccionar_usuario;


--FIN CRUD TABLA USUARIO


--INICIO CRUD TABLA PRESTAMO

--INSERTAR PRESTAMO
CREATE OR REPLACE PROCEDURE insertar_prestamo (
  v_idPrestamo IN Prestamo.idPrestamo%TYPE,
  v_Fecha_Prestamo IN Prestamo.Fecha_Prestamo%TYPE,
  v_Fecha_devolucion IN Prestamo.Fecha_devolucion%TYPE,
  v_Estado IN Prestamo.Estado%TYPE,
  v_Usuario IN Prestamo.Usuario%TYPE,
  v_Rol IN Prestamo.Rol%TYPE,
  v_idSocio IN Prestamo.idSocio%TYPE,
  v_ISBN IN Prestamo.ISBN%TYPE
) AS
BEGIN
  INSERT INTO Prestamo (idPrestamo, Fecha_Prestamo, Fecha_devolucion, Estado, Usuario, Rol, idSocio, ISBN)
  VALUES (v_idPrestamo, v_Fecha_Prestamo, v_Fecha_devolucion, v_Estado, v_Usuario, v_Rol, v_idSocio, v_ISBN);
  COMMIT;
END insertar_prestamo;

--ACTUALIZAR PRESTAMO
CREATE OR REPLACE PROCEDURE actualizar_prestamo (
  v_idPrestamo IN Prestamo.idPrestamo%TYPE,
  v_Fecha_Prestamo IN Prestamo.Fecha_Prestamo%TYPE,
  v_Fecha_devolucion IN Prestamo.Fecha_devolucion%TYPE,
  v_Estado IN Prestamo.Estado%TYPE,
  v_Usuario IN Prestamo.Usuario%TYPE,
  v_Rol IN Prestamo.Rol%TYPE,
  v_idSocio IN Prestamo.idSocio%TYPE,
  v_ISBN IN Prestamo.ISBN%TYPE
) AS
BEGIN
  UPDATE Prestamo
  SET Fecha_Prestamo = v_Fecha_Prestamo, Fecha_devolucion = v_Fecha_devolucion, Estado = v_Estado, Usuario = v_Usuario, Rol = v_Rol, idSocio = v_idSocio, ISBN = v_ISBN
  WHERE idPrestamo = v_idPrestamo;
  COMMIT;
END actualizar_prestamo;

--ELIMINAR PRESTAMO
CREATE OR REPLACE PROCEDURE eliminar_prestamo (
  v_idPrestamo IN Prestamo.idPrestamo%TYPE
) AS
BEGIN
  DELETE FROM Prestamo
  WHERE idPrestamo = v_idPrestamo;
  COMMIT;
END eliminar_prestamo;


--SELECCIONAR PRESTAMO
CREATE OR REPLACE PROCEDURE seleccionar_prestamo (
  v_idPrestamo IN Prestamo.idPrestamo%TYPE
) AS
  v_Fecha_Prestamo Prestamo.Fecha_Prestamo%TYPE;
  v_Fecha_devolucion Prestamo.Fecha_devolucion%TYPE;
  v_Estado Prestamo.Estado%TYPE;
  v_Usuario Prestamo.Usuario%TYPE;
  v_Rol Prestamo.Rol%TYPE;
  v_idSocio Prestamo.idSocio%TYPE;
  v_ISBN Prestamo.ISBN%TYPE;
BEGIN
  SELECT Fecha_Prestamo, Fecha_devolucion, Estado, Usuario, Rol, idSocio, ISBN INTO v_Fecha_Prestamo, v_Fecha_devolucion, v_Estado, v_Usuario, v_Rol, v_idSocio, v_ISBN
  FROM Prestamo
  WHERE idPrestamo = v_idPrestamo;
  DBMS_OUTPUT.PUT_LINE('Fecha_Prestamo: ' || v_Fecha_Prestamo || ', Fecha_devolucion: ' || v_Fecha_devolucion || ', Estado: ' || v_Estado || ', Usuario: ' || v_Usuario || ', Rol: ' || v_Rol || ', idSocio: ' || v_idSocio || ', ISBN: ' || v_ISBN);
END seleccionar_prestamo;


--FIN CRUD TABLA PRESTAMO





--Scripts de procedimientos almacenados con cursores 

--1.Crear el procedimiento para actualizar por idAutor el genero del libro cursor, tabla afectada libros colunma generos

CREATE OR REPLACE PROCEDURE ActualizarLibrosAutor(
  AutorID IN Autor.idAutor%TYPE,
  NuevoGenero IN Libro.Genero%TYPE
) IS
  CURSOR LibrosAutorCursor IS
    SELECT ISBN
    FROM Libro
    WHERE idAutor = AutorID;
  
  LibroRow Libro.ISBN%TYPE;
BEGIN
  -- Abrir el cursor
  OPEN LibrosAutorCursor;

  -- Bucle para recorrer todas las filas
  LOOP
    FETCH LibrosAutorCursor INTO LibroRow;
    EXIT WHEN LibrosAutorCursor%NOTFOUND;

    -- Actualizar el g�nero de cada libro del autor
    UPDATE Libro
    SET Genero = NuevoGenero
    WHERE ISBN = LibroRow;
  END LOOP;

  -- Cerrar el cursor
  CLOSE LibrosAutorCursor;

  COMMIT;
END ActualizarLibrosAutor;


--Caja anonima para modificar el genero de acuerdo al id del autor

SET SERVEROUTPUT ON;
DEFINE AutorID_input = &1;
DEFINE NuevoGenero_input = '&2';
DECLARE
    AutorID NUMBER(10) := &AutorID_input;
    NuevoGenero VARCHAR2(30) := '&NuevoGenero_input';
BEGIN
  -- Llamamos al procedimiento ActualizarLibrosAutor con los datos ingresados
    ActualizarLibrosAutor(AutorID => AutorID, NuevoGenero => NuevoGenero);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;


--2.Coloca el estado vencido de acuerdo al id y la fecha de la tabla prestamo columna estado

-- Crear el procedimiento almacenado
CREATE OR REPLACE PROCEDURE actualizar_prestamos_vencidos IS
  -- Definir un cursor para seleccionar todos los prestamos que tienen estado 'Prestado'
  CURSOR c_prestamos IS
    SELECT idPrestamo, Fecha_devolucion
    FROM Prestamo
    WHERE Estado = 'Prestado';

  -- Definir variables para almacenar los datos obtenidos del cursor
  v_idPrestamo Prestamo.idPrestamo%TYPE;
  v_Fecha_devolucion Prestamo.Fecha_devolucion%TYPE;

BEGIN
  -- Abrir el cursor
  OPEN c_prestamos;
  
  -- Iniciar un bucle para procesar los datos obtenidos del cursor
  LOOP
    -- Obtener los datos del cursor y almacenarlos en las variables definidas anteriormente
    FETCH c_prestamos INTO v_idPrestamo, v_Fecha_devolucion;
    -- Salir del bucle cuando ya no hay m�s datos en el cursor
    EXIT WHEN c_prestamos%NOTFOUND;
    
    -- Comprobar si la fecha de devoluci�n es anterior a la fecha actual
    IF v_Fecha_devolucion < SYSDATE THEN
      -- Si es as�, actualizar el estado del prestamo a 'Vencido'
      UPDATE Prestamo
      SET Estado = 'Vencido'
      WHERE idPrestamo = v_idPrestamo;
    END IF;
  -- Fin del bucle
  END LOOP;

  -- Cerrar el cursor
  CLOSE c_prestamos;

-- Manejo de excepciones
EXCEPTION
  WHEN OTHERS THEN
    -- Si ocurre alg�n error, imprimir el mensaje de error
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END actualizar_prestamos_vencidos;


-- Bloque an�nimo PL/SQL-- Bloque an�nimo PL/SQL
DECLARE
  -- Definir variables para almacenar los datos proporcionados por el usuario
  v_idPrestamo Prestamo.idPrestamo%TYPE := &idPrestamo;
  v_Fecha_devolucion Prestamo.Fecha_devolucion%TYPE := TO_DATE('&Fecha_devolucion', 'DD/MM/YYYY');
BEGIN
  -- Comprobar si la fecha de devoluci�n es anterior a la fecha actual
  IF v_Fecha_devolucion < SYSDATE THEN
    -- Si es as�, actualizar el estado del prestamo a 'Vencido'
    UPDATE Prestamo
    SET Estado = 'Vencido'
    WHERE idPrestamo = v_idPrestamo;
  END IF;
-- Manejo de excepciones
EXCEPTION
  WHEN OTHERS THEN
    -- Si ocurre alg�n error, imprimir el mensaje de error
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;


--Scripts de disparadores, los cuales deben involucrar l�gica de validaci�n y/o modificaci�n de datos

-- 1. Validar si existe el autor antes de insertar un libro
CREATE OR REPLACE TRIGGER trg_Validar_Autor
BEFORE INSERT ON Libro
FOR EACH ROW
DECLARE
  v_idAutor_exists NUMBER(1);
BEGIN
  SELECT COUNT(*)
  INTO v_idAutor_exists
  FROM Autor
  WHERE idAutor = :NEW.idAutor;

  IF v_idAutor_exists = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'El autor no existe');
  END IF;
END trg_Validar_Autor;

-- 2. Validar si existe la editorial antes de insertar un libro
CREATE OR REPLACE TRIGGER trg_Validar_Editorial
BEFORE INSERT ON Libro
FOR EACH ROW
DECLARE
  v_idEditorial_exists NUMBER(1);
BEGIN
  SELECT COUNT(*)
  INTO v_idEditorial_exists
  FROM Editorial
  WHERE idEditorial = :NEW.idEditorial;

  IF v_idEditorial_exists = 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'La editorial no existe');
  END IF;
END trg_Validar_Editorial;

-- 3. Actualizar Fecha_ingreso al modificar la fecha de nacimiento de un Socio
CREATE OR REPLACE TRIGGER trg_Actualizar_Fecha_Ingreso
AFTER UPDATE OF Fecha_nacimiento ON Socio
FOR EACH ROW
BEGIN
  UPDATE Socio
  SET Fecha_ingreso = SYSDATE
  WHERE idSocio = :NEW.idSocio;
  COMMIT;
END trg_Actualizar_Fecha_Ingreso;

-- 4. Validar que el nombre de usuario sea �nico al crear un usuario
CREATE OR REPLACE TRIGGER trg_Validar_Usuario_Unico
BEFORE INSERT ON Usuario
FOR EACH ROW
DECLARE
  v_nombreUsuario_exists NUMBER(1);
BEGIN
  SELECT COUNT(*)
  INTO v_nombreUsuario_exists
  FROM Usuario
  WHERE Nombre = :NEW.Nombre;

  IF v_nombreUsuario_exists > 0 THEN
    RAISE_APPLICATION_ERROR(-20003, 'El nombre de usuario ya existe');
  END IF;
END trg_Validar_Usuario_Unico;



--Scripts de funciones de usuario

-- 1. Funci�n para calcular la cantidad de libros prestados por un socio
CREATE OR REPLACE FUNCTION Libros_Prestados_Por_Socio (p_idSocio IN Socio.idSocio%TYPE)
RETURN NUMBER
IS
  v_cantidad NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad
  FROM Prestamo
  WHERE idSocio = p_idSocio;

  RETURN v_cantidad;
END Libros_Prestados_Por_Socio;

-- 2. Funci�n para calcular la cantidad de libros disponibles por g�nero
CREATE OR REPLACE FUNCTION Libros_Disponibles_Por_Genero (p_genero IN Libro.Genero%TYPE)
RETURN NUMBER
IS
  v_cantidad NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad
  FROM Libro
  WHERE Genero = p_genero AND ISBN NOT IN (SELECT ISBN FROM Prestamo WHERE Estado = 'Prestado');

  RETURN v_cantidad;
END Libros_Disponibles_Por_Genero;



--Scripts de vistas, debe contener l�gica compleja, es decir uso de joins, sub consultas, agrupaciones y/o funciones de sentencia de grupo 

-- Vista 1: Libros y sus autores
CREATE VIEW Libros_y_Autores AS
  SELECT l.ISBN, l.Titulo, l.Genero, l.Anio_Publicacion, l.Num_Ejemplar, a.Nombre || ' ' || a.Apellidos AS Autor
  FROM Libro l
  JOIN Autor a ON l.idAutor = a.idAutor;

-- Vista 2: Mostrar informaci�n de pr�stamos y socios
CREATE OR REPLACE VIEW v_prestamos_socios AS
  SELECT p.idPrestamo, p.Fecha_Prestamo, p.Fecha_devolucion, p.Estado, s.Nombre || ' ' || s.Apellidos AS Socio, s.Direccion, s.Telefono, s.Fecha_nacimiento, s.Fecha_ingreso, s.Correo
  FROM Prestamo p
  JOIN Socio s ON p.idSocio = s.idSocio;
  
-- Vista 3: Libros prestados junto con detalles del socio y el libro
CREATE VIEW Prestamos_Detallados AS
  SELECT p.idPrestamo, p.Fecha_Prestamo, p.Fecha_devolucion, p.Estado,
         s.idSocio, s.Nombre || ' ' || s.Apellidos AS Nombre_Socio,
         l.ISBN, l.Titulo, l.Genero
  FROM Prestamo p
  JOIN Socio s ON p.idSocio = s.idSocio
  JOIN Libro l ON p.ISBN = l.ISBN;



/*
Diccionario de Datos

Tabla		Atributo			Tipo Dato		Descripción
Autor		idAutor				NUMBER(10)		ID único del autor
Autor		Nombre				VARCHAR2(30)	Nombre del autor
Autor		Apellidos			VARCHAR2(30)	Apellidos del autor
Autor		Nacionalidad		VARCHAR2(30)	Nacionalidad del autor
Editorial	idEditorial			NUMBER(10)		ID único de la editorial
Editorial	Editorial			VARCHAR2(20)	Nombre de la editorial
Editorial	Telefono			VARCHAR2(20)	Teléfono de la editorial
Editorial	Correo_Electronico	VARCHAR2(50)	Correo electrónico de la editorial
Editorial	Direccion			VARCHAR2(50)	Dirección de la editorial
Libro		ISBN				NUMBER(10)		ID único del libro (ISBN)
Libro		Titulo				VARCHAR2(30)	Título del libro
Libro		Genero				VARCHAR2(30)	Género del libro
Libro		Anio_Publicacion	NUMBER(4)		Año de publicación del libro
Libro		Num_Ejemplar		NUMBER(10)		Número de ejemplares disponibles
Libro		idAutor				NUMBER(10)		ID del autor (referencia a la tabla Autor)
Libro		idEditorial			NUMBER(10)		ID de la editorial (referencia a la tabla Editorial)
Socio		idSocio				NUMBER(10)		ID único del socio
Socio		Nombre				VARCHAR2(30)	Nombre del socio
Socio		Apellidos			VARCHAR2(30)	Apellidos del socio
Socio		Direccion			VARCHAR2(255)	Dirección del socio
Socio		Telefono			VARCHAR2(20)	Teléfono del socio
Socio		Fecha_nacimiento	DATE			Fecha de nacimiento del socio
Socio		Fecha_ingreso		DATE			Fecha de ingreso del socio
Socio		Correo				VARCHAR2(50)	Correo electrónico del socio
Rol			idRol				NUMBER(10)		ID único del rol
Rol			Nombre				VARCHAR2(30)	Nombre del rol
Rol			Funcion				VARCHAR2(50)	Función del rol
Usuario		idUsuario			NUMBER(10)		ID único del usuario
Usuario		Nombre				VARCHAR2(30)	Nombre de usuario
Usuario		Contrasena			VARCHAR2(30)	Contraseña del usuario
Usuario		idRol				NUMBER(10)		ID del rol (referencia a la tabla Rol)
Prestamo	idPrestamo			NUMBER(10)		ID único del préstamo
Prestamo	Fecha_Prestamo		DATE			Fecha del préstamo
Prestamo	Fecha_devolucion	DATE			Fecha de devolución del préstamo
Prestamo	Estado				VARCHAR2(30)	Estado del préstamo
Prestamo	idUsuario			VARCHAR2(30)	ID del usuario que realizó el préstamo
Prestamo	idSocio				NUMBER(10)		ID del socio (referencia a la tabla Socio)
Prestamo	ISBN				NUMBER(10)		ID del libro (ISBN) (referencia a la tabla Libro)
*/


/*

**Normalización**

Libro 																		
Autor						Nacionalidad	Libro 						Genero 				Año Publicación			Num_Ejemplar	Dirección			Telefono	Correo					Fecha registro		Editorial					Telefono				Correo Electronico				Dirección					Préstamo	Fecha devolución	Estado			Usuario		Rol
Jose María García López		Española		El corazón de la piedra		Ficción					2014								Guadalupe Centro	83010234	aruizm@gmail.com		1/1/2023			Nocturna					914 16 15 30			info@nocturnaediciones.com		Calle Lope La Rueda España	3/1/2023	3/15/2023			Devuelto		aruizm		Admin
J.K Rowling					Europea			Harry Potter				Realismo Mágico			1997								Alajuela Centro		22234543	lumanaa@gmail.com		2/2/2023			Bloomsburry Publishing		+44 (0)20 7631 5600		contact@bloomsbury.com 			50 Bedford Square Londres	3/15/2023	3/22/2023			Devuelto 		aruizm		Admin
Antoine de Saint-exupery	Francesa		El Principito				Novela					1943								Heredia Centro 		87654567	lhernandezc@gmail.com	2/2/2023			Salamandra					934674387				http://www.salamandra.info		Calle Travessera Barcelona	3/22/2023						Sin Devolución	aruizm		Admin


Autor			
idAutor	Nombre 		Apellidos			Nacionalidad
1		Jose María 	García López		Española
2		J.K 		Rowling				Europea
3		Antoine	 	de Saint-exupery	Francesa
-NOT NULL

Editorial			
idEditorial		Editorial				Telefono				Dirección
1				Nocturna				914 16 15 30			Calle Lope La Rueda España
2				Bloomsburry Publishing	+44 (0)20 7631 5600	50 	Bedford Square Londres
3				Salamandra				934674387				Calle Travessera Barcelona
-NOT NULL

Socio					
idSocio	Nombre	Apellidos		Telefono	Correo					Fecha registro
1		Adriana	Ruiz Marin		83010234	aruizm@gmail.com		1/1/2023
2		Luis	Umaña Alpizar	22234543	lumanaa@gmail.com		2/2/2023
3		Luis	Hernandez Cruz	87654567	lhernandezc@gmail.com	2/2/2023

Libro						
ISBN	Titulo						Genero 				Año Publicación		Num_Ejemplar	idAutor	idEditorial
1		El corazón de la piedra		Ficción				2014					0			1			1
2		Harry Potter				Realismo Mágico		1997					0			2			2
3		El Principito				Novela				1943					0			3			3
-NOT NULL

Préstamo			
idPrestamo	Fecha préstamo	Fecha devolución	idSocio		ISBN	idUsuario
1			3/1/2023			3/15/2023		1			1		3
2			3/15/2023			3/22/2023		2			2		3
3			3/22/2023							3			3		4

Usuario			
idusuario	Nombre			Contraseña	idRol
1			aruizm			1234		1
2			lhernadezc		5678		1
3			lumanaa			9876		2
4			rbarbozav		5432		2
-NOT NULL

Rol		
idRol	Nombre			Funcion
1		Administrador	Administrador
2		Colaborador		Incluye datos
-NOT NULL

*/

