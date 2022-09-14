import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/MenuOption.dart';

class SearchBar extends StatelessWidget {
  final void Function(String)? onTextChanged;
  final void Function(String)? onSearchBtnClicked;

  late String text;

  SearchBar({Key? key, this.onTextChanged, this.onSearchBtnClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xFFFF0000)),
            borderRadius: const BorderRadius.all(Radius.circular(50.0))),
        width: double.infinity,
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: TextField(
                      onChanged: (s) {
                        text = s;
                        if (onSearchBtnClicked != null) {
                          onTextChanged!(s);
                        }
                      },
                      cursorColor: const Color(0xFFFF0000),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 15, bottom: 10, right: 15),
                        hintText: 'bicycle gear',
                      ),
                    ))),

            //search button
            GestureDetector(
              onTap: () {
                if (onSearchBtnClicked != null && text.isNotEmpty) {
                  onSearchBtnClicked!(text);
                }
              },
              child: Container(
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
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                child: Center(
                    child:
                        SvgPicture.asset("assets/app_icons/search_button.svg")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeMenuOptions extends StatelessWidget {
  final List<MenuOption> menuItems;
  final void Function(String optionName)? onClicked;

  const HomeMenuOptions({
    Key? key,
    required this.menuItems,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menuItems.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  if (onClicked != null) onClicked!(item.name);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      item.imageUrl,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(item.name)
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final List<String> imgUrls;
  final void Function(String url)? onClicked;

  const HomeBanner({
    Key? key,
    required this.imgUrls,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider(
        items: imgUrls.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  if (onClicked != null) onClicked!(url);
                },
                child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          url,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              );
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
    );
  }
}
