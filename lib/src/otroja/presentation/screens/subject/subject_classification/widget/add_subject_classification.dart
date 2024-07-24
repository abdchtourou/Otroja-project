import 'package:flutter/material.dart';
class AddSubjectClassification extends StatelessWidget {
  const AddSubjectClassification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/islamic (1) 1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Rectangle 64.png'))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/plus (8) 1.png'),
                const Text(
                  'أضف تصنيفا ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}
