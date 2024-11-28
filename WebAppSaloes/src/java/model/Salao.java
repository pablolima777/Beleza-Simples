package model;
/**
 *
 * @author Pablo Lima Pereira                 RGM: 11231100409
 *         Wendreu Bernardo dos Santos        RGM: 11231102590
 *         David da Silva Daniel              RGM: 11231103244 
 *         Guilherme Matos Andrade da Silva   RGM: 11231102539
 */
public class Salao {
    private int id;
    private String nome;
    private String localizacao;
    private String servico;
    private double avaliacao;
    private String descricao;

    //Construtores
    public Salao() {}

    public Salao(int id, String nome, String localizacao, String servico, double avaliacao, String descricao) {
        this.id = id;
        this.nome = nome;
        this.localizacao = localizacao;
        this.servico = servico;
        this.avaliacao = avaliacao;
        this.descricao = descricao;
    }

    //Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getServico() {
        return servico;
    }

    public void setServico(String servico) {
        this.servico = servico;
    }

    public double getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(double avaliacao) {
        this.avaliacao = avaliacao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
