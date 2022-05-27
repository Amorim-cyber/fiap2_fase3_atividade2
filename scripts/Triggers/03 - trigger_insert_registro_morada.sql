create or replace TRIGGER insert_registro_morada
        AFTER INSERT ON tbl_morador 
            BEGIN 
                INSERT INTO tbl_registro_morada (id_morador,id_morada)  
                VALUES (morador.id_morador,morada.id_morada);
            END;