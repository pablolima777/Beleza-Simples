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
    <title>Salões de Beleza</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Serviços de beleza e bem-estar</h1>
    </header>
    <main>
        <section>
            <h2>Salões Disponíveis</h2>
            <div id="lista-saloes">
                <ul>
                    <%
                        //Instancia o DAO e busca os salões
                        SalaoAgendamentoDAO dao = new SalaoAgendamentoDAO();
                        List<Salao> saloes = dao.listarSaloes();

                        //Condicao para ver se existem salões cadastrados
                        if (saloes != null && !saloes.isEmpty()) {
                            for (Salao salao : saloes) {
                    %>
                        <li>
                            <h3><%= salao.getNome() %></h3>
                            <img src="images/salao<%= salao.getId() %>.png" alt="<%= salao.getNome() %>">
                            <p><strong>Localização:</strong> <%= salao.getLocalizacao() %></p>
                            <p><strong>Serviço:</strong> <%= salao.getServico() %></p>
                            <p><strong>Avaliação:</strong> <%= salao.getAvaliacao() %> / 5</p>
                            <p><strong>Descrição:</strong> <%= salao.getDescricao() %></p>
                            <a href="agendamento.jsp?idSalao=<%= salao.getId() %>">
                                <button>Agendar Horário</button>
                            </a>
                        </li>
                    <%
                            }
                        } else {
                    %>
                        <p>Nenhum salão disponível no momento.</p>
                    <%
                        }
                    %>
                </ul>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 - Sistema de Salões de Beleza e bem-estar</p>
    </footer>
</body>
</html>
