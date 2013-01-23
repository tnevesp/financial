# language: pt
@javascript
Funcionalidade: Gerenciamento de contas
  Para efetuar o gerenciamento de contas
  Eu quero cadastrar, alterar e excluir gastos no sistema
   
  Cenário: Cadastro de Pessoas
    Dado que eu estou em expenses
    Quando eu clico "New Expense"
    Dado que tenho loja "Posto BR"
    Quando eu seleciono "Posto BR" para "expense[store_id]"
    Quando eu seleciono "Credit Card" para "expense[payment_type_id]"