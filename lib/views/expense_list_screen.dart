import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../viewmodels/expense_viewmodel.dart';
import '../viewmodels/currency_viewmodel.dart';
import '../widgets/expense_item.dart';
import '../widgets/currency_dialog.dart';
import 'edit_expense_screen.dart';

class ExpenseListScreen extends ConsumerWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseState = ref.watch(expenseViewModelProvider);
    final currencyState = ref.watch(currencyViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quản lý chi tiêu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              currencyState.when(
                data: (currency) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CurrencyDialog(
                        currentCurrency: currency,
                      );
                    },
                  );
                },
                loading: () {},
                error: (error, stack) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.toString())),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: expenseState.when(
        data: (expenses) {
          if (expenses.isEmpty) {
            return const Center(
              child: Text('Chưa có khoản chi nào'),
            );
          }

          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];

              return ExpenseItem(
                expense: expense,
                currency: currencyState.value ?? 'VND',
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditExpenseScreen(
                          expense: expense,
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stack) {
          return Center(
            child: Text('Lỗi: $error'),
          );
        },
      ),
    );
  }
}