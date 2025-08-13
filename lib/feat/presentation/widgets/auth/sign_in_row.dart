import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';

class SignInRow extends StatelessWidget {
  const SignInRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppTexts.dontHaveAccount),
        GestureDetector(
          child: const Text(
            AppTexts.signIn,
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
