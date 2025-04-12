import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'your_provider.dart';
import '../../../../../../provider/education_providers/education_provider.dart';

class TubeCategoriesList extends StatelessWidget {
  const TubeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    // final yourProvider = Provider.of<YourProvider>(context);
    final tubeProvider = Provider.of<EductionFormProvider>(context,listen: false);
    // tubeProvider.getTubes();
    tubeProvider.getTubesCat();
    tubeProvider.isLoadingCategorised = true;
    
     return Wrap(
      spacing: 5,
      children: tubeProvider.tubecate
          .map((category) => FilterChip(
                showCheckmark: false,
                label: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.grey.shade200,
                selectedColor: Colors.grey.shade600,
                selected: false,
                onSelected: (bool value) {},
              ))
          .toList(),
    );
  }
}
