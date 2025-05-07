import 'package:aurat_ride/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';


class CourierDeliveryScreen extends StatefulWidget {
  @override
  _CourierDeliveryScreenState createState() => _CourierDeliveryScreenState();
}

class _CourierDeliveryScreenState extends State<CourierDeliveryScreen> {

  String selectedVehicle = 'Motorcycle';


  Widget _vehicleSelector() {
    return Row(
      children: [
        ChoiceChip(
          label: Text('Motorcycle'),
          selected: selectedVehicle == 'Motorcycle',
          onSelected: (val) {
            setState(() {
              selectedVehicle = 'Motorcycle';
            });
          },
        ),
        SizedBox(width: 10),
        ChoiceChip(
          label: Text('Car'),
          selected: selectedVehicle == 'Car',
          onSelected: (val) {
            setState(() {
              selectedVehicle = 'Car';
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.mapImage),
          Positioned(
              top: 30,
              left: 10,
              child: CircleAvatar(
                  backgroundColor: AppColors.blueColor.withValues(alpha: 0.77),
                  child: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: Icon(Icons.arrow_left, color: Colors.white,),))),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  controller: scrollController, padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  shrinkWrap: true,
                  children: [
                    Text("Courier delivery", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    _vehicleSelector(),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'RB St',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.my_location, color: Colors.green,),

                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'To',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.location_on_outlined),
                        suffixIcon: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          label: Text("Add stops"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Order Details',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.receipt_long),
                        suffixIcon: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Offer Fare',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.monetization_on_rounded),
                        suffixIcon: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCCF100),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        // Add your logic here
                      },
                      child: Text("Find a courier", style: TextStyle(color: Colors.black)),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
