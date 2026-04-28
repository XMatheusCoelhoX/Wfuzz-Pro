# Wfuzz-Pro 🛡️

O **Wfuzz-Pro** é um wrapper em Bash desenvolvido para automatizar testes de penetração em larga escala. Ele permite realizar fuzzing de vulnerabilidades conhecidas (XSS, SQLi, LFI) em uma lista de múltiplos hosts, consolidando os resultados em logs detalhados.

## ✨ Funcionalidades
- **Multi-Target:** Processa listas de hosts via arquivo `.txt`.
- **Modos de Ataque:** Flags integradas para XSS, SQLi e LFI.
- **Customização:** Suporte para wordlists personalizadas via argumento.
- **Logs Inteligentes:** Gera relatórios automáticos com timestamp.
- **Interface Visual:** Saída colorida para facilitar o monitoramento em tempo real.

## 🚀 Instalação e Uso

### Pré-requisitos
Certifique-se de ter o `wfuzz` instalado e as wordlists padrão no diretório `/usr/share/wfuzz/`.

```bash
# Clone o repositório
git clone [https://github.com/matheusrcoelho/Wfuzz-Pro.git](https://github.com/matheusrcoelho/Wfuzz-Pro.git)

# Entre na pasta e dê permissão de execução
cd Wfuzz-Pro
chmod +x xfuzz-pro.sh
