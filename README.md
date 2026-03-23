# 📄 Overleaf CLI Workflow (olcli)

Este projeto utiliza o olcli para sincronização entre projetos do Overleaf e ambiente local, permitindo edição com ferramentas como VS Code e versionamento com Git/GitHub sem precisar usar a versão paga do overleaf.

## 📦 Pré-requisitos
- Node.js instalado
- Conta no Overleaf
- olcli instalado globalmente:
  ```sh
  npm install -g @aloth/olcli
  ```

## 🔐 Autenticação
1. Faça login no Overleaf no navegador
2. Abra o DevTools (F12)
3. Vá em Application/Storage → Cookies → overleaf.com
4. Copie o valor do cookie: `overleaf_session2`
5. Autentique no terminal:
   ```sh
   olcli auth --cookie "SEU_COOKIE_AQUI"
   ```

## 📂 Listar projetos
```sh
olcli list
```

## 🔄 Sincronização completa 
```sh
olcli sync ./nome-do-projeto --project ID_DO_PROJETO
```
Isso faz:
- pull (baixar mudanças do Overleaf)
- push (enviar alterações locais)

OBS: Se quiser realizar pull ou push, basta seguir esas etapas separadamente:

## ⬇️ Baixar (pull) um projeto
```sh
olcli pull ID_DO_PROJETO ./nome-da-pasta --project ID_DO_PROJETO
```
Exemplo:
```sh
olcli pull 73e15212g73180rgf253ghs ./meu-projeto --project ID_DO_PROJETO
```

## ⬆️ Enviar alterações (push)
```sh
olcli push ./meu-projeto
```


## 🛠️ Compilar projeto
```sh
olcli compile ID_DO_PROJETO
```

## 📄 Baixar PDF
```sh
olcli pdf ID_DO_PROJETO
```

## 📥 Baixar arquivos de saída (ex: .bbl)
```sh
olcli output ID_DO_PROJETO
```

## Fluxo de trabalho recomendado
1. Sempre sincronizar antes de editar:
   ```sh
   olcli sync ./meu-projeto --project ID_DO_PROJETO
   ```
2. Editar localmente
3. Enviar alterações:
   ```sh
   olcli push ./meu-projeto --project ID_DO_PROJETO
   ```

## 🧾 Integração com Git

Inicializar repositório:
```sh
git init
git add .
git commit -m "Projeto inicial"
```

Atualizar:
```sh
git add .
git commit -m "alterações"
git push
```

## .gitignore
Crie um `.gitignore` com:
```
venv/
.venv/
__pycache__/

*.aux
*.log
*.out
*.toc
*.bbl
*.blg
*.synctex.gz
```

## ⚠️ Observações importantes
- O cookie expira → refaça `olcli auth` quando necessário
- Evite trabalhar em pastas com espaços ou caminhos do Windows montados
- Sempre use `sync` para evitar conflitos
- Não compartilhe seu cookie (equivale à sua sessão)

## Estrutura recomendada
```
meu-projeto/
├── main.tex
├── sections/
├── images/
├── bibliography.bib
└── .gitignore
```

## Conclusão
Esse fluxo permite:
- edição local eficiente
- sincronização com Overleaf
- versionamento com Git/GitHub

Sem necessidade de plano pago.

## Observações finais

- Quando você usa olcli push, as alterações feitas localmente são enviadas diretamente para o Overleaf, atualizando o projeto remoto sem necessidade de abrir o navegador ou editar pela interface web. Ou seja, você pode trabalhar totalmente localmente (ou até versionando no GitHub) e, ao executar o push, o Overleaf já refletirá essas mudanças automaticamente; o sync apenas automatiza esse processo combinando pull e push para manter tudo consistente.

Se você fizer alterações diretamente no Overleaf, elas não aparecem automaticamente no seu repositório local ou no GitHub. Para trazer essas mudanças, você precisa executar no diretório do projeto:

```
olcli sync ./meu-projeto --project ID_DO_PROJETO
```

Quando você faz pull, o olcli cria um arquivo oculto:

```
.olcli.json
```

Esse arquivo guarda o ID do projeto. Se ele não existe (ou você não está na pasta correta), o sync falha.


- Não tem problema puxar um projeto com nomes sem underlines, mas o arquivo vai vir apenas com o primeiro nome antes do espaço e também é recomendado evitar espaços e caracteres especiais para evitar problemas de compatibilidade entre sistemas operacionais.

## Referências

Reddit: https://www.reddit.com/r/LaTeX/comments/1rgsp0t/i_built_an_opensource_cli_for_overleaf_sync/