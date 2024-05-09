import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem/screens/compnents.dart';
import 'package:gem/screens/sign_in.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class Signup extends StatelessWidget {
  final AuthController c = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailupController = TextEditingController();
  var passwordupController = TextEditingController();
  var phoneNoController = TextEditingController();

  GlobalKey<FormState> formk = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: Image.asset("assets/images/gemLogo.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: formk,
                        child: Column(
                          children: [
                            defaultTextField(
                              controller: nameController,
                              validateFun: (String? val) {
                                if (val!.isEmpty) {
                                  return "Must not be empty";
                                }
                              },
                              hintText: 'Full Name',
                              suffixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultTextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailupController,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => defaultTextField(
                                obscureText: obsc.value,
                                controller: passwordupController,
                                validateFun: (String? val) {
                                  if (val!.isEmpty) {
                                    return "Must not be empty";
                                  }
                                },
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.remove_red_eye),
                                  iconSize: 20,
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    c.passIcon();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultTextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: phoneNoController,
                              validateFun: (String? val) {
                                if (val!.isEmpty) {
                                  return "Must not be empty";
                                }
                                return null;
                              },
                              hintText: 'Phone Number',
                              suffixIcon: Icon(
                                Icons.phone,
                                color: Theme.of(context).primaryColor,
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
                                      c.userRegister(
                                          name: nameController.text,
                                          email: emailupController.text,
                                          password: passwordupController.text,
                                          phone: phoneNoController.text);
                                      // Get.to(SignUpSplash());
                                    } else {
                                      // clr = Colors.red;
                                    }
                                  },
                                  style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(
                                              horizontal: 100, vertical: 10)),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF1E1E1E))),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already have an account ?",
                                      style: TextStyle(
                                          color: Color(0xFF2B2B28),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.off(const SignIn());
                                      },
                                      child: Text(
                                        "Sign in",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
              )),
            ),
          ],
        ));
  }
}
