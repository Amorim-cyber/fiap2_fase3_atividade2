create or replace PACKAGE BODY listaservicos
AS

    FUNCTION mostrar(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2
    IS
        txtServicos VARCHAR2(200);
    BEGIN
        DECLARE  
        CURSOR cursor_servicos IS
        SELECT 
            servico.nm_servico AS SERVICO
        FROM tbl_usuario usuario
        INNER JOIN tbl_prestador prestador 
        ON prestador.id_usuario = usuario.id_usuario
        INNER JOIN tbl_ocupacao ocupacao
        ON ocupacao.id_prestador = prestador.id_prestador
        INNER JOIN tbl_servico servico
        ON servico.id_servico = ocupacao.id_servico
        WHERE usuario.login = p_login 
        AND usuario.senha = p_senha;

        BEGIN
            FOR servicos IN cursor_servicos LOOP
                txtServicos := txtServicos || ' ' || servicos.SERVICO;
             END LOOP;
            RETURN txtServicos;
        END;
    END mostrar;
END listaservicos;