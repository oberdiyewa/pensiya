import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retirement_app/screens/retire%20screen/documents_screen.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

import '../../widgets/ui_helpers/app_assets.dart';
import '../../widgets/ui_helpers/app_colors.dart';
import '../login_screen.dart';

class SelectedRetireScreen extends StatefulWidget {
  const SelectedRetireScreen({super.key});

  @override
  State<SelectedRetireScreen> createState() => _SelectedRetireScreenState();
}

class _SelectedRetireScreenState extends State<SelectedRetireScreen> {
  List<String> texts = [
    '• Hökmany pensiýa ätiýaçlandyrmasyna gatnaşygy bäş ýyldan az bolmadyk, 62 ýaşy dolan erkek adamlaryň, 57 ýaşy dolan aýal maşgalalaryň;',
    '• Uç çaga dogran we olary sekiz ýaşa çenli terbiýeläp ýetişdiren, hökmany pensiýa ätiýaçlandyrmasyna gatnaşygy 20 ýyldan az bolmadyk, 56 ýaşy dolan aýal maşgalalaryň;',
    '• Dört çaga dogran we olary sekiz ýaşa çenli terbiýeläp ýetişdiren,hökmany pensiýa ätiýaçlandyrmasyna gatnaşygy 18 ýyldan az bolmadyk, 55 ýaşy dolan aýal maşgalalaryň;',
    '• Bäş, alty, ýedi çagany dogran ýa-da çagalygyndan maýyplygy bolan çagasy bar bolan (maýyplygy bolan çaga diýip ykrar edilen wagtyna garamazdan) we olary sekiz ýaşa çenli terbiýeläp ýetişdiren, hökmany pensiýa ätiýaçlandyrmasyna gatnaşygy 15 ýyldan az bolmadyk, 54 ýaşy dolan aýal maşgalalaryň;',
    '• Sekiz we şondan köp çagany dogran we olary sekiz ýaşa çenli terbiýeläp ýetişdiren, hökmany pensiýa ätiýaçlandyrmasyna gatnaşygy 10 ýyldan az bolmadyk, 52 ýaşy dolan aýal maşgalalaryň;',
    '• Radiasiýa heläkçiliginiň we betbagtçylygynyň netijesinde ejir çeken (aýrybaşgalanan zolakdaky iş döwrüniň dowamlylygyna garamazdan) a)hökmany pensiýa ätiýaçlandyrmasyna gatnaşygy 25 ýyldan az  bolmadyk 52 ýaşy dolan erkek adamlaryň; b)hökmany pensiýa ätiýaçlandyrmasyna gatnaşygy 20 ýyldan az  bolmadyk 48 ýaşy dolan aýal maşgalalaryň;',
    '• Gipofizar nanizmi (boý ösmezlik-liliput) keseli bilen kesellän ýa-da göýdük (karlik) bolan hökmany pensiýa ätiýaçlandymasyna gatnaşygy bäş ýyldan az bolmadyk 45 ýaşy dolan erkek adamlaryň, 40 ýaşy dolan aýal maşgalalaryň.'
  ];
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            elevation: 5,
            shadowColor: Color.fromRGBO(26, 82, 191, 0.1),
            child: Container(
              width: 414.w,
              height: 93.h,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              margin: REdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: []),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ýaşy boýunça pensiýa şu aşakdakylaryň hukugy bardyr:',
                      style: headlineStyle.copyWith(
                          fontSize: 18.sp, color: colorPrimary),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DocumentsScreen()));
                      },
                      child: slimButton())
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
                children: List.generate(
                    texts.length, (index) => bodyContainers(texts[index]))),
          ))
        ],
      ),
    );
  }

  Container bodyContainers(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: colorPrimary),
      child: Expanded(
        child: Text(
          text,
          style: headlineStyle.copyWith(
              fontWeight: FontWeight.w400, fontSize: 18.sp),
        ),
      ),
    );
  }

  Container slimButton() {
    return Container(
      width: 140.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: colorGreenDark, borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: Text(
          'Gerekli resminamalar',
          style: headlineStyle.copyWith(fontSize: 12.sp),
        ),
      ),
    );
  }
}
