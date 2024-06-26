import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const InfoPage({super.key, required this.data});

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
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 70, left: 15, right: 15, bottom: 25),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  data["url"],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: 
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Color(0xFF2B2B28),
                ),
                child: 
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(
                              data["name"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              data["details"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              maxLines: 100,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30.0, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFFE3B04B)),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  surfaceTintColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                onPressed: () async {
                                  
                                  Get.back();
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/qrCode.svg',
                                      width: 20,
                                    ),
                                    const Text('Scan Again',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF2B2B28))),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          vertical: 18, horizontal: 30)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFFE3B04B)),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  surfaceTintColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                onPressed: () async {
                                  // TODO : Share Logic Here
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/share.svg',
                                      width: 20,
                                    ),
                                    const Text('Share',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF2B2B28))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
