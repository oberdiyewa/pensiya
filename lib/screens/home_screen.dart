import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retirement_app/screens/login_screen.dart';
import 'package:retirement_app/screens/online_apply.dart';
import 'package:retirement_app/screens/onlinepay_screen.dart';
import 'package:retirement_app/screens/profile_screen/profile_screen.dart';
import 'package:retirement_app/screens/retire%20screen/retire_screen.dart';
import 'package:retirement_app/widgets/ui_helpers/app_colors.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

import '../widgets/ui_helpers/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: colorPrimary),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.asset(Assets.flag)),
                      Text(
                        'türkmenistanyň \npensiýa gaznasy'.toUpperCase(),
                        style: headlineStyle.copyWith(color: colorWhite),
                      )
                    ],
                  ),
                )),
            Material(
              elevation: 2,
              shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
              child: Container(
                height: 80,
                color: Colors.white,
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dil saýlaň:',
                      style: bodyStyle.copyWith(
                          color: Color.fromRGBO(91, 91, 91, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.ru),
                        SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(Assets.tm)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Material(
              elevation: 4,
              shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
              child: Container(
                height: 300,
                color: colorWhite,
                child: Column(
                  children: [
                    menuItems("Baş sahypa"),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RetireScreen()));
                        },
                        child: menuItems("Pensiýalar")),
                    menuItems("Döwlet kömek pullary"),
                    menuItems("Hukuk namalary"),
                    menuItems("Habarlaşmak"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => OnlineApply()));
                      },
                      child: homeSectionUI(
                        'Onlaýn\n ýüz tutmak',
                        Assets.mail,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => OnlinePay()));
                        },
                        child: homeSectionUI(
                            'Tölegleri\nonlaýn tölemek', Assets.security))
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeSectionUI(
                      'Onlaýn\n hasaplaýjy',
                      Assets.calculator,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ProfileScreen()));
                        },
                        child: homeSectionUI('Şahsy\n otag', Assets.person))
                  ],
                ),
              ],
            ),
            Image.asset(Assets.decor)
          ],
        ),
      ),
    );
  }

  Container homeSectionUI(String title, String icon) {
    return Container(
      width: 176.w,
      height: 218.h,
      padding: REdgeInsets.only(
        top: 40,
      ),
      decoration: BoxDecoration(
          color: colorPrimary, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                icon,
                color: colorWhite,
                width: 60.w,
                height: 48.h,
              ),
              SizedBox(
                height: 10,
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: heading2Style.copyWith(fontSize: 22.sp))
            ],
          ),
          Image.asset(
            Assets.decor,
            //color: colorWhite,
          )
        ],
      ),
    );
  }

  ListTile menuItems(String title) {
    return ListTile(
      title: Text(
        title,
        style: bodyStyle.copyWith(color: const Color.fromRGBO(75, 75, 75, 1)),
      ),
    );
  }
}
