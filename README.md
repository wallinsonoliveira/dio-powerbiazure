
# Curso DIO - Wallinson O. Schutte

# 🚀 Desafio de Projeto
Processando e Transformando Dados com Power BI

### 👩‍💻 Processamento de Dados Simplificado com Power BI

    ✅1. Criação de uma instância na Azure para MySQL
    Instruções: seguir o vídeo aula

    ☑️2. Criar o Banco de dados com base disponível no github
    - Instruções: nesse caso, tive problemas com o script. Fiz algumas modificações e deixei os arquivos disponíveis nesse repositório.
    - Recomendo baixar o MySQL Workbench, pois assim fica muito mais fácil de inserir e editar novas tabelas e informações. Tive um problema para configurações do SSL, pois o certificado disponível no site da microsoft tem a extensão .crt e o MySQL Workbench exige extensão .pem. Fiz a conversão usando OpenSSL.
    - Download Workbench: https://dev.mysql.com/downloads/file/?id=525959
    - Download do Certificado exigido no MySQL Workbench: https://learn.microsoft.com/pt-br/azure/postgresql/flexible-server/concepts-networking-ssl-tls#downloading-root-ca-certificates-and-updating-application-clients-in-certificate-pinning-scenarios
    - Download OpenSSL para Windows: https://slproweb.com/products/Win32OpenSSL.html
    - Comando para conversão do certificado: openssl.exe x509 -in DigiCertGlobalRootCA.crt -out mycert.pem -outform PEM
    
    ✅3. Integração do Power BI com MySQL no Azure
    Instruções: seguir o vídeo da aula, mas caso seja a primeira vez que está usando essa conexão no Power BI, será necessário instalar o conector.
    - Download: https://dev.mysql.com/downloads/connector/net/

    ✅4. Verificar problemas na base a fim de realizar a transformação dos dados
    Instruções: seguir o vídeo da aula


### 📝Diretrizes para transformação dos dados

    ✔️0. Tabelas renomeadas: dependent -> dependentes; departament -> departamentos; dept_locations -> departamentos_locais; employee -> funcionários; project -> projetos e works_on -> plano_trabalho.
    ✔️1. Verifique os cabeçalhos e tipos de dados
    ✔️2. Modifique os valores monetários para o tipo double preciso (Tabela funcionários, coluna Salary)
    ✔️3. Verifique a existência dos nulos e analise a remoção (Decidi mantê-los)
    ✔️4. Os employees com nulos em Super_ssn podem ser os gerentes. Verifique se há algum colaborador sem gerente
    ✔️5. Verifique se há algum departamento sem gerente
    ✔️6. Se houver departamento sem gerente, suponha que você possui os dados e preencha as lacunas
    ✔️7. Verifique o número de horas dos projetos
    ✔️8. Separar colunas complexas (Coluna Address da tabela funcionários)
    ✔️9. Mesclar consultas employee e departament para criar uma tabela employee com o nome dos departamentos associados aos colaboradores. A mescla terá como base a tabela employee. Fique atento, essa informação influencia no tipo de junção
    ✔️10. Neste processo elimine as colunas desnecessárias.
    ✔️11. Realize a junção dos colaboradores e respectivos nomes dos gerentes . Isso pode ser feito com consulta SQL ou pela mescla de tabelas com Power BI. Caso utilize SQL, especifique no README a query utilizada no processo.
    ✔️12. Mescle as colunas de Nome e Sobrenome para ter apenas uma coluna definindo os nomes dos colaboradores
    ✔️13. Mescle os nomes de departamentos e localização. Isso fará que cada combinação departamento-local seja único. Isso irá auxiliar na criação do modelo estrela em um módulo futuro.
    ✔️14. Explique por que, neste caso supracitado, podemos apenas utilizar o mesclar e não o atribuir. (Nesse caso é melhor usar a opção de mesclagem, pois tratase da combinação de duas tableas diferentes, baseado em uma chave em comum [Dnumber])
    ✔️15. Agrupe os dados a fim de saber quantos colaboradores existem por gerente
    ✔️16. Elimine as colunas desnecessárias, que não serão usadas no relatório, de cada tabela
