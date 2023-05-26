import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retirement_app/widgets/helper_widgets.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

import '../../widgets/ui_helpers/app_assets.dart';
import '../../widgets/ui_helpers/app_colors.dart';
import '../login_screen.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  List<String> texts = [
    '• Pasportyň (ornuny tutýan resminamanyň) nusgasy;',
    '• Çagalaryň dogluş hakynda şahadatnamalarynyň nusgasy we olary sekiz ýaşyna çenli terbiýeländigine şaýatlyk edýän resminamalar (ýaşy boýunça pensiýa ir çykmaga hukugy bolan aýal maşgalalar üçin);',
    '• aýratyn döwürlerini tassyklaýan resminamalar;',
    '• zähmet depderçesiniň (ornuny tutýan resminamanyň) nusgasy;',
    '• Radiasiýa heläkçiliginiň we betbagtçylygynyň netijesinde ejir çeken (aýrybaşgalanan zolakdaky iş döwrüniň dowamlylygyna garamazdan):',
    '• Radiasiýa heläkçiliginiň we betbagtçylygynyň netijesinde ejir çeken (aýrybaşgalanan zolakdaky iş döwrüniň dowamlylygyna garamazdan):',
    '• Döwlet sylaglary we hormatly atlary hakynda şahadatnamanyň nusgasy (goşmaça tölegler göz öňünde tutulan döwlet sylaglary we hormatly atlary bar bolan adamlar üçin);',
    '• Pensiýa resmileşdiriljek adamyň "Altyn asyr" plastik bank kartynyň rekwizitleri.'
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
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                margin: REdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: []),
                child: Center(
                  child: Text(
                    'Gerekli resminamalary',
                    style: headlineStyle.copyWith(
                        fontSize: 18, color: colorPrimary),
                  ),
                )),
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

  bodyContainers(String text) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 15, horizontal: 15),
          margin: REdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: colorPrimary),
          child: Expanded(
            child: Text(
              text,
              style: headlineStyle.copyWith(
                  fontWeight: FontWeight.w700, fontSize: 18.sp),
            ),
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 10),
          child: const MySeparator(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
