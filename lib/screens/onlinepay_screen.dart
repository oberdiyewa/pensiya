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
