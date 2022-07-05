--
-- File generated with SQLiteStudio v3.2.1 on s�b abr 23 19:46:07 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: category
CREATE TABLE category (
    id integer NOT NULL PRIMARY KEY,
    description text NOT NULL
);
INSERT INTO category (id, description) VALUES (1, 'Bug');
INSERT INTO category (id, description) VALUES (2, 'New feature');
INSERT INTO category (id, description) VALUES (3, 'Improvement');
INSERT INTO category (id, description) VALUES (4, 'Task');
INSERT INTO category (id, description) VALUES (5, 'Support');

-- Table: issue
CREATE TABLE issue (
    id integer NOT NULL PRIMARY KEY,
    id_user integer NOT NULL,
    id_status integer NOT NULL,
    id_project integer NOT NULL,
    id_priority integer NOT NULL,
    id_category integer NOT NULL,
    id_member integer,
    register_date date NOT NULL,
    close_date date,
    issue_time character(5),
    title text NOT NULL,
    description text NOT NULL,
    solution text,
    file text, close_time char(5),
    FOREIGN KEY (id_category) REFERENCES category(id),
    FOREIGN KEY (id_priority) REFERENCES priority(id),
    FOREIGN KEY (id_project) REFERENCES project(id),
    FOREIGN KEY (id_status) REFERENCES status(id)
);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (1, 1, 1, 2, 2, 1, NULL, '2021-07-18', NULL, '19:55', 'Envio de e-mail após abrir tópico', '<p>Após a abertuda do chamado, o e-mail automatico não é enviado.</p><p>Acusando erro de conexão ao host.</p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (2, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '00:25', 'Tabela itens por festa', '<p style="line-height: 1;">Verificar com o Luan qual é a tabela de itens de festas / decoação de acordo com o número de convidados.</p><p style="line-height: 1;"><b style="background-color: rgb(255, 255, 0);">Exemplo:</b></p><p style="line-height: 1;"><span style="background-color: rgb(255, 255, 0);">Festa 50 Convidados = X Itens / Valor</span></p><p style="line-height: 1;"><span style="background-color: rgb(255, 255, 0);">Festa 100 Convidados = XX Itens / Valor</span></p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (3, 1, 1, 3, 2, 2, NULL, '2022-03-08', NULL, '00:29', 'Funcionalidade para gerar pagamento de colaboradores', '<p style="line-height: 1;">Melhoria proposta por Matias</p><p style="line-height: 1;">Criar funcionalidade para gerar de forma automatica a conta a pagar de pagamento dos colaboradores.</p><p style="line-height: 1;">Funcionalidade semelhante ao gerar Pagamento / Recebimento.</p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (4, 1, 1, 3, 2, 2, NULL, '2022-03-08', NULL, '00:33', 'Funcionalidade no dashboard para trazer EVENTOS não finalizadas', '<p style="line-height: 1;">Melhoria posta por Matias.</p><p style="line-height: 1;">Ser adicionado no dashboard da festa / decoração uma listagem de eventos não finalizados.</p><p style="line-height: 1;"><span style="background-color: rgb(255, 255, 0);"><b>Exemplo:</b></span></p><p style="line-height: 1;"><span style="background-color: rgb(255, 255, 0);">Na listagem fazer a verificação de qual festa está inativa e teve financeiro gerado. </span></p><p style="line-height: 1;"><span style="background-color: rgb(255, 255, 0);">Nessa situação caracteriza-se uma prospecção.</span></p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (5, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '00:39', 'Relatório de clientes que não realizam festas por X meses', '<p style="line-height: 1;">Melhoria posta por Matias.</p><p style="line-height: 1;">Ser desernvolvido um relatório com a listagem de clientes que não realizam nenhum evento a mais de X meses.</p><p style="line-height: 1;">Podendo ser separado por festas e decorações.</p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (6, 1, 1, 3, 4, 3, NULL, '2022-03-08', NULL, '00:43', 'Relatório para imprimir os contratos dos eventos', '<p style="line-height: 1;">Criar um relatório para puxar as informações de uma festa em especifico <b>(funcionalidae pode ficar disponível no campo de ações na list do form) </b></p><p style="line-height: 1;">Nessa visualização ser organizado um relatório contendo as informações presentes nos itens dos eventos.</p><p style="line-height: 1;">Verificar com o luan algum modelo já utilizado por ele no sistema antigo.</p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (7, 1, 1, 3, 4, 2, NULL, '2022-03-08', NULL, '00:55', 'Criar recibo para de movimentações de pagamento e recebimentos', '<p style="line-height: 1;">Criar um relatório com modelo para RECIBO para comprovação de pagamentos e recebimentos.</p><p style="line-height: 1;"><b style="background-color: rgb(255, 255, 0);">Exemplo:</b></p><p style="line-height: 1;"><span style="background-color: rgb(255, 255, 0);">Formato Matricial e Formato A4</span></p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (8, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '01:06', 'Criar vinculo de EVENTO com colaboradores (Oriundo Ticket 3)', '<p style="line-height: 1;">Criar uma listagem de colaboradores com vinculo em eventos, o intuito dessa tela é listar os pagamentos a serem feitos de forma que facilite a visualização.</p><p style="line-height: 1;"><b style="background-color: rgb(255, 255, 0);">Exemplo:</b></p><p style="line-height: 1;"><span style="background-color: rgb(255, 255, 0);"><b>Nome / Telefone / Chave PIX</b></span></p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (9, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '02:37', 'Melhoria nos filtros na tela recebimento e pagamento', '<p style="line-height: 1;">Ser adicionado nos filtros na pagina os seguintes filtros de pesquisa:</p><ol><li style="line-height: 1;"><b>Emissão</b></li><li style="line-height: 1;"><b>Vencimento</b></li><li style="line-height: 1;"><b>Pagmaento</b><br></li></ol><p style="line-height: 1;">Contendo data de inicio e final das datas.</p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (10, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '02:42', 'Melhoria nos filtros na tela de EVENTOS', '<p>Ser adicionado ao filtros de pesquisa da página a possibilidade do ususário fazer a busca pelo campo data evento.</p>', NULL, NULL, NULL);
INSERT INTO issue (id, id_user, id_status, id_project, id_priority, id_category, id_member, register_date, close_date, issue_time, title, description, solution, file, close_time) VALUES (11, 1, 1, 3, 3, 3, NULL, '2022-03-08', NULL, '03:10', 'Melhoria na tela de EVENTOS ao salvar itens', '<p style="line-height: 1;">Melhoria no ato de salvar o <b>EVENTO</b>, para fazer com que o sistema verifique se há um faturamento já gerado.</p><p style="line-height: 1;">Caso <b>NÃO</b>, permitir que o <b>EVENTO</b> seja editado.</p><p style="line-height: 1;">Caso <b>SIM</b>, sistema deve exibir uma mensagem informado para o ususário que não é possível alterar.</p>', NULL, NULL, NULL);

-- Table: note
CREATE TABLE note (
    id integer NOT NULL PRIMARY KEY,
    id_issue integer NOT NULL,
    id_user integer NOT NULL,
    note text,
    register_date date,
    register_time text,
    FOREIGN KEY (id_issue) REFERENCES issue(id)
);
INSERT INTO note (id, id_issue, id_user, note, register_date, register_time) VALUES (1, 8, 1, NULL, '2022-03-08', '01:14');
INSERT INTO note (id, id_issue, id_user, note, register_date, register_time) VALUES (2, 2, 1, '<p>Buscar o contato com o Luan.</p>', '2022-03-08', '01:18');
INSERT INTO note (id, id_issue, id_user, note, register_date, register_time) VALUES (3, 11, 1, '<p>Já foi adicionado um campo no banco de dados para ser inserido o ID da fatura e DATA da ultima fatura gerada.</p>', '2022-03-27', '23:26');

-- Table: priority
CREATE TABLE priority (
    id integer NOT NULL PRIMARY KEY,
    description text NOT NULL
);
INSERT INTO priority (id, description) VALUES (1, 'Low');
INSERT INTO priority (id, description) VALUES (2, 'Normal');
INSERT INTO priority (id, description) VALUES (3, 'High');
INSERT INTO priority (id, description) VALUES (4, 'Urgent');

-- Table: project
CREATE TABLE project (
    id integer NOT NULL PRIMARY KEY,
    description text NOT NULL
);
INSERT INTO project (id, description) VALUES (1, 'Sistema Integrado - ERP');
INSERT INTO project (id, description) VALUES (2, 'Sistema Integrado - SUPORTE');
INSERT INTO project (id, description) VALUES (3, 'CASA CELEBRAR');

-- Table: project_member
CREATE TABLE project_member (id integer NOT NULL PRIMARY KEY, project_id integer, member_id integer, FOREIGN KEY (project_id) REFERENCES project(id));
INSERT INTO project_member (id, project_id, member_id) VALUES (1, 1, 1);
INSERT INTO project_member (id, project_id, member_id) VALUES (2, 1, 4);
INSERT INTO project_member (id, project_id, member_id) VALUES (3, 2, 1);
INSERT INTO project_member (id, project_id, member_id) VALUES (4, 3, 1);

-- Table: status
CREATE TABLE status (
    id integer NOT NULL PRIMARY KEY,
    description text NOT NULL,
    final_state character(1)
, color text);
INSERT INTO status (id, description, final_state, color) VALUES (1, 'New', 'N', '#4d993a');
INSERT INTO status (id, description, final_state, color) VALUES (2, 'In progress', 'N', NULL);
INSERT INTO status (id, description, final_state, color) VALUES (3, 'Waiting feedback', 'N', '#ff8514');
INSERT INTO status (id, description, final_state, color) VALUES (4, 'Resolved', 'N', NULL);
INSERT INTO status (id, description, final_state, color) VALUES (5, 'Testing', 'N', NULL);
INSERT INTO status (id, description, final_state, color) VALUES (6, 'Deploy', 'N', NULL);
INSERT INTO status (id, description, final_state, color) VALUES (7, 'Closed', 'Y', '#5761ba');
INSERT INTO status (id, description, final_state, color) VALUES (8, 'Rejected', 'Y', '#ff1414');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
