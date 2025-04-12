import '../../../../../models/servicesCategoryModel.dart';

List<ServiceCategoryModel> servicesCategory = [
  ServiceCategoryModel(title: "Recharge Services", services: [
    ServiceModel(
        serviceName: "Mobile",
        svgIcon: 'assets/images/homescreen/servicesicons/mobile_recharge.svg',
        onTap: () {}),
    ServiceModel(
      serviceName: "Dth",
      svgIcon: 'assets/images/homescreen/servicesicons/dth.svg',
      serviceType: "dth",
    ),
    ServiceModel(
        serviceName: "Fastag",
        svgIcon: 'assets/images/homescreen/servicesicons/fastag.svg',
        serviceType: "fastag"),
    ServiceModel(
        serviceName: "Metro",
        svgIcon: 'assets/images/homescreen/servicesicons/metro.svg'),
    ServiceModel(
        serviceName: "DataCard",
        svgIcon: 'assets/images/homescreen/servicesicons/datacard.svg'),
  ]),
  ServiceCategoryModel(title: "Bill Payments", services: [
    ServiceModel(
        serviceName: "Electricity",
        svgIcon: 'assets/images/homescreen/servicesicons/electricity.svg',
        serviceType: 'electricity'),
    ServiceModel(
        serviceName: "Gas",
        svgIcon: 'assets/images/homescreen/servicesicons/gas.svg',
        serviceType: 'gas'),
    ServiceModel(
        serviceName: "Water",
        svgIcon: 'assets/images/homescreen/servicesicons/water.svg',
        serviceType: 'water'),
    ServiceModel(
        serviceName: "Broadband",
        svgIcon: 'assets/images/homescreen/servicesicons/broadband.svg',
        serviceType: 'broadband-postpaid'),
    ServiceModel(
        serviceName: "LandLine",
        svgIcon: 'assets/images/homescreen/servicesicons/landline.svg'),
    ServiceModel(
        serviceName: "Lpg Cylinder",
        svgIcon: 'assets/images/homescreen/servicesicons/lpg.svg',
        serviceType: 'lpg-gas'),
    ServiceModel(
        serviceName: "Piped Gas",
        svgIcon: 'assets/images/homescreen/servicesicons/gas.svg'),
    ServiceModel(
        serviceName: "Municipal Taxes",
        svgIcon: 'assets/images/homescreen/servicesicons/municipal.svg',
        serviceType: 'municipal-taxes'),
    ServiceModel(
        serviceName: "Cable Tv",
        svgIcon: 'assets/images/homescreen/servicesicons/cabletv.svg',
        serviceType: 'cable'),
    ServiceModel(
        serviceName: "Property Taxes",
        svgIcon: 'assets/images/homescreen/servicesicons/municipal.svg'),
    ServiceModel(
        serviceName: "Hospitals",
        svgIcon: 'assets/images/homescreen/servicesicons/hospitals.svg',
        serviceType: 'hospital'),
    ServiceModel(
        serviceName: "Fee Payment",
        svgIcon: 'assets/images/homescreen/servicesicons/feepayment.svg',
        serviceType: 'education'),
  ]),
  ServiceCategoryModel(title: "Financial Services", services: [
    ServiceModel(
        serviceName: 'Lic / Insurance',
        svgIcon: 'assets/images/homescreen/servicesicons/lic.svg',
        serviceType: 'insurance'),
    ServiceModel(
        serviceName: 'Loan',
        svgIcon: 'assets/images/homescreen/servicesicons/loanrepayment.svg',
        serviceType: 'loan'),
    ServiceModel(
        serviceName: 'Credit Card',
        svgIcon: 'assets/images/homescreen/servicesicons/creditcard.svg',
        serviceType: 'credit-card'),
    ServiceModel(
        serviceName: 'Emi Payments',
        svgIcon: 'assets/images/homescreen/servicesicons/loanrepayment.svg'),
  ]),
  ServiceCategoryModel(title: "Purchase Services", services: [
    ServiceModel(
      serviceName: "Gift Card",
      svgIcon: 'assets/images/homescreen/servicesicons/gift.svg',
    ),
    ServiceModel(
      serviceName: "Digital Gold",
      svgIcon: 'assets/images/homescreen/servicesicons/gift.svg',
    ),
    ServiceModel(
      serviceName: "Traffic Challan",
      svgIcon: 'assets/images/homescreen/servicesicons/challan.svg',
    ),
    ServiceModel(
      serviceName: "Google Play Recharge",
      svgIcon: 'assets/images/homescreen/servicesicons/playstore.svg',
    ),
    ServiceModel(
      serviceName: "Amazon E-Gift Card",
      svgIcon: 'assets/images/homescreen/servicesicons/amazon.svg',
    ),
  ]),
  ServiceCategoryModel(title: "Travel Services", services: [
    ServiceModel(
      serviceName: "Flight",
      svgIcon: 'assets/images/homescreen/servicesicons/flight.svg',
    ),
    ServiceModel(
      serviceName: "Hotel",
      svgIcon: 'assets/images/homescreen/servicesicons/hotel.svg',
    ),
    ServiceModel(
      serviceName: "Bus",
      svgIcon: 'assets/images/homescreen/servicesicons/bus.svg',
    ),
    ServiceModel(
      serviceName: "Car",
      svgIcon: 'assets/images/homescreen/servicesicons/car.svg',
    ),
    ServiceModel(
      serviceName: "Holidays",
      svgIcon: 'assets/images/homescreen/servicesicons/holidays.svg',
    ),
  ]),
];
