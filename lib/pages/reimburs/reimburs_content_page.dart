import 'package:dyvolt_employee/pages/reimburs/reimburs_detail_page.dart';
import 'package:dyvolt_employee/utils/colors.dart';
import 'package:dyvolt_employee/utils/fonts.dart';
import 'package:dyvolt_employee/utils/icons.dart';
import 'package:dyvolt_employee/widgets/appabr.dart';
import 'package:dyvolt_employee/widgets/card_reimburs.dart';
import 'package:dyvolt_employee/widgets/components/form_components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Reimburs extends StatefulWidget {
  // const Reimburs({super.key});

  @override
  State<Reimburs> createState() => _ReimbursState();
}

class _ReimbursState extends State<Reimburs> {
  List<dynamic> reimbursements = [];
  int currentPage = 1;
  int itemsPerPage = 12; // Jumlah items per page (paginate)
  int lastPage = 1;
  bool isLoading = false;

  // String getCurrentYear() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy');
  //   return formatter.format(now);
  // }

  late String currentYear;
  late String currentMonth;
  String selectedMonth = '';

  void setCurrentYear() {
    final tahun_saat_ini = DateFormat('yyyy').format(DateTime.now()).toString();
    final bulan_saat_ini = DateFormat('MMM').format(DateTime.now()).toString();
    setState(() {
      currentYear = tahun_saat_ini;
      currentMonth = bulan_saat_ini;
      selectedMonth = '$bulan_saat_ini-$tahun_saat_ini';
      // selectedMonth = 'All Months';
    });
  }

  String selectedStatus = "Status"; // Default value for the status dropdown

  final String apiUrl =
      "http://dyvoltapi.programmerbandung.my.id/api/reimburse?paginate=";
  final String authToken = "114|Nj2P9ym2Rj5KirSvAL4G4R1Y4p9Xi0f66mLvSmz1";

  Future<void> fetchReimbursements() async {
    try {
      setState(() {
        isLoading = true;
      });

      final String urlWithFilters = apiUrl +
          itemsPerPage.toString() +
          "&page=" +
          currentPage.toString() +
          "&month=" +
          Uri.encodeComponent(selectedMonth) +
          "&status=" +
          Uri.encodeComponent(selectedStatus);

      final response = await http.get(
        Uri.parse(urlWithFilters),
        headers: {
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer $authToken",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedData = json.decode(response.body);
        setState(() {
          if (currentPage == 1) {
            reimbursements = parsedData['data'];
          } else {
            reimbursements.addAll(parsedData['data']);
          }
          currentPage = parsedData['current_page'];
          lastPage = parsedData['last_page'];
          isLoading = false;
        });
      } else {
        // Handle error response (if needed)
        print("Error: ${response.statusCode}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      // Handle other exceptions (if needed)
      print("Exception: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void loadMoreData() {
    if (currentPage < lastPage) {
      currentPage++;
      fetchReimbursements();
    }
  }

  // Function to filter the reimbursements list based on selectedMonth and selectedStatus
  List<dynamic> filteredReimbursements() {
    return reimbursements.where((reimbursement) {
      bool matchesMonth = selectedMonth == "All Months" ||
          reimbursement['date'].contains(selectedMonth);
      bool matchesStatus = selectedStatus == "Status" ||
          reimbursement['status'] == selectedStatus;
      return matchesMonth && matchesStatus;
    }).toList();
  }

  // Update selected month with filter
  void updateSelectedMonth(String? month) {
    setState(() {
      selectedMonth = month ?? "All Months";
      if (selectedMonth == "All Months") {
        currentPage =
            1; // Set currentPage back to 1 when "All Months" is selected
        itemsPerPage =
            12; // Set itemsPerPage back to 12 when "All Months" is selected
      } else {
        itemsPerPage = 120; // Set itemsPerPage to 120 for other months
      }
      fetchReimbursements();
    });
  }

  // Update selected status with filter
  void updateSelectedStatus(String? status) {
    setState(() {
      selectedStatus = status ?? "Status";
      if (selectedStatus == "Status") {
        currentPage =
            1; // Set currentPage back to 1 when "All Statuses" is selected
        itemsPerPage =
            12; // Set itemsPerPage back to 12 when "All Statuses" is selected
      } else {
        itemsPerPage = 120; // Set itemsPerPage to 120 for other statuses
      }
      fetchReimbursements();
    });
  }

  @override
  void initState() {
    super.initState();
    // updateSelectedMonth();
    if (selectedMonth != 'All Months') {
      itemsPerPage = 120;
    } else {
      itemsPerPage = 12;
    }
    ;
    fetchReimbursements();
    // Inisialisasi variabel currentYear dengan tahun saat ini
    setCurrentYear();
  }

  void onCardReimbursTapped(Map<String, dynamic> reimbursement) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReimbursDetail(reimbursementData: reimbursement),
      ),
    );
  }

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
                            child: Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 16, vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.primaryColor,
                              ),
                              child: DropdownButton<String>(
                                dropdownColor: AppColors.blackColor,
                                underline: Container(),
                                icon: CustomIcon(
                                  iconName: 'icon_arrow_down',
                                  size: 16,
                                  color: AppColors.whiteColor,
                                ),
                                value: selectedMonth,
                                onChanged: updateSelectedMonth,
                                style: TextStyles.text16px700(
                                    color: AppColors.whiteColor),
                                items: <String>[
                                  "All Months",
                                  "Jan-$currentYear",
                                  "Feb-$currentYear",
                                  "Mar-$currentYear",
                                  "Apr-$currentYear",
                                  "May-$currentYear",
                                  "Jun-$currentYear",
                                  "Jul-$currentYear",
                                  "Aug-$currentYear",
                                  "Sep-$currentYear",
                                  "Oct-$currentYear",
                                  "Nov-$currentYear",
                                  "Dec-$currentYear",
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      child: Text(
                                        value,
                                        style: TextStyles.text16px700(
                                            color: AppColors.whiteColor),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 16, vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.primaryColor,
                              ),
                              child: DropdownButton<String>(
                                dropdownColor: AppColors.blackColor,
                                underline: Container(),
                                icon: CustomIcon(
                                  iconName: 'icon_arrow_down',
                                  size: 16,
                                  color: AppColors.whiteColor,
                                ),
                                style: TextStyles.text16px700(
                                    color: AppColors.whiteColor),
                                value: selectedStatus,
                                onChanged: updateSelectedStatus,
                                items: <String>[
                                  "Status",
                                  "ONPROCESS",
                                  "APPROVED",
                                  "REJECTED",
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyles.text16px700(
                                            color: AppColors.whiteColor),
                                      ));
                                }).toList(),
                              ),
                              // child: DropdownW(
                              //   labelText: 'Status',
                              //   items: const ['Option 1', 'Option 2', 'Option 3'],
                              //   onChanged: (value) {
                              //     print('Selected option: $value');
                              //   },
                              // ),
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
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filteredReimbursements().length,
                            itemBuilder: (BuildContext context, int index) {
                              final reimbursement =
                                  filteredReimbursements()[index];
                              return Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12.0),
                                      child: CardReimbursWidget(
                                        tanggal: '${reimbursement['date']}',
                                        alokasi:
                                            '${reimbursement['allocations']}',
                                        status: '${reimbursement['status']}',
                                        keterangan:
                                            '${reimbursement['description']}',
                                        labelColor: AppColors.primaryColor,
                                        bgColor: AppColors.bgGrey,
                                        onTap: () {
                                          onCardReimbursTapped(reimbursement);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    if (isLoading)
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!isLoading && currentPage < lastPage)
                      const SizedBox(
                        height: 12,
                      ),
                    if (!isLoading && currentPage < lastPage)
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: ElevatedButton(
                                onPressed: loadMoreData,
                                child: Text('Load More Data'),
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(
                      height: 12,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: CardReimbursWidget(
                    //       status: 'Reimburs',
                    //       keterangan: 'Mensurei mesin pelanggan di surabaya',
                    //       labelColor: AppColors.primaryColor,
                    //       bgColor: AppColors.bgGrey,
                    //       onTap: () {},
                    //     )),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: CardReimbursWidget(
                    //       status: 'Reimburs',
                    //       keterangan: 'Mensurei mesin pelanggan di surabaya',
                    //       labelColor: AppColors.labelSuccessColor,
                    //       bgColor: AppColors.bgGreen,
                    //       onTap: () {},
                    //     )),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: CardReimbursWidget(
                    //       status: 'Reimburs',
                    //       keterangan: 'Ker',
                    //       labelColor: AppColors.labelErrorColor,
                    //       bgColor: AppColors.bgRed,
                    //       onTap: () {},
                    //     )),
                    //   ],
                    // ),

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
          child: AppBarHello(),
        ),
      ],
    );
  }
}
