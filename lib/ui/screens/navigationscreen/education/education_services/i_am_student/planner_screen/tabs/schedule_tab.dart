import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';



final List<TaskStep> steps = [
  TaskStep(time: '08:30 pm', duration: '25 minutes', title: 'Task 1'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '08:30 pm', duration: '25 minutes', title: 'Task 3'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 3'),
  TaskStep(time: '08:30 pm', duration: '25 minutes', title: 'Task 3'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
  TaskStep(time: '09:00 pm', duration: '30 minutes', title: 'Task 2'),
];

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({
    super.key,
    required this.steps,
  });

  final List<TaskStep> steps;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stepper(
        currentStep: 0,
        controlsBuilder: (context, details) {
          return const SizedBox();
        },
        elevation: 10,
        physics: const ClampingScrollPhysics(),
        type: StepperType.vertical,
        steps: steps
            .map(
              (step) => Step(
            isActive: true,
            title: Row(
              children: [
                Text(
                  step.time,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18.0),
                ),
                const Spacer(),
                Text(
                  step.duration,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0),
                ),
              ],
            ),
            content: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    width: 1, color: Colors.grey),
              ),
              child: const Text(
                'This is my first time using Stepper widget',
                style: TextStyle(
                  color: ThemeColors.darkBlueColor,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}

class TaskStep {
  String time;
  String duration;
  String title;

  TaskStep({required this.time, required this.duration, required this.title});
}