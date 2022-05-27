create or replace PACKAGE condominio
AS
    id_condominio tbl_condominio.id_condominio%type := 9003;
    PROCEDURE incluirnovoregistro(
        p_nome_condominio IN tbl_condominio.nm_condominio%type,
        p_num_condominio IN tbl_condominio.nr_condominio%type,
        p_endereco IN tbl_condominio.endereco%type,
        p_cep IN tbl_condominio.cep%type,
        v_id_condominio OUT tbl_condominio.id_condominio%type
    );
    FUNCTION mostrarchave(
        p_num_condominio IN tbl_condominio.nr_condominio%type default -9999,
        p_cep IN tbl_condominio.cep%type default ''
    )
    RETURN numeric;
    FUNCTION existir(
        p_num_condominio IN tbl_condominio.nr_condominio%type default -9999,
        p_cep IN tbl_condominio.cep%type default ''
    )
    RETURN boolean;
END condominio;