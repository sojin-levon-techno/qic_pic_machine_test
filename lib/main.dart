import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qic/core/colors/app_colors.dart';
import 'package:qic/features/home/presentation/data_bloc/bloc/data_bloc.dart';
import 'package:qic/features/home/presentation/pages/onboarding_pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: AppColors.kWhite,
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
