import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String iconPath;
  final VoidCallback? onItemPressed;
  final VoidCallback? onIconPressed;

  const UserCard({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.iconPath,
    required this.onItemPressed,
     this.onIconPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 252, 248, 248),
        border: Border(
          bottom: BorderSide(color: Color(0x229C9B9B)),
        ),
      ),
      child: InkWell(
        onTap: onItemPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: IconButton(
                  onPressed: onIconPressed,
                  icon: Image.asset(iconPath, scale: 15),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$name ",
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath,
                  width: 60, // Specify the desired width
                  height: 60, // Specify the desired height
                  fit: BoxFit
                      .cover, // Ensure the image covers the area without stretching
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
