import 'package:flutter/material.dart';
import 'package:flutter_code4func_08_login_validation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  // TextEditingController để kết hợp kiểm tra user + pass
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _userNameError = "Tài khoản không hợp lệ";
  final _passError = "Mật khẩu phải trên 6 ký tự";
  var _userInvalid = false; // Hợp lệ tài khoản
  var _passInvalid = false; // Hợp lệ mật khẩu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffd8d8d8),
              ),
              padding: const EdgeInsets.all(10),
              child: const FlutterLogo(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text(
                "Hello\nWelcome Back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextField(
                // controller cho phép kiểm tratra textField
                controller: _userController,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    // errorText : hiển thị lỗi khi nhập sai
                    errorText: _userInvalid ? _userNameError : null,
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                // muốn "SHOW" chung hàng với password thì dùng Stack
                // làm các con của nó ở giữa và ở cuối, tại password default là fullscreen nên khi thay đổi kích thước thì nó phụ thuộc vào độ dài của password
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    // controller cho phép kiểm tratra textField
                    controller: _passController,
                    // obscureText = true --> có nghĩa là password = ************
                    obscureText: !_showPass,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        // errorText : hiển thị lỗi khi nhập sai
                        errorText: _passInvalid ? _passError : null,
                        labelStyle:
                            const TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      // _showPass = false -> onToggleShowPass --> _showPass = true --> label : HIDE , ngược lại label : SHOW
                      _showPass ? "HIDE" : "SHOW",
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // làm cho nút bấm trở nên full screen width
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: onSignInClicked,
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
            ),
            const SizedBox(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "NEW USER? SIGN UP",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      // Ký tự < 6 || Không chứa @ --> Không hợp lệ
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (!_userInvalid && !_passInvalid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }
}
