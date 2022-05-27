create or replace PACKAGE listaservicos
AS
    FUNCTION mostrar(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2;
END listaservicos;