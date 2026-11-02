// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Currency)
final currencyProvider = CurrencyProvider._();

final class CurrencyProvider extends $AsyncNotifierProvider<Currency, String> {
  CurrencyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyHash();

  @$internal
  @override
  Currency create() => Currency();
}

String _$currencyHash() => r'a62a98a0ae404e1559b2e1de8232d80c8741f4f2';

abstract class _$Currency extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
