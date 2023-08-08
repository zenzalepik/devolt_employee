import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';

class PresensiPopUp extends StatelessWidget {
  final VoidCallback onPressed;

  const PresensiPopUp({super.key, required this.onPressed});
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
                                    clipBehavior: Clip.antiAlias,
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 48),
                                    margin:
                                        const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: AppColors.bgClick,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        16.0),
                                                            child:
                                                                TextButtonCustom(
                                                              tabActive: true,
                                                              labelText:
                                                                  'Check In',
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 32,
                                                          width: 3,
                                                          color: AppColors
                                                              .whiteColor,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        16.0),
                                                            child:
                                                                TextButtonCustom(
                                                              tabDisable: true,
                                                              tabActive: false,
                                                              labelText:
                                                                  'Check Out',
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        32, 20, 32, 0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Current o’clock',
                                                            style: TextStyles
                                                                .text12px600()),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('07 : 00 AM',
                                                            style: TextStyles
                                                                .textClock()),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                              'Jl. Parikesit Raya No.35, RT.08/RW.15, Bantarjati, Kec. Bogor Utara, Kota Bogor, Jawa Barat 16153',
                                                              style: TextStyles
                                                                  .text12px400(
                                                                      color: AppColors
                                                                          .description)),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 22),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: ButtonMedium(
                                                            labelText:
                                                                'Check In',
                                                            onPressed: () {},
                                                          ),
                                                        )
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
                                ],
                              ),
                            ),
                            const SizedBox(height: 38),
                            GestureDetector(
                              onTap: onPressed,
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
                      )
                  ;
  }
}