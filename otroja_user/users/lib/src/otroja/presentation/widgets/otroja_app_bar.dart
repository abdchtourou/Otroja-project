import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? optionalWidget;
  final String? mainText;
  final String? secText;
  final List<Tab>? tabs; // List of tabs
  final TabController? tabController; // TabController

  OtrojaAppBar({
    super.key,
    this.optionalWidget,
    required this.mainText,
    this.secText,
    this.tabs,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 130.h,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF85313C),
                width: 5,
              ),
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                25,
                25,
              ),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/appBarBackground.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(100, 245, 243, 239),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                25,
                25,
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height:10.h ,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF85313C),
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          mainText!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        if(secText!=null)
                        Text(
                          secText!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              height: 1.47,
                              letterSpacing: 0.02,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 119, 119, 119)),
                        ),
                      ],
                    ),
                  ),
                ),
                ...optionalWidget != null
                    ? [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: optionalWidget!,
                        )
                      ]
                    : [
                        SizedBox(
                          width: 40.w,
                        ),
                      ],
              ],
            ),
            if (tabs != null && tabController != null) // Conditionally render TabBar
              TabBar(
                controller: tabController,
                tabs: tabs!,
                indicatorColor: Color(0xFF85313C),
                labelColor: Color(0xFF85313C),
                unselectedLabelColor: Colors.black,
                dividerColor: Colors.transparent,
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150); // Adjust height if needed
}