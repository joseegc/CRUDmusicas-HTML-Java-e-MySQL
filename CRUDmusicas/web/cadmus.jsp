<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body style="background-color: #ededed" class="d-flex align-items-center justify-content-center">
        <%
            //Receber os dados digitados no formulário cadpro.html
            int anoLancamento;
            String nomeFaixa, banda, album, capa, link;
            
            capa = request.getParameter("capa");
            nomeFaixa = request.getParameter("nome");
            banda = request.getParameter("banda");
            album = request.getParameter("album");
            anoLancamento = Integer.parseInt(request.getParameter("ano"));
            link = request.getParameter("link");

            
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjoseelias", "root", "P@$$w0rd");
                //Inserir os dados na tabela produto do banco de dados aberto
                st = conecta.prepareStatement("insert into musica(capa, nome, banda, album, ano, link) values(?,?,?,?,?,?)"); 
                st.setString(1, capa);
                st.setString(2, nomeFaixa);
                st.setString(3, banda);
                st.setString(4, album);
                st.setInt(5, anoLancamento);
                st.setString(6, link);
                st.executeUpdate(); //Executa o comando INSERT
                out.print("<p style='margin-top: 30px;'>Música cadastrada com sucesso</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='margin-top: 30px;'>Esta música já está cadastrada.</p>");
                } else {
                    out.print("<p style='margin-top: 30px;'> Mensagem de erro:" + erro + "</p>");
                }
            }
        %>
    </body>
</html>
