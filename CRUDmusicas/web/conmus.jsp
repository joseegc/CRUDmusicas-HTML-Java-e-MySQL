


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
    <body style="background-color: #ededed" class="bg-dark">
        <%
             // Recebe o nome do produto digitado no formulário conpro.html
            String n;
            n = request.getParameter("nome");
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjoseelias", "root", "P@$$w0rd");

                //Listar os dados da tabela produto do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM musica WHERE nome LIKE ? ORDER By banda");
                st.setString(1, "%" + n + "%");
                ResultSet rs = st.executeQuery();
                %>
                <table border="1" class=" table table-striped table-dark table-hover" style="table-layout: fixed;">
                    <tr class="align-middle text-center">
                        <th>Código </th><th>Capa</th><th>Nome</th><th>Artista</th><th>Álbum</th> <th> Ano de Lançamento</th> <th> Ouvir Música </th>
                   </tr>                
                <%
                while (rs.next()) {
                %>
                    <tr class="align-middle text-center">
                        <td style="font-size: 180%">#<%= rs.getString("codigo")%></td>
                        <td> <img src="<%= rs.getString("capa")%>" class="img-fluid rounded" style="max-width:80%;" alt="Capa do Álbum"></td>
                        <td><%= rs.getString("nome")%></td>
                        <td><%= rs.getString("banda")%></td>
                        <td> <%= rs.getString("album")%></td>
                        <td>  <%= rs.getString("ano")%></td>
                        <td> <a href="<%= rs.getString("link")%>" target="blank"> <img src="https://clipart-library.com/images/6Tp5aga7c.png" style="max-width:30%;"></a> </td>
                        
                        
                    </tr>
               <%
               }
               %>
               </table>
               <%
        } catch (Exception x) {
            out.print("Mensagem de erro:" + x.getMessage());
        }
    %>   
</body>
</html>
