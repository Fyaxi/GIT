<?php
use Adianti\Core\AdiantiCoreTranslator;

/**
 * ApplicationTranslator
 *
 * @version    7.0
 * @package    util
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class ApplicationTranslator
{
    private static $instance; // singleton instance
    private $lang;            // target language
    private $messages;
    private $sourceMessages;
    
    /**
     * Class Constructor
     */
    private function __construct()
    {
        $this->messages = [];
        $this->messages['en'] = [];
        $this->messages['en'][] = 'File not found';
        $this->messages['en'][] = 'Search';
        $this->messages['en'][] = 'Register';
        $this->messages['en'][] = 'Record saved';
        $this->messages['en'][] = 'Do you really want to delete ?';
        $this->messages['en'][] = 'Record deleted';
        $this->messages['en'][] = 'Function';
        $this->messages['en'][] = 'Table';
        $this->messages['en'][] = 'Tool';
        $this->messages['en'][] = 'Data';
        $this->messages['en'][] = 'Open';
        $this->messages['en'][] = 'New';
        $this->messages['en'][] = 'Save';
        $this->messages['en'][] = 'Find';
        $this->messages['en'][] = 'Edit';
        $this->messages['en'][] = 'Delete';
        $this->messages['en'][] = 'Cancel';
        $this->messages['en'][] = 'Yes';
        $this->messages['en'][] = 'No';
        $this->messages['en'][] = 'January';
        $this->messages['en'][] = 'February';
        $this->messages['en'][] = 'March';
        $this->messages['en'][] = 'April';
        $this->messages['en'][] = 'May';
        $this->messages['en'][] = 'June';
        $this->messages['en'][] = 'July';
        $this->messages['en'][] = 'August';
        $this->messages['en'][] = 'September';
        $this->messages['en'][] = 'October';
        $this->messages['en'][] = 'November';
        $this->messages['en'][] = 'December';
        $this->messages['en'][] = 'Today';
        $this->messages['en'][] = 'Close';
        $this->messages['en'][] = 'The field ^1 can not be less than ^2 characters';
        $this->messages['en'][] = 'The field ^1 can not be greater than ^2 characters';
        $this->messages['en'][] = 'The field ^1 can not be less than ^2';
        $this->messages['en'][] = 'The field ^1 can not be greater than ^2';
        $this->messages['en'][] = 'The field ^1 is required';
        $this->messages['en'][] = 'The field ^1 has not a valid CNPJ';
        $this->messages['en'][] = 'The field ^1 has not a valid CPF';
        $this->messages['en'][] = 'The field ^1 contains an invalid e-mail';
        $this->messages['en'][] = 'Permission denied';
        $this->messages['en'][] = 'Generate';
        $this->messages['en'][] = 'List';
        $this->messages['en'][] = 'Wrong password';
        $this->messages['en'][] = 'User not found';
        $this->messages['en'][] = 'User';
        $this->messages['en'][] = 'Users';
        $this->messages['en'][] = 'Password';
        $this->messages['en'][] = 'Login';
        $this->messages['en'][] = 'Name';
        $this->messages['en'][] = 'Group';
        $this->messages['en'][] = 'Groups';
        $this->messages['en'][] = 'Program';
        $this->messages['en'][] = 'Programs';
        $this->messages['en'][] = 'Back to the listing';
        $this->messages['en'][] = 'Controller';
        $this->messages['en'][] = 'Email';
        $this->messages['en'][] = 'Record Updated';
        $this->messages['en'][] = 'Password confirmation';
        $this->messages['en'][] = 'Front page';
        $this->messages['en'][] = 'Page name';
        $this->messages['en'][] = 'The passwords do not match';
        $this->messages['en'][] = 'Log in';
        $this->messages['en'][] = 'Date';
        $this->messages['en'][] = 'Column';
        $this->messages['en'][] = 'Operation';
        $this->messages['en'][] = 'Old value';
        $this->messages['en'][] = 'New value';
        $this->messages['en'][] = 'Database';
        $this->messages['en'][] = 'Profile';
        $this->messages['en'][] = 'Change password';
        $this->messages['en'][] = 'Leave empty to keep old password';
        $this->messages['en'][] = 'Results';
        $this->messages['en'][] = 'Invalid command';
        $this->messages['en'][] = '^1 records shown';
        $this->messages['en'][] = 'Administration';
        $this->messages['en'][] = 'SQL Panel';
        $this->messages['en'][] = 'Access Log';
        $this->messages['en'][] = 'Change Log';
        $this->messages['en'][] = 'SQL Log';
        $this->messages['en'][] = 'Clear form';
        $this->messages['en'][] = 'Send';
        $this->messages['en'][] = 'Message';
        $this->messages['en'][] = 'Messages';
        $this->messages['en'][] = 'Subject';
        $this->messages['en'][] = 'Message sent successfully';
        $this->messages['en'][] = 'Check as read';
        $this->messages['en'][] = 'Check as unread';
        $this->messages['en'][] = 'Action';
        $this->messages['en'][] = 'Read';
        $this->messages['en'][] = 'From';
        $this->messages['en'][] = 'Checked';
        $this->messages['en'][] = 'Object ^1 not found in ^2';
        $this->messages['en'][] = 'Notification';
        $this->messages['en'][] = 'Notifications';
        $this->messages['en'][] = 'Categories';
        $this->messages['en'][] = 'Send document';
        $this->messages['en'][] = 'My documents';
        $this->messages['en'][] = 'Shared with me';
        $this->messages['en'][] = 'Document';
        $this->messages['en'][] = 'File';
        $this->messages['en'][] = 'Title';
        $this->messages['en'][] = 'Description';
        $this->messages['en'][] = 'Category';
        $this->messages['en'][] = 'Submission date';
        $this->messages['en'][] = 'Archive date';
        $this->messages['en'][] = 'Upload';
        $this->messages['en'][] = 'Download';
        $this->messages['en'][] = 'Next';
        $this->messages['en'][] = 'Documents';
        $this->messages['en'][] = 'Permission';
        $this->messages['en'][] = 'Unit';
        $this->messages['en'][] = 'Units';
        $this->messages['en'][] = 'Add';
        $this->messages['en'][] = 'Active';
        $this->messages['en'][] = 'Activate/Deactivate';
        $this->messages['en'][] = 'Inactive user';
        $this->messages['en'][] = 'Send message';
        $this->messages['en'][] = 'Read messages';
        $this->messages['en'][] = 'An user with this login is already registered';
        $this->messages['en'][] = 'Access Stats';
        $this->messages['en'][] = 'Accesses';
        $this->messages['en'][] = 'Preferences';
        $this->messages['en'][] = 'Mail from';
        $this->messages['en'][] = 'SMTP Auth';
        $this->messages['en'][] = 'SMTP Host';
        $this->messages['en'][] = 'SMTP Port';
        $this->messages['en'][] = 'SMTP User';
        $this->messages['en'][] = 'SMTP Pass';
        $this->messages['en'][] = 'Ticket';
        $this->messages['en'][] = 'Open ticket';
        $this->messages['en'][] = 'Support mail';
        $this->messages['en'][] = 'Day';
        $this->messages['en'][] = 'Folders';
        $this->messages['en'][] = 'Compose';
        $this->messages['en'][] = 'Inbox';
        $this->messages['en'][] = 'Sent';
        $this->messages['en'][] = 'Archived';
        $this->messages['en'][] = 'Archive';
        $this->messages['en'][] = 'Recover';
        $this->messages['en'][] = 'Options';
        $this->messages['en'][] = 'New Issue';
        $this->messages['en'][] = 'Code';
        $this->messages['en'][] = 'Phone';
        $this->messages['en'][] = 'Address';
        $this->messages['en'][] = 'City';
        $this->messages['en'][] = 'Birthdate';
        $this->messages['en'][] = 'Logout';
        $this->messages['en'][] = 'Registration';
        $this->messages['en'][] = 'Expiration';
        $this->messages['en'][] = 'Call';
        $this->messages['en'][] = 'Author';
        $this->messages['en'][] = 'Authors';
        $this->messages['en'][] = 'Edition';
        $this->messages['en'][] = 'Volume';
        $this->messages['en'][] = 'Collection';
        $this->messages['en'][] = 'Classification';
        $this->messages['en'][] = 'Publisher';
        $this->messages['en'][] = 'Place';
        $this->messages['en'][] = 'Abstract';
        $this->messages['en'][] = 'Note';
        $this->messages['en'][] = 'Notes';
        $this->messages['en'][] = 'Basic data';
        $this->messages['en'][] = 'Secundary data';
        $this->messages['en'][] = 'Items';
        $this->messages['en'][] = 'Subjects';
        $this->messages['en'][] = 'Barcode';
        $this->messages['en'][] = 'Status';
        $this->messages['en'][] = 'Cost';
        $this->messages['en'][] = 'Acquire date';
        $this->messages['en'][] = 'Record added';
        $this->messages['en'][] = 'Success';
        $this->messages['en'][] = 'Not available';
        $this->messages['en'][] = 'Books';
        $this->messages['en'][] = 'Book';
        $this->messages['en'][] = 'Members';
        $this->messages['en'][] = 'Member';
        $this->messages['en'][] = 'Loans';
        $this->messages['en'][] = 'Loan';
        $this->messages['en'][] = 'Apply';
        $this->messages['en'][] = 'Not checked out';
        $this->messages['en'][] = 'Report filters';
        $this->messages['en'][] = 'Output';
        $this->messages['en'][] = 'Report generated';
        $this->messages['en'][] = 'No records found';
        $this->messages['en'][] = 'Loan date';
        $this->messages['en'][] = 'Arrive date';
        $this->messages['en'][] = 'Collections';
        $this->messages['en'][] = 'Classifications';
        $this->messages['en'][] = 'Publishers';
        $this->messages['en'][] = 'Cities';
        $this->messages['en'][] = 'Check in';
        $this->messages['en'][] = 'Check out';
        $this->messages['en'][] = 'Circulation';
        $this->messages['en'][] = 'Reports';
        $this->messages['en'][] = 'Cataloging';
        $this->messages['en'][] = 'Status';
        $this->messages['en'][] = 'Incorrect password';
        $this->messages['en'][] = 'Mnemonic';
        $this->messages['en'][] = 'Not active';
        $this->messages['en'][] = 'Role';
        $this->messages['en'][] = 'Roles';
        $this->messages['en'][] = 'Address';
        $this->messages['en'][] = 'Project';
        $this->messages['en'][] = 'Projects';
        $this->messages['en'][] = 'Priority';
        $this->messages['en'][] = 'Priorities';
        $this->messages['en'][] = 'Release';
        $this->messages['en'][] = 'Releases';
        $this->messages['en'][] = 'Time';
        $this->messages['en'][] = 'Assigned to';
        $this->messages['en'][] = 'Start date';
        $this->messages['en'][] = 'Due date';
        $this->messages['en'][] = 'Solution';
        $this->messages['en'][] = 'Final state';
        $this->messages['en'][] = 'View';
        $this->messages['en'][] = 'Comment';
        $this->messages['en'][] = 'Current password';
        $this->messages['en'][] = 'New password';
        $this->messages['en'][] = 'Confirm new password';
        $this->messages['en'][] = 'Current password does not match';
        $this->messages['en'][] = 'New password does not match the confirm password';
        $this->messages['en'][] = 'Password changed successfully';
        $this->messages['en'][] = 'Send e-mail';
        $this->messages['en'][] = 'Issue';
        $this->messages['en'][] = 'Issues';
        $this->messages['en'][] = 'Content';
        $this->messages['en'][] = 'Bug';
        $this->messages['en'][] = 'New feature';
        $this->messages['en'][] = 'Improvement';
        $this->messages['en'][] = 'Task';
        $this->messages['en'][] = 'Support';
        $this->messages['en'][] = 'In progress';
        $this->messages['en'][] = 'Waiting feedback';
        $this->messages['en'][] = 'Resolved';
        $this->messages['en'][] = 'Testing';
        $this->messages['en'][] = 'Deploy';
        $this->messages['en'][] = 'Closed';
        $this->messages['en'][] = 'Rejected';
        $this->messages['en'][] = 'Low';
        $this->messages['en'][] = 'Normal';
        $this->messages['en'][] = 'High';
        $this->messages['en'][] = 'Urgent';
        $this->messages['en'][] = 'Language';
        $this->messages['en'][] = 'Try again';
        $this->messages['en'][] = 'Contact';
        $this->messages['en'][] = 'Portugu??s';
        $this->messages['en'][] = 'Vers??o portugu??s';
        $this->messages['en'][] = 'News';
        $this->messages['en'][] = 'Tools';
        $this->messages['en'][] = 'Services';
        $this->messages['en'][] = 'Tickets';
        $this->messages['en'][] = 'Community';
        $this->messages['en'][] = 'Store';
        $this->messages['en'][] = 'Not logged';
        $this->messages['en'][] = 'Color';
        $this->messages['en'][] = 'Setup';
        $this->messages['en'][] = 'Attachment';
        $this->messages['en'][] = 'Reload';
        $this->messages['en'][] = 'Back';
        $this->messages['en'][] = 'Clear';
        $this->messages['en'][] = 'View';
        $this->messages['en'][] = 'No records found';
        $this->messages['en'][] = 'Drawing successfully generated';
        $this->messages['en'][] = 'QR Codes successfully generated';
        $this->messages['en'][] = 'Barcodes successfully generated';
        $this->messages['en'][] = 'Document successfully generated';
        $this->messages['en'][] = 'Value';
        $this->messages['en'][] = 'User';
        $this->messages['en'][] = 'Password';
        $this->messages['en'][] = 'Port';
        $this->messages['en'][] = 'Database type';
        $this->messages['en'][] = 'Root user';
        $this->messages['en'][] = 'Root password';
        $this->messages['en'][] = 'Create database/user';
        $this->messages['en'][] = 'Test connection';
        $this->messages['en'][] = 'Database name';
        $this->messages['en'][] = 'Insert permissions/programs';
        $this->messages['en'][] = 'Database and user created successfully';
        $this->messages['en'][] = 'Permissions and programs successfully inserted';
        $this->messages['en'][] = 'Update config';
        $this->messages['en'][] = 'Configuration file: ^1 updated successfully';
        $this->messages['en'][] = 'Connection successfully completed';
        $this->messages['en'][] = "The database ^1 doesn't exists";
        $this->messages['en'][] = 'Permissions/programs successfully inserted';
        $this->messages['en'][] = 'Programs/permissions have already been inserted';
        $this->messages['en'][] = 'Installing your application';
        $this->messages['en'][] = 'PHP version verification and installed extensions';
        $this->messages['en'][] = 'PHP verification';
        $this->messages['en'][] = 'Directory verification';
        $this->messages['en'][] = 'Database configuration/creation';
        $this->messages['en'][] = 'Admin user';
        $this->messages['en'][] = 'Admin password';
        $this->messages['en'][] = 'Insert data';
        $this->messages['en'][] = 'Of database:';
        $this->messages['en'][] = 'Connecton to database ^1 failed';
        $this->messages['en'][] = 'Install';
        $this->messages['en'][] = 'Databases successfully installed';
        $this->messages['en'][] = 'Databases have already been installed';
        $this->messages['en'][] = 'Main unit';
        $this->messages['en'][] = 'Time';
        $this->messages['en'][] = 'Type';
        $this->messages['en'][] = 'Failed to read error log (^1)';
        $this->messages['en'][] = 'Error log (^1) is not writable by web server user, so the messages may be incomplete';
        $this->messages['en'][] = 'Check the owner of the log file. He must be the same as the web user (usually www-data, www, etc)';
        $this->messages['en'][] = 'Error log is empty or has not been configured correctly. Define the error log file, setting <b>error_log</b> at php.ini';
        $this->messages['en'][] = 'Errors are not being logged. Please turn <b>log_errors = On</b> at php.ini';
        $this->messages['en'][] = 'Errors are not currently being displayd because the <b>display_errors</b> is set to Off in php.ini';
        $this->messages['en'][] = 'This configuration is usually recommended for production, not development purposes';
        $this->messages['en'][] = 'The php.ini current location is <b>^1</b>';
        $this->messages['en'][] = 'The error log current location is <b>^1</b>';
        $this->messages['en'][] = 'PHP Log';
        $this->messages['en'][] = 'Database explorer';
        $this->messages['en'][] = 'Tables';
        $this->messages['en'][] = 'Report generated. Please, enable popups';
        $this->messages['en'][] = 'File saved';
        $this->messages['en'][] = 'Edit page';
        $this->messages['en'][] = 'Update page';
        $this->messages['en'][] = 'Module';
        $this->messages['en'][] = 'Directory';
        $this->messages['en'][] = 'Source code';
        $this->messages['en'][] = 'Invalid return';
        $this->messages['en'][] = 'Page';
        $this->messages['en'][] = 'Connection failed';
        $this->messages['en'][] = 'Summary database install';
        $this->messages['en'][] = 'No write permission on file';
        $this->messages['en'][] = 'In order to continue with the installation you must grant read permission to the directory';
        $this->messages['en'][] = 'In order to continue with the installation you must grant write permission to the directory';
        $this->messages['en'][] = 'Installed';
        $this->messages['en'][] = 'Path';
        $this->messages['en'][] = 'File';
        $this->messages['en'][] = 'Write';
        $this->messages['en'][] = 'Read';
        $this->messages['en'][] = 'In order to continue with the installation you must grant read permission to the file';
        $this->messages['en'][] = 'In order to continue with the installation you must grant write permission to the file';
        $this->messages['en'][] = 'Photo';
        $this->messages['en'][] = 'Reset password';
        $this->messages['en'][] = 'A new seed is required in the application.ini for security reasons';
        $this->messages['en'][] = 'Password reset';
        $this->messages['en'][] = 'Token expired. This operation is not allowed';
        $this->messages['en'][] = 'The password has been changed';
        $this->messages['en'][] = 'An user with this e-mail is already registered';
        $this->messages['en'][] = 'Invalid LDAP credentials';
        $this->messages['en'][] = 'Update menu overwriting existing file?';
        $this->messages['en'][] = 'Menu updated successfully';
        $this->messages['en'][] = 'Menu path';
        $this->messages['en'][] = 'Add to menu';
        $this->messages['en'][] = 'Remove from menu';
        $this->messages['en'][] = 'Item removed from menu';
        $this->messages['en'][] = 'Item added to menu';
        $this->messages['en'][] = 'Icon';
        $this->messages['en'][] = 'User registration';
        $this->messages['en'][] = 'The user registration is disabled';
        $this->messages['en'][] = 'The password reset is disabled';
        $this->messages['en'][] = 'Account created';
        $this->messages['en'][] = 'Create account';
        $this->messages['en'][] = 'Files';
        $this->messages['en'][] = 'Statistics';
        $this->messages['en'][] = 'State';
        $this->messages['en'][] = 'Authorization error';
        $this->messages['en'][] = 'Exit';
        $this->messages['en'][] = 'REST key not defined';
        $this->messages['en'][] = 'Local';
        $this->messages['en'][] = 'Remote';
        $this->messages['en'][] = 'Success';
        $this->messages['en'][] = 'Error';
        $this->messages['en'][] = 'Status';
        $this->messages['en'][] = 'Update permissions?';
        $this->messages['en'][] = 'Changed';

        $this->messages['pt'][] = 'Arquivo n??o encontrado';
        $this->messages['pt'][] = 'Buscar';
        $this->messages['pt'][] = 'Cadastrar';
        $this->messages['pt'][] = 'Registro salvo';
        $this->messages['pt'][] = 'Deseja realmente excluir ?';
        $this->messages['pt'][] = 'Registro exclu??do';
        $this->messages['pt'][] = 'Fun????o';
        $this->messages['pt'][] = 'Tabela';
        $this->messages['pt'][] = 'Ferramenta';
        $this->messages['pt'][] = 'Dados';
        $this->messages['pt'][] = 'Abrir';
        $this->messages['pt'][] = 'Novo';
        $this->messages['pt'][] = 'Salvar';
        $this->messages['pt'][] = 'Buscar';
        $this->messages['pt'][] = 'Editar';
        $this->messages['pt'][] = 'Excluir';
        $this->messages['pt'][] = 'Cancelar';
        $this->messages['pt'][] = 'Sim';
        $this->messages['pt'][] = 'N??o';
        $this->messages['pt'][] = 'Janeiro';
        $this->messages['pt'][] = 'Fevereiro';
        $this->messages['pt'][] = 'Mar??o';
        $this->messages['pt'][] = 'Abril';
        $this->messages['pt'][] = 'Maio';
        $this->messages['pt'][] = 'Junho';
        $this->messages['pt'][] = 'Julho';
        $this->messages['pt'][] = 'Agosto';
        $this->messages['pt'][] = 'Setembro';
        $this->messages['pt'][] = 'Outubro';
        $this->messages['pt'][] = 'Novembro';
        $this->messages['pt'][] = 'Dezembro';
        $this->messages['pt'][] = 'Hoje';
        $this->messages['pt'][] = 'Fechar';
        $this->messages['pt'][] = 'O campo ^1 n??o pode ter menos de ^2 caracteres';
        $this->messages['pt'][] = 'O campo ^1 n??o pode ter mais de ^2 caracteres';
        $this->messages['pt'][] = 'O campo ^1 n??o pode ser menor que ^2';
        $this->messages['pt'][] = 'O campo ^1 n??o pode ser maior que ^2';
        $this->messages['pt'][] = 'O campo ^1 ?? obrigat??rio';
        $this->messages['pt'][] = 'O campo ^1 n??o cont??m um CNPJ v??lido';
        $this->messages['pt'][] = 'O campo ^1 n??o cont??m um CPF v??lido';
        $this->messages['pt'][] = 'O campo ^1 cont??m um e-mail inv??lido';
        $this->messages['pt'][] = 'Permiss??o negada';
        $this->messages['pt'][] = 'Gerar';
        $this->messages['pt'][] = 'Listar';
        $this->messages['pt'][] = 'Senha errada';
        $this->messages['pt'][] = 'Usu??rio n??o encontrado';
        $this->messages['pt'][] = 'Usu??rio';
        $this->messages['pt'][] = 'Usu??rios';
        $this->messages['pt'][] = 'Senha';
        $this->messages['pt'][] = 'Login';
        $this->messages['pt'][] = 'Nome';
        $this->messages['pt'][] = 'Grupo';
        $this->messages['pt'][] = 'Grupos';
        $this->messages['pt'][] = 'Programa';
        $this->messages['pt'][] = 'Programas';
        $this->messages['pt'][] = 'Voltar para a listagem';
        $this->messages['pt'][] = 'Classe de controle';
        $this->messages['pt'][] = 'Email';
        $this->messages['pt'][] = 'Registro atualizado';
        $this->messages['pt'][] = 'Confirma senha';
        $this->messages['pt'][] = 'Tela inicial';
        $this->messages['pt'][] = 'Nome da Tela';
        $this->messages['pt'][] = 'As senhas n??o conferem';
        $this->messages['pt'][] = 'Entrar';
        $this->messages['pt'][] = 'Data';
        $this->messages['pt'][] = 'Coluna';
        $this->messages['pt'][] = 'Opera????o';
        $this->messages['pt'][] = 'Valor antigo';
        $this->messages['pt'][] = 'Valor novo';
        $this->messages['pt'][] = 'Banco de dados';
        $this->messages['pt'][] = 'Perfil';
        $this->messages['pt'][] = 'Mudar senha';
        $this->messages['pt'][] = 'Deixe vazio para manter a senha anterior';
        $this->messages['pt'][] = 'Resultados';
        $this->messages['pt'][] = 'Comando inv??lido';
        $this->messages['pt'][] = '^1 registros exibidos';
        $this->messages['pt'][] = 'Administra????o';
        $this->messages['pt'][] = 'Painel SQL';
        $this->messages['pt'][] = 'Log de acesso';
        $this->messages['pt'][] = 'Log de altera????es';
        $this->messages['pt'][] = 'Log de SQL';
        $this->messages['pt'][] = 'Limpar formul??rio';
        $this->messages['pt'][] = 'Enviar';
        $this->messages['pt'][] = 'Mensagem';
        $this->messages['pt'][] = 'Mensagens';
        $this->messages['pt'][] = 'Assunto';
        $this->messages['pt'][] = 'Mensagem enviada com sucesso';
        $this->messages['pt'][] = 'Marcar como lida';
        $this->messages['pt'][] = 'Marcar como n??o lida';
        $this->messages['pt'][] = 'A????o';
        $this->messages['pt'][] = 'Ler';
        $this->messages['pt'][] = 'Origem';
        $this->messages['pt'][] = 'Verificado';
        $this->messages['pt'][] = 'Objeto ^1 n??o encontrado em ^2';
        $this->messages['pt'][] = 'Notifica????o';
        $this->messages['pt'][] = 'Notifica????es';
        $this->messages['pt'][] = 'Categorias';
        $this->messages['pt'][] = 'Enviar documentos';
        $this->messages['pt'][] = 'Meus documentos';
        $this->messages['pt'][] = 'Compartilhados comigo';
        $this->messages['pt'][] = 'Documento';
        $this->messages['pt'][] = 'Arquivo';
        $this->messages['pt'][] = 'T??tulo';
        $this->messages['pt'][] = 'Descri????o';
        $this->messages['pt'][] = 'Categoria';
        $this->messages['pt'][] = 'Data de submiss??o';
        $this->messages['pt'][] = 'Data de arquivamento';
        $this->messages['pt'][] = 'Upload';
        $this->messages['pt'][] = 'Download';
        $this->messages['pt'][] = 'Pr??ximo';
        $this->messages['pt'][] = 'Documentos';
        $this->messages['pt'][] = 'Permiss??o';
        $this->messages['pt'][] = 'Unidade';
        $this->messages['pt'][] = 'Unidades';
        $this->messages['pt'][] = 'Adiciona';
        $this->messages['pt'][] = 'Ativo';
        $this->messages['pt'][] = 'Ativar/desativar';
        $this->messages['pt'][] = 'Usu??rio inativo';
        $this->messages['pt'][] = 'Envia mensagem';
        $this->messages['pt'][] = 'Ler mensagens';
        $this->messages['pt'][] = 'Um usu??rio j?? est?? cadastrado com este login';
        $this->messages['pt'][] = 'Estat??sticas de acesso';
        $this->messages['pt'][] = 'Acessos';
        $this->messages['pt'][] = 'Prefer??ncias';
        $this->messages['pt'][] = 'E-mail de origem';
        $this->messages['pt'][] = 'Autentica SMTP';
        $this->messages['pt'][] = 'Host SMTP';
        $this->messages['pt'][] = 'Porta SMTP';
        $this->messages['pt'][] = 'Usu??rio SMTP';
        $this->messages['pt'][] = 'Senha SMTP';
        $this->messages['pt'][] = 'Ticket';
        $this->messages['pt'][] = 'Abrir ticket';
        $this->messages['pt'][] = 'Email de suporte';
        $this->messages['pt'][] = 'Dia';
        $this->messages['pt'][] = 'Pastas';
        $this->messages['pt'][] = 'Compor';
        $this->messages['pt'][] = 'Entrada';
        $this->messages['pt'][] = 'Enviados';
        $this->messages['pt'][] = 'Arquivados';
        $this->messages['pt'][] = 'Arquivar';
        $this->messages['pt'][] = 'Recuperar';
        $this->messages['pt'][] = 'Op????es';
        $this->messages['pt'][] = 'Novo chamado';
        $this->messages['pt'][] = 'C??digo';
        $this->messages['pt'][] = 'Fone';
        $this->messages['pt'][] = 'Endere??o';
        $this->messages['pt'][] = 'Cidade';
        $this->messages['pt'][] = 'Nascimento';
        $this->messages['pt'][] = 'Logout';
        $this->messages['pt'][] = 'Registro';
        $this->messages['pt'][] = 'Expira????o';
        $this->messages['pt'][] = 'Chamada';
        $this->messages['pt'][] = 'Autor';
        $this->messages['pt'][] = 'Autores';
        $this->messages['pt'][] = 'Edi????o';
        $this->messages['pt'][] = 'Volume';
        $this->messages['pt'][] = 'Cole????o';
        $this->messages['pt'][] = 'Classifica????o';
        $this->messages['pt'][] = 'Editora';
        $this->messages['pt'][] = 'Lugar';
        $this->messages['pt'][] = 'Resumo';
        $this->messages['pt'][] = 'Nota';
        $this->messages['pt'][] = 'Notas';
        $this->messages['pt'][] = 'Dados b??sicos';
        $this->messages['pt'][] = 'Dados secund??rios';
        $this->messages['pt'][] = 'Exemplares';
        $this->messages['pt'][] = 'Assuntos';
        $this->messages['pt'][] = 'Cod.Barras';
        $this->messages['pt'][] = 'Estado';
        $this->messages['pt'][] = 'Custo';
        $this->messages['pt'][] = 'Data aquisi????o';
        $this->messages['pt'][] = 'Registro adicionado';
        $this->messages['pt'][] = 'Sucesso';
        $this->messages['pt'][] = 'N??o dispon??vel';
        $this->messages['pt'][] = 'Livros';
        $this->messages['pt'][] = 'Livro';
        $this->messages['pt'][] = 'Usu??rios';
        $this->messages['pt'][] = 'Usu??rio';
        $this->messages['pt'][] = 'Empr??stimos';
        $this->messages['pt'][] = 'Empr??stimo';
        $this->messages['pt'][] = 'Aplicar';
        $this->messages['pt'][] = 'N??o emprestado';
        $this->messages['pt'][] = 'Filtros do relat??rio';
        $this->messages['pt'][] = 'Sa??da';
        $this->messages['pt'][] = 'Relat??rio gerado';
        $this->messages['pt'][] = 'N??o foram encontrados registros';
        $this->messages['pt'][] = 'Empr??stimo';
        $this->messages['pt'][] = 'Devolu????o';
        $this->messages['pt'][] = 'Cole????es';
        $this->messages['pt'][] = 'Classifica????es';
        $this->messages['pt'][] = 'Editoras';
        $this->messages['pt'][] = 'Cidades';
        $this->messages['pt'][] = 'Devolver';
        $this->messages['pt'][] = 'Emprestar';
        $this->messages['pt'][] = 'Circula????o';
        $this->messages['pt'][] = 'Relat??rios';
        $this->messages['pt'][] = 'Cataloga????o';
        $this->messages['pt'][] = 'Estado';
        $this->messages['pt'][] = 'Senha incorreta';
        $this->messages['pt'][] = 'Mnem??nico';
        $this->messages['pt'][] = 'N??o est?? ativo';
        $this->messages['pt'][] = 'Papel';
        $this->messages['pt'][] = 'Pap??is';
        $this->messages['pt'][] = 'Endere??o';
        $this->messages['pt'][] = 'Projeto';
        $this->messages['pt'][] = 'Projetos';
        $this->messages['pt'][] = 'Prioridade';
        $this->messages['pt'][] = 'Prioridades';
        $this->messages['pt'][] = 'Release';
        $this->messages['pt'][] = 'Releases';
        $this->messages['pt'][] = 'Hora';
        $this->messages['pt'][] = 'Atribu??do para';
        $this->messages['pt'][] = 'Data inicial';
        $this->messages['pt'][] = 'Data final';
        $this->messages['pt'][] = 'Solu????o';
        $this->messages['pt'][] = 'Estado final';
        $this->messages['pt'][] = 'Visualizar';
        $this->messages['pt'][] = 'Comentar';
        $this->messages['pt'][] = 'Senha atual';
        $this->messages['pt'][] = 'Nova senha';
        $this->messages['pt'][] = 'Confirme a nova senha';
        $this->messages['pt'][] = 'A senha atual n??o est?? correta';
        $this->messages['pt'][] = 'A nova senha n??o confere com a senha de confirma????o';
        $this->messages['pt'][] = 'Senha alterada com sucesso';
        $this->messages['pt'][] = 'Enviar e-mail';
        $this->messages['pt'][] = 'Chamado';
        $this->messages['pt'][] = 'Chamados';
        $this->messages['pt'][] = 'Conte??do';
        $this->messages['pt'][] = 'Bug';
        $this->messages['pt'][] = 'Nova funcionalidade';
        $this->messages['pt'][] = 'Melhoria';
        $this->messages['pt'][] = 'Tarefa';
        $this->messages['pt'][] = 'Suporte';
        $this->messages['pt'][] = 'Em progresso';
        $this->messages['pt'][] = 'Aguardando feedback';
        $this->messages['pt'][] = 'Resolvido';
        $this->messages['pt'][] = 'Testando';
        $this->messages['pt'][] = 'Entregue';
        $this->messages['pt'][] = 'Fechado';
        $this->messages['pt'][] = 'Rejeitado';
        $this->messages['pt'][] = 'Baixa';
        $this->messages['pt'][] = 'Normal';
        $this->messages['pt'][] = 'Alta';
        $this->messages['pt'][] = 'Urgente';
        $this->messages['pt'][] = 'Linguagem';
        $this->messages['pt'][] = 'Tente novamente';
        $this->messages['pt'][] = 'Contato';
        $this->messages['pt'][] = 'English';
        $this->messages['pt'][] = 'English version';
        $this->messages['pt'][] = 'Not??cias';
        $this->messages['pt'][] = 'Ferramentas';
        $this->messages['pt'][] = 'Servi??os';
        $this->messages['pt'][] = 'Chamados';
        $this->messages['pt'][] = 'Comunidade';
        $this->messages['pt'][] = 'Loja';
        $this->messages['pt'][] = 'N??o logado';
        $this->messages['pt'][] = 'Cor';
        $this->messages['pt'][] = 'Configura????o';
        $this->messages['pt'][] = 'Anexo';
        $this->messages['pt'][] = 'Recarregar';
        $this->messages['pt'][] = 'Voltar';
        $this->messages['pt'][] = 'Limpar';
        $this->messages['pt'][] = 'Visualizar';
        $this->messages['pt'][] = 'Nenhum registro foi encontrado';
        $this->messages['pt'][] = 'Desenho gerado com sucesso';
        $this->messages['pt'][] = 'QR codes gerados com sucesso';
        $this->messages['pt'][] = 'C??digos de barra gerados com sucesso';
        $this->messages['pt'][] = 'Documento gerado com sucesso';
        $this->messages['pt'][] = 'Valor';
        $this->messages['pt'][] = 'Usu??rio';
        $this->messages['pt'][] = 'Senha';
        $this->messages['pt'][] = 'Porta';
        $this->messages['pt'][] = 'Tipo da base de dados';
        $this->messages['pt'][] = 'Usu??rio admin';
        $this->messages['pt'][] = 'Senha do usu??rio admin';
        $this->messages['pt'][] = 'Criar base de dados/usu??rio';
        $this->messages['pt'][] = 'Testar conex??o';
        $this->messages['pt'][] = 'Nome da base de dados';
        $this->messages['pt'][] = 'Inserir permiss??es/programas';
        $this->messages['pt'][] = 'Base de dados e usu??rio criado com sucesso';
        $this->messages['pt'][] = 'Permiss??es e programas inseridos com sucesso';
        $this->messages['pt'][] = 'Atualizar config';
        $this->messages['pt'][] = 'Arquivo de configura????o: ^1 atualizado com sucesso';
        $this->messages['pt'][] = 'Conex??o realizada com sucesso';
        $this->messages['pt'][] = 'A base de dados ^1 n??o existe';
        $this->messages['pt'][] = 'Permiss??es/programas inseridos com sucesso';
        $this->messages['pt'][] = 'Os programas/permiss??es j?? foram inseridos';
        $this->messages['pt'][] = 'Instalando a sua aplica????o';
        $this->messages['pt'][] = 'Verifica????o da vers??o do PHP e extens??es instaladas';
        $this->messages['pt'][] = 'Verifica????o do PHP';
        $this->messages['pt'][] = 'Verifica????o de diret??rios';
        $this->messages['pt'][] = 'Configura????o/cria????o de base de dados';
        $this->messages['pt'][] = 'Usu??rio admin';
        $this->messages['pt'][] = 'Senha do usu??rio admin';
        $this->messages['pt'][] = 'Inserir dados';
        $this->messages['pt'][] = 'Da base de dados:';
        $this->messages['pt'][] = 'A conex??o com a base de dados ^1 falhou';
        $this->messages['pt'][] = 'Instalar';
        $this->messages['pt'][] = 'Bases de dados instaladas com sucesso';
        $this->messages['pt'][] = 'As bases de dados j?? foram instaladas';
        $this->messages['pt'][] = 'Unidade principal';
        $this->messages['pt'][] = 'Hora';
        $this->messages['pt'][] = 'Tipo';
        $this->messages['pt'][] = 'Falha ao ler o log de erros (^1)';
        $this->messages['pt'][] = 'O log de erros (^1) n??o permite escrita pelo usu??rio web, assim as mensagens devem estar incompletas';
        $this->messages['pt'][] = 'Revise o propriet??rio do arquivo de log. Ele deve ser igual ao usu??rio web (geralmente www-data, www, etc)';
        $this->messages['pt'][] = 'Log de erros est?? vazio ou n??o foi configurado corretamente. Defina o arquivo de log de erros, configurando <b>error_log</b> no php.ini';
        $this->messages['pt'][] = 'Erros n??o est??o sendo registrados. Por favor, mude <b>log_errors = On</b> no php.ini';
        $this->messages['pt'][] = 'Erros n??o est??o atualmente sendo exibidos por que <b>display_errors</b> est?? configurado para Off no php.ini';
        $this->messages['pt'][] = 'Esta configura????o normalmente ?? recomendada para produ????o, n??o para o prop??sito de desenvolvimento';
        $this->messages['pt'][] = 'A localiza????o atual do php.ini ?? <b>^1</b>';
        $this->messages['pt'][] = 'A localiza????o atual do log de erros ?? <b>^1</b>';
        $this->messages['pt'][] = 'Log do PHP';
        $this->messages['pt'][] = 'Database explorer';
        $this->messages['pt'][] = 'Tabelas';
        $this->messages['pt'][] = 'Relat??rio gerado. Favor, habilitar os popups';
        $this->messages['pt'][] = 'Arquivo salvo';
        $this->messages['pt'][] = 'Editar p??gina';
        $this->messages['pt'][] = 'Atualizar p??gina';
        $this->messages['pt'][] = 'M??dulo';
        $this->messages['pt'][] = 'Diret??rio';
        $this->messages['pt'][] = 'C??digo-fonte';
        $this->messages['pt'][] = 'Retorno inv??lido';
        $this->messages['pt'][] = 'P??gina';
        $this->messages['pt'][] = 'Falhas na conex??o';
        $this->messages['pt'][] = 'Resumo da instala????o da base de dados';
        $this->messages['pt'][] = 'Sem permiss??o de escrita no arquivo';
        $this->messages['pt'][] = 'Para que seja poss??vel continuar com a instala????o voc?? deve conceder permiss??o de leitura para o diret??rio';
        $this->messages['pt'][] = 'Para que seja poss??vel continuar com a instala????o voc?? deve conceder permiss??o de escrita para o diret??rio';
        $this->messages['pt'][] = 'Instalada';
        $this->messages['pt'][] = 'Diret??rio';
        $this->messages['pt'][] = 'Arquivo';
        $this->messages['pt'][] = 'Escrita';
        $this->messages['pt'][] = 'Leitura';
        $this->messages['pt'][] = 'Para que seja poss??vel continuar com a instala????o voc?? deve conceder permiss??o de leitura para o arquivo';
        $this->messages['pt'][] = 'Para que seja poss??vel continuar com a instala????o voc?? deve conceder permiss??o de escrita para o arquivo';
        $this->messages['pt'][] = 'Foto';
        $this->messages['pt'][] = 'Redefinir senha';
        $this->messages['pt'][] = 'Uma nova seed ?? necess??ria no application.ini por motivos de seguran??a';
        $this->messages['pt'][] = 'Troca de senha';
        $this->messages['pt'][] = 'Token expirado. Esta opera????o n??o ?? permitida';
        $this->messages['pt'][] = 'A senha foi alterada';
        $this->messages['pt'][] = 'Um usu??rio j?? est?? cadastrado com este e-mail';
        $this->messages['pt'][] = 'Credenciais LDAP erradas';
        $this->messages['pt'][] = 'Atualizar o menu sobregravando arquivo existente?';
        $this->messages['pt'][] = 'Menu atualizado com sucesso';
        $this->messages['pt'][] = 'Caminho menu';
        $this->messages['pt'][] = 'Adiciona ao menu';
        $this->messages['pt'][] = 'Remove do menu';
        $this->messages['pt'][] = 'Item removido do menu';
        $this->messages['pt'][] = 'Item adicionado ao menu';
        $this->messages['pt'][] = '??cone';
        $this->messages['pt'][] = 'Cadastro de usu??rio';
        $this->messages['pt'][] = 'O cadastro de usu??rios est?? desabilitado';
        $this->messages['pt'][] = 'A recupera????o de senhas est?? desabilitada';
        $this->messages['pt'][] = 'Conta criada';
        $this->messages['pt'][] = 'Criar conta';
        $this->messages['pt'][] = 'Arquivos';
        $this->messages['pt'][] = 'Estat??sticas';
        $this->messages['pt'][] = 'Estado';
        $this->messages['pt'][] = 'Erro de autoriza????o';
        $this->messages['pt'][] = 'Sair';
        $this->messages['pt'][] = 'Chave REST n??o definida';
        $this->messages['pt'][] = 'Local';
        $this->messages['pt'][] = 'Remoto';
        $this->messages['pt'][] = 'Sucesso';
        $this->messages['pt'][] = 'Erro';
        $this->messages['pt'][] = 'Status';
        $this->messages['pt'][] = 'Atualiza permiss??es?';
        $this->messages['pt'][] = 'Modificado';
        
        $this->messages['en'][] = 'Add item above';
        $this->messages['en'][] = 'Add item below';
        $this->messages['en'][] = 'Add child item';
        $this->messages['en'][] = 'Remove item';
        $this->messages['en'][] = 'Move item';
        $this->messages['en'][] = 'Menu editor';
        $this->messages['en'][] = 'Order';
        $this->messages['en'][] = 'Label';
        $this->messages['en'][] = 'Color';
        $this->messages['en'][] = 'Menu saved';
        $this->messages['en'][] = 'Clone';
        $this->messages['en'][] = 'Impersonation';
        $this->messages['en'][] = 'Impersonated';
        $this->messages['en'][] = 'Execution trace';
        $this->messages['en'][] = 'Session';
        $this->messages['en'][] = 'Request Log';
        $this->messages['en'][] = 'Method';
        $this->messages['en'][] = 'Request';
        $this->messages['en'][] = 'Users by group';
        $this->messages['en'][] = 'Count';
        $this->messages['en'][] = 'Users by unit';
        $this->messages['en'][] = 'Save as PDF';
        $this->messages['en'][] = 'Save as CSV';
        $this->messages['en'][] = 'Save as XML';
        $this->messages['en'][] = 'Export';
        $this->messages['en'][] = 'System information';
        $this->messages['en'][] = 'RAM Memory';
        $this->messages['en'][] = 'Using/Total';
        $this->messages['en'][] = 'Free';
        $this->messages['en'][] = 'Percentage used';
        $this->messages['en'][] = 'CPU usage';
        $this->messages['en'][] = 'Vendor';
        $this->messages['en'][] = 'Model';
        $this->messages['en'][] = 'Current Frequency';
        $this->messages['en'][] = 'Webserver and Process';
        $this->messages['en'][] = 'Disk devices';
        $this->messages['en'][] = 'Device';
        $this->messages['en'][] = 'Mount point';
        $this->messages['en'][] = 'Filesystem';
        $this->messages['en'][] = 'Network devices';
        $this->messages['en'][] = 'Device name';
        $this->messages['en'][] = 'Port speed';
        $this->messages['en'][] = 'Sent';
        $this->messages['en'][] = 'Recieved';
        $this->messages['en'][] = 'Print';
        $this->messages['en'][] = 'Delete session var';
        
        $this->messages['pt'][] = 'Adiciona item acima';
        $this->messages['pt'][] = 'Adiciona item abaixo';
        $this->messages['pt'][] = 'Adiciona item filho';
        $this->messages['pt'][] = 'Remover item';
        $this->messages['pt'][] = 'Mover item';
        $this->messages['pt'][] = 'Editor de menu';
        $this->messages['pt'][] = 'Ordena????o';
        $this->messages['pt'][] = 'R??tulo';
        $this->messages['pt'][] = 'Cor';
        $this->messages['pt'][] = 'Menu salvo';
        $this->messages['pt'][] = 'Clonar';
        $this->messages['pt'][] = 'Personificar';
        $this->messages['pt'][] = 'Personificado';
        $this->messages['pt'][] = 'Rastreamento da execu????o';
        $this->messages['pt'][] = 'Sess??o';
        $this->messages['pt'][] = 'Log de request';
        $this->messages['pt'][] = 'M??todo';
        $this->messages['pt'][] = 'Requisi????o';
        $this->messages['pt'][] = 'Usu??rios por grupo';
        $this->messages['pt'][] = 'Quantidade';
        $this->messages['pt'][] = 'Usu??rios por unidade';
        $this->messages['pt'][] = 'Salvar como PDF';
        $this->messages['pt'][] = 'Salvar como CSV';
        $this->messages['pt'][] = 'Salvar como XML';
        $this->messages['pt'][] = 'Exportar';
        $this->messages['pt'][] = 'Informac??o??es do sistema';
        $this->messages['pt'][] = 'Mem??ria RAM';
        $this->messages['pt'][] = 'Usando/Total';
        $this->messages['pt'][] = 'Dispon??vel';
        $this->messages['pt'][] = 'Percentual usado';
        $this->messages['pt'][] = 'Uso da CPU';
        $this->messages['pt'][] = 'Fornecedor';
        $this->messages['pt'][] = 'Modelo';
        $this->messages['pt'][] = 'Freque??ncia atual';
        $this->messages['pt'][] = 'Servidor web e processos';
        $this->messages['pt'][] = 'Dispositivos de disco';
        $this->messages['pt'][] = 'Dispositivo';
        $this->messages['pt'][] = 'Ponto de montagem';
        $this->messages['pt'][] = 'Sistema de arquivos';
        $this->messages['pt'][] = 'Dispositivos de rede';
        $this->messages['pt'][] = 'Nome do dispositivo';
        $this->messages['pt'][] = 'Velocidade da porta';
        $this->messages['pt'][] = 'Enviados';
        $this->messages['pt'][] = 'Recebidos';
        $this->messages['pt'][] = 'Imprimir';
        $this->messages['pt'][] = 'Exclui vari??vel de sess??o';
        
        $this->messages['es'][] = 'Agregar elemento arriba';
        $this->messages['es'][] = 'Agregar elemento abajo';
        $this->messages['es'][] = 'Adiciona item hijo';
        $this->messages['es'][] = 'Excluir item';
        $this->messages['es'][] = 'Mover elemento';
        $this->messages['es'][] = 'Editor de men??';
        $this->messages['es'][] = 'Ordenaci??n';
        $this->messages['es'][] = 'Etiqueta';
        $this->messages['es'][] = 'Color';
        $this->messages['es'][] = 'Men?? guardado';
        $this->messages['es'][] = 'Clonar';
        $this->messages['es'][] = 'Personificar';
        $this->messages['es'][] = 'Personificado';
        $this->messages['es'][] = 'Rastreo de ejecuci??n';
        $this->messages['es'][] = 'Sesi??n';
        $this->messages['es'][] = 'Log de request';
        $this->messages['es'][] = 'M??todo';
        $this->messages['es'][] = 'Request';
        $this->messages['es'][] = 'Usuarios por grupo';
        $this->messages['es'][] = 'Cantidad';
        $this->messages['es'][] = 'Usuarios por unidad';
        $this->messages['es'][] = 'Guardar como PDF';
        $this->messages['es'][] = 'Guardar como CSV';
        $this->messages['es'][] = 'Guardar como XML';
        $this->messages['es'][] = 'Exportar';
        $this->messages['es'][] = 'Informaciones del sistema';
        $this->messages['es'][] = 'Mem??ria RAM';
        $this->messages['es'][] = 'Utilizando/Total';
        $this->messages['es'][] = 'Disponible';
        $this->messages['es'][] = 'Porcentaje utilizado';
        $this->messages['es'][] = 'Uso de CPU';
        $this->messages['es'][] = 'Proveedor';
        $this->messages['es'][] = 'Modelo';
        $this->messages['es'][] = 'Frecuencia actual';
        $this->messages['es'][] = 'Servidor web y procesos';
        $this->messages['es'][] = 'Dispositivos de disco';
        $this->messages['es'][] = 'Dispositivo';
        $this->messages['es'][] = 'Punto de montaje';
        $this->messages['es'][] = 'Sistema de archivos';
        $this->messages['es'][] = 'Dispositivos de red';
        $this->messages['es'][] = 'Nombre del dispositivo';
        $this->messages['es'][] = 'Velocidad de la puerta';
        $this->messages['es'][] = 'Enviados';
        $this->messages['es'][] = 'Recebidos';
        $this->messages['es'][] = 'Imprimir';
        $this->messages['es'][] = 'Eliminar variable de sesi??n';
        
        //fim
        foreach ($this->messages as $lang => $messages)
        {
            $this->sourceMessages[$lang] = array_flip( $this->messages[ $lang ] );
        }
    }
    
    /**
     * Returns the singleton instance
     * @return  Instance of self
     */
    public static function getInstance()
    {
        // if there's no instance
        if (empty(self::$instance))
        {
            // creates a new object
            self::$instance = new self;
        }
        // returns the created instance
        return self::$instance;
    }
    
    /**
     * Define the target language
     * @param $lang     Target language index
     */
    public static function setLanguage($lang, $global = true)
    {
        $instance = self::getInstance();
        if (in_array($lang, array_keys($instance->messages)))
        {
            $instance->lang = $lang;
        }
        
        if ($global)
        {
            AdiantiCoreTranslator::setLanguage( $lang );
        }
    }
    
    /**
     * Returns the target language
     * @return Target language index
     */
    public static function getLanguage()
    {
        $instance = self::getInstance();
        return $instance->lang;
    }
    
    /**
     * Translate a word to the target language
     * @param $word     Word to be translated
     * @return          Translated word
     */
    public static function translate($word, $source_language, $param1 = NULL, $param2 = NULL, $param3 = NULL)
    {
        // get the self unique instance
        $instance = self::getInstance();
        // search by the numeric index of the word
        
        if (isset($instance->sourceMessages[$source_language][$word]) and !is_null($instance->sourceMessages[$source_language][$word]))
        {
            $key = $instance->sourceMessages[$source_language][$word]; //$key = array_search($word, $instance->messages['en']);
            
            // get the target language
            $language = self::getLanguage();
            // returns the translated word
            $message = $instance->messages[$language][$key];
            
            if (isset($param1))
            {
                $message = str_replace('^1', $param1, $message);
            }
            if (isset($param2))
            {
                $message = str_replace('^2', $param2, $message);
            }
            if (isset($param3))
            {
                $message = str_replace('^3', $param3, $message);
            }
            return $message;
        }
        else
        {
            return 'Message not found: '. $word;
        }
    }
    
    /**
     * Translate a template file
     */
    public static function translateTemplate($template)
    {
        // search by translated words
        if(preg_match_all( '!_t\{(.*?)\}!i', $template, $match ) > 0)
        {
            foreach($match[1] as $word)
            {
                $translated = _t($word);
                $template = str_replace('_t{'.$word.'}', $translated, $template);
            }
        }
        
        if(preg_match_all( '!_tf\{(.*?), (.*?)\}!i', $template, $matches ) > 0)
        {
            foreach($matches[0] as $key => $match)
            {
                $raw        = $matches[0][$key];
                $word       = $matches[1][$key];
                $from       = $matches[2][$key];
                $translated = _tf($word, $from);
                $template = str_replace($raw, $translated, $template);
            }
        }
        return $template;
    }
}

/**
 * Facade to translate words from english
 * @param $word  Word to be translated
 * @param $param1 optional ^1
 * @param $param2 optional ^2
 * @param $param3 optional ^3
 * @return Translated word
 */
function _t($msg, $param1 = null, $param2 = null, $param3 = null)
{
    return ApplicationTranslator::translate($msg, 'en', $param1, $param2, $param3);
}

/**
 * Facade to translate words from specified language
 * @param $word  Word to be translated
 * @param $source_language  Source language
 * @param $param1 optional ^1
 * @param $param2 optional ^2
 * @param $param3 optional ^3
 * @return Translated word
 */
function _tf($msg, $source_language = 'en', $param1 = null, $param2 = null, $param3 = null)
{
    return ApplicationTranslator::translate($msg, $source_language, $param1, $param2, $param3);
}
