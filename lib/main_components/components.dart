import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'colors.dart';

//------------------------AppBar-----------------------------------

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: color3,
      title: Text(
        widget.title,
        style: const TextStyle(color: color1),
      ),
    );
  }
}

//----------------------BottomBar---------------------------------

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: color4,
      notchMargin: 5,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: color1,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.cloudy_snowing,
              color: color1,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.wb_cloudy_outlined,
              color: color1,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.wb_cloudy,
              color: color1,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

//-----------------SVG Pictures-----------------------------

Widget mySvg(String iconName) {
  return SvgPicture.asset('assets/icons/$iconName.svg');
}

Widget mySvgSized(String iconName, double? iconWidth, double? iconHeight) {
  return SvgPicture.asset('assets/icons/$iconName.svg',
      width: iconWidth, height: iconHeight);
}

Widget mySvgSizedColor(
    String iconName, double? iconWidth, double? iconHeight, Color? color) {
  return SvgPicture.asset(
    'assets/icons/$iconName.svg',
    width: iconWidth,
    height: iconHeight,
    color: color ?? Colors.white,
  );
}
