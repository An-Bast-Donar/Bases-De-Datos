/*
- ==================== Procedimientos Almacenados ====================
- Son procesos que se pueden ejecutar una y otra vez mediante el nombre que se le asigne al mismo
- Debe ir conn la estructura en el ejemplo especificada
*/
USE `holamundo`;
DROP procedure IF EXISTS `sp_mostrarusers`;
DELIMITER $$
	USE `holamundo`$$
	CREATE PROCEDURE `sp_mostrarusers` ()
	BEGIN
		SELECT id, name FROM user;
	END $$
DELIMITER ;

/*
- Procedimiento almacenado con parametros
*/
USE `holamundo`;
DROP procedure IF EXISTS `sp_insertarusers`;
DELIMITER $$
	USE `holamundo`$$
	CREATE PROCEDURE `sp_insertarusers` (in p_name varchar(50), 
										 in p_edad int,
										 in p_email varchar(100))
	BEGIN
		INSERT INTO user (name, edad, email) VALUES (p_name, p_edad, p_email);
	END $$
DELIMITER ;

/*
- ==================== Ejecutar un procedimiento almacenado ====================
*/
CALL sp_mostrarusers();
CALL sp_insertarusers('juan', 26, 'juan@hotmail.com');

/*
- ==================== Triggers ====================
- Sentecias sql que se ejecutan antes o despues de una accion
- Estructura de un trigger: CREATE TRIGGER nombre_del_trigger momento evento ON tabla_que_recibe_el_evento
*/
USE `holamundo`;
DROP TRIGGER IF EXISTS registracrearusuario;
DELIMITER $$
CREATE TRIGGER registracrearusuario after insert ON user
FOR EACH ROW
BEGIN
   INSERT INTO acciones(accion) VALUE (concat('Inserto el usuario: ', NEW.name, NEW.edad));
END $$
DELIMITER ;

/*
- ==================== Usuario y prermisos ====================
- Cada usuario puede acceder desde lugares diferentes
- Si la cloumna # contiene el valor % para un registro significa que puede acceder desde donde sea
*/
SELECT * FROM mysql.user;

/*
- Crear usuario
- El usuario a crear debe contener tambien cual es el servidor del que proviene, esto se indica seguido del @
- Si no se indica de que servidor proviene el usuario este por defecto podra provenir de todos osea %
Ej: create user 'nombre_usuario'@'localhost' identified by 'pass';
*/
create user 'gestor' identified by '1234567890';

/*
- Dar permisos
Ej: grant tipo_de_permiso on db.tabla to 'nombre_usuario'@'localhost'; flush privileges;
ALL PRIVILEGES: Esto le otorgaría a un usuario de MySQL acceso completo a una base de datos designada (o si no se selecciona ninguna base de datos, acceso global a todo el sistema).
CREATE: Permite crear nuevas tablas o bases de datos.
DROP: Permite eliminar tablas o bases de datos.
DELETE: Permite eliminar filas de las tablas.
INSERT: Permite insertar filas en las tablas.
SELECT: Les permite usar el comando SELECT para leer las bases de datos.
UPDATE: Permite actualizar las filas de las tablas.
GRANT OPTION: Permite otorgar o eliminar privilegios de otros usuarios.
*/
grant all privileges on *.* to 'gestor';
flush privileges;

/*
- Revocar permisos
Ej: revoke tipo_de_permiso on db.tabla from 'nombre_usuario'@'localhost';
*/
revoke delete on *.* FROM 'gestor';

/*
- Mostrar los permisos del usuario
Ej: show grants for 'nombre_usuario'@'localhost';
*/
show grants for 'gestor';

/*
- Borrar usuario
Ej: drop user 'nombre_usuario'@'localhost';
*/
drop user 'gestor';
