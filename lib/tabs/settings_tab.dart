import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bottom_sheets/language_bottom_sheet.dart';
import 'package:todo_app/bottom_sheets/theme_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0Xff5D9CEC)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "English",
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isDismissible: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return LanguageBottomSheet();
                            },
                          );
                        },
                        icon: ImageIcon(
                          AssetImage("assets/images/drop_down_icon.png"),
                          color: Color(0xFF5D9CEC),
                        )),
                  ],
                ),
              )),
          Text(
            "Mode",
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0Xff5D9CEC)),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Light",
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isDismissible: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return ThemeBottomSheet();
                            },
                          );
                        },
                        icon: ImageIcon(
                          AssetImage("assets/images/drop_down_icon.png"),
                          color: Color(0xFF5D9CEC),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
