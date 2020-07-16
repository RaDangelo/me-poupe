import '../model/transaction.model.dart';

class TransactionMock {
  List<Transaction> getTransactions() {
    return [
      Transaction(
        id: 't1',
        title: 'Tênis novos',
        amount: 72.99,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'Remédios p/ dor de Cabeça',
        amount: 25.52,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't3',
        title: 'Ração do cachorro',
        amount: 99.52,
        date: DateTime.now().subtract(Duration(days: 1)),
      ),
      Transaction(
        id: 't4',
        title: 'Netflix',
        amount: 25.30,
        date: DateTime.now().subtract(Duration(days: 2)),
      ),
      Transaction(
        id: 't5',
        title: 'Mensalidade Internet',
        amount: 99.00,
        date: DateTime.now().subtract(Duration(days: 3)),
      ),
      Transaction(
        id: 't6',
        title: 'Telefone - Nextel',
        amount: 50,
        date: DateTime.now().subtract(Duration(days: 3)),
      ),
      Transaction(
        id: 't7',
        title: 'Bilhete único',
        amount: 90.00,
        date: DateTime.now().subtract(Duration(days: 5)),
      ),
      Transaction(
        id: 't8',
        title: 'Almoço',
        amount: 25.30,
        date: DateTime.now().subtract(Duration(days: 6)),
      ),
      Transaction(
        id: 't6',
        title: 'Remédios p/ dor de Cabeça',
        amount: 125.52,
        date: DateTime.now().subtract(Duration(days: 6)),
      ),
      Transaction(
        id: 't6',
        title: 'Remédios p/ dor de Cabeça',
        amount: 25.52,
        date: DateTime.now().subtract(Duration(days: 5)),
      ),
      Transaction(
        id: 't6',
        title: 'Remédios p/ dor de Cabeça',
        amount: 225.52,
        date: DateTime.now().subtract(Duration(days: 3)),
      ),
      Transaction(
        id: 't6',
        title: 'Remédios p/ dor de Cabeça',
        amount: 25.52,
        date: DateTime.now().subtract(Duration(days: 3)),
      ),
    ];
  }
}
