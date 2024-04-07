import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GroupButtonController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Services',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 20),
            child: GroupButton(
              isRadio: true,
              controller: controller,
              onSelected: (value, index, isSelected) => {},
              buttons: ["Book Appointment", "Feedback"],
              options: GroupButtonOptions(
                selectedTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                selectedColor: Colors.white,
                unselectedShadow: const [],
                unselectedColor: Color(0xff3E69FE),
                unselectedTextStyle: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
                spacing: 10,
                runSpacing: 10,
                groupingType: GroupingType.wrap,
                direction: Axis.horizontal,
                buttonHeight: 80,
                buttonWidth: 140,
                mainGroupAlignment: MainGroupAlignment.start,
                crossGroupAlignment: CrossGroupAlignment.start,
                groupRunAlignment: GroupRunAlignment.start,
                textAlign: TextAlign.center,
                textPadding: EdgeInsets.zero,
                alignment: Alignment.center,
                elevation: 0,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Top Doctors',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                List<String> imagePaths = [
                  'assets/images/doctor1.jpg',
                  'assets/images/doctor2.jpg',
                  'assets/images/doctor3.jpg',
                  'assets/images/doctor4.jpg',
                  'assets/images/doctor5.jpg',
                  'assets/images/doctor6.jpg',
                ];

                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.fitHeight,

                );
              },
              itemCount: 6,
              viewportFraction: 0.8,
              scale: 0.6,
              duration: 500,
              scrollDirection: Axis.horizontal,
              loop: false,
            ),
          )
        ],
      ),
    );
  }
}
