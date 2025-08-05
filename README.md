# RECONME

Script interativo em Bash para automação de reconhecimento (recon) ofensivo. Ele integra diversas ferramentas amplamente usadas no Bug Bounty e Pentest em um único menu simples, com saída consolidada.

## Funcionalidades

- Enumerar subdomínios com `subfinder`, `assetfinder` e `github-subdomains`
- Verificar quais subdomínios estão ativos com `httpx`
- Coletar URLs antigas com `waybackurls`
- Resolver DNS com `dnsx`
- Fazer crawling com `katana`
- Menu interativo e saída única 

## Ferramentas necessárias

Instale com Go:

```bash
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/003random/github-subdomains@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/waybackurls@latest
