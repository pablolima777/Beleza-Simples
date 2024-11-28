<%-- 
    Document   : agendamento
    Author     : Pablo Lima Pereira                 RGM: 11231100409
                 Wendreu Bernardo dos Santos        RGM: 11231102590
                 David da Silva Daniel              RGM: 11231103244 
                 Guilherme Matos Andrade da Silva   RGM: 11231102539
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="model.Agendamento" %>
<%@ page import="model.dao.SalaoAgendamentoDAO" %>
<%
    String idSalao = request.getParameter("idSalao");
    SalaoAgendamentoDAO dao = new SalaoAgendamentoDAO();
    String mensagem = null;

    //Exclusão de agendamento
    String excluirId = request.getParameter("excluirId");
    if (excluirId != null) {
        if (dao.excluirAgendamento(Integer.parseInt(excluirId))) {
            mensagem = "Agendamento excluído com sucesso!";
        } else {
            mensagem = "Erro ao excluir agendamento.";
        }
    }

    //Busca o agendamento para alteração
    String alterarId = request.getParameter("alterarId");
    Agendamento agendamentoParaAlterar = null;
    if (alterarId != null) {
        agendamentoParaAlterar = dao.buscarAgendamentoPorId(Integer.parseInt(alterarId));
    }

    //Tratamento de submissão do formulário
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nomeCliente = request.getParameter("nomeCliente");
        String data = request.getParameter("data");
        String horario = request.getParameter("horario");

        if (alterarId != null) {
            //Atualização de agendamento
            Agendamento agendamento = new Agendamento(Integer.parseInt(alterarId), nomeCliente, data, horario, Integer.parseInt(idSalao));
            if (dao.atualizarAgendamento(agendamento)) {
                mensagem = "Agendamento alterado com sucesso!";
            } else {
                mensagem = "Erro ao alterar agendamento.";
            }
        } else {
            //Inserção de novo agendamento
            Agendamento agendamento = new Agendamento();
            agendamento.setIdSalao(Integer.parseInt(idSalao));
            agendamento.setNomeCliente(nomeCliente);
            agendamento.setData(data);
            agendamento.setHorario(horario);

            if (dao.inserirAgendamento(agendamento)) {
                mensagem = "Agendamento realizado com sucesso!";
            } else {
                mensagem = "Erro ao realizar agendamento.";
            }
        }
    }

    //Consulta de agendamentos (com filtro por nome)
    String nomeConsulta = request.getParameter("nomeConsulta");
    List<Agendamento> agendamentos;
    if (nomeConsulta != null && !nomeConsulta.isEmpty()) {
        agendamentos = dao.buscarAgendamentosPorNome(nomeConsulta, Integer.parseInt(idSalao));
    } else {
        agendamentos = dao.listarAgendamentosPorSalao(Integer.parseInt(idSalao));
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Gerenciar Agendamentos</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <header>
        <h1>Gerenciar Agendamentos</h1>
    </header>
    <main>
        <% if (mensagem != null) { %>
            <p><strong><%= mensagem %></strong></p>
        <% } %>

        <!-- Formulário de Agendamento -->
        <form action="agendamento.jsp?idSalao=<%= idSalao %><%= (alterarId != null) ? "&alterarId=" + alterarId : "" %>" method="POST">
            <label for="nomeCliente">Nome do Cliente:</label>
            <input type="text" id="nomeCliente" name="nomeCliente" value="<%= (agendamentoParaAlterar != null) ? agendamentoParaAlterar.getNomeCliente() : "" %>" required>
            
            <label for="data">Data:</label>
            <input type="date" id="data" name="data" value="<%= (agendamentoParaAlterar != null) ? agendamentoParaAlterar.getData() : "" %>" required>
            
            <label for="horario">Horário:</label>
            <input type="time" id="horario" name="horario" value="<%= (agendamentoParaAlterar != null) ? agendamentoParaAlterar.getHorario() : "" %>" required>
            
            <button type="submit"><%= (alterarId != null) ? "Alterar Agendamento" : "Confirmar Agendamento" %></button>
        </form>

        <!-- Formulário de Consulta por Nome -->
        <h2>Consultar Agendamentos</h2>
        <form action="agendamento.jsp" method="GET">
            <input type="hidden" name="idSalao" value="<%= idSalao %>">
            <label for="nomeConsulta">Nome do Cliente:</label>
            <input type="text" id="nomeConsulta" name="nomeConsulta" placeholder="Digite o nome do cliente">
            <button type="submit">Buscar</button>
        </form>

        <!-- Listagem de Agendamentos -->
        <h2>Agendamentos</h2>
        <table>
            <tr>
                <th>Nome do Cliente</th>
                <th>Data</th>
                <th>Horário</th>
                <th>Ações</th>
            </tr>
            <% for (Agendamento ag : agendamentos) { %>
                <tr>
                    <td><%= ag.getNomeCliente() %></td>
                    <td><%= ag.getData() %></td>
                    <td><%= ag.getHorario() %></td>
                    <td>
                        <a href="agendamento.jsp?idSalao=<%= idSalao %>&alterarId=<%= ag.getId() %>">Alterar</a>
                        <a href="agendamento.jsp?idSalao=<%= idSalao %>&excluirId=<%= ag.getId() %>" onclick="return confirm('Tem certeza que deseja excluir este agendamento?');">Excluir</a>
                    </td>
                </tr>
            <% } %>
        </table>

        <a href="index.html">Voltar à página inicial</a>
    </main>
</body>
</html>