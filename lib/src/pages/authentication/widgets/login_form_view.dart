import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/pages/authentication/widgets/login_form_controller.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormView extends StatefulWidget {
  const LoginFormView({Key? key}) : super(key: key);

  @override
  State<LoginFormView> createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  final controller = LoginFormController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      width: 360,
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Type your email',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: controller.validateEmail,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
              controller: controller.password,
              obscureText: !controller.passwordVisibility,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Type your password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      controller.passwordVisibility =
                          !controller.passwordVisibility;
                    });
                  },
                  icon: controller.passwordVisibility
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: controller.validatePassword,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: _size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(rootRoute);
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
