import 'package:flutter/material.dart';
import 'package:payapp/models/batch_model.dart';
import 'package:payapp/services/apis/apiservice.dart';
import 'package:provider/provider.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/ui/dialogs/loaderdialog.dart';

class TutorBatchTile extends StatelessWidget {
  final BatchModel batch;

  const TutorBatchTile({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          '${batch.subject} (${batch.classes}) ',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start Date: ${batch.start_date.toString()}',
              style: TextStyle(color: Colors.blue.shade900),
            ),
            Text(
              'End Date: ${batch.end_date.toString()}',
              style: TextStyle(color: Colors.blue.shade900),
            ),
            Text(
              'Start Time: ${batch.start_time}',
              style: TextStyle(color: Colors.blue.shade900),
            ),
            Text(
              'End Time: ${batch.end_time}',
              style: TextStyle(color: Colors.blue.shade900),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showLoaderDialog(context);
                    final loginSignUpProvider =
                        Provider.of<LoginSignUpProvider>(context,
                            listen: false);
                    Map<String, dynamic> data = {
                      "type":"cart",
                      "obj_type":"course",
                      "user_id": loginSignUpProvider.userModel!.id,
                      "obj_id": batch.id,
                    };
                    ApiService.submitToCart(data: data)
                        .then((value) {
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    })
                        .onError((error, stackTrace) {
                      Navigator.pop(context);
                    });


                    // Handle add to cart action
                  },
                  child: const Text('Add to Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showLoaderDialog(context);
                    final loginSignUpProvider =
                        Provider.of<LoginSignUpProvider>(context,
                            listen: false);
                    Map<String, dynamic> data = {
                      "type":"wishlist",
                      "obj_type":"course",
                      "user_id": loginSignUpProvider.userModel!.id,
                      "obj_id": batch.id,
                    };
                    ApiService.submitToCart(data: data)
                        .then((value) {
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    })
                        .onError((error, stackTrace) {
                      Navigator.pop(context);
                    });
                    // Handle add to wishlist action
                  },
                  child: const Text('Add to Wishlist'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle join now action
                  },
                  child: const Text('Join Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
