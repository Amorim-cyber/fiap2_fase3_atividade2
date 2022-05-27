create or replace PACKAGE BODY listamoradas
AS

    FUNCTION mostrar(
        p_login IN tbl_usuario.login%type default '',
        p_senha IN tbl_usuario.senha%type default ''
    )
    RETURN VARCHAR2
    IS
        txtMoradas VARCHAR2(2000);
    BEGIN
        DECLARE  
        i numeric default 1;
        CURSOR cursor_moradas IS
        SELECT 
            morada.nr_morada AS NUM_MORADA,
            morada.tipo_morada AS TIPO,
            condominio.nm_condominio AS CONDOMINIO,
            condominio.nr_condominio AS NUM_CONDOMINIO,
            condominio.endereco AS ENDERECO,
            condominio.cep AS CEP
        FROM tbl_usuario usuario
        INNER JOIN tbl_morador morador 
        ON morador.id_usuario = usuario.id_usuario
        INNER JOIN tbl_registro_morada registro
        ON registro.id_morador = morador.id_morador
        INNER JOIN tbl_morada morada
        ON morada.id_morada = registro.id_morada
        INNER JOIN tbl_condominio condominio
        ON condominio.id_condominio = morada.id_condominio
        WHERE usuario.login = p_login 
        AND usuario.senha = p_senha;

        BEGIN

        FOR moradas IN cursor_moradas LOOP

                    txtMoradas := txtMoradas ||'(' || i || ')'
                    ||'Numero Morada = ' || moradas.NUM_MORADA || chr(10)
                    || 'Tipo Morada = ' || moradas.TIPO || chr(10)
                    || 'Condomínio Morada = ' || moradas.CONDOMINIO || chr(10)
                    || 'Número Condomínio Morada = ' || moradas.NUM_CONDOMINIO || chr(10)
                    || 'Endereço Morada = ' || moradas.ENDERECO || chr(10)
                    || 'CEP = ' || moradas.CEP || chr(10) || chr(10);
                    i := i + 1;
            END LOOP;
            RETURN txtMoradas;
            END;
    END mostrar;
END listamoradas;