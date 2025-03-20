#!/bin/bash


check_success() {
  if [ $? -eq 0 ]; then
    echo "$1: Sucesso"
  else
    echo "$1: Falha" >&2
  fi
}

echo "Removendo diretórios, usuários e grupos antigos..."


rm -rf /publico /financeiro /ti /vendas
check_success "Remoção de diretórios"


for user in carlos maria joao debora sebastiana roberto josefina amanda rogerio; do
  userdel -r $user 2>/dev/null
  check_success "Remoção do usuário $user"
done


for group in GRP_FINANCEIRO GRP_TI GRP_VENDAS GRP_ADM GRP_VEN GRP_SEC; do
  groupdel $group 2>/dev/null
  check_success "Remoção do grupo $group"
done

echo "Criando grupos..."
groupadd GRP_FINANCEIRO
check_success "Grupo GRP_FINANCEIRO criado"
groupadd GRP_TI
check_success "Grupo GRP_TI criado"
groupadd GRP_VENDAS
check_success "Grupo GRP_VENDAS criado"
groupadd GRP_ADM
check_success "Grupo GRP_ADM criado"
groupadd GRP_VEN
check_success "Grupo GRP_VEN criado"
groupadd GRP_SEC
check_success "Grupo GRP_SEC criado"

echo "Criando usuários e adicionando aos grupos..."

useradd carlos -m -s /bin/bash -G GRP_ADM
echo "carlos:Senha123" | chpasswd
check_success "Usuário carlos criado"

useradd maria -m -s /bin/bash -G GRP_ADM
echo "maria:Senha123" | chpasswd
check_success "Usuário maria criado"

useradd joao -m -s /bin/bash -G GRP_ADM
echo "joao:Senha123" | chpasswd
check_success "Usuário joao criado"

useradd debora -m -s /bin/bash -G GRP_VEN
echo "debora:Senha123" | chpasswd
check_success "Usuário debora criado"

useradd sebastiana -m -s /bin/bash -G GRP_VEN
echo "sebastiana:Senha123" | chpasswd
check_success "Usuário sebastiana criado"

useradd roberto -m -s /bin/bash -G GRP_VEN
echo "roberto:Senha123" | chpasswd
check_success "Usuário roberto criado"

useradd josefina -m -s /bin/bash -G GRP_SEC
echo "josefina:Senha123" | chpasswd
check_success "Usuário josefina criado"

useradd amanda -m -s /bin/bash -G GRP_SEC
echo "amanda:Senha123" | chpasswd
check_success "Usuário amanda criado"

useradd rogerio -m -s /bin/bash -G GRP_SEC
echo "rogerio:Senha123" | chpasswd
check_success "Usuário rogerio criado"

echo "Criando diretórios..."

mkdir /publico /financeiro /ti /vendas
check_success "Diretórios criados"

echo "Definindo dono e permissões dos diretórios..."

chown root:root /publico
chmod 777 /publico
check_success "Permissões do diretório /publico configuradas"

chown root:GRP_FINANCEIRO /financeiro
chmod 770 /financeiro
check_success "Permissões do diretório /financeiro configuradas"

chown root:GRP_TI /ti
chmod 770 /ti
check_success "Permissões do diretório /ti configuradas"

chown root:GRP_VENDAS /vendas
chmod 770 /vendas
check_success "Permissões do diretório /vendas configuradas"

echo "Script concluído com sucesso!"


