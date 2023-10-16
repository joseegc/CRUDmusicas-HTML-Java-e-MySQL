<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Músicas</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body style="background-color: #ededed" class="d-flex align-items-center justify-content-center">
        <%
            // Recebe o código digitado no formulário
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            try {
                //Conecta ao banco de dados chamado banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjoseelias", "root", "P@$$w0rd");
                // Excluem o produto de código informado
                PreparedStatement st = conecta.prepareStatement("DELETE FROM musica WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); // Executa o comando DELETE
                //Verifica se o produto foi ou  não excluído
                if (resultado == 0) {
                    out.print("<p style='margin-top: 30px;'>Esta música não está cadastrada.</p>");
                } else {
                    out.print("<p style='margin-top: 30px;'> A música de código " + cod + " foi excluída com sucesso</p>");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                
                out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
            }
        %>   
    </body>
</html>
