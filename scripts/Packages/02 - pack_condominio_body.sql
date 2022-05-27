create or replace PACKAGE BODY condominio
AS
    PROCEDURE incluirnovoregistro(
        p_nome_condominio IN tbl_condominio.nm_condominio%type,
        p_num_condominio IN tbl_condominio.nr_condominio%type,
        p_endereco IN tbl_condominio.endereco%type,
        p_cep IN tbl_condominio.cep%type,
        v_id_condominio OUT tbl_condominio.id_condominio%type
    )
    IS
    BEGIN 

        v_id_condominio := tbl_condominio_seq.NEXTVAL;
        
        BEGIN
             INSERT INTO tbl_condominio(id_condominio,nm_condominio, 
                                    endereco,nr_condominio,cep) 
            VALUES (v_id_condominio,p_nome_condominio,
                p_endereco,p_num_condominio,p_cep);
                
                id_condominio := v_id_condominio;
        END;

    END incluirnovoregistro;

    FUNCTION mostrarchave(
        p_num_condominio IN tbl_condominio.nr_condominio%type default -9999,
        p_cep IN tbl_condominio.cep%type default ''
    )
    RETURN numeric
    IS
        v_id_condominio tbl_condominio.id_condominio%type;
    BEGIN
        SELECT id_condominio 
        INTO v_id_condominio
        FROM tbl_condominio 
        WHERE nr_condominio = p_num_condominio AND cep = p_cep;
            id_condominio := v_id_condominio;
            RETURN v_id_condominio;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN -99999;
    END mostrarchave;

    FUNCTION existir(
        p_num_condominio IN tbl_condominio.nr_condominio%type default -9999,
        p_cep IN tbl_condominio.cep%type default ''
    )
    RETURN boolean
    IS
      BEGIN

        IF (mostrarchave(p_num_condominio,p_cep) = -99999) THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;

    END existir;

END condominio;