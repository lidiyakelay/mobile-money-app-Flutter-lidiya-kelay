import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_money_app_flutter/presentation/widgets/primary_button.dart';

class BankTransferFormScreen extends StatefulWidget {
  const BankTransferFormScreen({super.key});

  @override
  State<BankTransferFormScreen> createState() => _BankTransferFormScreenState();
}

class _BankTransferFormScreenState extends State<BankTransferFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? selectedBank;
  final List<String> banks = [
    'Dashen Bank',
    'Awash Bank',
    'Abay Bank',
    'CBE',
    'Zemen Bank'
  ];

  @override
  void dispose() {
    _accountNumberController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final bank = selectedBank;
      final account = _accountNumberController.text;
      final amount = _amountController.text;
      final description = _descriptionController.text;

      // Navigate to confirmation page with the details (mocked)
      context.pushNamed('confirm', extra: {
        'bank': selectedBank,
        'account': _accountNumberController.text,
        'amount': _amountController.text,
        'description': _descriptionController.text,
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send to Bank'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedBank,
                  hint: const Text('Select Bank'),
                  items: banks.map((bank) {
                    return DropdownMenuItem(
                      value: bank,
                      child: Text(bank),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => selectedBank = value);
                  },
                  validator: (value) =>
                  value == null ? 'Please select a bank' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _accountNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Bank Account Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Account number is required';
                    }
                    if (value.length < 6) {
                      return 'Account number is too short';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Amount (Birr)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Amount is required';
                    }
                    final amount = int.tryParse(value);
                    if (amount == null || amount < 25) {
                      return 'Minimum amount is 25 Birr';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 2,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                   child: PrimaryButton(
                       label:'Continue', onPressed: (){
                     _submitForm();
                   }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
