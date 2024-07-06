import 'package:admins/src/otroja/presentation/widgets/custumDropDown.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/text%20field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckStudentScreen extends StatelessWidget {
  const CheckStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 245, 239),
        appBar: OtrojaAppBar(
          mainText: "تفقد الطلاب ",
          secText:
              'حدد تاريخ اليوم والحلقة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
          optionalWidget: SizedBox(
            width: 35.w,
            height: 35.h,
            child: Image.asset('assets/icons/add.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PlatyTextField(
                  hintText: "حدد التاريخ",
                  labelText: 'اختر تاريخ',
                  containerColor: Color(0xffffff),
                  containerWidth: 350.w,
                  borderThickness: 2,
                  borderColor: Color(0xffE6E6E6),
                  imagePath: 'assets/icons/calendar.png',
                  textDirection: TextDirection.rtl),
              SizedBox(
                height: 10.h,
              ),
              CustomDropDown(),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 340.w,
                        height: 300.h,
                        padding: EdgeInsets.only(top: 70),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 236, 224),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 18.w,
                          ),
                          itemBuilder: (context, index) => Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, right: 5),
                                      child: Text(
                                        'يعقوب قمر الدين دبيازة',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, right: 48),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Color(0xff85313C),
                                                width: 2)),
                                        child: Icon(Icons.check , color: Colors.green,),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, right: 36),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Color(0xff85313C),
                                                width: 2)),
                                        child: Icon(Icons.check , color: Colors.green,),
                                      ),
                                    ),

                                  ],
                                ),
                                Divider(
                                  color: Color.fromARGB(223, 234, 226, 215),
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ],
                            ),
                          ),
                          itemCount: 5,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: 340.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Color.fromARGB(223, 239, 227, 211),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'الاسم',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 140.w,
                            ),
                            Text(
                              'حاضر',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            Text(
                              'غائب',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 6),

                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff85313C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(

                        'عرض المجموعة',
                        style: TextStyle(
                            color: Color(0xffEFEBE6),
                            fontStyle: FontStyle.normal,
                            fontSize:  15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),


                ],
              ),
            ],
          ),
        ));
  }
}
