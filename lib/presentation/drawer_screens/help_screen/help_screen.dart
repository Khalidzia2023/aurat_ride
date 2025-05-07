import 'package:aurat_ride/widgets/custom_container.dart';
import 'package:aurat_ride/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, item) {
          return CustomContainer(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            borderRadius: BorderRadius.circular(12),
            bgColor: Colors.teal.shade300,
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              title: const Text(
                'Phone Number',
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                '+92 321********23',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
            ),
          );
        },
      ),
    );
  }
}
