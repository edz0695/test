import 'package:payapp/ui/screens/navigationscreen/education/education_services/notes/tabs/short_note_tab.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/notes/tabs/video_note_tab.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:payapp/widgets/tabs_bar_design.dart';

import '../../../../../../src/src.dart';

class NotesMainScreen extends StatefulWidget {
  const NotesMainScreen({
    super.key,
    required this.classNumber,
    required this.chapterId,
    required this.subject,
    required this.chapter,
  });

  final String classNumber;
  final String chapterId;
  final String subject;
  final String chapter;

  @override
  State<NotesMainScreen> createState() => _NotesMainScreenState();
}

class _NotesMainScreenState extends State<NotesMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarWidget(title: 'Notes', size: 55),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notes for ${widget.classNumber},\n${widget.subject}, ${widget.chapter}.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ThemeColors.blueAccent,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTabsBar(
                    tabs: [
                      Tab(
                        text: "Short Notes",
                      ),
                      Tab(
                        text: "Video Notes",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: TabBarView(
                    children: [
                      ShortNotesTab(
                      
                        chapterId: widget.chapterId,
                      ),
                      VideoNotesTab(
                        chapterId: widget.chapterId,
                      ),
                    ],
                  )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
