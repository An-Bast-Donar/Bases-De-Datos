# Bases de Datos

Aprende bases de datos y sql de cero a master

## Conceptos

- Es cualquier cosa que almacene datos y pueda relacionarlos entre si
- Para acceder a los datos dentro de una BD se necesita un software RDMS (relational database management system), software como estos son, mysql, postgres, mariadb, oracle, entre otros, este softare se encarga de mostrar la infomracion, gestionar problemas como porjemplo los de concurrencia y conectar a los programas desarrollados con los diferentes lenguajes de programacion.
- CRUD: Create, Read, Update, Delete, son los querys basicos que se llevan acabo en una base de datos.
- Software de base de datos que implementan SQL son relacionales, almacenan datos mediante registros en tablas, con columnas y filas.
- Software de base de datos que no implementan SQL son no relacionales, estan implementan forman de registro de datos como json, BSON, BLOB, KEY-VALUE, entre muchas otras formas que existen para almacenar datos.
- Llave primaria: columna que indica un registro espesifico.
- llave foranea: columna que referencia la llave primaria de otra tabla.
- Las bases de datos son servicios que se ejecutan que guardan datos de forma organizada, para acceder a todos esos servicios se puede acceder desde diferentes gestores de bases de datos, cada servicio de base de datos generalmente tiene su propio gestor para la base de datos.
- Los servicios de bases de atos cuentan con un usuario administrativo con todos los privilegios, esto se le conoce como el usuario root que normalmente tiene una contraseña para proteger la infomacion dentro del servicio de la base de datos.

## Normalizacion de una bd

- Primera forma normal: ninguna tupla o registro puede tener atributos multivaluados
- Segunda forma normal: las relaciones muchos a muchos generan una nueva tabla
- Tercera forma normal: un registro en una tabla solo contiene datos que dependan de la clave del registro en la tabla
- Cuarta forma normal: Cero redundancia de datos y atomicidad en las tablas

## Procedimeintos almacenados

- Los stored procedures son conjuntos de sentecias sql que son agrupadas y almacenadas con un nombre particular en una base de datos relacional para ser usadas cada que sea necesario, estos procedimientos pueden recivir parametros lo que los hace muy flexibles a la hora de ejecutar consultar.
- Usar procedimientos almacenados tiene como beneficion que son mas rapidos de ejecutar, que encapsula logica del negocio, ddelega permisos a usuairos, por ejemplo puede que un usuairo no tenga permisos para borrar pero si acceso a un procedimiento almacenado que borra y por ultimo los procedimientos almacenados protegen a la base de datos de inyeccion de sentencias sql, puesto que como siempre son tratados como una variable los datos a ejecutar entonces es mas complicado inyectar sentencias que generen algun daño.
- Los diferentes gestores de bases de datos tienen su forma facil para crear y actualizar procedimientos almacenados sin necesidad de escribir todo el codigo que este requiere, ademas de que la estructura para crear procedimientos almacenados cambia segun el servidor de base de datos que estemos manejando

## Trigers

- Gatillo o disparador, una funcion que se ejecuta antes o despues de cierto momento, se pueden usar para insertar, actualizar o borrar registros de tablas en la base de datos, se puede usar para crear logs de las diferentes acciones, osea dejar registros de los diferentes movimientos de los usuarios dentro de una bd, tambien sirve para actualizar fechas de modificacion de registros, ejecutar acciones en caso de no tener los permisos de usuario, entre otras cosas, en mysql los trigers se almacenan dentro de la tabla a la que pertenecen.

## Usuario

- Existen diferentes tipos de usuarios con diferentes permisos, el usuario root es el que tiene por defecto todos los permisos, los permisos pueden radicar en poder crear o no triggers o sp o poder insertar datos o eliminar, entre otras acciones.

## Schemas

## MySQL

- Solo se requiere descargar de internet MySQL Installer, el servicio, el gestor de comandos y el gestor grafico.
- El gestor grafico de la base de datos MySQL es MySQL Workbench, este revisa que servicios de bd estan corriendo en el host y se puede acceder a ellos si se cuenta con el usuario root para ello.
- El motor grafico de gestor de base de datos de mysql tambien permite crear tablas graficamente, modelos entidad relacion, bases de datos enteras ne modelos entidad relacion, generar consultas sql en base a los modelos realizados graficamente, gestionar usuarios y muchas otras cosas mas.

## SQLServer

- Es otro motor de base de datos se descarga desde la web y contiene su propio gestor de base de datos igual que MySQL

## Oracle

- Otra base de datos con su servicio y con su gestor de desarrollo, esta base de datos tambien proporciona un lenguaje para realizar consultas llamado PL/SQL que es una extencion de SQL y nos permite crear procedimientos almacenados y generar muchas instrucciones desde el mismo servidor de la base de datos que en otros servicios debe hacerce por fuera de la BD.

## PostgreSQL

- Otra base de datos con su gestor de desarrollo tanto web como en aplicaicon de escritorio, bd multiplataforma y de codigo abierto.

## MariaBD

- Base de datos naciente de MySQL, usada en muchos software creados en linux, creada para garantizar el desarrollo abierto de MySQL.

## Cassandra

- Base de datos NoSQL de codigo bierto, distribuida y descentralizada.

## MongoDB

- Base de dato NoSQL de codigo abierto, almacena sus archivos en codigo json en vez de tablas.

## Redis

- Base de datos no relacionada que almacena datos mediante el metodo de clave valor, ofrece una gran velocidad que le sirve mucho a videojuegos y software que necesiten respuestas muy rapidas del servidor.

## DBeaver

- Conector de base de datos universal, en vez de tener un gestor de base de datos para cada uno de los servicios de bd diferentes, se tienen solo los servicios y se instala este gestor universal de bases de datos, es de codigo abierto y esta echo con java.

## Proveedor de base de datos

- Donde se implementa el servidor de base de datos a usar.
- Existen muchos como: aws, azure, digital oceans, hostinger, google cloud, entre muchos otros.

## Bases de datos no relacionales
