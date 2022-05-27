create or replace PACKAGE prestador 
AS
    id_prestador tbl_prestador.id_prestador%type := 9001;
    
    PROCEDURE incluirnovachave(
        v_novachave OUT tbl_prestador.id_prestador%type
    );
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
END prestador;