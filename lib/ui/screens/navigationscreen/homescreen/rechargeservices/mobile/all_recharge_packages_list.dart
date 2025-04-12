import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import '../../../../../../src/src.dart';
import '../../../ca_services/screens/proceed_to_pay_with_recharged_plan.dart';

class AllRechargePackagesList extends StatefulWidget {
  const AllRechargePackagesList(
      {super.key,
      required this.circleList,
      required this.contactName,
      required this.contactNumber});
  final List<CircleWisePlanLists> circleList;
  final String contactName;
  final String contactNumber;

  @override
  State<AllRechargePackagesList> createState() =>
      _AllRechargePackagesListState();
}

class _AllRechargePackagesListState extends State<AllRechargePackagesList>
    with SingleTickerProviderStateMixin {
  List<PlansInfo> filterList = [];
  bool isFilterEnable = false;
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final uniquePlans = widget.circleList.first.plansInfo
        ?.map((e) => e.planType)
        .toSet()
        .toList();

    _tabController =
        TabController(length: uniquePlans?.length ?? 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.circleList.isEmpty
        ? Center(
            child: Text(
              "Not Data Available",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
          )
        : DefaultTabController(
            length: widget.circleList.first.plansInfo
                    ?.map((e) => e.planType)
                    .toSet()
                    .toList()
                    .length ??
                0,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: const Text("Mobile Recharge"),
                  leading: back(),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                    backgroundColor: Colors.indigo,
                                    backgroundImage: NetworkImage(
                                        "https://9to5google.com/wp-content/uploads/sites/4/2022/02/flutter-windows-promo.jpg?quality=82&strip=all&w=1600")),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.contactName,
                                        style: GoogleFonts.poppins(),
                                      ),
                                      Text(
                                        widget.contactNumber,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: TabBar(
                          tabAlignment: TabAlignment.start,
                          labelColor: const Color(0xFF0496C7),
                          indicatorPadding:
                              const EdgeInsets.all(0), // Selected label color
                          unselectedLabelColor:
                              const Color(0xFF0496C7), // Unselected label color
                          indicatorColor: const Color(0xFF0496C7),
                          dividerColor: Colors
                              .transparent, // No padding around the indicator
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 14, // Font size for selected label
                            fontWeight: FontWeight
                                .w400, // Font weight for selected label
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 14, // Font size for selected label
                            fontWeight: FontWeight
                                .w700, // Font weight for selected label
                          ),
                          indicatorWeight: 2.0,
                          isScrollable: true,
                          controller: _tabController,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          tabs: List.generate(
                              widget.circleList.first.plansInfo
                                      ?.map((e) => e.planName)
                                      .toSet()
                                      .length ??
                                  0, (i) {
                            return Tab(
                                text: widget.circleList.first.plansInfo
                                        ?.map((e) => e.planName)
                                        .toSet()
                                        .toList()[i] ??
                                    "");
                          })),
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: List.generate(
                              widget.circleList.first.plansInfo
                                      ?.map((e) => e.planType)
                                      .toSet()
                                      .length ??
                                  0, (i) {
                            return ListView.builder(
                                itemCount: widget.circleList.first.plansInfo
                                    ?.where((element) =>
                                        element.planType ==
                                        (widget.circleList.first.plansInfo
                                            ?.map((e) => e.planType)
                                            .toSet()
                                            .toList()[i]))
                                    .length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              ProceedToPayWithRechargePlan(
                                                circleList: widget.circleList,
                                                planDesc: (widget.circleList
                                                            .first.plansInfo
                                                            ?.where((element) =>
                                                                element
                                                                    .planType ==
                                                                (widget.circleList
                                                                    .first.plansInfo
                                                                    ?.map((e) =>
                                                                        e.planType)
                                                                    .toSet()
                                                                    .toList()[i])))
                                                        ?.toList()[index]
                                                        .packageDescription ??
                                                    "",
                                                price:
                                                    "₹ ${(widget.circleList.first.plansInfo?.where((element) => element.planType == (widget.circleList.first.plansInfo?.map((e) => e.planType).toSet().toList()[i])))?.toList()[index].price ?? "0"}",
                                                planType: (widget.circleList
                                                            .first.plansInfo
                                                            ?.where((element) =>
                                                                element
                                                                    .planType ==
                                                                (widget.circleList
                                                                    .first.plansInfo
                                                                    ?.map((e) =>
                                                                        e.planType)
                                                                    .toSet()
                                                                    .toList()[i])))
                                                        ?.toList()[index]
                                                        .planType ??
                                                    "",
                                                validity: (widget.circleList
                                                            .first.plansInfo
                                                            ?.where((element) =>
                                                                element
                                                                    .planType ==
                                                                (widget.circleList
                                                                    .first.plansInfo
                                                                    ?.map((e) =>
                                                                        e.planType)
                                                                    .toSet()
                                                                    .toList()[i])))
                                                        ?.toList()[index]
                                                        .validity ??
                                                    "",
                                                talkTime: (widget.circleList
                                                            .first.plansInfo
                                                            ?.where((element) =>
                                                                element
                                                                    .planType ==
                                                                (widget.circleList
                                                                    .first.plansInfo
                                                                    ?.map((e) =>
                                                                        e.planType)
                                                                    .toSet()
                                                                    .toList()[i])))
                                                        ?.toList()[index]
                                                        .talkTime ??
                                                    "",
                                                contactName: widget.contactName,
                                                contactNumber:
                                                    widget.contactNumber,
                                              ));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 16, right: 16, top: 16),
                                          padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              top: 8,
                                              bottom: 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                kDefaultPadding),
                                            color: kOtherColor,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: kTextLightColor,
                                                blurRadius: 2.0,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Validity",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              kHalfSizedBox,
                                                              Text(
                                                                (widget.circleList.first.plansInfo?.where((element) =>
                                                                        element
                                                                            .planType ==
                                                                        (widget
                                                                            .circleList
                                                                            .first
                                                                            .plansInfo
                                                                            ?.map((e) =>
                                                                                e.planType)
                                                                            .toSet()
                                                                            .toList()[i])))?.toList()[index].validity ??
                                                                    "",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall!
                                                                    .copyWith(
                                                                      color:
                                                                          kTextBlackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 25),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "TalkTime",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              kHalfSizedBox,
                                                              Text(
                                                                (widget.circleList.first.plansInfo?.where((element) =>
                                                                        element
                                                                            .planType ==
                                                                        (widget
                                                                            .circleList
                                                                            .first
                                                                            .plansInfo
                                                                            ?.map((e) =>
                                                                                e.planType)
                                                                            .toSet()
                                                                            .toList()[i])))?.toList()[index].talkTime ??
                                                                    "",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall!
                                                                    .copyWith(
                                                                      color:
                                                                          kTextBlackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                    ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            border: Border.all(
                                                                color: const Color(
                                                                        0xFF0080FF)
                                                                    .withOpacity(
                                                                        0.7),
                                                                width: 1)),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6),
                                                          alignment:
                                                              Alignment.center,
                                                          constraints:
                                                              const BoxConstraints(),
                                                          child: Text(
                                                            " ₹ ${(widget.circleList.first.plansInfo?.where((element) => element.planType == (widget.circleList.first.plansInfo?.map((e) => e.planType).toSet().toList()[i])))?.toList()[index].price ?? ""} ",
                                                            style: TextStyle(
                                                              color: const Color(
                                                                      0xFF0080FF)
                                                                  .withOpacity(
                                                                      0.7),
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                "Data: ${(widget.circleList.first.plansInfo?.where((element) => element.planType == (widget.circleList.first.plansInfo?.map((e) => e.planType).toSet().toList()[i])))?.toList()[index].packageDescription ?? ""}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      fontSize: 12,
                                                      color:
                                                          Colors.grey.shade500,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  );
                                });
                          })),
                    )
                  ],
                ),
              ),
            ) /*Scaffold(
      backgroundColor: Colors.white,
        appBar: const AppBarWidget(
          title: "Select a recharge plan",
          size: 55,
        ),
        body: Column(
      children: [
        Text(
          "Recharges",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        widget.circleList.isNotEmpty?   Expanded(
          child: ListView.builder(
              itemCount: widget.circleList?.first.plansInfo?.length,
              itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin:EdgeInsets.symmetric(horizontal: 15,vertical:10),

                    decoration: BoxDecoration(
                      color: getRandomColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:8),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 15,vertical:5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                              widget.circleList.first.plansInfo?[index].planType??"",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                  onTap:(){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ProceedToPayWithRechargePlan(
                                            planDesc: widget.circleList.first.plansInfo?[index].packageDescription??"",
                                          price:"₹ ${widget.circleList.first.plansInfo?[index].price??""}",
                                          planType:  widget.circleList.first.plansInfo?[index].planType??"" ,
                                          validity: widget.circleList.first.plansInfo?[index].validity??"" ,
                                        )));
                                  },
                                  child: Icon(Icons.arrow_forward_ios,size:16))
                            ],
                          ),
                        ),
                        Divider(color:Colors.black.withOpacity(0.1)),
                        SizedBox(height:8),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "₹ ${widget.circleList.first.plansInfo?[index].price??""}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:5),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 15,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Validity",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                widget.circleList.first.plansInfo?[index].validity??"",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:10),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 15,),
                          child: Text(
                            widget.circleList.first.plansInfo?[index].packageDescription??"",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height:15),

                     */ /*   Padding(
            padding:EdgeInsets.symmetric(horizontal: 15,vertical:10),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                height: 40,
                                width:100,

                                decoration: BoxDecoration(
                                  color: Color(0xff1877F2).withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child:  Center(
                                  child: Text(
                                    "Recharge",
                                    style: TextStyle(
                                        color:Color(0xff1877F2),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )*/ /*
                      ],
                    )),
                SizedBox(height: 10),
              ],
            );
          }),
        ):Container(child:Center(child:Text("No recharge plan yet!!")))
      ],
    ))*/
            );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1.0, // Opacity
    );
  }
}
