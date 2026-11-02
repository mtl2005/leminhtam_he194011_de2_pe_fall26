import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/currency_viewmodel.dart';

class CurrencyDialog extends ConsumerStatefulWidget {
  final String currentCurrency;

  const CurrencyDialog({
    super.key,
    required this.currentCurrency,
  });

  @override
  ConsumerState<CurrencyDialog> createState() =>
      _CurrencyDialogState();
}

class _CurrencyDialogState extends ConsumerState<CurrencyDialog> {
  late String selectedCurrency;

  @override
  void initState() {
    super.initState();
    selectedCurrency = widget.currentCurrency;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Đơn vị tiền tệ'),
      content: RadioGroup<String>(
        groupValue: selectedCurrency,
        onChanged: (value) {
          if (value == null) return;
          setState(() {
            selectedCurrency = value;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('VND (Việt Nam Đồng)'),
              value: 'VND',
            ),
            RadioListTile<String>(
              title: const Text('USD (Đô la Mỹ)'),
              value: 'USD',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Hủy'),
        ),
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(currencyViewModelProvider.notifier)
                .changeCurrency(selectedCurrency);

            if (!context.mounted) return;

            Navigator.pop(context);
          },
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}
