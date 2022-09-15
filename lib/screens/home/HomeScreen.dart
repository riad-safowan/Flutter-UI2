import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:ui_design/screens/home/models/MenuOption.dart';
import 'dart:developer' as dev;

import 'package:ui_design/screens/home/widgets/Widgets.dart';

typedef OnClick = void Function();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double sWidth;

  @override
  Widget build(BuildContext context) {
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SizedBox(
              width: sWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileAvatar(
                      imgUrl: 'assets/demo_images/profile_image.png',
                      onClick: () {
                        dev.log('profile avatar clicked');
                      }),
                  SearchBar(
                    onTextChanged: (s) {
                      dev.log('text updated: $s');
                    },
                    onSearchBtnClicked: (s) {
                      dev.log('search text: $s');
                    },
                  ),
                  appBarNotificationButton(onClick: () {
                    dev.log('notification button clicked');
                  }),
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            HomeBanner(
                imgUrls: const [
                  'assets/demo_images/banner1.png',
                  'assets/demo_images/banner2.png',
                  'assets/demo_images/banner3.png'
                ],
                onClicked: (url) {
                  dev.log('banner image clicked: $url');
                }),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6, top: 25),
              child: HomeMenuOptions(
                menuItems: [
                  MenuOption(
                      "assets/app_icons/glass_categories.svg", "Categories"),
                  MenuOption("assets/app_icons/glass_love.svg", "Anonder Jhor"),
                  MenuOption("assets/app_icons/glass_plane.svg", "Eid Anondo"),
                  MenuOption("assets/app_icons/glass_cards.svg", "Gift Card"),
                  MenuOption("assets/app_icons/glass_cart.svg", "Anondo Mela")
                ],
                onClicked: (name) {
                  dev.log('menu option clicked: $name');
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 18),
                child: columnTitleBar(title: 'Anondo by Category')),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: CategoriesGrid(),
            )
          ],
        ),
      ),
    );
  }

  Container appBarNotificationButton({OnClick? onClick}) {
    return Container(
        width: 24,
        height: 24,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: GestureDetector(
          onTap: onClick,
          child: Badge(
              badgeContent:
                  const Text("3", style: TextStyle(color: Colors.white)),
              badgeColor: const Color(0xFFFF0000),
              position: BadgePosition.topEnd(top: -10, end: -6),
              elevation: 0,
              toAnimate: false,
              child:
                  SvgPicture.asset("assets/app_icons/notification_bell.svg")),
        ));
  }

  Container profileAvatar({String? imgUrl, OnClick? onClick}) {
    return Container(
        width: 35,
        height: 35,
        margin: const EdgeInsets.only(right: 12, left: 14),
        child: GestureDetector(
            onTap: onClick,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                imgUrl!,
                fit: BoxFit.cover,
              ),
            )));
  }
}

SizedBox columnTitleBar({required String title}) {
  return SizedBox(
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 12,
          height: 40,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFFF0000),
                  Color(0xFFFBA533),
                ],
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  bottomRight: Radius.circular(3))),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF3A494E),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}
