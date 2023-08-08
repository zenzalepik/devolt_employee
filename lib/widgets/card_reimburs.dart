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
  final String tanggal;
  final String alokasi;
  final String idReimburs;

  const CardReimbursWidget({
    Key? key,
    this.idReimburs = '',
    this.bgColor = AppColors.bgGrey,
    this.labelColor = AppColors.primaryColor,
    required this.onTap,
    this.status = '',
    this.keterangan = '',
    this.tanggal = '',
    this.alokasi = '',
  }) : super(key: key);
  // void _openDetailReimburs(context) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ReimbursDetail(
  //           idReimburs: '$idReimburs',
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap
        // () {
        // _openDetailReimburs(context);
        // }
        ,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: status == 'ONPROCESS'
                  ? bgColor
                  : status == 'APPROVED'
                      ? AppColors.bgGreen
                      : status == 'REJECTED'
                          ? AppColors.bgRed
                          : Colors.black,
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
                            child: Text('$alokasi'.toUpperCase(),
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
                                      child: Text('$keterangan',
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
                                      child: Text('$tanggal',
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
                color: status == 'ONPROCESS'
                  ? labelColor
                  : status == 'APPROVED'
                      ? AppColors.labelSuccessColor
                      : status == 'REJECTED'
                          ? AppColors.labelErrorColor
                          : Colors.black,
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
