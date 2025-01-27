// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lepton_dujo_application/view/colors/colors.dart';
import 'package:lepton_dujo_application/view/constant/sizes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/teacher_model/progress_report_model/progress_report_model.dart';

class ViewProgressReportScreen extends StatefulWidget {
  String schooilID;
  String classID;
  String studentId;
  String wexam;
  String batchId;
  ViewProgressReportScreen(
      {required this.schooilID,
      required this.classID,
      required this.studentId,
      required this.wexam,
      required this.batchId,
      super.key});

  @override
  State<ViewProgressReportScreen> createState() =>
      ViewtProgressReportScreenState();
}

class ViewtProgressReportScreenState extends State<ViewProgressReportScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schooilID)
            .collection(widget.batchId)
            .doc(widget.batchId)
            .collection("classes")
            .doc(widget.classID)
            .collection("Students")
            .doc(widget.studentId)
            .collection("StudentProgressReport")
            .doc(widget.wexam)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.data() != null) {
              UploadProgressReportModel data =
                  UploadProgressReportModel.fromMap(snapshot.data!.data()!);
              return Scaffold(
                appBar: AppBar(
                  title: Text("Progress Report".tr),
                  backgroundColor: adminePrimayColor,
                ),
                body: SafeArea(
                    child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        kHeight20,
                        Text(
                          data.schoolName,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          data.schoolPlace,
                          style: const TextStyle(
                              letterSpacing: 5,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          data.whichExam,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 05.h,
                        ),
                        Text(
                          "Progress Report",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data.studentName,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 30.w,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(data.studentIMage),
                              radius: 60.w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Text("Roll No :  "),
                                    Text(data.rollNo),
                                  ],
                                ),
                                FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection("SchoolListCollection")
                                        .doc(widget.schooilID)
                                        .collection(widget.batchId)
                                        .doc(widget.batchId)
                                        .collection("classes")
                                        .doc(widget.classID)
                                        .get(),
                                    builder: (context, snaos) {
                                      if (snaos.hasData) {
                                        return Row(
                                          children: [
                                            Text(
                                                "Class :   ${snaos.data?.data()!['className']}"),
                                          ],
                                        );
                                      } else {
                                        return const Text('');
                                      }
                                    }),
                                FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection("SchoolListCollection")
                                        .doc(widget.schooilID)
                                        .collection(widget.batchId)
                                        .doc(widget.batchId)
                                        .collection("classes")
                                        .doc(widget.classID)
                                        .get(),
                                    builder: (context, snaos) {
                                      if (snaos.hasData) {
                                        return Row(
                                          children: [
                                            Text(
                                                "Class Adviser :   ${snaos.data?.data()!['classTeacherName']}"),
                                          ],
                                        );
                                      } else {
                                        return const Text('');
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all()),
                          // height: 600.h,
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(
                                      label: Text('No'),
                                    ),
                                    DataColumn(
                                      label: Text("Subjects"),
                                    ),
                                    DataColumn(
                                      label: Text('Obtained'),
                                    ),
                                    DataColumn(
                                      label: Text('Total'),
                                    ),
                                  ],
                                  rows: [
                                    for (int i = 0;
                                        i <= data.reports.length - 1;
                                        i++)
                                      DataRow(
                                        cells: [
                                          DataCell(
                                            Text('${i + 1}'),
                                          ),
                                          DataCell(
                                            Text(data.reports[i].subject),
                                          ),
                                          DataCell(
                                            Text(
                                              data.reports[i].obtainedMark
                                                  .toString(),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.reports[i].totalMark
                                                  .toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: Text("No Records"),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        });
  }
}
