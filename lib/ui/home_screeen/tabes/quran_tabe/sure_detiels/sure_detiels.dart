import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/sures_data.dart';
import 'package:islami_app/ui/home_screeen/tabes/quran_tabe/widget/sure_Contint.dart';
import 'package:islami_app/utils/app_color.dart';


enum SureViewMode { paragraph, list }

class SureDetiels extends StatefulWidget {
  const SureDetiels({super.key});

  @override
  State<SureDetiels> createState() => _SureDetielsState();
}

class _SureDetielsState extends State<SureDetiels> {
  String sureContint = "";
  List<String> verses = [];
  SureViewMode viewMode = SureViewMode.paragraph;
  int? selectedIndex; // رقم الآية المختارة حاليًا (بيتغيّر شكلها لما تدوس عليها)

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;

    if (sureContint.isEmpty) {
      loadingSure(index);
    }

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        title: Text(
          QuranData.surahNamesEnglish[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.goldColor,
          ),
        ),
        actions: [
          _buildViewModeSwitcher(),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/img_left_corner.png"),
                Text(
                  QuranData.surahNamesArabic[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColor.goldColor,
                  ),
                ),
                Image.asset("assets/images/img_right_corner.png"),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: sureContint.isEmpty
                  ? Center(
                child: CircularProgressIndicator(
                  color: AppColor.goldColor,
                ),
              )
                  : viewMode == SureViewMode.paragraph
                  ? SingleChildScrollView(
                child: Text(
                  sureContint,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.goldColor,
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                ),
              )
                  : ListView.separated(
                itemCount: verses.length,
                itemBuilder: (context, i) {

                  return Material(
                    color: Colors.transparent,
                    child: SureContint(
                      contint: verses[i],
                      index: i,
                      isSelected: selectedIndex == i,
                      onTap: () {
                        setState(() {
                          // لو دوست على نفس الآية تاني بتتشال منها التحديد
                          selectedIndex =
                          selectedIndex == i ? null : i;
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (context, i) =>
                const SizedBox(height: 12),
              ),
            ),
            Image.asset("assets/images/Mask group.png"),
          ],
        ),
      ),
    );
  }

  // مفتاح تبديل شكل العرض بهوية التطبيق (بدون أي Navigator - نفس الصفحة بيتغير محتواها فقط)
  Widget _buildViewModeSwitcher() {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.blackColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColor.goldColor, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _modeButton(
            icon: Icons.menu_book_rounded,
            mode: SureViewMode.paragraph,
          ),
          _modeButton(
            icon: Icons.format_list_bulleted_rounded,
            mode: SureViewMode.list,
          ),
        ],
      ),
    );
  }

  Widget _modeButton({required IconData icon, required SureViewMode mode}) {
    final bool isActive = viewMode == mode;
    return GestureDetector(
      onTap: () {
        setState(() {
          viewMode = mode;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? AppColor.goldColor : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Icon(
          icon,
          color: isActive ? AppColor.blackColor : AppColor.goldColor,
          size: 18,
        ),
      ),
    );
  }

  void loadingSure(int index) async {
    String content =
    await rootBundle.loadString("assets/feiles/quran/${index + 1}.tex");
    // الأسطر الخام من غير أرقام، لأن SureContint بيضيف رقم الآية بنفسه
    List<String> rawLines = content.split("\n");

    // نص الفقرة المتصلة بيحتاج الأرقام هنا لأنه مش بيمر على SureContint
    String paragraph = "";
    for (int i = 0; i < rawLines.length; i++) {
      paragraph += "${rawLines[i]} [${i + 1}] ";
    }

    setState(() {
      verses = rawLines;
      sureContint = paragraph.trim();
    });
  }
}