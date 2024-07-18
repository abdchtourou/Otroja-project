import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String personalNumber;
  final String imagePath;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.personalNumber,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "الرقم الشخصي : $personalNumber",
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 19.0, top: 24),
          height: 74,
          width: 74,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
