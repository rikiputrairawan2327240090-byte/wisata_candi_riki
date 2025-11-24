import 'package:flutter/material.dart';
import 'package:wisata_candi_riki/data/candi_data.dart';
import 'package:wisata_candi_riki/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO 1. Deklarasi variabel yang dibuthkan
  List<Candi> _filteredCandis = candiList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _filteredCandis = candiList
          .where((candi) =>
      candi.name.toLowerCase().contains(_searchQuery) ||
          candi.location.toLowerCase().contains(_searchQuery))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2. Buat appbar dengan judul yang dibutuhkan
      appBar: AppBar(title: Text("Pencarian Candi."),),
      // TODO 3. Buat body berupa column
      body: Column(
        children: [
          // TODO 4. Buat TextField pencarian anak dari column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.deepPurple[50]!
              ),child: TextField(
              // TODO 6. Implementasi fitur pencaarian
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: 'Cari Candi...',
                  prefixIcon: Icon(Icons.search),
                  // TODO 7 Implementasi pengosongan input
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8)
              ),
            ),
            ),
          ),
          // TODO 5. Buat ListView hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index){
                final candi = _filteredCandis[index];
                // TODO 8 Implementasi GestureDetector dan Hero Animation
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(candi.imageAsset,
                              fit: BoxFit.cover,
                            ),),
                        ),
                        width: 100,
                        height: 100,

                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(candi.name, style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 4,),
                            Text(candi.location, style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                            ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );




  }
}