import 'package:flutter/material.dart';


class StudentCard extends StatelessWidget {
  final String name;

  const StudentCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;

    return Container(

      decoration: const BoxDecoration(
        color: Colors.red,
        border: Border(
          bottom: BorderSide(color: Colors.blueAccent),
        ),
      ),
      child: InkWell(
        onTap: () {
          // Handle tap event
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${name!} ",
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "الرقم الشخصي: {student.ID ?? ",
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: 44,
              height: 48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage("assets/images/images.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
