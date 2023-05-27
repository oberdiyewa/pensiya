import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retirement_app/widgets/helper_widgets.dart';
import 'package:retirement_app/widgets/ui_helpers/app_colors.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class OnlinePay extends StatefulWidget {
  const OnlinePay({super.key});

  @override
  State<OnlinePay> createState() => _OnlinePayState();
}

class _OnlinePayState extends State<OnlinePay> {
  List<String> yearsList = ['2020', '2021', '2022', '2023'];
  List<String> provincesList = [
    'Aşgabat',
    'Ahal',
    'Balkan',
    'Daşoguz',
    'Lebap',
    'Mary'
  ];
  // List<String> provi=['2020', '2021', '2022', '2023'];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Stack(
          children: [
            ListView(
              children: [
                textFieldSection('Adyňyzy giriziň'),
                textFieldSection('Familiýaňyzy giriziň'),
                textFieldSection('Ataňyzyň adyny giriziň'),
                textFieldSection('Telefon belgi'),
                textFieldSection('Salgyt belgisi (Ş.S.B) (12 simwol) '),
                textFieldSection('Pensiýa belgisi (9 simwol) '),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Hasaplaşyk döwri',
                      style: subheadingStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    miniExpansionTile(yearsList),
                    SizedBox(
                      width: 20.w,
                    ),
                    miniExpansionTile(provincesList),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    miniExpansionTile(yearsList),
                    SizedBox(
                      width: 20.w,
                    ),
                    miniExpansionTile(provincesList),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                textFieldSection('Töleg möçberi'),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
            Positioned(bottom: 0, child: BaseButton(title: 'Ugratmak'))
          ],
        ),
      ),
    );
  }

  Container miniExpansionTile(List<String> children) {
    return Container(
      // height: 70,
      width: 150,
      // padding:
      //     EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: colorLightestGrey, width: 2)),
      child: ListTileTheme(
        dense: true,
        child: ExpansionTile(
          title: Text(
            'Saýla',
            style: captionStyle,
          ),
          children: List.generate(
              children.length,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(children[index]),
                    ],
                  )),
        ),
      ),
    );
  }

  Column textFieldSection(String title) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: subheadingStyle,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 46,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: colorLightestGrey, width: 2)),
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
