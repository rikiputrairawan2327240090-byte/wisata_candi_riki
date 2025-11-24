import 'package:flutter/material.dart';
import 'package:wisata_candi_riki/data/candi_data.dart';
import 'package:wisata_candi_riki/screens/favorite_screen.dart';
import 'package:wisata_candi_riki/screens/home_screen.dart';
import 'package:wisata_candi_riki/screens/profile_screen.dart';
import 'package:wisata_candi_riki/screens/search_screen.dart';
import 'package:flutter/services.dart' show rootBundle;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme:  const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme:
        ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
            primary: Colors.deepPurple,
            surface: Colors.deepPurple[50]
        ),
        useMaterial3: true,
      ),

      // home: ProfileScreen(),
      // home: SearchScreen(),
      // home: DetailScreen(candi: candiList[0]),
      // home: SignInScreen()
      // home: SignUpScreen()
      // home: HomeScreen()
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO: 1. Buat properti body berupa widget yang ditampilkan
  int _currentIndex = 0;
  final List<Widget> _childern = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _childern[_currentIndex],
      // TODO: 3. Buat Properti bottomNavigationBar dengan nilai theme
      bottomNavigationBar: Theme(
        // TODO: 4. Buat Properti Data dan Child dari Theme
          data: Theme.of(context).copyWith(
              canvasColor: Colors.deepPurple[50]
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.deepPurple,),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.deepPurple,),
                  label: 'Search'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, color: Colors.deepPurple,),
                  label: 'Favorite'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.deepPurple,),
                  label: 'Profile'
              )
            ],
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.deepPurple[100],
            showUnselectedLabels: true,
          )),


    );
  }
}

