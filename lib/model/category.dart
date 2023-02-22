import 'package:getx_ecommerce/core/resources/images_manager.dart';

class Category {
  int id;
  String categoryImg;
  String categoryName;
  Category({
    required this.id,
    required this.categoryName,
    required this.categoryImg,
  });
}

List<Category> categories = [
  Category(
    id: 1,
    categoryName: 'Men',
    categoryImg: ImagesManager.men,
  ),
  Category(
    id: 2,
    categoryName: 'Women',
    categoryImg: ImagesManager.women,
  ),
  Category(
    id: 3,
    categoryName: 'Devices',
    categoryImg: ImagesManager.devices,
  ),
  Category(
    id: 4,
    categoryName: 'Gadgets',
    categoryImg: ImagesManager.gadgets,
  ),
  Category(
    id: 5,
    categoryName: 'Gaming',
    categoryImg: ImagesManager.gaming,
  ),
];
