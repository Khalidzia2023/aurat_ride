import 'package:flutter/material.dart';

import '../../../../widgets/custom_container.dart';


class AboutAuratrideIndex extends StatelessWidget {
  const AboutAuratrideIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CustomContainer(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            borderRadius: BorderRadius.circular(12),
            bgColor: Colors.grey.shade300,
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              title: Text(
                'moreTopics[index]',
                style: TextStyle(fontSize: 14),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),

            ),
          );
        },
      ),
    );
  }
}