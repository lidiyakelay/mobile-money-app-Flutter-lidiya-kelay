import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_money_app_flutter/presentation/widgets/primary_button.dart';

import '../../core/utils/constants/sizes.dart';



class CardWithCascadingLogos extends StatelessWidget {
  final String titleIcon;
  final String title;
  final String subtitle;
  final List<String> logoAssets;
  final String learnHowText;
  final VoidCallback onLearnHow;
  final Icon icon;

  const CardWithCascadingLogos({
    super.key,
    required this.titleIcon,
    required this.title,
    required this.subtitle,
    required this.logoAssets,
    required this.learnHowText,
    required this.onLearnHow, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final minSize = min(size.height, size.width);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(SSizes.md),
      ),
      child: Padding(
        padding:EdgeInsets.all(SSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: SSizes.lg,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: icon,
                  ),
                ),

                SizedBox(width: SSizes.md,),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color:Theme.of(context).colorScheme.primary,fontSize: 18 ),
                ),
              ],
            ),
            SizedBox(height: SSizes.sm),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: SSizes.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: minSize * 0.08,
                  width: minSize * 0.5,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      for (int i = 0; i < logoAssets.length.clamp(0, 5); i++)
                        Positioned(
                          left: i * 18, // adjust this for more or less overlap
                          child: SizedBox(
                            width: minSize * 0.06,
                            height: minSize * 0.06,
                            child: CircleAvatar(
                              radius: minSize * 0.06,
                              backgroundImage: AssetImage(logoAssets[i]),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      if (logoAssets.length > 5)
                        Positioned(
                          left: 5 * 18,
                          child: Container(
                            width: minSize * 0.06,
                            height: minSize * 0.06,
                            alignment: Alignment.center,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "+15",
                                // "+${logoAssets.length - 5}",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4 ,
                  child: PrimaryButton(
                    label: 'Learn More',
                    onPressed: onLearnHow

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}