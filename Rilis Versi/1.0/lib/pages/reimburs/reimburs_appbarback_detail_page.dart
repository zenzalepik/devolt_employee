import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:dyvolt_employee/widgets/card_reimburs.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';

class ReimbursAppbarback extends StatelessWidget {
  const ReimbursAppbarback({super.key});

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
                height: 104 + 36 + 9 - 104 + 32 - 24,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
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
                              items: const ['Option 1', 'Option 2', 'Option 3'],
                              onChanged: (value) {
                                print('Selected option: $value');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CardReimbursWidget(
                          status: 'Reimburs',
                          keterangan: 'Mensurei mesin pelanggan di surabaya',
                          labelColor: AppColors.primaryColor,
                          bgColor: AppColors.bgGrey,
                          onTap: () {},
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CardReimbursWidget(
                          status: 'Reimburs',
                          keterangan: 'Mensurei mesin pelanggan di surabaya',
                          labelColor: AppColors.primaryColor,
                          bgColor: AppColors.bgGrey,
                          onTap: () {},
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CardReimbursWidget(
                          status: 'Reimburs',
                          keterangan: 'Mensurei mesin pelanggan di surabaya',
                          labelColor: AppColors.labelSuccessColor,
                          bgColor: AppColors.bgGreen,
                          onTap: () {},
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CardReimbursWidget(
                          status: 'Reimburs',
                          keterangan: 'Ker',
                          labelColor: AppColors.labelErrorColor,
                          bgColor: AppColors.bgRed,
                          onTap: () {},
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
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
            labelText: 'Reimburs',
            onBack: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
