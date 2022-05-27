create or replace TRIGGER "INSERT_USUARIO_PRESTADOR" BEFORE INSERT ON tbl_prestador 
            BEGIN 
                INSERT INTO tbl_usuario (id_usuario,login , senha) 
                VALUES (usuario.id_usuario,usuario.login,usuario.senha);
            END;