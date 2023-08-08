import 'package:dyvolt_employee/pages/sakit/sakit_detail_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:flutter/material.dart';

class CardSakitWidget extends StatelessWidget {
  final Color bgColor;
  final Color labelColor;
  final VoidCallback onTap;
  final String status;
  final String keterangan;

  const CardSakitWidget({
    Key? key,
    this.bgColor = AppColors.bgRed,
    this.labelColor = AppColors.labelErrorColor,
    required this.onTap,
    this.status = '',
    this.keterangan = '',
  }) : super(key: key);
  void _openDetailSakit(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SakitDetail(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _openDetailSakit(context);
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
                            child: Text(status == '' ? 'Hadir' : status,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.text16px800()),
                          ),
                          Expanded(
                            child: Text('July 23, 2022',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.text16px800()),
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
                            child: Text(
                                status == '' ? 'Check in 07:00' : keterangan,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.text14px600()),
                          ),
                          status == ''
                              ? Expanded(
                                  child: Text('Check Out 16:20',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.text14px600()),
                                )
                              : const SizedBox(width: 0),
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
