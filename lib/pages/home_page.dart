import 'package:flutter/material.dart';

// Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = ''; // Search query variable

  final List<Widget> _pages = <Widget>[
    BerandaPage(),
    ProdukPage(),
    Center(
        child: Text('Chat',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Profil',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chocolate Store'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 35, 26, 93),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Cart clicked!')));
            },
          ),
          // Search Icon Button
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearch());
            },
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 35, 26, 93),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
//produkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  TextEditingController controller = TextEditingController();

  // Contoh data produk
  final List<Map<String, dynamic>> produkList = [
    {
      "nama": "Coklat Premium",
      "harga": 15000,
      "gambar":
          "https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Coklat Premium",
      "harga": 15000,
      "gambar":
          "https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Coklat Premium",
      "harga": 15000,
      "gambar":
          "https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Coklat Premium",
      "harga": 15000,
      "gambar":
          "https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Coklat Klasik",
      "harga": 10000,
      "gambar":
          "https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600",
      "bintang": 4.0,
      "terjual": 80,
      "kategori": "terlaris"
    },
    {
      "nama": "Coklat Dark",
      "harga": 20000,
      "gambar":
          "https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600",
      "bintang": 4.8,
      "terjual": 50,
      "kategori": "terkait"
    },
  ];

  // Kategori aktif yang dipilih
  String selectedCategory = 'terbaru';

  // Fungsi untuk memfilter produk sesuai kategori
  List<Map<String, dynamic>> get filteredProducts {
    return produkList
        .where((produk) => produk['kategori'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // TextField Pencarian
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Cari produk...',
          contentPadding: EdgeInsets.only(left: 10), // Menambahkan padding kiri
        ),
      ),
    ),
    const Padding(
      padding: EdgeInsets.only(right: 10),
      child: Icon(Icons.search),
    ),
  ],
),),

          const SizedBox(height: 20),
          // Banner
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 35, 26, 93),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Baris Kategori dengan Garis Vertikal
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Expanded(
      child: Center(
        child: _buildCategoryButton('Terbaru', 'terbaru'),
      ),
    ),
    const SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.black,
        thickness: 2,
        width: 10,
      ),
    ),
    Expanded(
      child: Center(
        child: _buildCategoryButton('Terlaris', 'terlaris'),
      ),
    ),
    const SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.black,
        thickness: 2,
        width: 10,
      ),
    ),
    Expanded(
      child: Center(
        child: _buildCategoryButton('Terkait', 'terkait'),
      ),
    ),
  ],
),

          const SizedBox(height: 20),
          // Grid Produk
          Expanded(
  child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 0.6,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    ),
    itemCount: filteredProducts.length,
    itemBuilder: (context, index) {
      final produk = filteredProducts[index];
      var boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      );
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: boxDecoration,
        child: Column(
          children: [
            Image.network(
              produk['gambar'],
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              produk['nama'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "Rp. ${produk['harga']}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    Text(
                      produk['bintang'].toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(), // Untuk memberikan jarak antara bintang dan terjual
                Text(
                  "${produk['terjual']} Terjual",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
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

  // Widget untuk tombol kategori
  Widget _buildCategoryButton(String label, String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selectedCategory == category ? Color.fromARGB(255, 35, 26, 93) : Colors.black,
        ),
      ),
    );
  }
}




// Product Search Delegate
class ProductSearch extends SearchDelegate<String> {
  final List<Product> products = [
    Product(name: 'Coklat Matcha', price: 50000),
    Product(name: 'Coklat Cashew', price: 60000),
    Product(name: 'Silver Queen', price: 40000),
    Product(name: 'Kit Kat', price: 45000),
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results.map<Widget>((product) {
        return ListTile(
          title: Text(product.name),
          subtitle: Text('Harga: Rp ${product.price}'),
          onTap: () {
            Navigator.pushNamed(context, '/produk', arguments: product.name);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions.map<Widget>((product) {
        return ListTile(
          title: Text(product.name),
          subtitle: Text('Harga: Rp ${product.price}'),
          onTap: () {
            Navigator.pushNamed(context, '/produk', arguments: product.name);
          },
        );
      }).toList(),
    );
  }
}

// BerandaPage, Product, LoginPage
class BerandaPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Coklat Matcha', price: 50000),
    Product(name: 'Coklat Cashew', price: 60000),
  ];

  final TextEditingController controller = TextEditingController(); // Controller for the search field

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Field
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Cari produk...',
              contentPadding: const EdgeInsets.only(left: 40), // Adjusted left padding for space
              filled: true,
              fillColor: Colors.grey[200], // Background color for the text field
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none, // No border side
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 10), // Padding for the icon
                child: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Banner Promosi in Grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 2, // Adjust the aspect ratio for the banner
            ),
            itemCount: 2, // Two banners
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 35, 26, 93),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600',
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),

          // Produk dalam Grid
          Text(
            'Rekomendasi Coklat',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8, // Adjust for the size of product boxes
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                padding: const EdgeInsets.all(4), // Adjust padding for item
                child: ProductBox(product: product),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Widget Kotak Produk
class ProductBox extends StatelessWidget {
  final Product product;

  ProductBox({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/produk', arguments: product.name);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 35, 26, 93), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/2/21/c40ab1f7-113a-4b89-941a-b75100e4c994.png',
                height: 100),
            SizedBox(height: 8),
            Text(product.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Rp ${product.price}',
                style:
                    TextStyle(color: const Color.fromARGB(255, 133, 103, 38))),
          ],
        ),
      ),
    );
  }
}

// Model Produk
class Product {
  final String name;
  final int price;

  Product({required this.name, required this.price});
}

// Login Page
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children = [
                  // Welcome text
                  const Text(
                    'Selamat datang di dunia penuh keajaiban coklat!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 35, 26, 93),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Central image with a fallback URL
                  Image.network(
                    'https://media.istockphoto.com/id/923177308/vector/chocolate-streams-isolated-on-whit.jpg?s=612x612&w=0&k=20&c=0VKtrgq0PM1bLINVTro7l_QZR9sk9r90ak5tH4-O3y4=', // Fallback example
                    height: 150,
                  ),
                  SizedBox(height: 30),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 35, 26, 93),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Sign Up Button as an Outlined Button
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: BorderSide(
                        color: Color.fromARGB(255, 35, 26, 93),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 35, 26, 93),
                      ),
                    ),
                  ),
                ];
    var children2 = [
          // Logo at the top-left corner
          Positioned(
            top: 40,
            left: 16,
            child: Image.network(
              'https://st2.depositphotos.com/1588812/7628/v/950/depositphotos_76287645-stock-illustration-vector-logo-with-natural-chocolate.jpg',
              height: 50,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
          ),
          // Copyright text at the bottom
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '© 2024 Cokelat Wonderland. All Rights Reserved.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
        ];
    return Scaffold(
      body: Stack(
        children: children2,
      ),
    );
  }
}
