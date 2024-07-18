import 'package:admins/src/otroja/presentation/screens/tasme3/widgets/page_count_editor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageCountWidget extends StatelessWidget {
 PageCountWidget({super.key});
  TextEditingController _textEditingController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'عدد الصفحات ',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 4),
          child: Row(
            children: [
              PageCountEditorWidget(icon: 'assets/icons/minus-sign.png', onTap: (){}),
             Expanded(
               child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      'assets/icons/label.png',
                    ))),
                    child: Center(
                      child: TextField(
                        controller: _textEditingController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                    )),
             ),
              PageCountEditorWidget(icon: 'assets/icons/plus(6).png', onTap: (){}) ,
            ],
          ),
        )
      ],
    );
  }
}
