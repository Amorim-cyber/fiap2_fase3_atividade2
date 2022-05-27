create or replace PACKAGE servico
AS
    id_servico tbl_servico.id_servico%type := 1;
    FUNCTION mostrarchave(
        p_nome_servico IN tbl_servico.nm_servico%type
    )
    RETURN numeric;
    FUNCTION existir(
        p_nome_servico IN tbl_servico.nm_servico%type
    )
    RETURN boolean;
END servico;