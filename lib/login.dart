import 'package:flutter/material.dart';
import 'package:Pokedex/routes/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogin();
  }

  void checkIfAlreadyLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool("login") ?? true);
    print(newuser);

    if (!newuser) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MyHomePage(); // Ganti dengan halaman utama yang benar
      }));
    }
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Page'),
      ),
      body: Center(
        child: Container(
          width: 300, // Ganti dengan lebar yang diinginkan
          padding: const EdgeInsets.all(21.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.greenAccent.withOpacity(0.14),
            boxShadow: [
              BoxShadow(
                color: Colors.white70.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/pokemon.jpg", // Ganti dengan nama file dan lokasi gambar yang benar
                height: 160,
                width: 160,
              ),
              SizedBox(height: 16),
              Text(
                "WELCOME",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _username,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  String username = _username.text;
                  String password = _password.text;

                  if (username.isNotEmpty && password == "1234") {
                    logindata.setBool("login", false);
                    logindata.setString("username", username);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return MyHomePage(); // Ganti dengan halaman utama yang benar
                    }));
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
