# final_assigment_ex2_bernardo
Exercicio 2

Objetivo
Criar uma máquina virtual Linux em Microsoft Azure que funcione como servidor DHCP, utilizando Terraform e Ansible, sem configuração manual e sem passwords guardadas em scripts.

Descrição geral
O Terraform é utilizado para criar toda a infraestrutura em Azure, incluindo a máquina virtual Linux.
O Ansible é utilizado para configurar automaticamente o servidor DHCP nessa máquina.

As credenciais de acesso são protegidas com Ansible Vault.

Autenticação
Antes de executar o Terraform:


Criação da infraestrutura
A password da máquina virtual não está em nenhum ficheiro.

Exemplo:

$env:TF_VAR_admin_password="PASSWORD_DA_VM"
terraform init
terraform apply

No final, o Terraform apresenta o IP público da máquina virtual.

Ansible

Configuração
O Ansible liga-se à máquina virtual criada pelo Terraform e instala/configura o serviço DHCP.
A password de acesso SSH está guardada apenas no ficheiro vault.yml, que se encontra encriptado com Ansible Vault.

Execução do playbook:
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass

Teste do DHCP
Em redes Azure, o DHCP é gerido pela própria plataforma e não permite broadcasts personalizados.
Por esse motivo, o teste do DHCP é feito localmente na máquina virtual através de um namespace de rede Linux.

O playbook executa:

-criação de uma bridge
-criação de um namespace de rede
-pedido de endereço IP via DHCP usando dhclient

O resultado do playbook mostra:

-endereço IP atribuído ao namespace
-logs do servidor DHCP
-ficheiro de leases do DHCP
Isto comprova que o servidor DHCP está funcional.

Segurança

Não existem passwords em ficheiros Terraform ou Ansible
As credenciais estão protegidas dentro Ansible Vault encriptado

A password do Vault em nenhuma circunstancia real seria inserida aqui, porém para pode avaliar a password do vault é "P@sswOrd1234"

Conclusão

Este exercício demonstra a criação automática de infraestrutura em Azure com Terraform e a configuração de um servidor DHCP com Ansible, de forma segura e totalmente automatizada.
