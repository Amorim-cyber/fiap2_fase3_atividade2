create or replace FUNCTION CriarMorador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type,
p_nome tbl_morador.nm_morador%type,
p_telefone tbl_morador.telefone%type,
p_num_morada tbl_morada.nr_morada%type,
p_tipo_morada tbl_morada.tipo_morada%type,
p_nome_condominio tbl_condominio.nm_condominio%type,
p_num_condominio tbl_condominio.nr_condominio%type,
p_endereco tbl_condominio.endereco%type,
p_cep tbl_condominio.cep%type)
return VARCHAR2
AS

BEGIN

    DECLARE 
    v_id_usuario numeric;
    v_id_condominio numeric;
    v_id_morada numeric;
    v_id_morador numeric;

    BEGIN

        IF(usuario.existir(p_login,p_senha)) THEN
            RETURN 'Já existe uma conta com esse acesso';
        ELSE
            usuario.incluirnovachave(p_login,p_senha,v_id_usuario);
        END IF;
        
        IF(condominio.existir(p_num_condominio,p_cep)) THEN
            v_id_condominio := condominio.mostrarchave(p_num_condominio,p_cep);
        ELSE
            condominio.incluirnovoregistro(p_nome_condominio,
            p_num_condominio,p_endereco,p_cep,v_id_condominio);
        END IF;

        IF(morada.existir(v_id_condominio,p_num_morada)) THEN
            v_id_morada := morada.mostrarchave(p_num_morada,v_id_condominio);
        else
            morada.incluirnovachave(p_num_morada,p_tipo_morada,v_id_morada);
        END IF;
        
        morador.incluirnovachave(v_id_morador);
        
        INSERT INTO tbl_morador (id_morador,nm_morador, telefone, id_usuario) 
        VALUES (v_id_morador,p_nome,p_telefone,v_id_usuario);
        
        RETURN 'Morador registrado com sucesso!';

    END;
    
END CriarMorador;