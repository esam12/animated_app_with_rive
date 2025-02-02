import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset("assets/icons/email.svg"),
                ),
              ),
            ),
          ),
          Text('Password'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset("assets/icons/password.svg"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF77D8E),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ))),
              onPressed: () {},
              label: const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 15.0),
              ),
              icon: const Icon(
                Icons.arrow_forward_outlined,
                color: Color(0xFFFE0037),
                size: 24.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
