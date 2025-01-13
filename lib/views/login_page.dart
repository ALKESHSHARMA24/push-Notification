import 'package:flutter/material.dart';
import 'package:pushnotifcation/controllers/auth_controllers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter your email',
                  //labelText: 'Name *',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Enter your password',
                  //labelText: 'Name *',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                    onPressed: () async {
                      AuthControllers.LoginWithEmail(
                              emailcontroller.text, passwordController.text)
                          .then((onValue) {
                        if (onValue == "Succesfully logined") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Successfully Logined !! ")));
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/home", (Route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "Wrong Credentials",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )));
                        }
                      });
                    },
                    child: Text("Login")),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("No Account"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: Text("Register")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
