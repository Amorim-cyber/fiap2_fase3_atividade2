create or replace TRIGGER insert_morada 
        BEFORE INSERT ON tbl_morador 
            BEGIN 
                INSERT INTO tbl_morada (id_morada,nr_morada , tipo_morada,id_condominio)  
                VALUES (morada.id_morada,
                morada.num_morada,
                morada.tipo_morada,
                condominio.id_condominio);
            END;