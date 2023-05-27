import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retirement_app/widgets/helper_widgets.dart';
import 'package:retirement_app/widgets/ui_helpers/app_colors.dart';
import 'package:retirement_app/widgets/ui_helpers/styles.dart';

import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class OnlineApply extends StatefulWidget {
  const OnlineApply({super.key});

  @override
  State<OnlineApply> createState() => _OnlineApplyState();
}

class _OnlineApplyState extends State<OnlineApply> {
  List<String> onlineApplyTypes = [
    'Pensiýa',
    'Döwlet  kömek puly',
    'Pensiýa ätiýaçlandyrmasy',
    'Beýlekiler',
    'Zähmet kadalaşdyrmak we zähmet haky müdürligi',
    'Zähmet gatnaşyklary we zähmet şertleri müdirligi',
    'Zähmet gory we iş üpjünçilik müdirligi',
    'Durmuş üpjünçiligi bölümi',
    'Halkara gatnaşyklar bölümi',
  ];

   List<String> provincesList = [
    'Aşgabat',
    'Ahal',
    'Balkan',
    'Daşoguz',
    'Lebap',
    'Mary'
  ];
  String selectedItem = 'Saýlanmadyk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Stack(
          children: [
            ListView(
              children: [
                FillSelection(title: selectedItem, children: onlineApplyTypes),
                const FillSelection(
                    title: 'Onlaýn ýüzlenmäniň görnüşini saýlaň', children: []),
                FillSelection(
                    title: 'Welaýaty saýlaň', children: provincesList),
                FillSelection(title: 'Etrap/şäher saýlaň', children: []),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Salgyňyzy giriziň',
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
                  height: 15.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Ýüz tutmanyň mazmuny',
                      style: subheadingStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 200.h,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: colorLightestGrey, width: 2)),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Faýllaryňyz bar bolsa birikdiriň \n(doc,docx,jpg,pdf,zip,rar,png,jpeg )'
                          .toUpperCase(),
                      style: captionStyle.copyWith(fontSize: 10),
                    )),
                    InkWell(
                      onTap: () {
                        _pickFile();
                      },
                      child: Container(
                        height: 42.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: colorPrimary,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.upload),
                            Text(
                              'Fayl yukle',
                              style: subheadingStyle.copyWith(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;

    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
  }
}

class FillSelection extends StatelessWidget {
  const FillSelection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<String> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          // height: 52.h,
          // padding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: colorLightestGrey, width: 2)),
          child: Expanded(
            child: ListTileTheme(
              dense: true,
              child: ExpansionTile(
                title: Text(
                  'Saýlanmadyk',
                  style: subheadingStyle.copyWith(fontSize: 14.sp),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.zero,
                children: List.generate(
                    children.length,
                    (index) => ListTile(
                          onTap: () {
                            //selectedItem = onlineApplyTypes[index];
                          },
                          title: Text(
                            children[index],
                            style: subheadingStyle,
                          ),
                        )),
                // onExpansionChanged: (isExpanded) {
                //   setState(() {});
                // },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}
