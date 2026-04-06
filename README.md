# 📚 Biblioteca DB

A fully normalized Oracle library management database with complete CRUD stored procedures, triggers, functions, views, and cursor-based automation.

---

## 🇺🇸 English

### About

**Biblioteca DB** is a relational database system designed to manage a library. Built entirely on Oracle, it handles books, authors, publishers, library members (socios), loans, users, and roles. The schema is fully normalized and includes a rich PL/SQL layer covering stored procedures for every entity, business logic triggers, user-defined functions, cursors, and complex analytical views.

### 🗂️ Database Schema

The database is organized around 6 core tables with proper foreign key relationships:

```
Autor ──────────────┐
                    ├──► Libro ──────────┐
Editorial ──────────┘                   ├──► Prestamo
                                        │
Socio ──────────────────────────────────┘
Rol ────────────────────────────────────────► Usuario
```

**Tables:**

| Table | Description |
|---|---|
| `Autor` | Book authors with name, surname, and nationality |
| `Editorial` | Publishers with contact details and address |
| `Libro` | Book catalog with ISBN, genre, year, copy count, author, and publisher |
| `Socio` | Library members with personal info and membership date |
| `Rol` | System roles defining user permissions and functions |
| `Usuario` | System users linked to a role |
| `Prestamo` | Loan records tracking book, member, dates, status, and responsible user |

### ✨ Features

- 📖 **Full CRUD via Stored Procedures** — Every table has dedicated Insert, Update, Delete, and Select procedures
- 🔁 **Cursor-based Automation** — Bulk updates using explicit cursors (e.g., update all books by an author, flag overdue loans)
- 🔒 **Validation Triggers** — Business rules enforced at the database level before data is committed
- 📊 **Analytical Views** — Complex views with JOINs, subqueries, and aggregations for reporting
- 🧮 **User-defined Functions** — Reusable functions for loan counts and book availability by genre
- 🗃️ **Custom Tablespace** — Dedicated `BIBLIOPROYEC` tablespace with its own datafile and user
- 📋 **Data Dictionary** — Inline documentation of all table attributes, types, and descriptions
- 🔄 **Normalization** — Schema follows normalization principles up to 3NF

### 🛠️ Tech Stack

| Technology | Description |
|---|---|
| [Oracle Database](https://www.oracle.com/database/) | Relational database engine |
| [PL/SQL](https://www.oracle.com/database/technologies/appdev/plsql.html) | Stored procedures, triggers, functions, cursors |
| [Oracle SQL Developer](https://www.oracle.com/tools/downloads/sqldev-downloads.html) | Recommended IDE for running the script |

### 🗄️ PL/SQL Objects

#### Stored Procedures (CRUD — one full set per table)

| Entity | Procedures |
|---|---|
| `Autor` | `Crear_Autor`, `Actualizar_Autor`, `Eliminar_Autor`, `Obtener_Autor` |
| `Libro` | `Insertar_Libro`, `actualizar_libro`, `borrar_libro`, `leer_libro` |
| `Editorial` | `insertar_editorial`, `actualizar_editorial`, `eliminar_editorial`, `seleccionar_editorial` |
| `Socio` | `insertar_socio`, `actualizar_socio`, `eliminar_socio`, `seleccionar_socio` |
| `Rol` | `insertar_rol`, `actualizar_rol`, `eliminar_rol`, `seleccionar_rol` |
| `Usuario` | `insertar_usuario`, `actualizar_usuario`, `eliminar_usuario`, `seleccionar_usuario` |
| `Prestamo` | `insertar_prestamo`, `actualizar_prestamo`, `eliminar_prestamo`, `seleccionar_prestamo` |

#### Cursor-based Procedures

- **`ActualizarLibrosAutor`** — Updates the genre of all books belonging to a given author using an explicit cursor
- **`actualizar_prestamos_vencidos`** — Scans all active loans and marks overdue ones as `'Vencido'` (expired) using a cursor loop

#### Triggers

| Trigger | Event | Description |
|---|---|---|
| `trg_Validar_Autor` | `BEFORE INSERT ON Libro` | Ensures the referenced author exists before inserting a book |
| `trg_Validar_Editorial` | `BEFORE INSERT ON Libro` | Ensures the referenced publisher exists before inserting a book |
| `trg_Actualizar_Fecha_Ingreso` | `AFTER UPDATE ON Socio` | Automatically refreshes `Fecha_ingreso` when a member's birth date is updated |
| `trg_Validar_Usuario_Unico` | `BEFORE INSERT ON Usuario` | Prevents duplicate usernames at the database level |

#### User-defined Functions

- **`Libros_Prestados_Por_Socio(p_idSocio)`** — Returns the total number of loans made by a specific member
- **`Libros_Disponibles_Por_Genero(p_genero)`** — Returns the count of available books in a given genre (excluding currently loaned ones)

#### Views

| View | Description |
|---|---|
| `Libros_y_Autores` | Joins `Libro` and `Autor` to show each book with its author's full name |
| `v_prestamos_socios` | Joins `Prestamo` and `Socio` to display full loan and member details |
| `Prestamos_Detallados` | Three-way JOIN across `Prestamo`, `Socio`, and `Libro` for full loan reporting |

### 📁 Repository Structure

```
Biblioteca-DB/
└── Biblioteca DB.sql    # Complete Oracle script: tablespace, user, schema,
                         # seed data, procedures, triggers, functions, and views
```

### ⚙️ Prerequisites

- **Oracle Database** (XE, Standard, or Enterprise — 11g or later recommended)
- **Oracle SQL Developer** or **SQL*Plus**
- A DBA-level user to run the initial setup (tablespace and user creation)

### 🚀 Getting Started

```sql
-- 1. Connect to Oracle as SYS or a DBA user, then run:
@"Biblioteca DB.sql"

-- This script will:
-- • Create the BIBLIOPROYEC tablespace and datafile
-- • Create the BibliPRO23 user (password: biblioteca123)
-- • Grant DBA, CONNECT, and RESOURCE roles to BibliPRO23
-- • Create all tables with constraints
-- • Insert sample data (10 authors, 10 publishers, 10 books, 10 members, 10 loans)
-- • Create all stored procedures, cursor procedures, triggers, functions, and views

-- 2. To connect as the library user:
-- Username: BibliPRO23
-- Password: biblioteca123
```

### 📊 Loan Status Values

| Status | Meaning |
|---|---|
| `Devuelto` | Book returned on time |
| `Atrasado` | Book returned late |
| `Sin Devolución` | Book not yet returned |
| `Vencido` | Loan expired (set automatically by cursor procedure) |

---

## 🇪🇸 Español

### Acerca del proyecto

**Biblioteca DB** es un sistema de base de datos relacional diseñado para gestionar una biblioteca. Construido completamente en Oracle, maneja libros, autores, editoriales, socios, préstamos, usuarios y roles. El esquema está completamente normalizado e incluye una capa PL/SQL completa con procedimientos almacenados para cada entidad, triggers de lógica de negocio, funciones de usuario, cursores y vistas analíticas complejas.

### 🗂️ Esquema de la Base de Datos

La base de datos está organizada en 6 tablas principales con relaciones de llave foránea correctas:

```
Autor ──────────────┐
                    ├──► Libro ──────────┐
Editorial ──────────┘                   ├──► Prestamo
                                        │
Socio ──────────────────────────────────┘
Rol ────────────────────────────────────────► Usuario
```

**Tablas:**

| Tabla | Descripción |
|---|---|
| `Autor` | Autores de libros con nombre, apellidos y nacionalidad |
| `Editorial` | Editoriales con datos de contacto y dirección |
| `Libro` | Catálogo de libros con ISBN, género, año, cantidad de ejemplares, autor y editorial |
| `Socio` | Miembros de la biblioteca con información personal y fecha de ingreso |
| `Rol` | Roles del sistema que definen permisos y funciones de usuarios |
| `Usuario` | Usuarios del sistema vinculados a un rol |
| `Prestamo` | Registros de préstamos con libro, socio, fechas, estado y usuario responsable |

### ✨ Funcionalidades

- 📖 **CRUD completo vía Procedimientos Almacenados** — Cada tabla tiene procedimientos dedicados de Insertar, Actualizar, Eliminar y Seleccionar
- 🔁 **Automatización con Cursores** — Actualizaciones masivas usando cursores explícitos (ej. actualizar todos los libros de un autor, marcar préstamos vencidos)
- 🔒 **Triggers de Validación** — Reglas de negocio aplicadas a nivel de base de datos antes de confirmar los datos
- 📊 **Vistas Analíticas** — Vistas complejas con JOINs, subconsultas y agrupaciones para reportes
- 🧮 **Funciones de Usuario** — Funciones reutilizables para conteo de préstamos y disponibilidad de libros por género
- 🗃️ **Tablespace Propio** — Tablespace `BIBLIOPROYEC` dedicado con su propio datafile y usuario
- 📋 **Diccionario de Datos** — Documentación en línea de todos los atributos, tipos y descripciones de las tablas
- 🔄 **Normalización** — El esquema sigue los principios de normalización hasta 3FN

### 🛠️ Stack Tecnológico

| Tecnología | Descripción |
|---|---|
| [Oracle Database](https://www.oracle.com/database/) | Motor de base de datos relacional |
| [PL/SQL](https://www.oracle.com/database/technologies/appdev/plsql.html) | Procedimientos, triggers, funciones y cursores |
| [Oracle SQL Developer](https://www.oracle.com/tools/downloads/sqldev-downloads.html) | IDE recomendado para ejecutar el script |

### 🗄️ Objetos PL/SQL

#### Procedimientos Almacenados (CRUD — un conjunto completo por tabla)

| Entidad | Procedimientos |
|---|---|
| `Autor` | `Crear_Autor`, `Actualizar_Autor`, `Eliminar_Autor`, `Obtener_Autor` |
| `Libro` | `Insertar_Libro`, `actualizar_libro`, `borrar_libro`, `leer_libro` |
| `Editorial` | `insertar_editorial`, `actualizar_editorial`, `eliminar_editorial`, `seleccionar_editorial` |
| `Socio` | `insertar_socio`, `actualizar_socio`, `eliminar_socio`, `seleccionar_socio` |
| `Rol` | `insertar_rol`, `actualizar_rol`, `eliminar_rol`, `seleccionar_rol` |
| `Usuario` | `insertar_usuario`, `actualizar_usuario`, `eliminar_usuario`, `seleccionar_usuario` |
| `Prestamo` | `insertar_prestamo`, `actualizar_prestamo`, `eliminar_prestamo`, `seleccionar_prestamo` |

#### Procedimientos con Cursores

- **`ActualizarLibrosAutor`** — Actualiza el género de todos los libros de un autor dado usando un cursor explícito
- **`actualizar_prestamos_vencidos`** — Recorre todos los préstamos activos y marca como `'Vencido'` los que superaron su fecha de devolución

#### Triggers

| Trigger | Evento | Descripción |
|---|---|---|
| `trg_Validar_Autor` | `BEFORE INSERT ON Libro` | Verifica que el autor referenciado exista antes de insertar un libro |
| `trg_Validar_Editorial` | `BEFORE INSERT ON Libro` | Verifica que la editorial referenciada exista antes de insertar un libro |
| `trg_Actualizar_Fecha_Ingreso` | `AFTER UPDATE ON Socio` | Actualiza automáticamente `Fecha_ingreso` cuando se modifica la fecha de nacimiento de un socio |
| `trg_Validar_Usuario_Unico` | `BEFORE INSERT ON Usuario` | Previene nombres de usuario duplicados a nivel de base de datos |

#### Funciones de Usuario

- **`Libros_Prestados_Por_Socio(p_idSocio)`** — Retorna el total de préstamos realizados por un socio específico
- **`Libros_Disponibles_Por_Genero(p_genero)`** — Retorna la cantidad de libros disponibles en un género dado (excluyendo los actualmente prestados)

#### Vistas

| Vista | Descripción |
|---|---|
| `Libros_y_Autores` | JOIN entre `Libro` y `Autor` para mostrar cada libro con el nombre completo de su autor |
| `v_prestamos_socios` | JOIN entre `Prestamo` y `Socio` para mostrar detalles completos de préstamos y socios |
| `Prestamos_Detallados` | JOIN triple entre `Prestamo`, `Socio` y `Libro` para reportes completos de préstamos |

### 📁 Estructura del Repositorio

```
Biblioteca-DB/
└── Biblioteca DB.sql    # Script Oracle completo: tablespace, usuario, schema,
                         # datos de ejemplo, procedimientos, triggers, funciones y vistas
```

### ⚙️ Requisitos Previos

- **Oracle Database** (XE, Standard o Enterprise — se recomienda 11g o superior)
- **Oracle SQL Developer** o **SQL*Plus**
- Un usuario con privilegios DBA para ejecutar la configuración inicial (creación del tablespace y usuario)

### 🚀 Primeros Pasos

```sql
-- 1. Conectarse a Oracle como SYS u otro usuario DBA, luego ejecutar:
@"Biblioteca DB.sql"

-- Este script:
-- • Crea el tablespace BIBLIOPROYEC y su datafile
-- • Crea el usuario BibliPRO23 (contraseña: biblioteca123)
-- • Otorga roles DBA, CONNECT y RESOURCE al usuario BibliPRO23
-- • Crea todas las tablas con sus restricciones
-- • Inserta datos de ejemplo (10 autores, 10 editoriales, 10 libros, 10 socios, 10 préstamos)
-- • Crea todos los procedimientos, cursores, triggers, funciones y vistas

-- 2. Para conectarse como usuario de la biblioteca:
-- Usuario: BibliPRO23
-- Contraseña: biblioteca123
```

### 📊 Estados de Préstamo

| Estado | Significado |
|---|---|
| `Devuelto` | Libro devuelto a tiempo |
| `Atrasado` | Libro devuelto con retraso |
| `Sin Devolución` | Libro aún no devuelto |
| `Vencido` | Préstamo expirado (asignado automáticamente por el procedimiento con cursor) |

---

<div align="center">
  <sub>Built with ❤️ by <a href="https://github.com/LUHECU">LUHECU</a></sub>
</div>
