import 'package:flutter/material.dart';
import '../../core/utils/constants/sizes.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final double borderRadius;


  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: EdgeInsets.only(
        left: SSizes.md,
        right: SSizes.md,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.04 ,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:Theme.of(context).primaryColor ,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
              : Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
