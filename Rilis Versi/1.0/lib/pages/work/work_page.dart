import 'package:dyvolt_employee/pages/work/work_order_detail_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/card_order.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Mengatur tinggi AppBar menjadi 0
        child: AppBarEmptyW(),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 104 - 24,
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                      // color: AppColors.whiteColor,
                      // borderRadius: BorderRadius.circular(16),
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Color.fromRGBO(89, 27, 27, 0.05),
                      //     offset: Offset(0, 5),
                      //     blurRadius: 10,
                      //     spreadRadius: 0,
                      //   ),
                      // ],
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: DropdownW(
                            labelText: 'July 2023',
                            items: const ['Option 1', 'Option 2', 'Option 3'],
                            onChanged: (value) {
                              print('Selected option: $value');
                            },
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: DropdownW(
                            labelText: 'Status',
                            items: const ['Option 1', 'Option 2'],
                            onChanged: (value) {
                              print('Selected option: $value');
                            },
                          ),
                        )
                      ]),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                        bgColor: AppColors.bgGrey,
                        labelColor: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                        bgColor: AppColors.bgGreen,
                        labelColor: AppColors.labelSuccessColor,
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                        bgColor: AppColors.bgGrey,
                        labelColor: AppColors.labelInfoColor,
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                        bgColor: AppColors.bgGrey,
                        labelColor: AppColors.labelInfoColor,
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                        bgColor: AppColors.bgGreen,
                        labelColor: AppColors.labelSuccessColor,
                      ),
                      const SizedBox(height: 12),
                      CardOrderWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const WorkOrderDetailPage()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40 + 80)
              ],
            ),
          ),
          const Positioned(top: 0, right: 0, left: 0, child: AppBarHello()),
        ],
      ),
    );
  }
}
