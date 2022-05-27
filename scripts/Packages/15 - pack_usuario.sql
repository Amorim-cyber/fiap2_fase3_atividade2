create or replace PACKAGE usuario
AS
    id_usuario tbl_usuario.id_usuario%type := 9000;
    login tbl_usuario.login%type := 'LOGINTEST';
    senha tbl_usuario.senha%type := '999999';
    PROCEDURE incluirnovachave(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default '',
        v_novachave OUT tbl_usuario.id_usuario%type
    );
    FUNCTION mostrarchave(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN numeric;
    FUNCTION mostrarchave_id_morador(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default '',
        p_id_morador IN tbl_morador.id_morador%type
    )
    RETURN numeric;
    FUNCTION existir(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN boolean;
    FUNCTION formorador(
        p_id_usuario IN tbl_usuario.id_usuario%type
    )
    RETURN boolean;
    
END usuario;