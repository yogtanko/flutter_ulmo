import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ulmo/config/constants.dart';
import 'package:flutter_ulmo/domain/datasources/dump.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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

  _favoriteSwitch(index) {
    popularItem[index].isFavorite = !popularItem[index].isFavorite;
  }

  _popular(index) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          //image
          Stack(
            children: [
              Image(
                image: AssetImage(popularItem[index].imgPath[0]),
              ),
              popularItem[index].isNew
                  ? Container(
                      width: 46,
                      height: 24,
                      margin: const EdgeInsets.only(left: 8, top: 10),
                      decoration: BoxDecoration(
                        color: charizard[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "new",
                          style: b2Medium,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 8),
          //row of price and favorited
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                popularItem[index].itemPrice,
                style: b1Medium,
              ),
              GestureDetector(
                onTap: () => _favoriteSwitch(index),
                child: Icon(
                  popularItem[index].isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          //description
          Text(
            popularItem[index].itemDescription,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: b3Regular.copyWith(color: giratina[500]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categoryData.length,
                    itemBuilder: (context, index) => _categories(index),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              //Popular Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Popular",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 16),
              //Popular item
              SizedBox(
                child: Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shrinkWrap: true,
                    itemCount: popularItem.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 164 / 268,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => _popular(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
