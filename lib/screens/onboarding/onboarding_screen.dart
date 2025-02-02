import 'dart:ui';

import 'package:animated_app_with_rive/screens/onboarding/components/animated_btn.dart';
import 'package:animated_app_with_rive/screens/onboarding/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart' as rive;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late rive.RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
    _btnAnimationController = rive.OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.sizeOf(context).width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),

          rive.RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),

          // Text Section
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      spacing: 16.0,
                      children: [
                        Text(
                          'Learn design & code',
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Poppins',
                            height: 1.2,
                          ),
                        ),
                        Text(
                          "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 2),

                  // Build Button
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    onTap: () {
                      _btnAnimationController.isActive = true;
                      showGeneralDialog(
                        context: context,
                        barrierLabel: 'Sign In',
                        barrierDismissible: true, // close it when click outside

                        pageBuilder: (context, __, ___) {
                          return Center(
                            child: Container(
                              height: 620,
                              margin: EdgeInsets.symmetric(horizontal: 16.0),
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 24.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Sign In ',
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16),
                                        child: Text(
                                          "Access 120+ hours of content. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                      // Email & Password
                                      SignInForm(),

                                      Row(
                                        children: [
                                          Expanded(child: Divider()),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              'OR',
                                              style: TextStyle(
                                                  color: Colors.black26),
                                            ),
                                          ),
                                          Expanded(child: Divider()),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18.0),
                                        child: Text(
                                          "Sign up with Email, Apple or Google",
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.0),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                              "assets/icons/email_box.svg",
                                              height: 64,
                                              width: 64,
                                            ),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                              "assets/icons/apple_box.svg",
                                              height: 64,
                                              width: 64,
                                            ),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                              "assets/icons/google_box.svg",
                                              height: 64,
                                              width: 64,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
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
