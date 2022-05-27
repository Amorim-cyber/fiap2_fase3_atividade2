create or replace PACKAGE BODY usuario
AS
    PROCEDURE incluirnovachave(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default '',
        v_novachave OUT tbl_usuario.id_usuario%type
    )
    IS
    BEGIN 
        v_novachave := tbl_usuario_seq.NEXTVAL;
        id_usuario := v_novachave;
        login := p_login;
        senha := p_senha;
    END incluirnovachave;

    FUNCTION mostrarchave(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN numeric
    IS
        v_id_usuario tbl_usuario.id_usuario%type;
    BEGIN
        SELECT id_usuario 
        INTO v_id_usuario
        FROM tbl_usuario 
        WHERE login = p_login AND senha = p_senha;
        
            id_usuario := v_id_usuario;
            login := p_login;
            senha := p_senha;

            RETURN v_id_usuario;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN -99999;
    END mostrarchave;
    
    FUNCTION mostrarchave_id_morador(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default '',
        p_id_morador IN tbl_morador.id_morador%type
    )
    RETURN numeric
    IS
        v_id_usuario tbl_usuario.id_usuario%type;
    BEGIN
        SELECT id_usuario 
        INTO v_id_usuario
        FROM tbl_morador 
        WHERE id_morador = p_id_morador;
        
            id_usuario := v_id_usuario;
            login := p_login;
            senha := p_senha;

            RETURN v_id_usuario;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN -99999;
    END mostrarchave_id_morador;

    FUNCTION existir(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN boolean
    IS
      BEGIN

        IF (mostrarchave(p_login,p_senha) = -99999) THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;

    END existir;
    
    FUNCTION formorador(
        p_id_usuario IN tbl_usuario.id_usuario%type
    )
    RETURN boolean
    IS
        v_id_morador tbl_morador.id_morador%type;
      BEGIN
      
        select id_morador 
        into v_id_morador
        from tbl_morador 
        where id_usuario = p_id_usuario;
        
        RETURN TRUE;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            RETURN FALSE;

    END formorador;

END usuario;