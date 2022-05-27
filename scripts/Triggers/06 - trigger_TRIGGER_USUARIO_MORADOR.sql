create or replace TRIGGER "TRIGGER_USUARIO_MORADOR" BEFORE INSERT OR UPDATE ON tbl_morador 
            BEGIN 
                CASE
                    WHEN INSERTING THEN
                        INSERT INTO tbl_usuario (id_usuario,login , senha) 
                        VALUES (usuario.id_usuario,usuario.login,usuario.senha);
                    WHEN UPDATING THEN
                        UPDATE TBL_USUARIO SET login = usuario.login,
                        senha = usuario.senha
                        WHERE id_usuario = usuario.id_usuario;
                END CASE;
            END;