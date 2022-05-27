create or replace FUNCTION AtualizarMorador(
p_id_morador tbl_morador.id_morador%type,
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type,
p_nome tbl_morador.nm_morador%type,
p_telefone tbl_morador.telefone%type)
return VARCHAR2
AS
BEGIN

    DECLARE 
    v_id_usuario numeric;

    BEGIN
        IF(usuario.mostrarchave_id_morador(p_login,p_senha,p_id_morador) = -99999) 
        THEN
            RETURN 'Morador inexistente ou usuário inválido';
        ELSE
            v_id_usuario := 
            usuario.mostrarchave_id_morador(p_id_morador,p_login,p_senha);
        END IF;

        UPDATE TBL_MORADOR SET nm_morador = p_nome, telefone = p_telefone
        WHERE id_morador = p_id_morador;
        
        RETURN 'Morador atualizado com sucesso';

    END;

END AtualizarMorador;