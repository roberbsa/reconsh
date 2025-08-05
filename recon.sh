#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

banner() {
echo -e "${GREEN}"   
echo "██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗"
echo "██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║"
echo "██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║"
echo "██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║"
echo "██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║"
echo "╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝"


echo "         recon script by trustm3"
echo -e "${NC}"

}

menu() {
    echo -e "\nEscolha uma opção:"
    echo "1) Subdomínios (subfinder + assetfinder + github-subdomains)"
    echo "2) Verificar ativos (httpx)"
    echo "3) Wayback URLs (waybackurls)"
    echo "4) Resolver DNS (dnsx)"
    echo "5) Crawler (katana)"
    echo "6) Executar tudo"
    echo "0) Sair"
    echo
}

read_target() {
    read -p "Digite o domínio alvo (ex: exemplo.com): " domain
    output="recon/$domain"
    final="$output/trustm3_recon.txt"
    mkdir -p "$output"
    : > "$final"  
}

subdomain_enum() {
    echo -e "${GREEN}[+] Coletando subdomínios...${NC}"
    
    subfinder -d $domain -silent >> "$output/subs.txt"
    assetfinder --subs-only $domain >> "$output/subs.txt"
    github-subdomains -d $domain >> "$output/subs.txt"

    sort -u "$output/subs.txt" > "$output/all_subs.txt"
    echo -e "\n[Subdomínios encontrados]" >> "$final"
    cat "$output/all_subs.txt" >> "$final"
    echo -e "${GREEN}[-] Subdomínios salvos.${NC}"
}

httpx_alive() {
    echo -e "${GREEN}[+] Verificando hosts ativos com httpx...${NC}"
    echo -e "\n[Hosts Ativos]" >> "$final"
    httpx -l "$output/all_subs.txt" -silent -status-code -title | tee "$output/alive.txt" >> "$final"
}

wayback() {
    echo -e "${GREEN}[+] Coletando URLs antigas com waybackurls...${NC}"
    echo -e "\n[Wayback URLs]" >> "$final"
    cat "$output/all_subs.txt" | waybackurls | tee "$output/wayback.txt" >> "$final"
}

dnsx_resolve() {
    echo -e "${GREEN}[+] Resolvendo DNS com dnsx...${NC}"
    echo -e "\n[Resolução DNS]" >> "$final"
    dnsx -l "$output/all_subs.txt" -silent -a -resp | tee "$output/dnsx.txt" >> "$final"
}

katana_crawl() {
    echo -e "${GREEN}[+] Crawler com Katana...${NC}"
    echo -e "\n[Crawler - Katana]" >> "$final"
    katana -list "$output/alive.txt" -silent | tee "$output/katana.txt" >> "$final"
}

run_all() {
    subdomain_enum
    httpx_alive
    wayback
    dnsx_resolve
    katana_crawl
    echo -e "${GREEN}\n[+] Recon completa. Veja o arquivo ${final}${NC}"
}


banner
read_target

while true; do
    menu
    read -p "Opção: " opt
    case $opt in
        1) subdomain_enum ;;
        2) httpx_alive ;;
        3) wayback ;;
        4) dnsx_resolve ;;
        5) katana_crawl ;;
        6) run_all ;;
        0) echo -e "${RED}Saindo...${NC}"; exit ;;
        *) echo -e "${RED}Opção inválida.${NC}" ;;
    esac
done
