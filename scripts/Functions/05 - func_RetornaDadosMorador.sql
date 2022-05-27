create or replace FUNCTION RetornaDadosMorador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type)
return VARCHAR2
is
BEGIN
        DECLARE 
            txtNome VARCHAR2(100) default ' ';
            txtTelefone VARCHAR2(100) default ' ';
            txtMoradas VARCHAR2(2000) default '';

        BEGIN

            txtNome := morador.mostrarnome(p_login,p_senha);
            txtTelefone := morador.mostrartelefone(p_login,p_senha);
            txtMoradas := listamoradas.mostrar(p_login,p_senha);

            IF(txtNome is null or txtTelefone is null) THEN
                RETURN 'Usuário não encontrado!';
            END IF;

             RETURN txtNome || chr(10) ||
                txtTelefone || chr(10) ||
                'Moradas:' || chr(10) ||
                chr(10) ||txtMoradas;

        END;    
END RetornaDadosMorador;