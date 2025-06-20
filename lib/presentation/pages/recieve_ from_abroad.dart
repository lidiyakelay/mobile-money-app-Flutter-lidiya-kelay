import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReceiveFromAbroadScreen extends StatelessWidget {
  const ReceiveFromAbroadScreen({super.key});

  final List<String> partners = const [
    "Boss Revolution",
    "ClickSend",
    "GME",
    "G-Money Trans",
    "BNB transfer",
    "Paysend",
    "Dahabshiil",
    "BFC Bahrain",
    "NEC Remit",
    "Bin Yaala Exchange",
    "AL Mulla Exchange",
    "Lulu Exchange Company WLL",
    "Unimoni",
    "NAFEX",
    "NNEC Remit",
    "Mama Money",
    "Capital Services",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text("Receive from Abroad"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Receive money from your loved ones across the world instantly via M-PESA",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,

              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: partners.length,
                itemBuilder: (context, index) => Text(
                  "• ${partners[index]}",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
