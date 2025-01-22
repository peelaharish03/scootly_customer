import 'package:flutter/material.dart';
import 'package:scootly_customer/core/constants/colors.dart';
import 'package:scootly_customer/core/constants/img_const.dart';
import 'package:scootly_customer/widgets/custome_topbar.dart';
import 'package:scootly_customer/widgets/logout_cnfrm_sheet.dart';
import 'package:scootly_customer/widgets/slider_widget.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: AppColor.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Harish Peela',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'harishpeela03@gmail.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const LogOutCnfrmBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTopBar(
            title: '',
            showBackIcon: false,
            showMenuIcon: true,
            showSearchBar: false,
            showFilterIcon: true,
            showSkipText: false,
            onPressMenu: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          SliderWidget(),
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
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(items[index]['name']!),
                            content: Text(
                                'You tapped on this ${items[index]['name']!} tab.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Column(
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
                              color: AppColor.green,
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
                    ),
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
