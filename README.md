# Projeto de Provisionamento de Sistema

Este projeto contém um script de shell que automatiza a criação e configuração de usuários, grupos e diretórios em um sistema Linux. O objetivo do script é realizar a criação de diretórios e grupos específicos para um sistema de gestão de usuários, além de configurar permissões adequadas para cada diretório e adicionar usuários aos grupos corretos. O script também limpa os diretórios, grupos e usuários antigos antes de realizar as configurações necessárias.

## Funcionalidades

- **Remoção de diretórios e usuários antigos**: O script remove diretórios e usuários que não são mais necessários.
- **Criação de grupos**: Grupos específicos são criados para gerenciar diferentes áreas do sistema (financeiro, TI, vendas, etc.).
- **Criação de usuários**: Usuários são criados e adicionados aos grupos apropriados com senha criptografada.
- **Configuração de permissões de diretórios**: Os diretórios criados têm as permissões definidas conforme a função de cada grupo.

## Estrutura do Script

1. **Remoção de itens antigos**: O script começa removendo diretórios antigos e usuários que não são mais necessários.
2. **Criação de grupos e usuários**: Em seguida, ele cria os grupos e usuários com suas respectivas permissões.
3. **Criação de diretórios**: Diretórios específicos para cada grupo são criados e configurados.
4. **Definição de permissões**: O script define as permissões de acesso aos diretórios de acordo com o grupo.

## Como usar

1. Clone este repositório no seu servidor.
2. Torne o script executável:
   ```bash
   chmod +x script.sh
   
sudo ./script.sh
