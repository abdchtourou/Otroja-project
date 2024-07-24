import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "عرض الحلقات",
        secText: 'ابحث عن أي حلقة أو اضغط على الحلقة لعرض \n  تفاصيلها',
        optionalWidget: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Image.asset('assets/icons/add.png'),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: 340.w,
              height: 50.h,
              margin: EdgeInsets.only(left: 0, top: 10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(223, 245, 236, 224),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(223, 234, 226, 215),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'بحث',
                    style: TextStyle(
                        color: Color(0xff85313C),
                        fontStyle: FontStyle.normal,
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 17),
                    width: 25.w,
                    height: 30.h,
                    child: Image.asset('assets/icons/search (1).png'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 392.h,
              width: 340.w,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 18,
                ),
                itemBuilder: (context, index) => Container(
                  height: 220.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff85313C), width: 2)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 22, top: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تعديل',
                              style: TextStyle(
                                  color: Color(0xff85313C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            Container(
                              width: 145,
                              height: 30,
                              margin: EdgeInsets.only(right: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'أيار 5/2024 ',
                                    style: TextStyle(
                                        color: Color(0xff85313C),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 17),
                                    width: 25.w,
                                    height: 30.h,
                                    child: Image.asset(
                                        'assets/icons/calendar (2).png'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Color.fromARGB(223, 234, 226, 215),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 21, top: 4),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        height: 70.h,
                                        child: Image.asset(
                                            'assets/icons/emblem (2).png'),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 30, top: 20),
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffEEEAE4)),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20.w),
                                  child: Text(
                                    'المستوى ',
                                    style: TextStyle(
                                        color: Color(0xff85313C),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 17 ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text(
                                      'القران الكريم - الأولى',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(height: 10,),

                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          'عدد الطلاب الكلي ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp),
                                        ),
                                        Text(
                                          '28 ',
                                          style: TextStyle(
                                              color: Color(0xff85313C),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Color.fromARGB(223, 234, 226, 215),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 18,top: 2),
                              padding: EdgeInsets.only(bottom: 6),

                              width: 128,
                              height: 41,
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
