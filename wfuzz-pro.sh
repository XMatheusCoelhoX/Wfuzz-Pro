#!/bin/bash

# Cores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

# Configurações padrão
WORDLIST_DEFAULT="/usr/share/wfuzz/wordlist/Injections/XSS.txt"
LOGFILE="fuzz_results_$(date +%Y%m%d_%H%M%S).log"
ENDPOINT="/search?q=FUZZ"

usage() {
    echo "Uso: $0 -f <hosts.txt> [-w <wordlist.txt>] [-t <tipo>]"
    echo "Tipos suportados: xss (padrão), sqli, lfi"
    exit 1
}

# Processando flags
while getopts "f:w:t:" opt; do
    case $opt in
        f) HOSTS_FILE="$OPTARG" ;;
        w) WORDLIST_CUSTOM="$OPTARG" ;;
        t) TYPE="$OPTARG" ;;
        *) usage ;;
    esac
done

# Validação básica
if [ -z "$HOSTS_FILE" ] || [ ! -f "$HOSTS_FILE" ]; then
    echo -e "${RED}[!] Erro: Arquivo de hosts não encontrado.${NC}"
    usage
fi

# Definindo Wordlist e Endpoint por tipo
WORDLIST=${WORDLIST_CUSTOM:-$WORDLIST_DEFAULT}

case $TYPE in
    sqli)
        WORDLIST=${WORDLIST_CUSTOM:-"/usr/share/wfuzz/wordlist/Injections/SQL.txt"}
        ENDPOINT="/products.php?id=FUZZ"
        ;;
    lfi)
        WORDLIST=${WORDLIST_CUSTOM:-"/usr/share/wfuzz/wordlist/Injections/Traversal.txt"}
        ENDPOINT="/view?file=FUZZ"
        ;;
esac

echo -e "${GREEN}[+] Iniciando Scan...${NC}"
echo -e "[+] Tipo: ${TYPE:-xss}"
echo -e "[+] Log: $LOGFILE\n"

# Início do Log
echo "--- Relatório de Fuzzing: $(date) ---" > "$LOGFILE"

while IFS= read -r host || [ -n "$host" ]; do
    host=$(echo "$host" | xargs)
    [ -z "$host" ] && continue

    echo -e "${GREEN}[*] Alvo: $host${NC}"
    echo -e "\nTarget: $host" >> "$LOGFILE"
    
    # Execução do Wfuzz salvando no log e mostrando no terminal
    wfuzz -u "${host}${ENDPOINT}" -w "$WORDLIST" | tee -a "$LOGFILE"
    
    echo -e "\n--------------------------------------\n" >> "$LOGFILE"
done < "$HOSTS_FILE"

echo -e "${GREEN}[+] Scan finalizado. Resultados salvos em: $LOGFILE${NC}"
