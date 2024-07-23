import 'package:flutter/material.dart';
import 'package:nike_application/login_page.dart';
import 'package:nike_application/shoe.dart';
import 'package:nike_application/shoe_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.email = ""});

  final String email;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List> likedShoes = [];
  List<List> cartItems = [];

  //LOGOUT BUTTON
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyLoginPage()),
    );
  }

  //LIKE BUTTON
  void _toggleLike(List shoe) {
    setState(() {
      if (likedShoes.contains(shoe)) {
        likedShoes.remove(shoe);
      } else {
        likedShoes.add(shoe);
      }
    });
  }

  // ADD TO CART
  void _addToCart(List shoe) {
    setState(() {
      cartItems.add(shoe);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Shoe nikeShoes = Shoe();
    final MyImage nikeImages = MyImage();

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          title: Row(
            children: [
              Image.asset(
                'assets/nike.png', // Make sure to add your Nike logo image to the assets folder
                height: 50,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.black),
                onPressed: _logout,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Men\'s Jordan Shoes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Low Top'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Mid Top'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('High Top'),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () {
                      // Handle filter action
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: MyShoeList(
                  shoes: nikeShoes.shoes,
                  images: nikeImages.images,
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 80,
                child: DrawerHeader(
                  child: ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://scontent.fmnl24-1.fna.fbcdn.net/v/t1.6435-1/188875613_3933423093393159_5758743602276423364_n.jpg?stp=dst-jpg_s200x200&_nc_cat=107&ccb=1-7&_nc_sid=e4545e&_nc_ohc=S-KidRUPqPEQ7kNvgHKoD9Z&_nc_ht=scontent.fmnl24-1.fna&oh=00_AYDBDDc04gGte4TH0pgDbV2LA-y7XrfWIkPZUr3XjzFXlA&oe=66A61DA0'),
                      ),
                    ),
                    title: const Text(
                      "Vincent Benedict Barquilla",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    trailing: const Text(
                      "Active",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyProfile()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text("Likes"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLikes()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PROFILE PAGE
class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            Image.asset(
              'assets/nike.png', // Make sure to add your Nike logo image to the assets folder
              height: 50,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://scontent.fmnl24-1.fna.fbcdn.net/v/t1.6435-1/188875613_3933423093393159_5758743602276423364_n.jpg?stp=dst-jpg_s200x200&_nc_cat=107&ccb=1-7&_nc_sid=e4545e&_nc_ohc=S-KidRUPqPEQ7kNvgHKoD9Z&_nc_ht=scontent.fmnl24-1.fna&oh=00_AYDBDDc04gGte4TH0pgDbV2LA-y7XrfWIkPZUr3XjzFXlA&oe=66A61DA0'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Vincent Benedict B. Barquilla",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//LIKES PAGE
class MyLikes extends StatelessWidget {
  const MyLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            Image.asset(
              'assets/nike.png',
              height: 50,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
    );
  }
}

//ADD TO CART PAGE

class MyAddCart extends StatelessWidget {
  const MyAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
