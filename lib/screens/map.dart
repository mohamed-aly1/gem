import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://media.admiddleeast.com/photos/649b45182324a61a3b80798d/2:3/w_854,h_1281,c_limit/Grand%20Egyptian%20Museum%20Image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                    "https://i0.wp.com/byarchlens.com/wp-content/uploads/2021/04/%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1-8.png?w=621&ssl=1"),
                Image.network(
                    "https://www.propertyfinder.eg/blog/wp-content/uploads/2022/03/64054-%D8%A7%D9%84%D9%85%D9%88%D9%82%D8%B9-%D8%A7%D9%84%D8%B9%D8%A7%D9%85-%D9%84%D9%84%D9%85%D8%B4%D8%B1%D9%88%D8%B9-edited.jpeg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
