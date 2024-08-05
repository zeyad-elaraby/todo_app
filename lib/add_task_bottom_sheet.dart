import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
          width: double.infinity,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Add new Task",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w700),
                )),
                SizedBox(
                  height: 18,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
                SizedBox(
                  height: 18,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Select Date",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    "12:00",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5D9CEC)),
                      onPressed: () {},
                      child: Text(
                        "add",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                )
              ])),
    );
  }
}
