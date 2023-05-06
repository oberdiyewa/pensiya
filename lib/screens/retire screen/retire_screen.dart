import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retirement_app/screens/login_screen.dart';
import 'package:retirement_app/widgets/ui_helpers/app_colors.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

import '../../widgets/ui_helpers/app_assets.dart';

class RetireScreen extends StatefulWidget {
  const RetireScreen({super.key});

  @override
  State<RetireScreen> createState() => _RetireScreenState();
}

class _RetireScreenState extends State<RetireScreen> {
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
          children: [InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=> SelectedRetire()));
              
            },
            child: sectionRetirement())],
        ),
      ),
    );
  }

  Container sectionRetirement() {
    return Container(
      height: 70.h,
      width: 374.w,
      padding: EdgeInsets.only(left: 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(40, 151, 236, 1),
              Color(0xFF00CCFF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Ýaşy boýunça pensiýa',
          style: headlineStyle.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
