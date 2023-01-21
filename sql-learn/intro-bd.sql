/*
- ==================== Crea una base de datos ====================
*/
create database holamundo;

/*
- Visualiza las bases de datos creadas en este server
*/
show databases;

/*
- El servicio no reconoce sobre que base de datos trabaj, por ende se le debe indicar
- Normalmente se debe usar esta sentencia antes de crear, insertar o eliminar alguna tabla o dato, para corroborar que se esta trabajando sobre la base de datos correcta
*/
use holamundo;

/*
- ==================== Crear una tabla ====================
- Existen muchos tipos de datos en SQL pero tres principales son: int, float y varchar, al cual entre parentecis se le indica la cantidad de caracteres que guarda
- Las llaves primarias se les necesita agregar la propiedad de auto ingremento para que no se solicite el dato al momento de insertar un registro
*/
CREATE TABLE animales(
	id int,
    tipo varchar(255),
    estado varchar(255),
    PRIMARY KEY (id)
);
CREATE TABLE user(
	id int not null auto_increment,
    name varchar(50) not null,
    edad int not null,
    email varchar(100) not null,
    PRIMARY KEY (id)
);
/*
- Crear tabla con llave foranea
*/
CREATE TABLE products(
	id int not null auto_increment,
    name varchar(50) not null,
    create_by int not null,
    marca varchar(50) not null,
    PRIMARY KEY (id),
    /*
    - Para crear una llave foranea se indica la tabla y entre parentecis la columna a la que hace referencia
    */
    foreign key(create_by) references user(id)
);
/*
- Crear una tabla para logs con fecha automatica
*/
CREATE TABLE `acciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `accion` VARCHAR(255) NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

/*
- ==================== Modificar una tabla ya creada ====================
*/
ALTER TABLE animales MODIFY COLUMN id int auto_increment;

/*
- Modificar el nombre de la tabla
*/
rename table products to product;

/*
- Muestra comando con el que se creo una tabla
- Para ejecutar el comando que regresa esta instruccion hay que quitarle las comillas que encierran el resultado
- Esta instruccion permite apreciar como por lo menos MySQL Server genera las tablas despues de leer nuestra instruccion
- Hay caracteristicas de cada columna que se adicionan despues de declarar la columna y asignarle el tipo
*/
SHOW CREATE TABLE animales;
/*
'CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
*/

/*
- ==================== Eliminar tabla ====================
*/
drop table animales;
drop table user;
drop table product;

/*
- ==================== Insertar valores en la tabla ====================
*/
INSERT INTO animales (tipo, estado) VALUES ('chanchito', 'feliz');
INSERT INTO animales (tipo, estado) VALUES ('dragon', 'furioso');
INSERT INTO animales (tipo, estado) VALUES ('felipe', 'triste');
INSERT INTO user (name, edad, email) VALUES ('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Layla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Nicolas', 36, 'nicolas@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Laura', 24, 'laura@gmail.com');
/*
- Insertar varios datos en un insert
*/
INSERT INTO product(name, create_by, marca)
VALUES
	('ipad', 1,'apple'),
    ('iphone', 1,'apple'),
    ('watch', 2,'apple'),
	('macbook', 1,'apple'),
    ('imac', 3,'apple'),
    ('ipad mini', 2,'apple');

/*
- ==================== Listar datos ====================
- El * se usa para listar todas las columnas de los registros entregados en la consulta
*/
SELECT * FROM animales;
SELECT * FROM user;
SELECT * FROM product;
SELECT * FROM acciones; 
/*
- Selectores con condiciones
*/
SELECT * FROM animales WHERE id=1;
SELECT * FROM animales WHERE estado='feliz';
SELECT * FROM animales WHERE estado='feliz' AND tipo='chanchito';
SELECT * FROM user limit 1;
SELECT * FROM user where edad > 15;
SELECT * FROM user where edad >= 15;
SELECT * FROM user where edad > 20 AND email = 'nicolas@gmail.com';
SELECT * FROM user where edad > 20 OR email = 'layla@gmail.com';
SELECT * FROM user where email != 'layla@gmail.com';
/*
- Entre valores
*/
SELECT * FROM user where edad between 15 and 30;
/*
- Abreviacion para algun string
*/
SELECT * FROM user where email like '%@gmail%';
SELECT * FROM user where email like '%@gmail';
SELECT * FROM user where email like 'oscar%';
/*
- Orden ascendente y descendente
*/
SELECT * FROM user order by edad asc;
SELECT * FROM user order by edad desc;
/*
- Funciones que se les envia el valor de la columna
*/
SELECT max(edad) as mayor FROM user;
SELECT min(edad) as menor FROM user;
/*
- Selecciona por columnas y agrega alias a las columnas
*/
SELECT id, name FROM user;
SELECT id as ID, name as nombre FROM user;
/*
- Alias a una tabla
*/
SELECT u.id, u.email FROM user u;

/*
- ==================== Actualizar registros ====================
*/
UPDATE animales SET tipo='tortuga' WHERE id=2;

/*
- ==================== Eliminar registros ====================
- Las bases de datos ya vienen configuradas para que siempre se necesite un id para la eliminacion
- Se pueden poner otros parametros de eliminacion o ninguno pero la configuracion arrojara un error
- La configuracion de protecion para eliminaciones se puede reconfigurar
*/
DELETE FROM animales WHERE id=2;

/*
- ==================== Left Join ====================
- Trae todos los registros de la tabla A que correspondan a la consulta realizada 
- Trae tambien los registros de la tabla B que esten vinculados al resultado de la conuslta realizada para la tabla A
- Ej: trae todos los datos de la tabla A asi tenga o no datos asociados en B, si tiene datos en B los muestra y si no muestra null
*/
SELECT u.id, u.email, p.name FROM user u LEFT JOIN product p on u.id = p.create_by;

/*
- ==================== Right Join ====================
- Trae todos los datos de la tabla B que correspondan a la consulta realizada
- Trae tambien los registros de la tabla A que esten vinculados al resultado de la consulta realizada para la tabla B
- Ej: trae todos los datos de la tabla B asi tenga o no datos asociados en A, si tiene datos en A los muestra y si no muestra null
*/
SELECT u.id, u.email, p.name FROM user u RIGHT JOIN product p on u.id = p.create_by;

/*
- ==================== Inner Join ====================
- Trae los registros que se encuentran en la interceccion de la tabla A y B
- Como trae los datos existentes en la intercepcion generalemente no arroja nulls
- Ej: trae los datos de la tabla A que tengan datos en la tabla B que es lo mismo que decir que trae los datos de la tabla B que tengan datos en la tabla A
*/
SELECT u.id, u.email, p.name FROM user u INNER JOIN product p on u.id = p.create_by;

/*
- ==================== Cross Join ====================
- Regresa una nueva asociacion de tablas donde cada registro de A lo asocia a cada registro de B
- No requiere indicar la asociacion de columnas
- Los adtos a entregar de esta consulta son potencialmente grandes
*/
SELECT u.id, u.email, p.name FROM user u CROSS JOIN product p;

/*
- ==================== GROUP BY ====================
- Se usa con instrucciones que por lo general agrupan elementos
- Ej: count() es una funcion que se le envian los datos de las columnas y regresa la cantidad de catos
*/
SELECT count(id), marca FROM product GROUP BY marca;
SELECT count(p.id), u.name FROM product p LEFT JOIN user u on p.create_by = u.id GROUP BY p.create_by;
SELECT count(p.id), u.name FROM product p LEFT JOIN user u on p.create_by = u.id GROUP BY p.create_by HAVING count(p.id)>=2;