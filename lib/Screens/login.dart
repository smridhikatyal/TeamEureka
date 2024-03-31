import 'package:chatbot/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Color.fromARGB(255, 10, 74, 110); // Adjust color
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Make scaffold background transparent
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/sliderbg.jpg", // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          // Login Content
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildLoginForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Colors.black.withOpacity(0.5), // Add opacity to the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Welcome!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10), // Add some spacing between text and icon
              FaIcon(
                FontAwesomeIcons.robot,
                color: Colors.white,
                size: 32,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildGreyText("Please login with your information"),
          const SizedBox(height: 24),
          _buildGreyText("Email address"),
          _buildInputField(emailController),
          const SizedBox(height: 20),
          _buildGreyText("Password"),
          _buildInputField(passwordController, isPassword: true),
          const SizedBox(height: 16),
          _buildRememberForgot(),
          const SizedBox(height: 16),
          _buildLoginButton(),
          const SizedBox(height: 16),
          _buildOtherLogin(),
        ],
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.8), // Add opacity to the color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword ? Icon(Icons.visibility) : null,
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: _buildGreyText("I forgot my password"),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        minimumSize: Size.fromHeight(60),
      ),
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Column(
      children: [
        _buildGreyText("Or Sign Up"),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.facebook),
              color: Colors.blue[900],
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.twitter),
              color: Colors.lightBlue[400],
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.google),
              color: Colors.red,
            ),
          ],
        )
      ],
    );
  }
}
