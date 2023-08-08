import 'package:dyvolt_employee/pages/reimburs/reimburs_detail_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:flutter/material.dart';

class CardReimbursWidget extends StatelessWidget {
  final Color bgColor;
  final Color labelColor;
  final VoidCallback onTap;
  final String status;
  final String keterangan;

  const CardReimbursWidget({
    Key? key,
    this.bgColor = AppColors.bgGrey,
    this.labelColor = AppColors.primaryColor,
    required this.onTap,
    this.status = '',
    this.keterangan = '',
  }) : super(key: key);
  void _openDetailReimburs(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ReimbursDetail(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _openDetailReimburs(context);
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
                            child: Text('KONSUMSI - CM'.toUpperCase(),
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
                            child: Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    child: Text('Keterangan',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.text8px400()),
                                  ),
                                ]),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Konsumsi Lembur',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyles.text14px600()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Date',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyles.text12px600(
                                              color: AppColors.greyBlackColor)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CustomIcon(
                                        iconName: 'icon_calendar',
                                        color: AppColors.greyBlackColor,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text('29 July 2023',
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
