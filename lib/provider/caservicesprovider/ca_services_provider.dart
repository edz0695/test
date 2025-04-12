import 'package:flutter/material.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/models/ca_models/paymentdata.dart';
import 'package:payapp/models/caservicemodel.dart';
import 'package:payapp/services/apis/apiservice.dart';
import '../../models/ca_models/home_services_model.dart';
import '../../models/cacategorise_services.dart';
import '../../services/apis/remote_services/remote_ca_sservices/remote_ca_services.dart';

class CaServicesProvider extends ChangeNotifier {
  CaServiceModel services = CaServiceModel(
    id: '',
    title: 'title',
    description: 'description',
    trainingVideo: 'trainingVideo',
    categories: [],
    bannerImage: [],
  );
  List<paymentdataModel> servicespaymentList = [
    paymentdataModel(
        type: false,
        required: "amr alaa ali",
        lable: "no labale till now",
        id: "01011577033")
  ];
  bool isLoading = false;
  bool isLoadingForm = false;
  bool isLoadingCategorised = false;
  List<CaCategoriseServiceModel> categoriseServices = [];

  bool visible = false;
  final List formFields = [];

  //*********************************************************************************
  //*********************************************************************************

  bool isLoadingCAHOmeServices = false;
  List<CAHomeServicesModel> cAHomeServices = [];

  Future<List<CAHomeServicesModel>> getCAHomeServices() async {
    isLoadingCAHOmeServices = true;
    cAHomeServices = await RemoteCAServices.fetchCAHomeServices();

    isLoadingCAHOmeServices = false;
    printThis(
        "++++++++++++++++++++++ca servicesss done +++++++++++++++++++++++++++++");
    notifyListeners();
    return cAHomeServices;
  }

  //*********************************************************************************
  //*********************************************************************************

  CaServicesProvider() {
    isLoading = true;
    getServices();
  }

  Future<CaServiceModel?> getServices() async {
    try {
      final servicesTemp = await ApiService.fetchAllCaServices();
      final servicespayments = await ApiService.FRequreddata();
      services = servicesTemp;
      servicespaymentList = servicespayments;
      isLoading = false;
      notifyListeners();
      return services;
    } catch (e) {
      printThis("Something went wrong in Payment $e");
    }
    return null;
  }

  Future<List<CaCategoriseServiceModel>> getCategoriseServices(
      {required String id}) async {
    categoriseServices = await ApiService.fetchAllCategoriseServices(id: id);
    isLoadingCategorised = false;
    notifyListeners();
    return categoriseServices;
  }

  

  void visibilityOfVideo() {
    visible = !visible;
    notifyListeners();
  }
}
