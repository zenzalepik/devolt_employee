import 'package:dyvolt_employee/pages/izin/izin_pengajuan_page.dart';
import 'package:dyvolt_employee/pages/lembur/lembur_pengajuan_page.dart';
import 'package:dyvolt_employee/pages/reimburs/reimburs_pengajuan_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';

class FABMenuPopUp extends StatelessWidget {
  final VoidCallback fabMenuPresensi;
  final VoidCallback showFAB;

  const FABMenuPopUp({super.key, 
    required this.fabMenuPresensi,
    required this.showFAB,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 38 + 44),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.whiteColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextButtonCustom(
                                labelText: 'Presensi Kehadiran',
                                onPressed: fabMenuPresensi),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: TextButtonCustom(
                              labelText: 'Perizinan kerja',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IzinPengajuan(),
                                  ),
                                );
                                Future.delayed(
                                    const Duration(milliseconds: 750), showFAB);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: TextButtonCustom(
                                labelText: 'Reimburs',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ReimbursPengajuan(),
                                      ));
                                  Future.delayed(
                                      const Duration(milliseconds: 750), showFAB);
                                }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: TextButtonCustom(
                              labelText: 'Lembur',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LemburPengajuan(),
                                    ));
                                Future.delayed(
                                    const Duration(milliseconds: 750), showFAB);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 38),
          GestureDetector(
            onTap: 
              showFAB
            ,
            child: Container(
              height: 52,
              width: 52,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.greyD9Color,
                borderRadius: BorderRadius.circular(26),
              ),
              child: const SizedBox(
                height: 32,
                width: 32,
                child: CustomIcon(
                  iconName: 'icon_close',
                  size: 32,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
