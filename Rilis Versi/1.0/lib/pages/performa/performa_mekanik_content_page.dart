import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:dyvolt_employee/widgets/card_performa.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';

class PerformaMekanik extends StatelessWidget {
  const PerformaMekanik({super.key});

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
                height: 104 + 36 + 9 - 104 + 32 - 12,
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
                    DropdownW(
                      labelText: 'July 2023',
                      items: const ['Option 1', 'Option 2', 'Option 3'],
                      onChanged: (value) {
                        print('Selected option: $value');
                      },
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CardPerformaWidget(
                          whatCard: 'performa',
                          textValue: 'Pekerjaan Selesai',
                          textTitle: '12',
                          onTap: () {},
                        )),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CardPerformaWidget(
                            whatCard: 'performa',
                            textValue: 'Pekerjaan Tidak Selesai',
                            textTitle: '4',
                            onTap: () {},
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
                            child: CardPerformaWidget(
                          whatCard: 'performa',
                          textValue: 'Total Pekerjaan',
                          textTitle: '16',
                          onTap: () {},
                        )),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(''),
                        ),
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
            labelText: 'Performa Mekanik',
            onBack: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
