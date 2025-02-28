import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/color.dart';
import '../../core/constants/fonts.dart';
import '../../core/constants/string.dart';
import '../../core/global_widget/appbar.dart';
import '../../core/global_widget/custom_button.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({
    super.key,
    required this.name,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late String userName;
  String selectedUserName = AppStrings.defaultSelectedUserName;

  @override
  void initState() {
    super.initState();
    userName = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(AppStrings.secondScreenTitle, context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeText,
              style: regulerFont(ColorName.blackColor, 12),
            ),
            const SizedBox(height: 4),
            Text(
              userName,
              style: semiBoldFont(ColorName.blackColor, 18),
            ),
            Expanded(
              child: Center(
                child: Text(
                  selectedUserName,
                  style: semiBoldFont(ColorName.blackColor, 24),
                ),
              ),
            ),
            CustomButton(
              textButton: AppStrings.chooseUserButton,
              onPressed: () async {
                // Navigasi ke ThirdScreen menggunakan GoRouter dan menunggu hasilnya
                final result = await context.push<String>('/third-screen');
                if (result != null && result.isNotEmpty) {
                  setState(() {
                    selectedUserName = result;
                  });
                }
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
