# Como editar e publicar o Estilo Zotero UFSCAR (ABNT)

Este repositório contém o arquivo de estilo CSL (`ufscar-abnt.csl`) customizado para a Universidade Federal de São Carlos, baseado na norma ABNT NBR 10520:2023.

## 1. Como Editar o Arquivo CSL

### Ferramentas recomendadas
Você pode editar o arquivo `.csl` (que nada mais é que um XML) de duas maneiras:
* **Modo Visual (Recomendado para iniciantes):** Use o [Editor Visual do Zotero/Mendeley (CSL Editor)](https://editor.citationstyles.org/visualEditor/). Nele você pode carregar seu arquivo `ufscar-abnt.csl`, ver as mudanças de formatação em tempo real e baixar o código XML ajustado depois.
* **Modo Código (Avançado):** Use qualquer editor de código (como VS Code ou Sublime Text) para abrir e editar diretamente o arquivo XML, da mesma forma como fizemos as inclusões das macros `publisher` (Editora) e o ajuste et. al. 

### Ajustes recentes realizados
A título de exemplo, o mais recente ajuste manual incorporado a este estilo foi a **exibição da Editora logo após o Título em Artigos de Periódicos**:
```xml
  <text macro="title" suffix=". "/>
  <!--Titulo do artigo-->
  <text variable="publisher" suffix=". "/>
  <!--Editora-->
```

## 2. Como Testar seu Estilo Localmente

Antes de enviar as edições para o repositório mundial, você deve garantir que seu estilo modificado funciona perfeitamente:

1. Salve o arquivo `ufscar-abnt.csl` editado aqui na pasta local.
2. Acesse a [Ferramenta de Validação CSL (CSL Validator)](https://validator.citationstyles.org/) e cole seu código para ter certeza de que você não quebrou nenhuma regra do XML. O validador deve retornar que o arquivo é "Good / Valid".
3. Abra o seu aplicativo do Zotero em seu computador.
4. Vá em **Preferências > Citação > Estilos**.
5. Clique no botão de **"+" (adicionar)** e localize o seu arquivo `ufscar-abnt.csl` atualizado. Adicione-o.
6. Crie uma citação no estilo acadêmico dentro do Word/Google Docs com ele para garantir visualmente que está tudo certo.

---

## 3. Como Submeter (Publicar) as alterações para o Zotero Mundial

Qualquer edição feita neste arquivo local precisa ser enviada através do Git para que o restante do mundo tenha acesso à atualização do "Estilo UFSCar" através do Zotero!

Já temos um *Fork* do repositório no seu GitHub com o branch `add-ufscar-abnt` criado, e um *Pull Request* já foi aberto. 

Para envios **futuros**:

1. Pelo terminal, certifique-se de estar nesta pasta clonada:
   ```bash
   cd /Volumes/Dados/work/zotero-modelo/styles
   ```

2. Registre as alterações e salve (Commit):
   ```bash
   git add ufscar-abnt.csl
   git commit -m "Explique de forma curta o que mudou. Ex: Correção da exibição do fascículo"
   ```

3. Envie (Push) para o seu repositório no GitHub:
   ```bash
   git push origin add-ufscar-abnt
   ```

4. Acesse a **página original da sua Pull Request no GitHub** da comunidade de Estilos CSL:
   * [https://github.com/citation-style-language/styles/pulls](https://github.com/citation-style-language/styles/pulls) (Encontre "Add ufscar-abnt.csl")
   
> **Nota:** Seus novos *commits* (como o explicado no passo 3) irão atualizar automaticamente a folha do Pull Request ativo! Não é necessário criar outro. Assim que os moderadores do *Citation Style Language* tiverem tempo, revisarão o seu PR e o aprovarão, enviando seu estilo direto para os aplicativos Zotero mundialmente num prazo de horas.
