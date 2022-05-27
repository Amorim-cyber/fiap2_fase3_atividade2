create or replace TRIGGER insert_ocupacao 
        AFTER INSERT ON tbl_prestador 
            BEGIN 
                INSERT INTO tbl_ocupacao (id_prestador,id_servico)  
                VALUES (prestador.id_prestador,servico.id_servico);
            END;