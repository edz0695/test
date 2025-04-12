import 'package:get/get.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../../../src/src.dart';
import '../screens/scholarship_result_screen.dart';

class SambhavScholarshipsListWidget extends StatefulWidget {
  const SambhavScholarshipsListWidget({super.key});

  @override
  State<SambhavScholarshipsListWidget> createState() =>
      _SambhavScholarshipsListWidgetState();
}

class _SambhavScholarshipsListWidgetState
    extends State<SambhavScholarshipsListWidget> {
  @override
  void initState() {
    super.initState();
    final scholarshipProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    scholarshipProvider.getScholarships();
    scholarshipProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
      builder: (context, scholarshipProvider, child) {
        return Scaffold(
          appBar: const AppBarWidget(title: "All Scholarships", size: 50),
          body: scholarshipProvider.isLoadingCategorised
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: scholarshipProvider.scholarshipList.length,
                  itemBuilder: (context, index) {
                    final scholarShip =
                        scholarshipProvider.scholarshipList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Card(
                                  shape: const StadiumBorder(),
                                  child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          Constants.forImg +
                                              scholarShip.logo))),
                              height(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      scholarShip.title,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo),
                                      onPressed: () => Get.to(() =>
                                          SambhavScholarshipsResults(
                                              title: scholarShip.title)),
                                      child: const Text(
                                        "View All",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
