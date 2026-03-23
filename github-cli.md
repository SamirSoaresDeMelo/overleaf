# Como subir seu projeto para o GitHub usando GitHub CLI

Este guia ensina a publicar seu projeto local no GitHub usando a ferramenta oficial GitHub CLI (`gh`).

## Pré-requisitos
- Projeto já inicializado com `git init`

## Passos

### 1. Baixe o GitHub CLI
Baixe e instale a GitHub CLI seguindo as instruções para seu sistema operacional: https://cli.github.com/

```sh
sudo apt update
```

```sh
sudo apt install gh
```

### 2. Faça login na GitHub CLI
```sh
gh auth login
```
Siga as instruções para autenticar sua conta.

### 3. Crie um repositório no GitHub
No diretório do seu projeto:
```sh
gh repo create NOME_DO_REPO --public --source=. --remote=origin --push
```
- Substitua `NOME_DO_REPO` pelo nome desejado para o repositório.
- Use `--private` se quiser um repositório privado.

### 4. Se já tiver commits locais, apenas crie o repositório e envie:
```sh
gh repo create NOME_DO_REPO --public --source=. --remote=origin
# Depois:
git push -u origin main
```

### 5. Subindo alterações futuras
Sempre que fizer alterações:
```sh
git add .
git commit -m "sua mensagem"
git push
```

## Dicas
- Use `gh repo view --web` para abrir o repositório no navegador.
- Consulte `gh --help` para mais comandos.

---

Pronto! Seu projeto está versionado e publicado no GitHub usando a GitHub CLI.
