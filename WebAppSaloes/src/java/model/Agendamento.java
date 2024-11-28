package model;

public class Agendamento {
    private int id;
    private String nomeCliente;
    private String data;
    private String horario;
    private int idSalao;

    //Construtores
    public Agendamento() {}

    public Agendamento(int id, String nomeCliente, String data, String horario, int idSalao) {
        this.id = id;
        this.nomeCliente = nomeCliente;
        this.data = data;
        this.horario = horario;
        this.idSalao = idSalao;
    }

    //Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public int getIdSalao() {
        return idSalao;
    }

    public void setIdSalao(int idSalao) {
        this.idSalao = idSalao;
    }
}
