import 'package:lepton_dujo_application/view/colors/colors.dart';
import 'package:lepton_dujo_application/view/constant/sizes/sizes.dart';
import 'package:lepton_dujo_application/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view/widgets/fonts/google_poppins.dart';

class ExmNotification extends StatelessWidget {
  const ExmNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButtonBackWidget(),
            Text(
              "Exam Notification View",
            ),
          ],
        ),
        backgroundColor: adminePrimayColor,
      ),
      body: Column(
        children: [
          kHeight20,
          Padding(
            padding: EdgeInsets.only(left: 13.h, right: 13.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GooglePoppinsWidgets(
                  text: "First Revision Exam",
                  fontsize: 21.h,
                  fontWeight: FontWeight.w500,
                ),
                GooglePoppinsWidgets(
                  text: "Date :00/00/00",
                  fontsize: 21.h,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          kHeight20,
          Expanded(
            child: ListView.separated(
                itemCount: 5,
                separatorBuilder: ((context, index) {
                  return kHeight10;
                }),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: containerColor[
                                    index], // set your desired color here
                                width: 4, // set your desired width here
                              ),
                            ),
                          ),
                          child: ListTile(
                            shape: BeveledRectangleBorder(
                                side:
                                    BorderSide(color: Colors.grey, width: 0.2)),
                            title: GooglePoppinsWidgets(
                              text: "Maths",
                              fontsize: 21.h,
                              fontWeight: FontWeight.w500,
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: GooglePoppinsWidgets(
                                  text: "Chapter : 1-3", fontsize: 15.h),
                            ),
                            trailing: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: GooglePoppinsWidgets(
                                    text: "00/00/00",
                                    fontsize: 15.h,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: GooglePoppinsWidgets(
                                      text: "09:30-12:30",
                                      fontsize: 15.h,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

const containerColor = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Colors.grey,
  Colors.black
];
