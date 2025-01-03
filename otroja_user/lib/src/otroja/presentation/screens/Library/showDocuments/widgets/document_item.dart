import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otroja_users/src/core/routing/routes.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../data/models/Document.dart';


class DocumentItem extends StatelessWidget {
  Document document;
  DocumentItem({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (document.type == 'pdf') {
            context.pushNamed(Routes.pdf,arguments: document.url);
          } else {
            _launchURL(document.url);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF85313C), width: 2.w),
              borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      document.type,
                      style: TextStyle(color: Color(0xFF85313C)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      "assets/icons/product-development(1).png",
                      scale: 20,
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFE6E6E6),
                ),
                Text(document.description,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
    );
  }

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri); 
  } else {
    throw 'Could not launch $url';
  }
}


}
