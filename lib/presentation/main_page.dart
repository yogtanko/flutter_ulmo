import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ulmo/config/constants.dart';
import 'package:flutter_ulmo/domain/models/category_model.dart';
import 'package:flutter_ulmo/domain/models/story_model.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

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

  _storiesItem(index) {
    return GestureDetector(
      onTap: () {
        log(index.toString());
      },
      child: Container(
        width: 88,
        height: 88,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(storyData[index].imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  black,
                  black.withOpacity(0),
                ],
              ),
            ),
            child: Text(
              storyData[index].text,
              style: b3Medium.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  _categories(index) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.only(left: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: giratina[100],
        image: DecorationImage(
          alignment: Alignment.centerRight,
          image: AssetImage(categoryData[index].imgPath),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryData[index].title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _popular(index) {
    return Container(
      width: 100,
      height: 100,
      color: venusaur,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              //Title
              const Center(
                child: Text('ulmo', style: h1Semibold),
              ),
              const SizedBox(height: 16),

              //Search bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: giratina[100],
                ),
                child: TextField(
                  cursorColor: giratina[500],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: giratina[500]),
                    hintText: "Search",
                    icon: Icon(
                      Icons.search,
                      color: giratina[500],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              //Stories
              SizedBox(
                height: 88,
                child: Expanded(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: storyData.length,
                    itemBuilder: (context, index) => _storiesItem(index),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              //Categories
              SizedBox(
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categoryData.length,
                    itemBuilder: (context, index) => _categories(index),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              //Popular item
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Popular",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
