--criação de tabelas em SQL para gerenciamento de banco de dados de um banco:

--Tabela de Clientes:

CREATE TABLE clientes (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  sobrenome VARCHAR(50) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  endereco VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(50),
  data_nascimento DATE,
  PRIMARY KEY (id)
);


--Tabela de Contas:

CREATE TABLE contas (
  id INT NOT NULL AUTO_INCREMENT,
  numero VARCHAR(20) NOT NULL,
  saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  tipo ENUM('corrente', 'poupanca', 'investimento') NOT NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);


--Tabela de Transações:

CREATE TABLE transacoes (
  id INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  tipo ENUM('debito', 'credito') NOT NULL,
  conta_origem INT NOT NULL,
  conta_destino INT,
  PRIMARY KEY (id),
  FOREIGN KEY (conta_origem) REFERENCES contas(id),
  FOREIGN KEY (conta_destino) REFERENCES contas(id)
);


