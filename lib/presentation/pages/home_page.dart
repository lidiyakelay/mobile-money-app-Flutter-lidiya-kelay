import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_money_app_flutter/core/utils/constants/sizes.dart';
import 'package:mobile_money_app_flutter/presentation/widgets/action_card.dart';
import 'package:mobile_money_app_flutter/presentation/widgets/base_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: SSizes.lg,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Text('AB'),
          ),
        ),

        content: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available Balance',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: Icon(
                              _isVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                      Text(
                        _isVisible ? 'ETB 1,500.00' : '******',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
,
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SSizes.lg*3, vertical: SSizes.md) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionCard(title: "Send", icon: Icons.send, onPressed: () { context.push('/send');}, ),
                      ActionCard(title: "Add Money", icon: Icons.add, onPressed: () {context.push('/add-money');  },),
                    ],
                  ),
                )
              ],

        ) );
  }
}
