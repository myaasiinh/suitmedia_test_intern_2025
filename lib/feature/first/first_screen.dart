import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/images.dart';
import '../../core/constants/string.dart';
import '../../core/global_widget/custom_button.dart';
import '../../core/global_widget/custom_textfield.dart';
import '../../core/global_widget/pop_up.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  String _checkPalindrome(String input) {
    final String processed = input.replaceAll(" ", "").toLowerCase();
    final bool isPal = processed == processed.split('').reversed.join('');
    return isPal ? AppStrings.palindromeTrue : AppStrings.palindromeFalse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgFirstScreen1),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo / Photo
            Padding(
              padding: const EdgeInsets.only(bottom: 51),
              child: Image.asset(AppImages.bgProfile),
            ),
            // TextField: Name
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomTextField(
                label: AppStrings.labelName,
                controller: _nameController,
                hintText: AppStrings.hintName,
              ),
            ),
            // TextField: Palindrome
            Padding(
              padding: const EdgeInsets.only(bottom: 53),
              child: CustomTextField(
                label: AppStrings.labelPalindrome,
                controller: _palindromeController,
                hintText: AppStrings.hintPalindrome,
              ),
            ),
            // Button: Check
            CustomButton(
              textButton: AppStrings.checkButton,
              onPressed: () {
                if (_palindromeController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        const PopUpWidget(text: AppStrings.errorPalindromeRequired),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => PopUpWidget(
                      text: _checkPalindrome(_palindromeController.text),
                    ),
                  );
                }
              },
            ),
            // Button: Next
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomButton(
                textButton: AppStrings.nextButton,
                onPressed: () {
                  if (_nameController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          const PopUpWidget(text: AppStrings.errorNameRequired),
                    );
                  } else {
                    // Navigasi menggunakan GoRouter dan mengirimkan argument berupa name
                    context.push('/second-screen', extra: _nameController.text);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
