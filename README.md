# Painel de Licenciamento – Evolution WhatsApp

O **Painel de Licenciamento** é uma aplicação web projetada para gerenciar as licenças dos módulos Evolution WhatsApp. Ele permite ao administrador:

- Criar novas licenças automaticamente.
- Editar, renovar, resetar e excluir licenças existentes.
- Visualizar logs detalhados de auditoria das operações realizadas.
- Consultar informações do ambiente do sistema, como diretório de instalação, versão do PHP e servidor web.
- Gerenciar a validação de licença por meio de uma API remota, com suporte a cache para otimização.

O painel funciona de forma independente e pode ser hospedado em uma VPS separada do WHMCS.

---

## 🔍 Tabela de Conteúdos

- [Visão Geral](#visão-geral)
- [Recursos](#recursos)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Fluxo de Operação](#fluxo-de-operação)
- [Estrutura de Arquivos](#estrutura-de-arquivos)
- [Funcionalidades Principais](#funcionalidades-principais)
- [Logs e Auditoria](#logs-e-auditoria)
- [Informações do Ambiente](#informações-do-ambiente)
- [Desenvolvimento e Contribuição](#desenvolvimento-e-contribuição)
- [Licença](#licença)
- [Suporte](#suporte)

---

## 📄 Visão Geral

O **Painel de Licenciamento** centraliza o gerenciamento das licenças do **Evolution WhatsApp**, permitindo um controle seguro e organizado das chaves de acesso e auditoria das operações.

---

## 🔧 Recursos

- **Geração de Licenças**: Criar chaves únicas com opção de validade ilimitada.
- **Edição, Renovação e Reset**: Modificar domínio, IP, status e data de expiração.
- **Exclusão de Licenças**: Remover chaves que não estão em uso.
- **Logs de Auditoria**: Registro detalhado de todas as operações realizadas.
- **Informações do Ambiente**: Exibição de versão do PHP, servidor web e status da licença.
- **Validação de Licença com Cache**: Redução de consultas desnecessárias por meio de armazenamento temporário.

---

## ⚙️ Requisitos

- Servidor Web com **PHP 7.2** ou superior
- Banco de dados **MySQL**
- Extensões PHP: **cURL**, **JSON**
- Acesso à **API de Licenciamento** (exemplo: `https://license.meudominio.com.br/api/license_api.php`)

---

## 🛠️ Instalação

1. **Upload dos Arquivos**
   - Envie os arquivos do painel para o diretório desejado no servidor.

2. **Criação do Banco de Dados**
   - Crie um banco de dados no MySQL para armazenar as licenças e logs.

3. **Importação da Estrutura do Banco**
   - No **phpMyAdmin** ou via **linha de comando**, importe o arquivo `database.sql` fornecido.
   - Se estiver usando o terminal, execute:
     
     ```sh
     mysql -u SEU_USUARIO -p SEU_BANCO_DE_DADOS < database.sql
     ```

4. **Acesso Inicial**
   - O sistema vem com um usuário padrão para login:
     
     - **Usuário:** `admin`
     - **Senha:** `Admin@123`

   **⚠️ Importante:** Altere a senha assim que fizer login para garantir a segurança do sistema.

5. **Configuração do Banco no Sistema**
   - Edite o arquivo `includes/db.php` e atualize as credenciais do banco de dados:
     
     ```php
     define('DB_HOST', 'localhost');
     define('DB_NAME', 'SEU_BANCO_DE_DADOS');
     define('DB_USER', 'SEU_USUARIO');
     define('DB_PASS', 'SUA_SENHA');
     ```

6. **Finalização**
   - Acesse o painel no navegador e faça login com as credenciais padrão.
   - Configure as opções no painel de administração conforme suas necessidades.

---

## 💡 Configuração

- **Banco de Dados**: Configure `includes/db.php` com as credenciais corretas.
- **Configuração da Licença**: Ajuste `LICENSE_SERVER` e `EVOLUTION_WHATSAPP_LICENSE` no Módulo.
- **Outras Configurações**: Defina o caminho dos logs e cache conforme necessário.

---

## 📊 Fluxo de Operação

1. **Validação da Licença**:
   - A consulta à API de licenciamento é armazenada em cache por 10 minutos.

2. **Operações de Licenciamento**:
   - Geração, edição, renovação, reset e exclusão de licenças.

3. **Exibição de Informações do Ambiente**:
   - Diretório de instalação, versão do PHP, servidor web e status da licença.

---

## 🗂️ Estrutura de Arquivos

```
/
├── admin
│   ├── admin_config.php
│   ├── admin_dashboard.php
│   ├── admin_edit.php
│   ├── admin_footer.php
│   ├── admin_header.php
│   ├── admin_license_manage.php
│   ├── admin_licenses.php
│   ├── admin_login.php
│   ├── admin_logout.php
│   ├── admin_logs.php
│   ├── admin_manage.php
│   ├── admin_register.php
│   ├── admin_reset_password.php
│   ├── change_password.php
│   ├── forgot_password.php
│   ├── generate_hash.php
│   ├── generate_license.php
│   ├── reset_license.php
│   ├── test_password.php
│   └── view_reports.php
├── api
│   └── license_api.php
├── composer.json
├── composer.lock
├── debug_time.php
├── generate_hash_copy.php
├── includes
│   ├── db.php
│   └── functions.php
├── index.php
└── vendor
    ├── autoload.php
    ├── composer
    └── phpmailer
```

---

## 💡 Desenvolvimento e Contribuição

Contribuições são bem-vindas!
- **Fork** este repositório.
- **Crie uma branch** para suas alterações.
- **Envie um pull request** com melhorias.

---

## ✅ Licença

Este projeto é licenciado sob a **MIT License**.

---

## 🌐 Suporte

Para suporte comercial, entre em contato através do [seu email ou website de suporte].

