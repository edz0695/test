import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import 'package:payapp/core/views/kslistviewbuilder.dart';
import 'package:payapp/models/contacts_model.dart';
import 'package:payapp/provider/rechargeServiceProvider.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/ui/widgets/nopermissionwidget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/CircleWisePlanLists.dart';
import '../../../../../../themes/colors.dart';
import '../../../../../dialogs/loaderdialog.dart';
import '../../../../../widgets/headingtile.dart';
import 'all_recharge_packages_list.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({super.key});

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  final rechargeServiceProvider = RechargeServicesProvider();
  @override
  void initState() {
    super.initState();
    printThis("this");
  }

  List<ContactsModel> filterList = [];
  List<ContactsModel> noMatchNumbers = [];
  bool isFilterEnable = false;
  String filterNumber = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: rechargeServiceProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeColors.backgroundLightBlue,
        appBar: AppBarWidget(
          title: "Mobile Recharge",
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Consumer<RechargeServicesProvider>(
                builder: (context, rechargeServiceProvider, child) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: SizedBox(
                  height: 50,
                  child: CupertinoSearchTextField(
                    smartDashesType: SmartDashesType.enabled,
                    smartQuotesType: SmartQuotesType.enabled,
                    enabled: true,
                    borderRadius: BorderRadius.circular(100),
                    onChanged: (query) {
                      if (query == "") {
                        setState(() {
                          isFilterEnable = false;
                          noMatchNumbers = [];
                        });
                      } else {
                        filterList = rechargeServiceProvider.contacts
                            .where((element) => (element.name
                                    .toLowerCase()
                                    .contains(query.toLowerCase()) ||
                                element.number.contains(query)))
                            .toList();
                        setState(() {});
                        if (filterList.isEmpty) {
                          if (query.isNotEmpty &&
                              RegExp(r'^[0-9]+$').hasMatch(query) &&
                              query.length == 10) {
                            setState(() {
                              isFilterEnable = true;
                              noMatchNumbers.add(ContactsModel(
                                  name: "New User", number: query));
                            });
                          } else {
                            setState(() {
                              isFilterEnable = true;
                              noMatchNumbers = [];
                            });
                          }
                        }
                      }
                      return;
                    },
                    placeholder: 'Search by Name or Number',
                  ),
                ),
              );
            }),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Consumer<RechargeServicesProvider>(
                      builder: (context, rechargeServiceProvider, child) {
                    if (rechargeServiceProvider.result != null &&
                        (rechargeServiceProvider.result!.isPermanentlyDenied ||
                            rechargeServiceProvider.result!.isDenied)) {
                      return const NoPermissionWidget();
                    }
                    return rechargeServiceProvider.contacts.isEmpty
                        ? loading()
                        : (filterList.isNotEmpty)
                            ? Column(
                                children: [
                                  height(10),
                                  const HeadingTile(title: "All Contacts"),
                                  Expanded(
                                    child: KSListView(
                                      shrinkWrap: true,
                                      itemCount: filterList.length,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      scrollDirection: Axis.vertical,
                                      separateSpace: 5,
                                      itemBuilder: (context, index) {
                                        final contact = filterList[index];
                                        return Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              showLoaderDialog(context);
                                              List<CircleWisePlanLists>?
                                                  circleList =
                                                  await rechargeServiceProvider
                                                      .getCircleData(
                                                mobileNumber: contact.number,
                                              );

                                              Get.to(() =>
                                                  AllRechargePackagesList(
                                                    circleList:
                                                        circleList ?? [],
                                                    contactName: contact.name,
                                                    contactNumber:
                                                        contact.number,
                                                  ));
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              height: 60,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.indigo,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Text(
                                                          contact.name
                                                              .substring(0, 2)
                                                              .toUpperCase(),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          contact.name,
                                                          style: GoogleFonts
                                                              .poppins(),
                                                        ),
                                                        Text(
                                                          contact.number,
                                                          style: GoogleFonts
                                                              .poppins(),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : (filterList.isEmpty && isFilterEnable)
                                ? KSListView(
                                    itemCount: noMatchNumbers.length,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    scrollDirection: Axis.vertical,
                                    separateSpace: 5,
                                    itemBuilder: (context, index) {
                                      final contact = noMatchNumbers[index];
                                      return Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            showLoaderDialog(context);
                                            List<CircleWisePlanLists>?
                                                circleList =
                                                await rechargeServiceProvider
                                                    .getCircleData(
                                                        mobileNumber:
                                                            contact.number);

                                            Get.to(() =>
                                                AllRechargePackagesList(
                                                  circleList: circleList ?? [],
                                                  contactName: contact.name,
                                                  contactNumber: contact.number,
                                                ));
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            height: 60,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.indigo,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                        contact.number
                                                            .substring(0, 2)
                                                            .toUpperCase(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white)),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        contact.name,
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      ),
                                                      Text(
                                                        contact.number,
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      height(10),
                                      const HeadingTile(title: "All Contacts"),
                                      Expanded(
                                        child: KSListView(
                                          shrinkWrap: true,
                                          itemCount: rechargeServiceProvider
                                                  .contacts.length +
                                              1,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          scrollDirection: Axis.vertical,
                                          separateSpace: 5,
                                          itemBuilder: (context, index) {
                                            final contact =
                                                rechargeServiceProvider
                                                    .contacts[index];
                                            return Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () async {
                                                  showLoaderDialog(context);

                                                  List<CircleWisePlanLists>?
                                                      circleList =
                                                      await rechargeServiceProvider
                                                          .getCircleData(
                                                              mobileNumber:
                                                                  contact
                                                                      .number);
                                                  Get.to(() =>
                                                      AllRechargePackagesList(
                                                        circleList:
                                                            circleList ?? [],
                                                        contactName:
                                                            contact.name,
                                                        contactNumber:
                                                            contact.number,
                                                      ));
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  height: 60,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.indigo,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Text(
                                                              contact.name
                                                                  .substring(
                                                                      0, 2)
                                                                  .toUpperCase(),
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      color: Colors
                                                                          .white)),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              contact.name,
                                                              style: GoogleFonts
                                                                  .poppins(),
                                                            ),
                                                            Text(
                                                              contact.number,
                                                              style: GoogleFonts
                                                                  .poppins(),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchChild(contact) {
    return ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.number),
    );
  }
}
