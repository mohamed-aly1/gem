import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem/controllers/auth_controller.dart';
import 'package:gem/screens/compnents.dart';
import 'package:gem/screens/qr_page.dart';
import 'package:gem/screens/sign_in.dart';
import 'package:gem/screens/signup.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    GlobalKey<FormState> formk = new GlobalKey<FormState>();
    final AuthController c = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              'assets/images/backGr.png',
              fit: BoxFit.fill,
            ),
          ),
          Opacity(
            opacity: 0.85,
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SvgPicture.asset(
                'assets/images/back.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/gemLogo.png',
                width: 250,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: formk,
                  child: Column(
                    children: [
                      defaultTextField(
                        controller: emailController,
                        validateFun: (String? val) {
                          if (val!.isEmpty) {
                            return "Must not be empty";
                          }
                        },
                        hintText: 'Email',
                        suffixIcon: Icon(
                          Icons.mail,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultTextField(
                        obscureText: true,
                        controller: passwordController,
                        validateFun: (String? val) {
                          if (val!.isEmpty) {
                            return "Must not be empty";
                          }
                        },
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye_outlined),
                          iconSize: 20,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              var formd = formk.currentState;
                              if (formd!.validate()) {
                                c.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              } else {}
                            },
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 10)),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFF1E1E1E))),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(Signup());
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(right: 30.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       TextButton(
                //         onPressed: () {},
                //         child: const Text('Forgot Password ?',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 15,
                //                 decoration: TextDecoration.underline,
                //                 decorationColor: Colors.white)),
                //       ),
                //     ],
                //   ),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Don't have an account?",
                //         style: TextStyle(
                //             color: Color(0xFF1E1E1E),
                //             fontSize: 15,
                //             fontWeight: FontWeight.bold)),
                //     TextButton(
                //       onPressed: () {},
                //       child: const Text('Sign Up',
                //           style: const TextStyle(
                //               color: Colors.white,
                //               fontSize: 15,
                //               decoration: TextDecoration.underline,
                //               decorationColor: Colors.white)),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
