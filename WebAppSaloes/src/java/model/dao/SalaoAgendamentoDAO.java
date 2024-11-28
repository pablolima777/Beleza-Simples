package model.dao;
/**
 *
 * @author Pablo Lima Pereira                 RGM: 11231100409
 *         Wendreu Bernardo dos Santos        RGM: 11231102590
 *         David da Silva Daniel              RGM: 11231103244 
 *         Guilherme Matos Andrade da Silva   RGM: 11231102539
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Salao;
import model.Agendamento;
import util.ConectaDB;

public class SalaoAgendamentoDAO {

    //Método para inserir um Salão
    public boolean inserirSalao(Salao salao) {
        String sql = "INSERT INTO saloes (nome, localizacao, servico, avaliacao, descricao) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = ConectaDB.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, salao.getNome());
            stmt.setString(2, salao.getLocalizacao());
            stmt.setString(3, salao.getServico());
            stmt.setDouble(4, salao.getAvaliacao());
            stmt.setString(5, salao.getDescricao());
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Erro ao inserir salão: " + e.getMessage());
            return false;
        }
    }

    //Método para listar todos os Salões
    public List<Salao> listarSaloes() {
        String sql = "SELECT * FROM saloes";
        List<Salao> saloes = new ArrayList<>();
        try (Connection conn = ConectaDB.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Salao salao = new Salao(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("localizacao"),
                    rs.getString("servico"),
                    rs.getDouble("avaliacao"),
                    rs.getString("descricao")
                );
                saloes.add(salao);
            }
        } catch (Exception e) {
            System.err.println("Erro ao listar salões: " + e.getMessage());
        }
        return saloes;
    }

    //Método para inserir um Agendamento
    public boolean inserirAgendamento(Agendamento agendamento) {
        String sql = "INSERT INTO agendamentos (id_salao, nome_cliente, data, horario) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConectaDB.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, agendamento.getIdSalao());
            stmt.setString(2, agendamento.getNomeCliente());
            stmt.setString(3, agendamento.getData());
            stmt.setString(4, agendamento.getHorario());
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Erro ao inserir agendamento: " + e.getMessage());
            return false;
        }
    }

    //Método para listar todos os Agendamentos de um salão
    public List<Agendamento> listarAgendamentosPorSalao(int idSalao) {
        String sql = "SELECT * FROM agendamentos WHERE id_salao = ?";
        List<Agendamento> agendamentos = new ArrayList<>();
        try (Connection conn = ConectaDB.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, idSalao);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Agendamento agendamento = new Agendamento(
                        rs.getInt("id"),
                        rs.getString("nome_cliente"),
                        rs.getString("data"),
                        rs.getString("horario"),
                        rs.getInt("id_salao")
                    );
                    agendamentos.add(agendamento);
                }
            }
        } catch (Exception e) {
            System.err.println("Erro ao listar agendamentos: " + e.getMessage());
        }
        return agendamentos;
    }
    //Método para buscar um Agendamento por ID
    public Agendamento buscarAgendamentoPorId(int id) {
    String sql = "SELECT * FROM agendamentos WHERE id = ?";
    try (Connection conn = ConectaDB.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setInt(1, id);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return new Agendamento(
                    rs.getInt("id"),
                    rs.getString("nome_cliente"),
                    rs.getString("data"),
                    rs.getString("horario"),
                    rs.getInt("id_salao")
                );
            }
        }
    } catch (Exception e) {
        System.err.println("Erro ao buscar agendamento: " + e.getMessage());
    }
    return null;
}

//Método para excluir um Agendamento
    public boolean excluirAgendamento(int id) {
    String sql = "DELETE FROM agendamentos WHERE id = ?";
    try (Connection conn = ConectaDB.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setInt(1, id);
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0;
    } catch (Exception e) {
        System.err.println("Erro ao excluir agendamento: " + e.getMessage());
        return false;
    }
    
}
    public boolean atualizarAgendamento(Agendamento agendamento) {
    String sql = "UPDATE agendamentos SET nome_cliente = ?, data = ?, horario = ? WHERE id = ?";
    try (Connection conn = ConectaDB.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, agendamento.getNomeCliente());
        stmt.setString(2, agendamento.getData());
        stmt.setString(3, agendamento.getHorario());
        stmt.setInt(4, agendamento.getId());
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0;
    } catch (Exception e) {
        System.err.println("Erro ao atualizar agendamento: " + e.getMessage());
        return false;
    }
    
}
    //Método para buscar agendamentos por nome do cliente
public List<Agendamento> buscarAgendamentosPorNome(String nome, int idSalao) {
    String sql = "SELECT * FROM agendamentos WHERE id_salao = ? AND nome_cliente LIKE ?";
    List<Agendamento> agendamentos = new ArrayList<>();
    try (Connection conn = ConectaDB.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setInt(1, idSalao);
        stmt.setString(2, "%" + nome + "%");  // Usa LIKE para busca parcial
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Agendamento agendamento = new Agendamento(
                    rs.getInt("id"),
                    rs.getString("nome_cliente"),
                    rs.getString("data"),
                    rs.getString("horario"),
                    rs.getInt("id_salao")
                );
                agendamentos.add(agendamento);
            }
        }
    } catch (Exception e) {
        System.err.println("Erro ao buscar agendamentos por nome: " + e.getMessage());
    }
    return agendamentos;
}


}
