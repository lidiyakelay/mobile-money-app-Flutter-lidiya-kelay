import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_money_app_flutter/core/utils/constants/sizes.dart';

import '../../core/utils/constants/assets.dart';
import '../widgets/CardWithCascadingLogos.dart';
import '../widgets/base_screen.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final abroadServices = [
      Assets.dahabshiil,
      Assets.terra,
      Assets.thunes,
      Assets.onafriq,
    ];
    final banks = [
      Assets.hibret,
      Assets.dashen,
      Assets.abyssiniya,
      Assets.awash,
      Assets.cbe,
      Assets.zemen,
    ];

    return Scaffold(
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: true,
       
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SSizes.md, vertical: SSizes.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),

              Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                    GestureDetector(
                         onTap: context.pop,
                        child: Icon(Icons.close))

                  ],),
              Align(
                alignment: Alignment.center,
                widthFactor: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: SSizes.lg*2,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.attach_money),
                      ),
                    ),
                    const Text('Add Money',  style: TextStyle(fontSize: 24, fontWeight:FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              CardWithCascadingLogos(
                titleIcon: Assets.pay,
                title:'transfer_from_bank',
                subtitle: 'transfer_from_bank_subtitle',
                logoAssets: banks,
                learnHowText: 'learn_how',
                onLearnHow: () => {},
                icon: Icon(Icons.payment, size: SSizes.lg,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              CardWithCascadingLogos(
                icon: Icon(Icons.payment,size: SSizes.lg,),
                titleIcon: Assets.receiveAbroad,
                title: 'Deposit at agent',
                subtitle: 'receive_from_abroad_subtitle',
                learnHowText: 'learn_how',
                onLearnHow: () => {}, logoAssets: [],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              CardWithCascadingLogos(
                icon: Icon(Icons.payment,size: SSizes.lg,),
                titleIcon: Assets.receiveAbroad,
                title: 'Ask a friend',
                subtitle: 'receive_from_abroad_subtitle',
                learnHowText: 'learn_how',
                onLearnHow: () => {}, logoAssets: [],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              CardWithCascadingLogos(
                icon: Icon(Icons.payment,size: SSizes.lg,),
                titleIcon: Assets.receiveAbroad,
                title: 'receive_from_abroad',
                subtitle: 'receive_from_abroad_subtitle',
                logoAssets: abroadServices,
                learnHowText: 'learn_how',
                onLearnHow: (){context.push('/receive');}

              ),
            ],
          ),
        ));
  }
}



