import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/constants/sizes.dart';

class ConfirmationPage extends StatefulWidget {
  final Map<String, dynamic> transferData;

  const ConfirmationPage({super.key, required this.transferData});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  String pin = '';

  void addDigit(String digit) {
    if (pin.length < 4) {
      setState(() => pin += digit);
    }
  }

  void deleteDigit() {
    if (pin.isNotEmpty) {
      setState(() => pin = pin.substring(0, pin.length - 1));
    }
  }

  void onSubmit() {
    const mockPin = '4321';

    if (pin.length == 4) {
      if (pin == mockPin) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Money sent successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  context.push('/') ;
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Incorrect PIN
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect PIN. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          pin = ''; // Clear entered PIN
        });
      }
    } else {
      // PIN too short
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a 4-digit PIN.'),
        ),
      );
    }
  }


  Widget buildPinDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        bool filled = index < pin.length;
        return Container(
          margin: const EdgeInsets.all(8),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? Colors.black : Colors.grey[300],
          ),
        );
      }),
    );
  }

  Widget buildKeypadButton(String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => addDigit(label),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        child: label == '⌫'
            ? const Icon(Icons.backspace_outlined)
            : Text(
          label,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.transferData;
    final bank = data['bank'];
    final account = data['account'];
    final name = 'Hiwot Desta Alemayhu'; // Static for now
    final amount = data['amount'];
    final fee = '0.02';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          // Header
          CircleAvatar(
            radius: SSizes.lg*2.5,
            backgroundColor: Colors.grey[200],
            child: const Text('HA', style: TextStyle(color: Colors.blue),),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  bank.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text('BANK ACCOUNT NUMBER  $account'),
                Text('NAME  $name'),
                Text(
                  '$amount Birr     FEE: $fee Birr',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text('ENTER M-PESA PIN:'),
          const SizedBox(height: 12),
          buildPinDots(),
          const SizedBox(height: 16),

          // Keypad
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ...List.generate(9, (i) => buildKeypadButton('${i + 1}')),
              buildKeypadButton('0'),
              buildKeypadButton('⌫', onTap: deleteDigit),
            ],
          ),

          const SizedBox(height: 24),

          // Done Button
          ElevatedButton(
            onPressed: onSubmit,
            child: const Text('Done'),
          )
        ],
      ),
    );
  }
}
