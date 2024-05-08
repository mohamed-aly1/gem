import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem/screens/qr_page.dart';
import 'package:gem/screens/sign_in.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/backGr.png',
            width: double.infinity,
          ),
          Opacity(
            opacity: 0.85,
            child: SvgPicture.asset(
              'assets/images/back.svg',
              width: double.infinity,
            ),
          ),
          Image.asset(
            'assets/images/gemLogo.png',
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const QRViewExample());
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 85, vertical: 10)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF1E1E1E))),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign Up',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
