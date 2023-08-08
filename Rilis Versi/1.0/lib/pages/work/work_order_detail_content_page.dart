import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:flutter/material.dart';

class WorkOrderDetail extends StatelessWidget {
  const WorkOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 104 + 36 + 9 - 104 + 32 - 9,
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                // padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.bgCardDetail,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(89, 27, 27, 0.05),
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                        'assets/images/order/img_detail_work_order.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Mengganti suku Cadang EV6 Light (RWD)',
                                        style: TextStyles.text20px600(
                                            color: AppColors.blackColor),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          'Lokasi Jl. Anggrek no 12, Perumanahan Pasadena. Caringin, Babakan Ciparay, Bandung Jawa Barat',
                                          style: TextStyles.text12px400(
                                              color: AppColors.grey89Color)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Awal Pengerjaan',
                                          style: TextStyles.text18px400()),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text('July 23, 2022',
                                          textAlign: TextAlign.right,
                                          style: TextStyles.text18px600()),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColors
                                            .greyBlackColor, // Warna garis pemisah
                                        thickness:
                                            1.0, // Ketebalan garis pemisah
                                        height: 16.0, // Tinggi garis pemisah
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Akhir Pengerjaan',
                                          style: TextStyles.text18px400()),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text('July 27, 2022',
                                          textAlign: TextAlign.right,
                                          style: TextStyles.text18px600()),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColors
                                            .greyBlackColor, // Warna garis pemisah
                                        thickness:
                                            1.0, // Ketebalan garis pemisah
                                        height: 16.0, // Tinggi garis pemisah
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Status',
                                          style: TextStyles.text18px400()),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text('Completed',
                                          textAlign: TextAlign.right,
                                          style: TextStyles.text18px600()),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColors
                                            .greyBlackColor, // Warna garis pemisah
                                        thickness:
                                            1.0, // Ketebalan garis pemisah
                                        height: 16.0, // Tinggi garis pemisah
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Part Suku Cadang',
                                          style: TextStyles.text18px400()),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text('Bearing',
                                          textAlign: TextAlign.right,
                                          style: TextStyles.text18px600()),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColors
                                            .greyBlackColor, // Warna garis pemisah
                                        thickness:
                                            1.0, // Ketebalan garis pemisah
                                        height: 16.0, // Tinggi garis pemisah
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('',
                                          style: TextStyles.text18px400()),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text('Filter',
                                          textAlign: TextAlign.right,
                                          style: TextStyles.text18px600()),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColors
                                            .greyBlackColor, // Warna garis pemisah
                                        thickness:
                                            1.0, // Ketebalan garis pemisah
                                        height: 16.0, // Tinggi garis pemisah
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('',
                                          style: TextStyles.text18px400()),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text('CrankShaft',
                                          textAlign: TextAlign.right,
                                          style: TextStyles.text18px600()),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColors
                                            .greyBlackColor, // Warna garis pemisah
                                        thickness:
                                            1.0, // Ketebalan garis pemisah
                                        height: 16.0, // Tinggi garis pemisah
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: AppBarBack(
            labelText: 'Details',
            onBack: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
