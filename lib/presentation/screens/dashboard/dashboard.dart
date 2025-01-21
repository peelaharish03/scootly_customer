import 'package:flutter/material.dart';
import 'package:scootly_customer/core/constants/img_const.dart';
import 'package:scootly_customer/widgets/slider_widget.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen();

  final List<Map<String, String>> items = [
    {'name': 'Insurance', 'icon': INSURANCE},
    {'name': 'Pollution', 'icon': POLLUTION},
    {'name': 'Water Wash', 'icon': WATERWASH},
    {'name': 'Rto Service', 'icon': RTO},
    {'name': 'Finance', 'icon': FINANCE},
    {'name': 'Re-Finance', 'icon': RE_FINANCE},
    {'name': 'Sale-old vehicle', 'icon': SALE_OLD},
    {'name': 'Buy-New vehicle', 'icon': BUY_CAR},
    {'name': 'Buy-Old vehicle', 'icon': SALE_OLD},
    {'name': 'Petrol', 'icon': PETROL},
    {'name': 'Garage', 'icon': GARAGE},
    {'name': 'Shopping', 'icon': SHOPPING},
    {'name': 'Spares', 'icon': SPARES},
    {'name': 'E-commers', 'icon': ECOMMERS},
    {'name': 'Upcoming Produts', 'icon': PRODUCTS},
    {'name': 'Settings', 'icon': SETTINGS},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Icon(Icons.person_outline_outlined),
              ],
            ),
          ),
          SliderWidget(),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   child: Text(
          //     'Dashboard Items',
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: ClipOval(
                          child: Container(
                            color: Colors.blueAccent,
                            child: Image.asset(
                              items[index]['icon']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        items[index]['name']!,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
