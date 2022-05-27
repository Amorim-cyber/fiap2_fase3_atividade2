create or replace FUNCTION CriarPrestador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type,
p_nome tbl_prestador.nm_prestador%type,
p_telefone tbl_prestador.telefone%type,
p_nome_servico tbl_servico.nm_servico%type)
return VARCHAR2
IS
BEGIN
    DECLARE 
    v_id_usuario numeric;
    v_id_servico numeric;
    v_id_prestador numeric;

    BEGIN

        IF(usuario.existir(p_login,p_senha)) THEN
            RETURN 'Já existe uma conta com esse acesso';
        ELSE
            usuario.incluirnovachave(p_login,p_senha,v_id_usuario);
        END IF;

        IF(NOT servico.existir(p_nome_servico)) THEN
            RETURN 'Tipo de serviço não foi encontrado no banco de dados';
        END IF;
        
        v_id_servico := servico.mostrarchave(p_nome_servico);
        
        prestador.incluirnovachave(v_id_prestador);
        
        INSERT INTO tbl_prestador (id_prestador,nm_prestador, telefone, id_usuario) 
        VALUES (v_id_prestador,p_nome,p_telefone,v_id_usuario);
        
        RETURN 'Prestador registrado com sucesso!';

    END;
    
END CriarPrestador;