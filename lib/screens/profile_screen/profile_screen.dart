import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retirement_app/widgets/ui_helpers/app_assets.dart';
import 'package:retirement_app/widgets/ui_helpers/app_colors.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

class NavbarItem {
  const NavbarItem({
    required this.icon,
    this.onPressed,
  });
  final String icon;
  final VoidCallback? onPressed;

  NavbarItem copyWith({
    String? icon,
    VoidCallback? onPress,
  }) {
    return NavbarItem(
      icon: icon ?? this.icon,
      onPressed: onPress ?? this.onPressed,
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  List<NavbarItem> icons = [
    NavbarItem(
      icon: Assets.personGrey,
      onPressed: () {},
    ),
    NavbarItem(
      icon: Assets.edit,
      onPressed: () {},
    ),
    NavbarItem(
      icon: Assets.message,
      onPressed: () {},
    ),
    NavbarItem(
      icon: Assets.calculatorGrey,
      onPressed: () {},
    ),
    NavbarItem(
      icon: Assets.note,
      onPressed: () {},
    ),
  ];
  List<Widget> profileScreens = [
    ProfileCabinet(),
    ProfileEdit(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(),
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileScreens[_selectedIndex],
          Container(
              width: 50.w,
              height: 282.h,
              margin: REdgeInsets.only(top: 23, left: 12, right: 20),
              padding: REdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Color.fromRGBO(240, 240, 240, 1), width: 2)),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final navbar = icons[index];
                    return InkWell(
                        onTap: () {
                          _selectedIndex = index;

                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            navbar.icon,
                            color: _selectedIndex == index
                                ? colorPrimary
                                : Colors.grey,
                            width: 20.w,
                            height: 20.h,
                          ),
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: icons.length)),
        ],
      ),
    );
  }
}

class ProfileCabinet extends StatelessWidget {
  const ProfileCabinet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(top: 23, left: 81),
      child: Column(
        children: [cyanContainer(), pinkContainer()],
      ),
    );
  }

  Container cyanContainer() {
    return Container(
      width: 303.w,
      height: 130.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(239, 251, 255, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0',
                style:
                    headlineStyle.copyWith(fontSize: 34.sp, color: colorBlack),
              ),
              Text(
                'Onlaýn tölegler',
                style:
                    headlineStyle.copyWith(fontSize: 13.sp, color: colorBlack),
              )
            ],
          ),
          Container(
            width: 170.w,
            height: 130.h,
            color: Colors.transparent,
            child: Stack(children: [
              Positioned(
                  top: 0, right: 50, child: SvgPicture.asset(Assets.ellipse)),
              Positioned(
                  bottom: 0,
                  right: 20,
                  child: SvgPicture.asset(Assets.triangleVer)),
              Positioned(
                  top: 10,
                  right: 0,
                  child: SvgPicture.asset(Assets.triangleHor)),
              Positioned(top: 0, right: 0, child: Image.asset(Assets.tablet))
            ]),
          )
        ],
      ),
    );
  }

  Container pinkContainer() {
    return Container(
      width: 303.w,
      height: 130.h,
      margin: REdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(255, 235, 228, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0',
                style:
                    headlineStyle.copyWith(fontSize: 34.sp, color: colorBlack),
              ),
              Text(
                'Ýüztutmalar',
                style:
                    headlineStyle.copyWith(fontSize: 13.sp, color: colorBlack),
              )
            ],
          ),
          Container(
            width: 170.w,
            height: 130.h,
            color: Colors.transparent,
            child: Stack(children: [
              Positioned(
                  top: 0, right: 60, child: SvgPicture.asset(Assets.ellipse)),
              Positioned(
                  bottom: 5,
                  right: 0,
                  child: SvgPicture.asset(Assets.triangleHor)),
              Positioned(top: 0, right: 0, child: Image.asset(Assets.diagram))
            ]),
          )
        ],
      ),
    );
  }
}

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(top: 23, left: 81),
      child: Column(
        children: [
          Container(
              width: 303.w,
              height: 130.h,
              margin: REdgeInsets.only(top: 10),
              padding: REdgeInsets.only(top: 10, left: 20, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(247, 247, 247, 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Oguljemal Berdiyewa',
                        style: headlineStyle.copyWith(
                          color: Color.fromRGBO(26, 26, 26, 1),
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.edit,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Text(
                    'oberdiyewa17@gmail.com',
                    style: headlineStyle.copyWith(
                        color: Color.fromRGBO(26, 26, 26, 1),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '+993123456',
                    style: headlineStyle.copyWith(
                        color: Color.fromRGBO(26, 26, 26, 1),
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
