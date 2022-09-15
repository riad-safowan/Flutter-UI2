import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_design/screens/home/models/CategoryCart.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        double sWidth = constraints.maxWidth;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: menuItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    if (onClicked != null) onClicked!(item.name);
                  },
                  child: SizedBox(
                    width: sWidth / menuItems.length,
                    child: Column(
                      children: [
                        Container(
                          constraints:
                              const BoxConstraints(maxWidth: 50, maxHeight: 50),
                          child: SvgPicture.asset(
                            item.imageUrl,
                            width: sWidth * .45 / menuItems.length,
                            height: sWidth * .45 / menuItems.length,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
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
                      padding: const EdgeInsets.symmetric(horizontal: 13),
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

class CategoriesGrid extends StatelessWidget {
  final List<CategoryItem> categories ;

  const CategoriesGrid({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemCount: categories.length,
        builder: (BuildContext context, int index) => CategoryCart(
              cart: categories[index],
            ));
  }
}

class CategoryCart extends StatelessWidget {
  final CategoryItem cart;

  const CategoryCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                cart.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFF0000),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Text(
              '${cart.discount} %',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            height: 40,
            child: Center(
              child: Text(
                cart.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF3A494E), fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// return LayoutBuilder(builder: (context, constraints) {
// double width = constraints.maxWidth;
// return Placeholder();
// });
