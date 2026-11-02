import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/expense.dart';
import '../repositories/expense_repository.dart';

part 'expense_viewmodel.g.dart';

@riverpod
class ExpenseViewModel extends _$ExpenseViewModel {
  @override
  Future<List<Expense>> build() async {
    final repository = ref.read(expenseRepositoryProvider);

    return await repository.getAllExpenses();
  }

  Future<void> updateExpense(Expense expense) async {
    final repository = ref.read(expenseRepositoryProvider);

    await repository.updateExpense(expense);

    ref.invalidateSelf();

    await future;
  }
}
