<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Listagem de produtos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


    </head>
    <body class="text-center" style="background-color: #ededed">
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjoseelias", "root", "P@$$w0rd");

                //Listar os dados da tabela produto do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM musica ORDER BY codigo DESC LIMIT 1");
                ResultSet rs = st.executeQuery();
                %>
                <p>                
                <%
                while (rs.next()) {
                %>
                <h2> <strong> Última Música Adicionada: </strong> </h2>
                
                <p>
                 <img src="<%= rs.getString("capa")%>" class="rounded" style="max-width:20%;" alt="Capa do Álbum">
                </p>
                <p> 
                    <strong>
                    <%= rs.getString("banda")%> - <%= rs.getString("nome")%> <br> (<%= rs.getString("ano")%>)
                    </strong>
                    </p>
                 <a href="<%= rs.getString("link")%>" target="blank"> Ouvir Música </a> 
               <%
               }
               %>
               </p>
               <%
        } catch (Exception x) {
            out.print("Mensagem de erro:" + x.getMessage());
        }
    %>   
</body>
</html>
