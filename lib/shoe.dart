import 'package:flutter/material.dart';

class MyShoeList extends StatelessWidget {
  const MyShoeList({
    super.key,
    required this.shoes,
    required this.images,
    required this.onLike,
    required this.onAddToCart,
    required this.likedShoes,
    required this.cartItems,
  });

  final List<List> shoes;
  final List<String> images;
  final Function(List) onLike;
  final Function(List) onAddToCart;
  final List<List> likedShoes;
  final List<List> cartItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        bool isLiked = likedShoes.contains(shoes[index]);
        bool isInCart = cartItems.contains(shoes[index]);
        return Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        images[index],
                        // height: 150,
                        // width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 30,
                      child: IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => onLike(shoes[index]),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 1,
                      child: IconButton(
                        icon: Icon(
                          isInCart
                              ? Icons.remove_shopping_cart
                              : Icons.add_shopping_cart,
                          color: isInCart ? Colors.black : Colors.grey,
                        ),
                        onPressed: () => onAddToCart(shoes[index]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  shoes[index][0],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${shoes[index][1]}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                child: Text(
                  '${shoes[index][2]}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
