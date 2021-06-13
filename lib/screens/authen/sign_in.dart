import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wmp/bloc/locale_lang/locale_lang_bloc.dart';
import 'package:wmp/generated/l10n.dart';
import 'package:wmp/main.dart';
import 'package:wmp/screens/authen/sign_up.dart';
import 'package:wmp/utils/constants.dart';
import 'package:wmp/utils/language.dart';
import 'package:wmp/widgets/dialog_widget.dart';
import 'package:provider/provider.dart';

import 'components/text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  ///Field
  LocaleLangBloc? _localeLangBloc;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool secure = false;

  @override
  Widget build(BuildContext context) {
    _localeLangBloc = BlocProvider.of<LocaleLangBloc>(context);
    return BlocBuilder(
      bloc: _localeLangBloc,
      builder: (context, state) {
        if (state is InitialLocaleLangState) {
          _localeLangBloc!.add(LocaleLoadEvent());
        }
        if (state is LocaleLoadedState) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: backgroundColor,
              elevation: 0.0,
              actions: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: DropdownButton(
                    onChanged: (Language? language) {
                      _localeLangBloc!
                          .add(LocaleChangeEvent(language!.languageCode));
                    },
                    underline: SizedBox(),
                    icon: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                          ),
                          Text(S.of(context).titleLang),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>(
                          (lang) => DropdownMenuItem(
                            value: lang,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(lang.flag),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(lang.name),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: 250,
                        ),
                        Form(
                          child: Column(
                            children: [
                              // TextFields(
                              //   hint: 'Test',
                              //   secure: false,
                              //   onTap: () {},
                              //   onChanged: (value) {},
                              //   controller: emailController,
                              //   icon: Icons.email,
                              //
                              //
                              // ),
                              _textInput(
                                secure: false,
                                hint: '${S.of(context).email}',
                                controller: emailController,
                                icon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                              ),
                              _textInput(
                                secure: true,
                                hint: '${S.of(context).password}',
                                controller: passwordController,
                                icon: Icons.lock,
                              ),
                              _signInButton(),
                              _signUpButton(),
                              Text('${S.of(context).or}'),
                              _signInOption(
                                img: "assets/images/google.png",
                                title: '${S.of(context).google}',
                                onTap: () {},
                              ),
                              _signInOption(
                                img: "assets/images/facebook.png",
                                title: '${S.of(context).facebook}',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Container(
          color: backgroundColor,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  _textInput({
    String? hint,
    TextEditingController? controller,
    IconData? icon,
    bool? secure,
    TextInputType? textInputType,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: secure!,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: '$hint',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          prefixIcon: Icon(icon),
          suffixIcon: controller!.text == "" || controller.text.isEmpty
              ? Container(
                  width: 1,
                )
              : InkWell(
                  child: Icon(Icons.close),
                  onTap: () {
                    setState(() {
                      controller.clear();
                    });
                  },
                ),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  _signInButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (emailController.text.length <= 0 ||
                    !emailController.text.contains("@") ||
                    !emailController.text.contains(".")) {
                  DialogWidget(
                          context: context,
                          title: "Error",
                          message: "Email Invalid")
                      .errorDialog();
                } else if (passwordController.text.length < 6) {
                  print('Password invalid');
                }
              },
              child: Text(
                '${S.of(context).signIn}',
              ),
            ),
          ),
        ],
      ),
    );
  }

  _signInOption(
      {required String img, required String title, GestureTapCallback? onTap}) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(img),
              width: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(title)
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  _signUpButton() {
    return Container(
      child: TextButton(
        child: Text('${S.of(context).SignUp}'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignUp(),
          ));
        },
      ),
    );
  }
}
