# RECON

Script interativo em Bash para automação de reconhecimento (recon) ofensivo. Integra diversas ferramentas amplamente utilizadas em atividades de Bug Bounty e Pentest em um único menu, simplificando a execução e consolidando os resultados.

## Funcionalidades

- **Enumeração de subdomínios:** integração com `subfinder`, `assetfinder` e `github-subdomains`.
- **Identificação de hosts ativos:** verificação de subdomínios com `httpx`.
- **Coleta de URLs históricas:** utilização do `waybackurls`.
- **Resolução DNS:** identificação de registros com `dnsx`.
- **Web crawling:** descoberta de endpoints e recursos com `katana`.
- **Interface interativa:** menu em terminal e consolidação das saídas.

## Pré-requisitos

- Linux ou ambiente compatível com Bash.
- Go instalado e configurado.
- Git instalado.
- Ferramentas listadas abaixo disponíveis no `PATH`.

## Instalação das ferramentas

Instale as dependências utilizando Go:

```bash
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/gwen001/github-subdomains@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/waybackurls@latest
```

Certifique-se de que o diretório de binários do Go esteja no `PATH`:

```bash
export PATH="$PATH:$(go env GOPATH)/bin"
```

## Execução

Clone o repositório:

```bash
git clone <URL_DO_REPOSITORIO>
cd RECON
```

Conceda permissão de execução ao script:

```bash
chmod +x recon.sh
```

Execute:

```bash
./recon.sh
```

## Observações

- Algumas ferramentas podem exigir configurações adicionais ou chaves de API.
- Utilize o script somente em domínios e ativos para os quais você tenha autorização para realizar atividades de reconhecimento.
