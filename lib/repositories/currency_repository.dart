import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'expense_repository.dart';

part 'currency_repository.g.dart';

@riverpod
class Currency extends _$Currency {
  @override
  Future<String> build() async {
    final service = ref.read(sharedPreferencesServiceProvider);

    return await service.getCurrency();
  }

  Future<void> changeCurrency(String currency) async {
    final service = ref.read(sharedPreferencesServiceProvider);

    await service.saveCurrency(currency);

    state = AsyncData(currency);
  }
}