create or replace PACKAGE BODY morada
AS
    PROCEDURE incluirnovachave(
        p_num_morada IN tbl_morada.nr_morada%type,
        p_tipo_morada IN tbl_morada.tipo_morada%type,
        v_novachave OUT tbl_morada.id_morada%type
    )
    IS
    BEGIN 
        v_novachave := tbl_morada_seq.NEXTVAL;
        id_morada := v_novachave;
        num_morada := p_num_morada;
        tipo_morada := p_tipo_morada;
    END incluirnovachave;

    FUNCTION mostrarchave(
        p_id_condominio IN tbl_condominio.id_condominio%type,
        p_num_morada IN tbl_morada.nr_morada%type
    )
    RETURN numeric
    IS
    BEGIN
        SELECT id_morada,nr_morada,tipo_morada
        INTO id_morada,num_morada,tipo_morada
        FROM tbl_morada 
        WHERE id_condominio = p_id_condominio 
        AND nr_morada = p_num_morada;

            RETURN id_morada;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN -99999;
    END mostrarchave;

    FUNCTION existir(
        p_id_condominio IN tbl_condominio.id_condominio%type,
        p_num_morada IN tbl_morada.nr_morada%type
    )
    RETURN boolean
    IS
      BEGIN

        IF (mostrarchave(p_id_condominio,p_num_morada) = -99999) THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;

    END existir;

END morada;