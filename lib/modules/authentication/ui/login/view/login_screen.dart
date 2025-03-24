import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/bases/base_statless_widget.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../shared_layers/localization/generated/locale_keys.g.dart';

class LoginScreen extends BaseStatelessWidget {
  FocusNode focusNode = FocusNode();
  LoginScreen({super.key});
  @override
  Widget customBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Login',
          style: GoogleFonts.inter(textStyle: theme.textTheme.headlineMedium),
        ),
        leading: ModalRoute.of(context)?.isFirst == true
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: LocaleKeys.pleaseEnterEmail.tr(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your password',
                labelText: 'password',
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 16.0, right: 16.0, left: 16.0),
            child: Row(
              children: [
                Checkbox(
                    activeColor: AppColors.mainColor,
                    value: true,
                    onChanged: (value) {
                      value = !value!;
                    }),
                Text(
                  'Remember me',
                  style:
                      GoogleFonts.inter(textStyle: theme.textTheme.bodyMedium),
                ),
                const Spacer(),
                Text(
                  'Forget Password',
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodyMedium!,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Login'))),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?',
                  style:
                      GoogleFonts.inter(textStyle: theme.textTheme.bodyLarge)),
              TextButton(
                onPressed: () {},
                child: (Text(
                  'Sign up',
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodyLarge!,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mainColor,
                  ).copyWith(color: AppColors.mainColor),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
/*
  customBuild build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Answers',
          style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineMedium),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }

 */
