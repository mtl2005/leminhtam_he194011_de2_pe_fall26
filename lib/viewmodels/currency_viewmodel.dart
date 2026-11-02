import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/currency_repository.dart';

part 'currency_viewmodel.g.dart';

@riverpod
class CurrencyViewModel extends _$CurrencyViewModel {
  @override
  Future<String> build() async {
    return await ref.watch(currencyProvider.future);
  }

  Future<void> changeCurrency(String currency) async {
    await ref.read(currencyProvider.notifier).changeCurrency(currency);

    state = AsyncData(currency);
  }
}