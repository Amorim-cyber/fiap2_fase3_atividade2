create or replace FUNCTION IncluirMorada(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type,
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
    v_id_morada numeric;
    v_id_morador numeric;
    v_id_condominio numeric;

    BEGIN
                        
         IF(usuario.existir(p_login,p_senha)) THEN
            v_id_usuario := usuario.mostrarchave(p_login,p_senha);
            IF (NOT usuario.formorador(v_id_usuario)) THEN
                RETURN 'Usuário inválido !';
            END IF;
         
         ELSE
            RETURN 'Usuário não existe !';
        END IF;
        
        IF(condominio.existir(p_num_condominio,p_cep)) THEN
            v_id_condominio := condominio.mostrarchave(p_num_condominio,p_cep);
         ELSE
            condominio.incluirnovoregistro(
                p_nome_condominio,
                p_num_condominio,
                p_endereco,
                p_cep,
                v_id_condominio
            );
        END IF;

        IF(morada.existir(v_id_condominio,p_num_morada) 
        AND usuario.existir(p_login,p_senha)) THEN
            RETURN 'Morada já registrada no banco de dados para esse usuário';
        ELSE
            morada.incluirnovachave(p_num_morada,p_tipo_morada,v_id_morada);
        END IF;
        
        v_id_morador := morador.mostrarchave(v_id_usuario);

        INSERT INTO tbl_morada (id_morada,nr_morada , tipo_morada,id_condominio)
        VALUES (v_id_morada,p_num_morada,p_tipo_morada,v_id_condominio);

        RETURN 'Morada registrada com sucesso!';
        
    END;

END IncluirMorada;