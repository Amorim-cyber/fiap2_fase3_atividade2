-- SELECT * FROM TBL_MORADOR ORDER BY ID_MORADOR DESC;
-- SELECT * FROM TBL_USUARIO ORDER BY ID_USUARIO DESC;
/* UPDATE TBL_MORADOR SET nm_morador = 'Cody', telefone = '(021)22447-7171'
        WHERE id_morador = 108;*/
/* UPDATE TBL_USUARIO SET login = 'Cody123', senha = '123'
        WHERE id_usuario = 249;*/
        
SET SERVEROUTPUT ON

DECLARE v_output_morador varchar(1000);
        v_resposta varchar(1000);
        
BEGIN
    -- Atualizar Morador
    sp_loginAccount('Cody123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);
    
    sp_atualizarmorador(108,'Cody1234','1234','Cody Richard'
                        ,'(011)30000-4026',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);
    DBMS_OUTPUT.PUT_LINE('');
    sp_loginAccount('Cody1234','1234','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);
    
    -- ERRO : Morador não encontrado ou inválido
    /*sp_atualizarmorador(111,'Agatha1234','1234','Agatha Christie'
                        ,'(011)49781-4026',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);*/
    
END;