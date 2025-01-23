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
    {'name': 'Rto Service', 'icon': RTO},
    {'name': 'Finance', 'icon': FINANCE},
    {'name': 'Re-Finance', 'icon': RE_FINANCE},
    {'name': 'Shopping', 'icon': SHOPPING},
    {'name': 'E-commers', 'icon': ECOMMERS},
    {'name': 'Upcoming Products', 'icon': PRODUCTS},
  ];

  final List<Map<String, String>> itemList = [
    {'name': 'Water Wash', 'icon': WATERWASH},
    {'name': 'Sale-old vehicle', 'icon': SALE_OLD},
    {'name': 'Buy-New vehicle', 'icon': BUY_CAR},
    {'name': 'Buy-Old vehicle', 'icon': SALE_OLD},
    {'name': 'Petrol', 'icon': PETROL},
    {'name': 'Garage', 'icon': GARAGE},
    {'name': 'Spares', 'icon': SPARES},
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
              decoration: BoxDecoration(color: AppColor.green),
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
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
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
        children: [
          CustomTopBar(
            title: '',
            showBackIcon: false,
            showMenuIcon: true,
            showSearchBar: false,
            showFilterIcon: true,
            showSkipText: false,
            onPressMenu: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SliderWidget(),
                  const SizedBox(height: 10),
                  _buildGrid(items),
                  const SizedBox(height: 10),
                  _buildGrid(itemList),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(List<Map<String, String>> itemList) {
    List<List<Map<String, String>>> rows = [];
    for (int i = 0; i < itemList.length; i += 4) {
      rows.add(itemList.sublist(
          i, i + 4 > itemList.length ? itemList.length : i + 4));
    }

    return Card(
      color: AppColor.green,
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: rows.length,
          itemBuilder: (context, rowIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: rows[rowIndex].map((item) {
                  return Expanded(
                    child: _buildGridItem(item),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: _scaffoldKey.currentContext!,
          builder: (context) => AlertDialog(
            title: Text(item['name']!),
            content: Text('You tapped on this ${item['name']!} tab.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
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
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: ClipOval(
              child: Container(
                color: AppColor.white,
                child: Image.asset(item['icon']!, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item['name']!,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
