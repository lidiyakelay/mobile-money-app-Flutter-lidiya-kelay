import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_money_app_flutter/presentation/pages/add_money.dart';
import 'package:mobile_money_app_flutter/presentation/pages/confirm_page.dart';
import 'package:mobile_money_app_flutter/presentation/pages/recieve_%20from_abroad.dart';
import 'package:mobile_money_app_flutter/presentation/pages/send_to_bank.dart';

import '../../presentation/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/add-money',
      name: 'addMoney',
      builder: (context, state) => const AddScreen(),
    ),
    GoRoute(
      path: '/receive',
      name: 'receive',
      builder: (context, state) => const ReceiveFromAbroadScreen(),
    ),
    GoRoute(
      path: '/send',
      name: 'send',
      builder: (context, state) => const BankTransferFormScreen(),
    ),
    GoRoute(
      path: '/confirm',
      name: 'confirm',
      builder: (context, state) {
        final transferData = state.extra as Map<String, dynamic>;
        return ConfirmationPage(transferData: transferData);
      },
    ),

  ],
);
