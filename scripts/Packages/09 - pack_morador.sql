create or replace PACKAGE morador
AS
    id_morador tbl_morador.id_morador%type := 9000;
    PROCEDURE incluirnovachave(
        v_novachave OUT tbl_morador.id_morador%type
    );
    FUNCTION mostrarchave(
        p_id_usuario IN tbl_usuario.id_usuario%type
    )
    RETURN NUMERIC;
    FUNCTION mostrarnome(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2;
    FUNCTION mostrartelefone(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2;
END morador;