import 'package:flutter/material.dart';
import '../../data/auth/responsesmodel/user_responses_model.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';

class UserCardWidget extends StatelessWidget {
  final Datum userModel;
  final Function(String) onCallback;
  const UserCardWidget({
    super.key,
    required this.userModel,
    required this.onCallback,
  });

  @override
  Widget build(BuildContext context) {
    //full name of the user
    String fullname = "${userModel.firstName} ${userModel.lastName}";
    return GestureDetector(
      onTap: () {
        onCallback(fullname);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(userModel.avatar),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: mediumFont(ColorName.blackColor, 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  userModel.email.toUpperCase(),
                  style: mediumFont(ColorName.greyColor, 10),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
