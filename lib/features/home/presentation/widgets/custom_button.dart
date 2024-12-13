import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qic/core/colors/app_colors.dart';
import 'package:qic/features/home/presentation/pages/home_page/home_page.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required Animation<Offset> slideAnimation,
  }) : _slideAnimation = slideAnimation;

  final Animation<Offset> _slideAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SlideTransition(
        position: _slideAnimation,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimary,
            maximumSize: const Size.fromHeight(50),
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: Text(
            "Get Started",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
