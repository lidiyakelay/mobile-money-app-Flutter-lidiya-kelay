import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobile_money_app_flutter/core/utils/constants/sizes.dart';
import 'package:mobile_money_app_flutter/presentation/widgets/primary_button.dart';
import 'package:mobile_money_app_flutter/presentation/widgets/secondary_button.dart';


class CustomDialogBox extends StatelessWidget {
  final String dialogTitle;
  final String? dialogDescription;
  final PrimaryButton? primaryButton;
  final SecondaryButton? secondaryButton;
  final String? svgIconPath;
  final Color? svgIconColor;
  final bool? showCloseIcon;

  const CustomDialogBox(
      {super.key,
        required this.dialogTitle,
        this.dialogDescription,
        this.primaryButton,
        this.secondaryButton,
        this.svgIconPath,
        this.svgIconColor,
        this.showCloseIcon = true});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    double logoWidth = min(size.width, size.height) * 0.20;
    double titlePadding = min(size.width, size.height) * 0.14;
    double descriptionPadding = min(size.width, size.height) * 0.06;

    return WillPopScope(
      onWillPop: () async {
        return false; // Prevent back button press to close the dialog
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SSizes.md),
        ),
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(SSizes.md),
        content: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(SSizes.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (svgIconPath != null) ...[
                SizedBox(
                  width: logoWidth,
                  height: logoWidth,
                  child: SvgPicture.asset(
                    svgIconPath!,
                    colorFilter: svgIconColor != null
                        ? ColorFilter.mode(svgIconColor!, BlendMode.srcIn)
                        : null,
                  ),
                ),
                SizedBox(height: SSizes.sm),
              ] else if (svgIconPath == null && showCloseIcon!)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color:  Colors.green[900],
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: titlePadding),
                child: Text(
                  dialogTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: SSizes.md),
              if (dialogDescription != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: descriptionPadding),
                  child: Text(
                    dialogDescription!,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: SSizes.md),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (secondaryButton != null) ...[
                    Expanded(child: secondaryButton!),
                    SizedBox(
                      width: SSizes.sm,
                    )
                  ],
                  if (primaryButton != null) ...[
                    Expanded(child: primaryButton!),
                  ],
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

