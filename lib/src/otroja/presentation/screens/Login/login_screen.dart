import 'package:admins/src/otroja/presentation/screens/Login/widgets/login_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_buttom.dart';
import 'widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? userName;

  String? password;

  bool isLoading = false;

  static String id = 'LoginScreen';

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the entire content with SingleChildScrollView
        child: Column(
          children: [
          const  LoginAppBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Container( // Wrap ListView with a Container to give it a fixed height
                  height: MediaQuery.of(context).size.height - 200, // Adjust the height as needed
                  child: ListView(
                    children: [
                     const Text(
                        "اسم المستخدم",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      CustomTextFormField(
                          onChange: (data) {
                            userName = data;
                          },
                          hintText: "اسم المستخدم",
                          prefixIcon: Transform.scale(
                            scale: 0.6.sp,
                            child: const ImageIcon(
                              AssetImage('assets/icons/person.png'),
                              color: Color(0xFFE6E6E6),
                            ),
                          )),
                      SizedBox(height: 25.sp),
                      const Text(
                        "كلمة المرور",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      CustomTextFormField(
                        prefixIcon: Transform.scale(
                          scale: 0.6.sp,
                          child: const ImageIcon(
                            AssetImage('assets/icons/Lock.png'),
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                        suffixIcon: Transform.scale(
                          scale: 0.6.sp,
                          child: const ImageIcon(
                            AssetImage('assets/icons/eye.png'),
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                        obscureText: true,
                        onChange: (data) {
                          password = data;
                        },
                        hintText: "كلمة المرور",
                      ),
                      SizedBox(
                        height: 60.sp,
                      ),
                      CustomButtom(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {}
                        },
                        title: 'تسجيل الدخول',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
