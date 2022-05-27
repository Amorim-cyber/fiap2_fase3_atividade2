create or replace PACKAGE BODY morador
AS
    PROCEDURE incluirnovachave(
        v_novachave OUT tbl_morador.id_morador%type
    )
    IS
    BEGIN
        v_novachave:= tbl_morador_seq.NEXTVAL;
        id_morador := v_novachave;
    END incluirnovachave;
    FUNCTION mostrarchave(
        p_id_usuario IN tbl_usuario.id_usuario%type
    )
    RETURN NUMERIC
    IS
        v_id_morador tbl_morador.id_morador%type;
    BEGIN
        SELECT id_morador 
            INTO v_id_morador
            FROM tbl_morador 
                    WHERE  id_usuario = p_id_usuario;
        id_morador := v_id_morador;
        RETURN v_id_morador;
    END mostrarchave;
    FUNCTION mostrarnome(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2
    IS
        v_nome_morador tbl_morador.nm_morador%type;
    BEGIN
        SELECT 
            morador.nm_morador AS NOME
            INTO v_nome_morador
            FROM tbl_usuario usuario
            INNER JOIN tbl_morador morador 
            ON morador.id_usuario = usuario.id_usuario
            WHERE usuario.login = p_login
            AND usuario.senha = p_senha;

            RETURN 'Nome = ' || v_nome_morador;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN null;
    END mostrarnome;

    FUNCTION mostrartelefone(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2
    IS
        v_tel_morador tbl_morador.telefone%type;
    BEGIN
        SELECT 
            morador.telefone AS TELEFONE
            INTO v_tel_morador
            FROM tbl_usuario usuario
            INNER JOIN tbl_morador morador 
            ON morador.id_usuario = usuario.id_usuario
            WHERE usuario.login = p_login
            AND usuario.senha = p_senha;

            RETURN 'Telefone = ' || v_tel_morador;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN null;
    END mostrartelefone;
END morador;