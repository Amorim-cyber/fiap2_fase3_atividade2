create or replace FUNCTION RetornaDadosPrestador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type)
return VARCHAR2
is
BEGIN
        DECLARE 
            txtNome VARCHAR2(100) default ' ';
            txtTelefone VARCHAR2(100) default ' ';
            txtServicos VARCHAR2(200) default '';

        BEGIN

            txtNome := prestador.mostrarnome(p_login,p_senha);
            txtTelefone := prestador.mostrartelefone(p_login,p_senha);
            txtServicos := listaservicos.mostrar(p_login,p_senha);

            IF(txtNome is null or txtTelefone is null) THEN
                RETURN 'Usuário não encontrado!';
            END IF;
             
             RETURN txtNome || chr(10) ||
             txtTelefone || chr(10) ||
             'Especialidades =' || txtServicos;
             
        END;    
END RetornaDadosPrestador;