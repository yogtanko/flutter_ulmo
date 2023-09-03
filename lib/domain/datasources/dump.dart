import 'package:flutter_ulmo/domain/models/category_model.dart';
import 'package:flutter_ulmo/domain/models/item_model.dart';
import 'package:flutter_ulmo/domain/models/story_model.dart';

final List<StoryModel> storyData = [
  StoryModel("assets/img/s1.png", "best of 2020"),
  StoryModel("assets/img/s2.png", "the golden hour"),
  StoryModel("assets/img/s3.png", "lovely kitchen"),
  StoryModel("assets/img/s4.png", "summer choice"),
];

final List<CategoryModel> categoryData = [
  CategoryModel("bedroom", 'assets/img/c1.png'),
  CategoryModel("living room", 'assets/img/c2.png'),
  CategoryModel("kitchen", 'assets/img/c3.png'),
  CategoryModel("dining", 'assets/img/c4.png'),
  CategoryModel("bathroom", 'assets/img/c5.png'),
];

final List<ItemModel> popularItem = [
  ItemModel(0, ['assets/img/p1.png'], "\$150.00",
      "Wooden bedside table featuring a raised design on the door",
      isNew: true, isFavorite: true),
  ItemModel(1, ['assets/img/p2.png'], "\$149.99",
      "Chair made of ash wood sourced from responsible craftmanship"),
  ItemModel(2, ['assets/img/p3.png'], "\$140.25",
      "Square bedside table with legs, a rattan shelf and a sleek, marble tabletop"),
  ItemModel(3, ['assets/img/p4.png'], "\$450.00",
      "Dark wood side board with a faceted drawer"),
];
