// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrencyViewModel)
final currencyViewModelProvider = CurrencyViewModelProvider._();

final class CurrencyViewModelProvider
    extends $AsyncNotifierProvider<CurrencyViewModel, String> {
  CurrencyViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyViewModelHash();

  @$internal
  @override
  CurrencyViewModel create() => CurrencyViewModel();
}

String _$currencyViewModelHash() => r'56b10fc4c161f4e4180318766755fdff1070ef74';

abstract class _$CurrencyViewModel extends $AsyncNotifier<String> {
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
