<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produtos</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body style="background-color: #ededed" class="d-flex align-items-center justify-content-center">
        <%
            //Receber os dados ALTERADOS no formulário carregaprod.jsp
            int codigo, anoLancamento;
            String nomeFaixa, banda, album, capa, link;
            
            codigo = Integer.parseInt(request.getParameter("codigo"));
            capa = request.getParameter("capa");
            nomeFaixa = request.getParameter("nome");
            banda = request.getParameter("banda");
            album = request.getParameter("album");
            anoLancamento = Integer.parseInt(request.getParameter("ano"));
            link = request.getParameter("link");

            try{
            //Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjoseelias", "root", "P@$$w0rd");

            //Alterar o sdados na tabela produtos do BD
            st = conecta.prepareStatement("UPDATE musica SET capa = ?, nome = ?, banda = ?, album = ?, ano = ?, link = ? WHERE codigo = ?");
            st.setString(1, capa);
            st.setString(2, nomeFaixa);
            st.setString(3, banda);
            st.setString(4, album);
            st.setInt(5, anoLancamento);
            st.setString(6, link);
            st.setInt(7, codigo);
            st.executeUpdate(); //Executa o UPDATE
            out.print("<p style='margin-top: 30px;'> Os dados da música " + codigo + " foram alterados com sucesso </p>");
       } catch (Exception erro){
          out.print ("Entre em contato com o suporte e informe o erro " + erro.getMessage());
       }
%>    
    </body>
</html>
