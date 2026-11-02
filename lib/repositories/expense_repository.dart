import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/expense.dart';
import '../services/database_service.dart';
import '../services/shared_preferences_service.dart';

part 'expense_repository.g.dart';

class ExpenseRepository {
  final DatabaseService databaseService;

  ExpenseRepository(this.databaseService);

  Future<List<Expense>> getAllExpenses() async {
    final data = await databaseService.getAllExpenses();

    return data.map((e) => Expense.fromMap(e)).toList();
  }

  Future<void> updateExpense(Expense expense) async {
    await databaseService.updateExpense(
      expense.id!,
      expense.toMap(),
    );
  }
}

@riverpod
ExpenseRepository expenseRepository(Ref ref) {
  return ExpenseRepository(DatabaseService.instance);
}

@riverpod
SharedPreferencesService sharedPreferencesService(Ref ref) {
  return SharedPreferencesService();
}
