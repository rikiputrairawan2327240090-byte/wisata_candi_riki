import 'package:flutter/material.dart';
import 'package:wisata_candi_riki/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  // TODO: 1 DEKLARASIKAN VARIABEL YANG DIBUTUHKAN
  bool isSignedIn = true;
  String fullName = 'Riki Putra Irawan';
  String userName = 'Riki Putra';
  int favoriteCandiCount = 10;

  // TODO 5: Implementasi FUNGSI SIGN IN
  void signIn(){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }
  // TODO 6: IMPLEMENTASI FUNGSI SIGN OUT
  void signOut(){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.deepPurple,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // TODO: 2 BUAT BAGIAN PROFILEHEADER YANG BERISI GAMBAR PROFILE
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/placeholder_image.png'),
                            ),
                          ),
                          if(isSignedIn)
                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.camera_alt, color: Colors.deepPurple[50],))
                        ],
                      ),
                    ),
                  ),
                  // TODO: 3 BUAT BAGIAN PROFILEINFO YANG BERISI INFO PROFILE
                  SizedBox(height: 20),
                  Divider(color: Colors.deepPurple[100]),
                  SizedBox(height: 4),
                  ProfileInfoItem(
                    icon: Icons.lock,
                    label: "Pengguna",
                    value: userName,
                    iconColor: Colors.amber,
                    showEditIcon: isSignedIn,
                  ),
                  SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  SizedBox(height: 4),
                  ProfileInfoItem(
                    icon: Icons.lock,
                    label: "Name",
                    value: fullName,
                    iconColor: Colors.blue,
                    showEditIcon: isSignedIn,
                  ),
                  SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  SizedBox(height: 4),
                  ProfileInfoItem(
                      icon: Icons.favorite,
                      label: "Favorit Candi",
                      value: favoriteCandiCount > 0 ? favoriteCandiCount.toString() : '',
                      iconColor: Colors.red
                  ),
                  // TODO: 4 BUAT PROFILE ACTION YANG BERISI TEXTBUTTON SIGN IN/OUT
                  SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  SizedBox(height: 20),
                  isSignedIn ? TextButton(onPressed: signOut, child: Text('Sign Out'))
                      : TextButton(onPressed: signIn, child: Text('Sign in'))
                ],
              )
          ),

        ],
      ),
    );
  }
}
