import 'package:dyvolt_employee/pages/lembur/lembur_detail_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:flutter/material.dart';

class CardLemburWidget extends StatelessWidget {
  final Color bgColor;
  final Color labelColor;
  final VoidCallback onTap;
  final String status;
  final String keterangan;

  const CardLemburWidget({
    Key? key,
    this.bgColor = AppColors.bgGrey,
    this.labelColor = AppColors.primaryColor,
    required this.onTap,
    this.status = '',
    this.keterangan = '',
  }) : super(key: key);
  void _openDetailLembur(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LemburDetail(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _openDetailLembur(context);
        },
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Lembur',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.text16px800()),
                          ),
                          Expanded(
                            child: Text('July 29, 2023',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.text12px600(
                                    color: AppColors.greyBlackColor)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        children: [],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text('Durasi:',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.text14px600()),
                          ),
                          Expanded(
                            child: Text('3 jam - 20 Menit',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.text14px600()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 14,
            child: Container(
              height: 28,
              width: 4,
              decoration: BoxDecoration(
                color: labelColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
