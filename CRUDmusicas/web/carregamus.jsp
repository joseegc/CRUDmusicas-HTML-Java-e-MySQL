
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <title>Alteração de Músicas</title>
    </head>
    <body style="background-color: #ededed" class="d-flex align-items-center justify-content-center">
        <%
            //Recebe o código do produto a alterar
            int codigo;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            //Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjoseelias", "root", "P@$$w0rd");
            //Buscar o produto pelo código recebido
            st = conecta.prepareStatement("SELECT * FROM musica WHERE codigo = ?");
            st.setInt(1, codigo);
            ResultSet resultado = st.executeQuery(); //Executa o SELECT
            //Verifica se o produto de código informado foi encontrado
            if (!resultado.next()) { //se não encontrou o produto
                out.print("<p style='margin-top: 30px;'>Esta música não foi encontrada.</p>");
            } else { //se encontrou o produto
        %>
        
        
         <form style="margin-top: 30px;" method="post" action="alterar_musicas.jsp">
            <p>
                <label for="cod">Código:*</label>
                <input class="form-control" id="cod" type="number" name="codigo" value="<%= resultado.getString("codigo") %>" readonly>
            </p>
            <p>
                <label for="capa"> URL da Capa:</label>
                <input class="form-control" id="capa" type="text" name="capa" size="40" maxlength="6000" value="<%= resultado.getString("capa") %>">
            </p>
            <p>
                <label for="nom"> Nome da Faixa:*</label>
                <input class="form-control" id="nom" type="text" name="nome" size="40" maxlength="50" value="<%= resultado.getString("nome") %>" required>
            </p>
            <p>
                <label for="band">Artista:</label>
                <input class="form-control" id="band" type="text" size="40" maxlength="100" name="banda" value="<%= resultado.getString("banda") %>">
            </p>
            <p>
                <label for="album">Álbum: </label>
                <input class="form-control" id="album" type="text" size="40" maxlength="40" name="album" value="<%= resultado.getString("album") %>">
            </p>
            <p>
                <label for="ano">Ano de Lançamento: </label>
                <input class="form-control" id="ano" type="number" min="1860" name="ano" value="<%= resultado.getString("ano") %>">
            </p>
            <p>
                <label for="link"> URL da Música:</label>
                <input class="form-control" id="link" type="text" name="link" size="40" maxlength="6000" value="<%= resultado.getString("link") %>">
            </p>
            <p>
                <input class="btn btn-dark" type="submit" value="Salvar">
            </p>
            
        </form>
        
        
        <%
            }
        %>    
    </body>
</html>
