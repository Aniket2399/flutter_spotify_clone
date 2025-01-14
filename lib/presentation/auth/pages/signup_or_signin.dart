import 'package:flutter/material.dart';
import 'package:flutter_application_2/common/helpers/is_dark_mode.dart';
import 'package:flutter_application_2/common/widgets/appbar/app_bar.dart';
import 'package:flutter_application_2/common/widgets/button/basic_app_button.dart';
import 'package:flutter_application_2/core/configs/assets/app_images.dart';
import 'package:flutter_application_2/core/configs/assets/app_vectors.dart';
import 'package:flutter_application_2/core/configs/theme/app_colors.dart';
import 'package:flutter_application_2/presentation/auth/pages/signin.dart';
import 'package:flutter_application_2/presentation/auth/pages/signup.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.grey),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignupPage()));
                            },
                            title: 'Register'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SigninPage()));
                          },
                          child: Text(
                            'Signin',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
