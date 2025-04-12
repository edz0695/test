import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../models/jobModel.dart';
import 'icon_text.dart';

class JobItem extends StatefulWidget {
  const JobItem({super.key, required this.job, this.showTime = false, this.edit = false});

  final Job job;
  final bool showTime;
  final bool edit;

  @override
  State<JobItem> createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Image.asset(widget.job.logoUrl),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.job.company,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   widget.job.isMark = !widget.job.isMark;
                  //   // if(selected = true)
                  //   //   selected=false;
                  // });
                },
                child: SvgPicture.asset(
                      'assets/images/educationscreen/edit.svg',width: MediaQuery.of(context).size.width * 0.02,height: MediaQuery.of(context).size.width * 0.05,),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.job.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                  icon: Icons.location_on_outlined, text: widget.job.location),
              if (widget.showTime)
                IconText(
                    icon: Icons.access_time_outlined, text: widget.job.time)
            ],
          ),
        ],
      ),
    );
  }
}