/*SELECT 
            morada.nr_morada AS NUM_MORADA,
            morada.tipo_morada AS TIPO,
            condominio.nm_condominio AS CONDOMINIO,
            condominio.nr_condominio AS NUM_CONDOMINIO,
            condominio.endereco AS ENDERECO,
            condominio.cep AS CEP
        FROM tbl_usuario usuario
        INNER JOIN tbl_morador morador 
        ON morador.id_usuario = usuario.id_usuario
        INNER JOIN tbl_registro_morada registro
        ON registro.id_morador = morador.id_morador
        INNER JOIN tbl_morada morada
        ON morada.id_morada = registro.id_morada
        INNER JOIN tbl_condominio condominio
        ON condominio.id_condominio = morada.id_condominio
        WHERE usuario.login = 'Cody123' 
        AND usuario.senha = '123';*/
-- SELECT * FROM TBL_USUARIO ORDER BY id_usuario DESC;
-- SELECT * FROM TBL_MORADOR ORDER BY id_morador DESC;
-- SELECT * FROM TBL_CONDOMINIO ORDER BY id_condominio DESC;
-- SELECT * FROM TBL_MORADA ORDER BY id_morada DESC;
-- SELECT * FROM TBL_REGISTRO_MORADA ORDER BY id_morada DESC;
-- DELETE FROM TBL_CONDOMINIO WHERE id_condominio = 14;
-- SELECT * FROM TBL_MORADA WHERE id_condominio = 11;
-- DELETE FROM TBL_MORADA WHERE id_condominio = 14;
-- SELECT * FROM TBL_REGISTRO_MORADA WHERE id_morada = 47;
-- DELETE FROM TBL_REGISTRO_MORADA WHERE id_morada = 47;

SET SERVEROUTPUT ON

DECLARE v_output_morador varchar(1000);
        v_resposta varchar(1000);
        
BEGIN
    -- Adição morada
    /*sp_loginAccount('Cody123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);
    
    sp_novamorada('Cody123','123',78,'APARTAMENTO','Condominio Ibiza',
                    90,'Rua Ocean Drive', '66631-210',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);
    DBMS_OUTPUT.PUT_LINE('');
    sp_loginAccount('Cody123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);*/
    
    -- Erro 1: Usuário não existente
    /*sp_novamorada('Benedita123','123',78,'APARTAMENTO','Condominio Ibiza',
                    90,'Rua Ocean Drive', '66631-210',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);*/
    
    -- Erro 2: Morada já registrada no registro do usuário
    /*sp_novamorada('Cody123','123',78,'APARTAMENTO','Condominio Ibiza',
                    90,'Rua Ocean Drive', '66631-210',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);*/
    
    -- Erro 3: Usuário inválido
    sp_novamorada('Zack123','123',78,'CASA','Condominio Monaco',
                    97,'Rua Perdizes', '66631-212',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);
    
END;
