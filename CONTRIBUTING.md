# Contribuindo para Sui First Steps

**Por Lucas Buarque**

---

Obrigado por considerar contribuir para este projeto! 🎉

## 📋 Como Contribuir

### 1. Tipos de Contribuições

Aceitamos vários tipos de contribuições:

- 🐛 **Correções de bugs** - Encontrou um erro? Corrija-o!
- ✨ **Novas features** - Tem uma ideia legal? Implemente!
- 📖 **Documentação** - Melhore ou traduza docs
- 🧪 **Testes** - Adicione mais cobertura de testes
- 💡 **Exemplos** - Crie novos tutoriais
- 🎨 **UI/UX** - Melhore a apresentação

### 2. Processo de Contribuição

#### Passo 1: Fork e Clone

```bash
# Fork este repositório no GitHub

# Clone seu fork
git clone https://github.com/SEU_USUARIO/calculadora-indiqai.git
cd calculadora-indiqai/sui-first-steps

# Adicione o repositório original como upstream
git remote add upstream https://github.com/lucasbuarque/calculadora-indiqai.git
```

#### Passo 2: Crie uma Branch

```bash
# Atualize seu main
git checkout main
git pull upstream main

# Crie uma branch para sua feature
git checkout -b feature/minha-feature
```

**Convenção de nomes de branches:**
- `feature/nome-da-feature` - Para novas funcionalidades
- `fix/nome-do-bug` - Para correções
- `docs/topico` - Para documentação
- `test/nome-do-teste` - Para testes

#### Passo 3: Faça Suas Mudanças

```bash
# Faça as alterações
# ...

# Teste sempre!
cd backend/seu-projeto
sui move build
sui move test

# Commit com mensagem clara
git add .
git commit -m "feat: adiciona nova funcionalidade X"
```

**Convenção de commits:**
- `feat:` - Nova funcionalidade
- `fix:` - Correção de bug
- `docs:` - Mudanças na documentação
- `test:` - Adiciona ou modifica testes
- `refactor:` - Refatoração de código
- `style:` - Mudanças de formatação
- `chore:` - Tarefas de manutenção

#### Passo 4: Push e Pull Request

```bash
# Push para seu fork
git push origin feature/minha-feature
```

Depois, abra um Pull Request no GitHub com:
- Título claro e descritivo
- Descrição detalhada das mudanças
- Referência a issues relacionadas (se houver)
- Screenshots (se aplicável)

### 3. Diretrizes de Código

#### Para Código Move

```move
// ✅ BOM: Comentários claros em português ou inglês
/// Adiciona pontos ao cartão de fidelidade
public fun add_points(card: &mut LoyaltyCard, amount: u64) {
    assert!(amount > 0, EZeroAmount);
    card.points = card.points + amount;
}

// ❌ RUIM: Sem comentários, nomes confusos
public fun ap(c: &mut LC, a: u64) {
    c.p = c.p + a;
}
```

**Padrões:**
- Use nomes descritivos para variáveis e funções
- Adicione comentários para lógica complexa
- Siga o estilo do código existente
- Sempre adicione testes para novas funções

#### Para Documentação

```markdown
<!-- ✅ BOM: Estruturado, exemplos claros -->
## Como Usar

1. Navegue até a pasta:
   ```bash
   cd backend/projeto
   ```

2. Execute o build:
   ```bash
   sui move build
   ```

<!-- ❌ RUIM: Vago, sem exemplos -->
## Uso
Execute os comandos necessários.
```

**Padrões:**
- Use markdown apropriadamente
- Inclua exemplos de código
- Adicione comandos executáveis
- Mantenha a formatação consistente

### 4. Diretrizes de Testes

Todo código novo deve incluir testes:

```move
#[test]
fun test_minha_funcao() {
    // Setup
    let mut card = create_test_card();
    
    // Ação
    add_points(&mut card, 50);
    
    // Verificação
    assert!(get_points(&card) == 50, 0);
}
```

**Checklist de testes:**
- ✅ Teste o caminho feliz (sucesso)
- ✅ Teste casos de erro
- ✅ Teste casos extremos (valores mínimos/máximos)
- ✅ Use `#[expected_failure]` para erros esperados

### 5. Checklist Antes de Submeter

Antes de abrir seu PR, verifique:

- [ ] O código compila sem erros
- [ ] Todos os testes passam (`sui move test`)
- [ ] Adicionei testes para código novo
- [ ] Atualizei a documentação (se necessário)
- [ ] Segui as convenções de código
- [ ] Não inclui chaves privadas ou dados sensíveis
- [ ] Commit messages seguem o padrão
- [ ] Branch está atualizada com main

### 6. O Que NÃO Fazer

❌ **Não:**
- Inclua código proprietário do IndiqAI
- Exponha chaves privadas ou segredos
- Faça commits de arquivos de build (`build/`, `target/`)
- Mude múltiplas coisas não relacionadas em um PR
- Ignore falhas de testes
- Copie código sem dar crédito

## 🐛 Reportando Bugs

Encontrou um bug? Abra uma issue com:

### Template de Issue - Bug

```markdown
**Descrição**
Descrição clara do problema

**Como Reproduzir**
1. Vá para '...'
2. Execute '...'
3. Veja o erro

**Comportamento Esperado**
O que deveria acontecer

**Comportamento Atual**
O que acontece

**Ambiente**
- OS: [e.g. macOS 14.0]
- Sui CLI: [e.g. 1.15.0]
- Move edition: [e.g. 2024.beta]

**Logs**
```
Cole logs relevantes aqui
```

**Screenshots**
Se aplicável, adicione screenshots
```

## 💡 Sugerindo Features

Tem uma ideia? Abra uma issue de feature:

### Template de Issue - Feature

```markdown
**Feature Proposta**
Descrição clara da feature

**Motivação**
Por que esta feature é útil?

**Solução Proposta**
Como você imagina que funcione?

**Alternativas Consideradas**
Outras formas de resolver o problema

**Impacto**
Quem se beneficiaria? Qual o impacto?
```

## 📖 Melhorando Documentação

Documentação é super importante! Você pode:

- Corrigir erros de digitação
- Melhorar explicações
- Adicionar exemplos
- Traduzir para outros idiomas
- Criar tutoriais

## 🎯 Áreas Que Precisam de Ajuda

Procurando por onde começar? Estas áreas precisam de contribuições:

### IndiqPass
- [ ] Testes de integração
- [ ] Exemplo de integração com frontend
- [ ] Exemplo de integração com backend
- [ ] Mais exemplos de casos de uso
- [ ] Otimizações de gas

### Tutoriais
- [ ] Mais exemplos práticos
- [ ] Exercícios com soluções
- [ ] Vídeos explicativos
- [ ] Tradução para inglês

### Geral
- [ ] CI/CD pipeline
- [ ] Mais testes automatizados
- [ ] Melhoria de performance
- [ ] Acessibilidade da documentação

## 🏆 Reconhecimento

Todos os contribuidores serão:
- Listados no README principal
- Mencionados nos release notes
- Parte da história do projeto!

## 📞 Dúvidas?

- 💬 Abra uma issue com a tag `question`
- 📧 Entre em contato com Lucas Buarque
- 💡 Pergunte na comunidade Sui

## 📄 Código de Conduta

### Nossos Padrões

**Comportamentos aceitáveis:**
- ✅ Ser respeitoso com diferentes opiniões
- ✅ Aceitar críticas construtivas
- ✅ Focar no que é melhor para a comunidade
- ✅ Mostrar empatia

**Comportamentos inaceitáveis:**
- ❌ Linguagem ou imagens sexualizadas
- ❌ Trolling, insultos ou comentários depreciativos
- ❌ Assédio público ou privado
- ❌ Publicar informações privadas de outros

### Aplicação

Violações podem resultar em:
1. Aviso
2. Banimento temporário
3. Banimento permanente

Reporte violações para: [seu email]

## 🙏 Obrigado!

Sua contribuição faz a diferença! Juntos estamos:
- 🌍 Educando a comunidade sobre Sui
- 🚀 Criando ferramentas úteis
- 💡 Inspirando novos projetos
- ❤️ Construindo o futuro da Web3

---

**Happy coding! 🎉**

*Contribuindo para um futuro descentralizado, uma linha de código por vez.*

---

**Criado com ❤️ por Lucas Buarque**
