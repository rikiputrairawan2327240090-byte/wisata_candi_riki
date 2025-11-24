import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget{
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TODO: 1 DEKLORASIKAN VARIABEL
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSigningIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //TODO: 2 Pasang APPBAR
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      //TODO: 3 PASANGKAN BODY
      body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  // TODO: 4. ATUR MainAxisAlignment dan crossAxisAlignment
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TODO: 5. PASANG TextFormField Nama Pengguna
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nama Pengguna',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // TODO: 6. PASANG TextFormField Kata Sandi
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // TODO: 6. PASANG TextFormField Kata Sandi
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Kata Sandi",
                        errorText: _errorText.isEmpty ? _errorText : null,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState((){
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off: Icons.visibility,
                          ),
                        ),
                      ),
                      obscureText: _obscurePassword,
                    ),
                    // TODO: 7. PASANGKAN ElevatedButton SIGN IN
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: (){},
                      child: Text('SIGN Up'),
                    ),
                    //TODO: 8 Pasang TextButton
                    SizedBox(height: 10),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text("Belum punya akun? Daftar di sini"),
                    // ),
                    // RichText(
                    //   text: TextSpan(
                    //     text: "Belum punya akun?",
                    //     style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                    //     children: <TextSpan>[
                    //       TextSpan(
                    //         text: " Daftar di sini",
                    //         style: TextStyle(
                    //           color: Colors.blue,
                    //           decoration: TextDecoration.underline,
                    //           fontSize: 16,
                    //         ),
                    //         recognizer: TapGestureRecognizer()
                    //           ..onTap = () {}
                    //       )

                    //     ]
                    //   ),
                    // )


                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}