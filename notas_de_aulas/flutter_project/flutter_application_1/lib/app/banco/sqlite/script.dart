const criarTabelas = [
  '''
    CREATE TABLE cliente(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(200) NOT NULL,
      descricao VARCHAR(200) NULL,
      CPF CHAR(14) UNIQUE,
      url_avatar VARCHAR(300) NULL,
      status CHAR(1) NOT NULL DEFAULT 'A'
    )
  '''
];

const insercoes = [
  '''
    INSERT INTO cliente (nome, descricao, CPF, url_avatar, status)
    VALUES ('William Carvalho', 'Desenvolvedor Flutter', '123.456.789-10', 'https://example.com/avatar1.png', 'A')
  ''',
  '''
    INSERT INTO cliente (nome, descricao, CPF, url_avatar, status)
    VALUES ('Maria Santos', 'Designer Gráfico', '987.654.321-00', 'https://example.com/avatar2.png', 'A')
  ''',
  '''
    INSERT INTO cliente (nome, descricao, CPF, url_avatar, status)
    VALUES ('Pedro Alvares', 'Engenheiro', '321.654.987-00', 'https://example.com/avatar3.png', 'I')
  '''
];