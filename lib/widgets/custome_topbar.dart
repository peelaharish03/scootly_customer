import 'package:flutter/material.dart';
import 'package:scootly_customer/core/constants/colors.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool showBackIcon;
  final bool showMenuIcon;
  final bool showSearchBar;
  final bool showFilterIcon;
  final bool showSkipText;
  final bool showEditText;
  final bool showCancelText;

  final VoidCallback? onEditTextPressed;
  final VoidCallback? onCancelTextPressed;
  final VoidCallback? onSkipTextPressed;
  final VoidCallback? onPressMenu;

  const CustomTopBar({
    super.key,
    required this.title,
    this.showBackIcon = false,
    this.showMenuIcon = false,
    this.showSearchBar = false,
    this.showFilterIcon = false,
    this.showSkipText = false,
    this.showEditText = false,
    this.showCancelText = false,
    this.onEditTextPressed,
    this.onCancelTextPressed,
    this.onSkipTextPressed,
    this.onPressMenu,
  });

  @override
  Size get preferredSize => Size.fromHeight(showSearchBar ? 120.0 : 60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.green,
      elevation: 0,
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColor.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      centerTitle: true,
      leading: showBackIcon || showMenuIcon
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showBackIcon)
                  IconButton(
                    icon: Image.asset('assets/images/Vector.png'),
                    onPressed: () => Navigator.pop(context),
                  ),
                if (showMenuIcon)
                  IconButton(icon: Icon(Icons.menu), onPressed: onPressMenu
                      // () {
                      //   Scaffold.of(context).openDrawer();
                      // },
                      ),
              ],
            )
          : null,
      actions: [
        if (showFilterIcon)
          IconButton(
            icon: Icon(Icons.person_outline_outlined),
            onPressed: () {},
          ),
        if (showEditText)
          TextButton(
            onPressed: onEditTextPressed,
            child: Text(
              'Edit',
              style: TextStyle(color: AppColor.white, fontSize: 13),
            ),
          ),
        if (showSkipText)
          TextButton(
            onPressed: onSkipTextPressed,
            child: Text(
              'Skip',
              style: TextStyle(color: AppColor.white, fontSize: 13),
            ),
          ),
        if (showCancelText)
          TextButton(
            onPressed: onCancelTextPressed ??
                () {
                  Navigator.pop(context);
                },
            child: Text(
              'Cancel',
              style: TextStyle(color: AppColor.white, fontSize: 16),
            ),
          ),
      ],
      bottom: showSearchBar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  color: AppColor.green,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image(
                              image: AssetImage('assets/images/search.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        hintText: 'Search by',
                        hintStyle: TextStyle(color: AppColor.greyText1),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
