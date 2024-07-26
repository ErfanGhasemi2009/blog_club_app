import 'package:blog_club_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTab = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextTheme = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w700,
        fontSize: 18);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 48),
            child: Assets.img.icons.logo.svg(width: 120),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTab = loginTab;
                          });
                        },
                        child: Text(
                          'login'.toUpperCase(),
                          style: tabTextTheme.apply(
                              color: selectedTab == loginTab
                                  ? Colors.white
                                  : Colors.white38),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTab = signUpTab;
                          });
                        },
                        child: Text(
                          'sign up'.toUpperCase(),
                          style: tabTextTheme.apply(
                              color: selectedTab == signUpTab
                                  ? Colors.white
                                  : Colors.white38),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.onPrimary,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32),
                            topLeft: Radius.circular(32))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                        child: selectedTab == loginTab ? _Login(themeData: themeData): _SingUp(themeData: themeData),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in with your account',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        
        _PasswordTextField(themeData: themeData),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
          child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 60),
                ),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
              ),
              onPressed: () {},
              child: Text('login'.toUpperCase())),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot your password?',
                style: themeData.textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 4,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Reset here',
                    style: TextStyle(color: themeData.colorScheme.primary),
                  ))
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'or sign in with'.toUpperCase(),
              style: const TextStyle(letterSpacing: 1.5),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.google.image(width: 36, height: 36),
                const SizedBox(
                  width: 32,
                ),
                Assets.img.icons.facebook.image(width: 36, height: 36),
                const SizedBox(
                  width: 32,
                ),
                Assets.img.icons.twitter.image(width: 36, height: 36),
              ],
            )
          ],
        )
      ],
    );
  }
}

class _SingUp extends StatelessWidget {
  const _SingUp({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to blug club',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Please enter your information',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('FullName')),
        ),
        const SizedBox(
          height: 8,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const SizedBox(
          height: 8,
        ),
        _PasswordTextField(themeData: themeData),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
          child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 60),
                ),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
              ),
              onPressed: () {},
              child: Text('sign up'.toUpperCase())),
        ),
        Column(
          children: [
            Text(
              'or sign up with'.toUpperCase(),
              style: const TextStyle(letterSpacing: 1.5),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.google.image(width: 36, height: 36),
                const SizedBox(
                  width: 32,
                ),
                Assets.img.icons.facebook.image(width: 36, height: 36),
                const SizedBox(
                  width: 32,
                ),
                Assets.img.icons.twitter.image(width: 36, height: 36),
              ],
            )
          ],
        )
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureTextPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscureTextPassword,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureTextPassword = !obscureTextPassword;
            });
          },
          child: Text(
            obscureTextPassword ? 'Show' : 'Hide',
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
