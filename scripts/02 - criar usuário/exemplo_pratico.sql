
-- SELECT * FROM TBL_MORADOR ORDER BY id_morador DESC;
-- SELECT * FROM TBL_MORADA ORDER BY id_morada DESC;
-- SELECT * FROM TBL_CONDOMINIO ORDER BY id_condominio DESC;
-- SELECT * FROM TBL_PRESTADOR ORDER BY id_prestador DESC;
-- SELECT * FROM TBL_USUARIO ORDER BY id_usuario DESC;
-- SELECT * FROM TBL_OCUPACAO ORDER BY id_prestador DESC;
-- SELECT * FROM tbl_registro_morada ORDER BY id_morador DESC;

-- DELETE FROM TBL_USUARIO WHERE login = 'Zack123';
-- DELETE FROM TBL_PRESTADOR WHERE nm_prestador = 'Zack';
-- DELETE FROM TBL_OCUPACAO WHERE id_prestador = 115;

-- DELETE FROM TBL_USUARIO WHERE login = 'LOGINTEST';
-- DELETE FROM TBL_MORADOR WHERE nm_morador = 'Cody';
-- DELETE FROM tbl_registro_morada WHERE id_morador = 107;
-- DELETE FROM tbl_morada WHERE id_morada = 60;
-- DELETE FROM tbl_condominio WHERE id_condominio = 17;
SET SERVEROUTPUT ON

DECLARE v_resposta varchar(1000);

BEGIN
    -- Caso prestador
         /*sp_novousuario (
            p_login => 'Zack123',
            p_senha => '123',
            p_nome => 'Zack',
            p_telefone => '(021)22447-7155',
            p_tipo => 'PRESTADOR',
            p_servico => 'PINTOR',
            v_text_value => v_resposta
            );*/
            
    -- Caso morador
         /*sp_novousuario (
            p_login => 'Cody123',
            p_senha => '123',
            p_nome => 'Cody',
            p_telefone => '(021)22447-7171',
            p_tipo => 'MORADOR',
            p_num_morada => 30,
            p_tipo_morada => 'CASA',
            p_nome_condominio => 'Jardim Oce�nico',
            p_num_condominio => 1000,
            p_endereco => 'Rua Douglas Silva',
            p_cep => '99999-999',
            v_text_value => v_resposta
            );*/
            
            
    -- ERRO 1: Tipo de usuario invalido
        /*sp_novousuario (
            p_login => 'Zack123',
            p_senha => '123',
            p_nome => 'Zack',
            p_telefone => '(021)22447-7155',
            p_tipo => 'LOCAT�RIO',
            p_servico => 'PINTOR',
            v_text_value => v_resposta
        );*/
    
    -- ERRO 2: Usuario j� existe no banco
        /*sp_novousuario (
            p_login => 'Zack123',
            p_senha => '123',
            p_nome => 'Zack',
            p_telefone => '(021)22447-7155',
            p_tipo => 'PRESTADOR',
            p_servico => 'PINTOR',
            v_text_value => v_resposta
         );*/
         
    -- ERRO 3: O tipo de servi�o n�o existe
        sp_novousuario (
            p_login => 'Zoe123',
            p_senha => '123',
            p_nome => 'Zoe',
            p_telefone => '(021)22447-3030',
            p_tipo => 'PRESTADOR',
            p_servico => 'CONFEITEIRO',
            v_text_value => v_resposta
         );
    
    DBMS_OUTPUT.PUT_LINE(v_resposta);
    
END;
