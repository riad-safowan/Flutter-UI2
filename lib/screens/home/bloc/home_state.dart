part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  List<String> bannerImages = [
    'assets/demo_images/banner1.png',
    'assets/demo_images/banner2.png',
    'assets/demo_images/banner3.png'
  ];

  List<MenuOption> menuOptions = [
    MenuOption("assets/app_icons/glass_categories.svg", "Categories"),
    MenuOption("assets/app_icons/glass_love.svg", "Anonder Jhor"),
    MenuOption("assets/app_icons/glass_plane.svg", "Eid Anondo"),
    MenuOption("assets/app_icons/glass_cards.svg", "Gift Card"),
    MenuOption("assets/app_icons/glass_cart.svg", "Anondo Mela")
  ];

  List<CategoryItem> categories = [
    CategoryItem(
        imgUrl: 'assets/demo_images/category1.png',
        name: "Groceries",
        discount: -20),
    CategoryItem(
        imgUrl: "assets/demo_images/category2.png",
        name: "Laptop & Computerothing",
        discount: -20),
    CategoryItem(
        imgUrl: "assets/demo_images/category3.png",
        name: "Life style",
        discount: -20),
    CategoryItem(
        imgUrl: "assets/demo_images/category4.png",
        name: "Mom And Babys",
        discount: -20),
    CategoryItem(
        imgUrl: "assets/demo_images/category5.png",
        name: "Automotive & Motorbike",
        discount: -20),
    CategoryItem(
        imgUrl: "assets/demo_images/category6.png",
        name: "Phones & Tablets",
        discount: -20),
    CategoryItem(
        imgUrl: "assets/demo_images/category7.png",
        name: "Tourism",
        discount: -20),
    CategoryItem(
        imgUrl: "assets/demo_images/category8.png",
        name: "Media,Music & Books",
        discount: -20),
  ];

  @override
  List<Object> get props => [bannerImages, menuOptions, categories];
}
