import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

import '../../widgets/ui_helpers/app_assets.dart';
import '../../widgets/ui_helpers/app_colors.dart';
import '../login_screen.dart';

class SelectedRetireScreen extends StatelessWidget {
  const SelectedRetireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'türkmenistanyň \n Pensiýa gaznasy'.toUpperCase(),
          style: headlineStyle.copyWith(color: colorWhite),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const LoginScreen()));
            },
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(right: 17, left: 17),
                child: SvgPicture.asset(
                  Assets.user,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 414.w,
              height: 83.h,
decoration: BoxDecoration(
  color: colorWhite, 
  borderRadius: BorderRadius.only(  bottomLeft: BorderRadius.(10), bottomRight: )
),

              child: ,
            )
          ],
        ),
      ),
    );
  }
}
