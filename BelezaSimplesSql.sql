-- BelezaSimples
CREATE DATABASE IF NOT EXISTS salao_beleza;
USE salao_beleza;

-- Tabela salões de beleza
CREATE TABLE IF NOT EXISTS saloes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(150) NOT NULL,
    servico VARCHAR(50) NOT NULL,
    avaliacao DECIMAL(3, 2) NOT NULL,
    descricao TEXT
);

-- Inserção de dados para os salões
INSERT INTO saloes (nome, localizacao, servico, avaliacao, descricao) VALUES
('Carol Scavello Barbearia', 'Rio Vermelho, Bahia', 'Barbearia', 5.0, 'Especializada em cortes masculinos e barba.'),
('Sublime Sala De Belleza', 'Belén Aliadas, Medellín', 'Salão de Beleza', 5.0, 'Cortes femininos, maquiagem e penteados.'),
('Nectar Spa at the Cliff', 'Cupé Coy, Sint Maarten', 'Spa', 5.0, 'Relaxamento com vista para o mar.');

-- Tabela para armazenar os agendamentos
CREATE TABLE IF NOT EXISTS agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    id_salao INT NOT NULL,
    FOREIGN KEY (id_salao) REFERENCES saloes(id)
);

select * from saloes;
select * from agendamentos;






















