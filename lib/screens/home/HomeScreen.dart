import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_design/screens/home/models/MenuItem.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //profile image
                  Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(right: 12, left: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/demo_images/profile_image2.png'))),
                  ),

                  //Search bar
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      constraints: const BoxConstraints(maxWidth: 500),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xFFFF0000)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: const TextField(
                                    cursorColor: Color(0xFFFF0000),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 10, right: 15),
                                      hintText: 'bicycle gear',
                                    ),
                                  ))),

                          //search button
                          Container(
                            width: 50,
                            margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFFF0000),
                                    Color(0xFFFBA934),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Center(
                                child: SvgPicture.asset(
                                    "assets/app_icons/search_button.svg")),
                          )
                        ],
                      ),
                    ),
                  ),

                  //Notification
                  Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Badge(
                          badgeContent: const Text("3",
                              style: TextStyle(color: Colors.white)),
                          badgeColor: Color(0xFFFF0000),
                          position: BadgePosition.topEnd(top: -10, end: -6),
                          elevation: 0,
                          toAnimate: false,
                          child: SvgPicture.asset(
                              "assets/app_icons/notification_bell.svg"))),
                ],
              ))
        ],
      ),
      body: Column(
        children: [
          //banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: 12, left: 12, top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: CarouselSlider(
              items: const [
                'assets/demo_images/banner1.png',
                'assets/demo_images/banner2.png',
                'assets/demo_images/banner3.png'
              ].map((e) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          e,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 7 / 3,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
              ),
            ),
          ),

          //menu
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: menuItems.map((e) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        child: Column(
                      children: [
                        SvgPicture.asset(
                          e.imageUrl,
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(height: 10,),
                        Text(e.name)
                      ],
                    ));
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
