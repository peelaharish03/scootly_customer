// import 'package:flutter/material.dart';
// import 'package:scootly/widgets/permissions_service.dart';

// class PermissionRequest extends StatefulWidget {
//   @override
//   _PermissionRequestState createState() => _PermissionRequestState();
// }

// class _PermissionRequestState extends State<PermissionRequest> {
//   final PermissionService _permissionService = PermissionService();

//   @override
//   void initState() {
//     super.initState();
//     // Request permissions as soon as the widget is loaded
//     _requestPermissions();
//   }

//   // Request permissions
//   Future<void> _requestPermissions() async {
//     await _permissionService.requestPermissions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.shrink(); // No UI, just a permission request handler
//   }
// }
