create or replace PACKAGE BODY prestador
AS
    PROCEDURE incluirnovachave(
        v_novachave OUT tbl_prestador.id_prestador%type
    )
    IS
    BEGIN 
        v_novachave := tbl_prestador_seq.NEXTVAL;
        id_prestador := v_novachave;
    END incluirnovachave;

    FUNCTION mostrarnome(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2
    IS
        v_nome_prestador tbl_prestador.nm_prestador%type;
    BEGIN
        SELECT 
            prestador.nm_prestador AS NOME
            INTO v_nome_prestador
            FROM tbl_usuario usuario
            INNER JOIN tbl_prestador prestador 
            ON prestador.id_usuario = usuario.id_usuario
            INNER JOIN tbl_ocupacao ocupacao
            ON ocupacao.id_prestador = prestador.id_prestador
            INNER JOIN tbl_servico servico
            ON servico.id_servico = ocupacao.id_servico
            WHERE usuario.login = p_login 
            AND usuario.senha = p_senha;

            RETURN 'Nome = ' || v_nome_prestador;
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
        v_tel_prestador tbl_prestador.telefone%type;
    BEGIN
        SELECT
            prestador.telefone AS TELEFONE
            INTO v_tel_prestador
            FROM tbl_usuario usuario
            INNER JOIN tbl_prestador prestador 
            ON prestador.id_usuario = usuario.id_usuario
            INNER JOIN tbl_ocupacao ocupacao
            ON ocupacao.id_prestador = prestador.id_prestador
            INNER JOIN tbl_servico servico
            ON servico.id_servico = ocupacao.id_servico
            WHERE usuario.login = p_login 
            AND usuario.senha = p_senha;

            RETURN 'Telefone = ' || v_tel_prestador;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN null;
    END mostrartelefone;
END prestador;