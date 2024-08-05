import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Container(
            color: Colors.blue,
            height: 62,
            width: 4,
          ),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "task title",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff5D9CEC)),
                ),
                Text(
                  "task description",
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.done,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                backgroundColor: Color(0xff5D9CEC),
                minimumSize: Size(80, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          )
        ],
      ),
    );
  }
}
