import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaSearchBar extends StatelessWidget {
  const OtrojaSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      color:Color.fromARGB(255, 252, 248, 248),
      child: TextField(
        
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
             decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE0DBD3)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color:  Color(0xffE0DBD3)),
                // Changed color to red
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:  Color(0xffE0DBD3)),
                // Changed color to red when focused
              ),
               suffixIcon: Image.asset('assets/icons/search.png',scale: 20,),
              hintText: 'بحث',
              hintTextDirection: TextDirection.rtl,
              hintStyle: const TextStyle(color: Color(0xFF85313C)),
            ),
          ),
   
    );
  }
}
