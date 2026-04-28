# Wfuzz-Pro 🛡️

O **Wfuzz-Pro** é um wrapper avançado em Bash projetado para automatizar testes de penetração web em larga escala. A ferramenta otimiza o fluxo de trabalho de auditores de segurança ao consolidar múltiplos módulos de fuzzing em uma única interface automatizada.

## 🚀 Funcionalidades Principais
* **Multi-Target Analysis**: Processamento eficiente de listas de hosts via arquivos `.txt`.
* **Modos de Ataque Integrados**: Perfis pré-configurados para detecção de **XSS, SQLi e LFI**.
* **Gestão de Wordlists**: Suporte total a dicionários personalizados via argumentos dinâmicos.
* **Logs Inteligentes**: Geração automática de relatórios estruturados com timestamp para auditoria posterior.
* **Interface Otimizada**: Saída colorida (ANSI) para facilitar o monitoramento em tempo real de vulnerabilidades críticas.

## 🛠️ Instalação e Uso

### Pré-requisitos
Certifique-se de possuir o ambiente configurado com as ferramentas padrão de mercado:
* `wfuzz` instalado e configurado no PATH.
* Repositório de wordlists (ex: SecLists) localizado em `/usr/share/wfuzz/`.

### Deployment
```bash
# Clonar o repositório oficial
git clone [https://github.com/XMatheusCoelhoX/Wfuzz-Pro.git](https://github.com/XMatheusCoelhoX/Wfuzz-Pro.git)

# Acessar o diretório do projeto
cd Wfuzz-Pro

# Atribuir permissões de execução
chmod +x wfuzz-pro.sh

# Iniciar a ferramenta
./wfuzz-pro.sh
