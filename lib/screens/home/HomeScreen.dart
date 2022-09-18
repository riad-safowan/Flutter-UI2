import 'package:flutter/material.dart';
import 'package:ui_design/screens/home/bloc/home_bloc.dart';
import 'package:ui_design/screens/home/models/CategoryCart.dart';
import 'dart:developer' as dev;

import 'package:ui_design/screens/home/widgets/Widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var blockProvider = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xE6FFFFFF),
        elevation: 0,
        actions: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileAvatar(
                      imgUrl: 'assets/demo_images/profile_image.png',
                      onClick: () {
                        blockProvider.add(
                            const ItemClicked(text: 'profile avatar clicked'));
                      }),
                  SearchBar(
                    onTextChanged: (s) {
                      dev.log('text updated: $s');
                    },
                    onSearchBtnClicked: (s) {
                      blockProvider.add(MakeSearch(query: s));
                    },
                  ),
                  appBarNotificationButton(onClick: () {
                    blockProvider.add(
                        const ItemClicked(text: 'notification button clicked'));
                  }),
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            if (state is HomeInitial) {
              return Column(
                children: [
                  const SizedBox(height: 20),
//Banner
                  HomeBanner(
                      imgUrls: state.bannerImages,
                      onClicked: (url) {
                        blockProvider.add(
                            ItemClicked(text: 'banner image clicked: $url'));
                      }),
                  //Menu option row
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 25),
                    child: HomeMenuOptions(
                      menuItems: state.menuOptions,
                      onClicked: (name) {
                        blockProvider.add(
                            ItemClicked(text: 'menu option clicked: $name'));
                      },
                    ),
                  ),
//Categories title
                  Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: columnTitleBar(title: 'Anondo by Category')),
//Categories
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 12, right: 12),
                    child: CategoriesGrid(categories: state.categories),
                  ),
//Flash Bazar widget
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                    child: FlashBazarWidget(flashes: [
                      state.flashes[0],
                      state.flashes[1],
                      state.flashes[2]
                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              );
            } else {
              return const Text('something went wrong');
            }
          },
        ),
      ),
    );
  }
}
