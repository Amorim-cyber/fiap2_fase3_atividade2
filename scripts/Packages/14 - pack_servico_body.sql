create or replace PACKAGE BODY servico
AS
    FUNCTION mostrarchave(
        p_nome_servico IN tbl_servico.nm_servico%type
    )
    RETURN numeric
    IS
        v_id_servico tbl_servico.id_servico%type;
    BEGIN
        SELECT id_servico 
        INTO v_id_servico
        FROM tbl_servico 
        WHERE nm_servico = p_nome_servico;
            id_servico := v_id_servico;
            RETURN v_id_servico;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN -99999;
    END mostrarchave;

    FUNCTION existir(
        p_nome_servico IN tbl_servico.nm_servico%type
    )
    RETURN boolean
    IS
      BEGIN

        IF (mostrarchave(p_nome_servico) = -99999) THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;

    END existir;

END servico;