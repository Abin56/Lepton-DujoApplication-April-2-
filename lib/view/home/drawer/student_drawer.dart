// ignore_for_file: empty_catches, unused_element

import 'package:lepton_dujo_application/controllers/userCredentials/user_credentials.dart';
import 'package:lepton_dujo_application/view/constant/sizes/sizes.dart';
import 'package:lepton_dujo_application/view/home/exam_Notification/users_exam_list_view/user_exam_acc.dart';
import 'package:lepton_dujo_application/view/home/general_instructions/general_instructions.dart';
import 'package:lepton_dujo_application/view/home/parent_home/progress_report/progress_report.dart';
import 'package:lepton_dujo_application/view/home/student_home/time_table/ss.dart';
import 'package:lepton_dujo_application/view/pages/Homework/view_home_work.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import '../../language/language_change_drawer.dart';
import '../../pages/Attentence/take_attentence/attendence_book_status_month.dart';
import '../../pages/privacy_policy/dialogs/privacy_policy.dart';
import '../all_class_test_show/all_class_list_show.dart';

class StudentsHeaderDrawer extends StatelessWidget {
  const StudentsHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(bottom: 20, top: 15.h),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spacearound,
        children: [
          SizedBox(height: 30.h),
          Container(
            margin: const EdgeInsets.only(bottom: 0),
            height: 90.h,
            width: 150.h,
            decoration: const BoxDecoration(
              // color: cred,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FL.png?alt=media&token=135e14d0-fb5a-4a21-83a6-411f647ec974"),
              ),
            ),
          ),
          Text(
            "Lepton DuJo",
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 25.h,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            "Watch and Guide      \n  Let them Study",
            style: GoogleFonts.poppins(
                color: Colors.black.withOpacity(0.5),
                fontSize: 10.h,
                fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () async {
              await userLogOut(context);
            },
            child: Text(
              "Logout".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.h),
            ),
          )
        ],
      ),
    );
  }
}

Widget MenuItem(int id, String image, String title, bool selected, onTap) {
  return Material(
    color: Colors.white,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15.0.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 30.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ))
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  favourites,
  setting,
  share,
  feedback,
  contact,
  about,
}

// ignore: non_constant_identifier_names
Widget MyDrawerList(context) {
  void signOut(context) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signOut().then((value) => {
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => const Gsignin()),
            //     (route) => false)
          });
    } catch (e) {}
  }

  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          );
        });
  }

  var currentPage = DrawerSections.dashboard;
  return Container(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      // show list  of menu drawer.........................
      children: [
        MenuItem(1, 'assets/images/information.png', 'General Instructions'.tr,
            currentPage == DrawerSections.dashboard ? true : false, () {
          Get.to(
            () => GeneralInstruction(),
          );
        }),
        MenuItem(1, 'assets/images/attendance.png', 'Attendance book'.tr,
            currentPage == DrawerSections.dashboard ? true : false, () {
          Get.to(
            () => AttendenceBookScreenSelectMonth(
                schoolId: UserCredentialsController.schoolId!,
                batchId: UserCredentialsController.batchId!,
                classID: UserCredentialsController.classId!),
          );
        }),
        MenuItem(2, 'assets/images/exam.png', 'Exams'.tr,
            currentPage == DrawerSections.favourites ? true : false, () {
          Get.to(
            () => const UserExmNotifications(),
          );
        }),
        MenuItem(3, 'assets/images/library.png', 'Time Table'.tr,
            currentPage == DrawerSections.setting ? true : false, () {
          Get.to(
            () => const SS(),
          );
        }),
        // MenuItem(4, "Share", Icons.share,
        //     currentPage == DrawerSections.share ? true : false, () async {
        //   // await  Share.share('https://play.google.com/store/apps/details?id=in.brototype.BrotoPlayer');
        // }),
        MenuItem(4, 'assets/images/homework.png', 'HomeWorks'.tr,
            currentPage == DrawerSections.contact ? true : false, () {
          Get.to(
            () => const ViewHomeWorks(),
          );
        }),

        // MenuItem(6, 'assets/images/progressreport.png', 'Progress Report'.tr,
        //     currentPage == DrawerSections.dashboard ? true : false, () {
        //   Get.to(
        //     () => ProgressReportListViewScreen(
        //         schoolId: UserCredentialsController.schoolId!,
        //         classID: UserCredentialsController.classId!,
        //         studentId: FirebaseAuth.instance.currentUser!.uid,
        //         batchId: UserCredentialsController.batchId!),
        //   );
        // }),

        MenuItem(7, 'assets/images/languages.png', 'Change Language'.tr,
            currentPage == DrawerSections.dashboard ? true : false, () {
          Get.to(LanguageChangeDrawerPage());
        }),
        MenuItem(8, 'assets/images/attendance.png', 'Privacy Policy'.tr,
            currentPage == DrawerSections.dashboard ? true : false, () {
          Get.to(const PrivacyViewScreen());
        }),

        kHeight10,
        kHeight10,
        kHeight10,
        Container(
          color: Colors.grey.withOpacity(0.2),
          height: 200.h,
          width: double.infinity,
          child: Stack(children: [
            Positioned(
              left: 20,
              top: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Developed by",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 40.h,
                left: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FL.png?alt=media&token=135e14d0-fb5a-4a21-83a6-411f647ec974'),
                    ),
                    SizedBox(
                      width: 06,
                    ),
                    Text(
                      "Lepton Communications",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 11.5),
                    ),
                  ],
                )),
            Positioned(
              left: 100,
              top: 73,
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.adb_outlined,
                        color: Colors.green,
                      ),
                      Text(
                        " Version",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "    1.0.0",
                    style: TextStyle(color: Colors.black, fontSize: 11.5.h),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

Widget emptyDisplay(String section) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No $section Found",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.h,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
