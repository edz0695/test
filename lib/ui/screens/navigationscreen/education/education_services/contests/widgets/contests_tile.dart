import 'package:get/get.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../../../src/src.dart';
import 'all_contest_screen.dart';

class ContestsTile extends StatefulWidget {
  const ContestsTile({super.key});

  @override
  State<ContestsTile> createState() => _ContestsTileState();
}

class _ContestsTileState extends State<ContestsTile> {
  @override
  void initState() {
    super.initState();
    final contestProvider =
        Provider.of<EductionFormProvider>(context, listen: false);
    contestProvider.getContests();
    contestProvider.isLoadingCategorised = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EductionFormProvider>(
      builder: (context, contestProvider, child) {
        return Scaffold(
          appBar: const AppBarWidget(title: "All Contests", size: 50),
          body: contestProvider.isLoadingCategorised
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: contestProvider.contestlist.length,
                  itemBuilder: (context, index) {
                    final contest = contestProvider.contestlist[index];
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
                                          Constants.forImg + contest.logo))),
                              height(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      contest.title,
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
                                          AllContests(title: contest.title)),
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
