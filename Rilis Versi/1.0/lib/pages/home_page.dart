import 'package:dyvolt_employee/pages/izin/izin_page.dart';
import 'package:dyvolt_employee/pages/performa/performa_mekanik_page.dart';
import 'package:dyvolt_employee/pages/presensi/presensi_page.dart';
import 'package:dyvolt_employee/pages/sakit/sakit_page.dart';
import 'package:dyvolt_employee/pages/work/work_order_detail_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:dyvolt_employee/widgets/appbar_empty.dart';
import 'package:dyvolt_employee/widgets/card_activities.dart';
import 'package:dyvolt_employee/widgets/card_anouncement.dart';
import 'package:dyvolt_employee/widgets/card_order.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                      Text('Work Order', style: TextStyles.textTitleSection()),
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
                      const SizedBox(
                        height: 28,
                      ),
                      Text('Activities', style: TextStyles.textTitleSection()),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CardActivitiesWidget(
                            whatCard: 'hadir',
                            textValue: 'Hadir 14 hari dari 27',
                            textTitle: 'Presensi Kehadiran',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PresensiPage()),
                              );
                            },
                          )),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CardActivitiesWidget(
                              whatCard: 'izin',
                              textValue: 'Izin 2 hari dari 7',
                              textTitle: 'Perizinan Kerja',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const IzinPage()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CardActivitiesWidget(
                            whatCard: 'sakit',
                            textValue: 'Sakit 2 hari',
                            textTitle: 'Sakit',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SakitPage()),
                              );
                            },
                          )),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CardActivitiesWidget(
                              whatCard: 'performa',
                              textValue: 'Cukup baik',
                              textTitle: 'Performa mekanik',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PerformaMekanikPage()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Text('Anouncement', style: TextStyles.textTitleSection()),
                      const SizedBox(height: 12),
                      CardAnaouncementWidget(
                        onTap: () {},
                        bgColor: AppColors.bgGrey,
                        labelColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const SizedBox(height: 80)
              ],
            ),
          ),
          const Positioned(top: 0, right: 0, left: 0, child: AppBarHello()),
        ],
      ),
    );
  }
}
