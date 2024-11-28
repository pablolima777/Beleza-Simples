<%-- 
    Document   : ListarSaloes
    Created on : 19 de nov. de 2024, 20:25:26
    Author     : Pablo Lima Pereira                 RGM: 11231100409
                 Wendreu Bernardo dos Santos        RGM: 11231102590
                 David da Silva Daniel              RGM: 11231103244 
                 Guilherme Matos Andrade da Silva   RGM: 11231102539
--%>
<%@ page import="java.util.List" %>
<%@ page import="model.Salao" %>
<%@ page import="model.dao.SalaoAgendamentoDAO" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sal�es de Beleza</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Servi�os de beleza e bem-estar</h1>
    </header>
    <main>
        <section>
            <h2>Sal�es Dispon�veis</h2>
            <div id="lista-saloes">
                <ul>
                    <%
                        //Instancia o DAO e busca os sal�es
                        SalaoAgendamentoDAO dao = new SalaoAgendamentoDAO();
                        List<Salao> saloes = dao.listarSaloes();

                        //Condicao para ver se existem sal�es cadastrados
                        if (saloes != null && !saloes.isEmpty()) {
                            for (Salao salao : saloes) {
                    %>
                        <li>
                            <h3><%= salao.getNome() %></h3>
                            <img src="images/salao<%= salao.getId() %>.png" alt="<%= salao.getNome() %>">
                            <p><strong>Localiza��o:</strong> <%= salao.getLocalizacao() %></p>
                            <p><strong>Servi�o:</strong> <%= salao.getServico() %></p>
                            <p><strong>Avalia��o:</strong> <%= salao.getAvaliacao() %> / 5</p>
                            <p><strong>Descri��o:</strong> <%= salao.getDescricao() %></p>
                            <a href="agendamento.jsp?idSalao=<%= salao.getId() %>">
                                <button>Agendar Hor�rio</button>
                            </a>
                        </li>
                    <%
                            }
                        } else {
                    %>
                        <p>Nenhum sal�o dispon�vel no momento.</p>
                    <%
                        }
                    %>
                </ul>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 - Sistema de Sal�es de Beleza e bem-estar</p>
    </footer>
</body>
</html>
