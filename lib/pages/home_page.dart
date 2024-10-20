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
    Center(
        child: Text('Promo',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
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
              icon: Icon(Icons.local_offer), label: 'Promo'),
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

// BerandaPage, Product, LoginPage, and ProductDetailPage classes remain unchanged
class BerandaPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Coklat Matcha', price: 50000),
    Product(name: 'Coklat Cashew', price: 60000),
  ];

  final List<Product> recommendations = [
    Product(name: 'Silver Queen', price: 40000),
    Product(name: 'Kit Kat', price: 45000),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Promosi
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 35, 26, 93),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://kioskcokelat.com/cdn/shop/articles/img-1722499003558.jpg?v=1722499043&width=1600'),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Produk dalam Grid
          Text('Rekomendasi Coklat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductBox(product: product);
            },
          ),
          SizedBox(height: 16),

          // Rekomendasi Produk
          Text('Produk Terbaru',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final product = recommendations[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Image.network(
                      'https://solvent-production.s3.amazonaws.com/media/images/products/2021/06/DSC_0183_copy_jyJktjA.jpg'),
                  title: Text(product.name),
                  subtitle: Text('Harga: Rp ${product.price}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.pushNamed(context, '/produk',
                        arguments: product.name);
                  },
                ),
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
    return Scaffold(
      body: Stack(
        children: [
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
                children: [
                  // Welcome text
                  Text(
                    'Selamat datang di dunia penuh keajaiban coklat!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 35, 26, 93),
                    ),
                  ),
                  SizedBox(height: 16),

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
                ],
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
        ],
      ),
    );
  }
}

// Halaman Detail Produk
class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get product details passed via arguments
    final Map<String, dynamic> productData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String productName = productData['name'];
    final String productImage = productData['imageUrl'];
    final String productPrice = productData['price'];
    final String productDescription = productData['description'];
    final double productRating = productData['rating'];

    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Image.network(productImage),

            // Product Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Product Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text('$productRating', style: TextStyle(fontSize: 16)),
              ],
            ),

            // Product Price
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                productPrice,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Product Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                productDescription,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle add to cart action
                  },
                  child: Text('Add to Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle purchase action
                  },
                  child: Text('Buy Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
