create or replace PACKAGE morada
AS
    id_morada tbl_morada.id_morada%type := 9002;
    num_morada tbl_morada.nr_morada%type := 8000;
    tipo_morada tbl_morada.tipo_morada%type := 'NAO_ENCONTRADO';
    PROCEDURE incluirnovachave(
        p_num_morada IN tbl_morada.nr_morada%type,
        p_tipo_morada IN tbl_morada.tipo_morada%type,
        v_novachave OUT tbl_morada.id_morada%type
    );
    FUNCTION mostrarchave(
        p_id_condominio IN tbl_condominio.id_condominio%type,
        p_num_morada IN tbl_morada.nr_morada%type
    )
    RETURN numeric;
    FUNCTION existir(
        p_id_condominio IN tbl_condominio.id_condominio%type,
        p_num_morada IN tbl_morada.nr_morada%type
    )
    RETURN boolean;
END morada;