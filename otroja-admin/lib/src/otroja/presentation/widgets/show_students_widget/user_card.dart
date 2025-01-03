  import 'package:flutter/material.dart';
class StudentCard extends StatelessWidget {
  final String name;
  final int id;

  const StudentCard({Key? key, required this.name,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        border: Border(
          bottom: BorderSide(color: Colors.blueAccent),
        ),
      ),
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
                  "${id}: الرقم الشخصي   ",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
                image: AssetImage("assets/images/people (1) 1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
