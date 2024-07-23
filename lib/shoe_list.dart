// class Shoe {
//   final List<List<String>> shoes = [
//     ["Tatum 2 PF", "₱12,202", "Basketball Shoes"],
//     ["Tatum 2 'Sidewalk Chalk' PF", "₱12,202", "Basketball Shoes"],
//     ["Air Jordan 1 Low", "₱11,033", "Men's Shoes"],
//     ["Air Jordan 1 Low SE", "₱12,202", "Men's Shoes"],
//     ["Air Jordan 1 Retro High", "₱15,698", "Men's Shoes"],
//     ["Air Jordan 13 Retro 'Dune Red'", "₱15,698", "Men's Shoes"],
//     ["Air Jordan 9 G", "₱18,033", "Golf Shoes"],
//   ];
// }

// class MyImage {
//   final List<String> images = [
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/30648388-71e0-4cd0-b2b3-72e5c458ec58/tatum-2-pf-basketball-shoes-8fp79D.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/ce8db870-78e9-4de3-be5b-744828105013/tatum-2-sidewalk-chalk-pf-basketball-shoes-SjC3nc.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/86991b52-33a2-4e41-aace-c05510832f84/air-jordan-1-low-shoes-6Q1tFM.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/8c73dd3a-cfa4-49ca-b66c-065c233802dc/air-jordan-1-low-se-shoes-FTrFvs.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c51b161d-0d5a-4879-b192-980e29e0605d/air-jordan-1-retro-high-shoes-9qsmsF.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0c38ab1d-2e36-4eaa-95d6-ae7a34e351d5/air-jordan-13-retro-dune-red-shoes-xcK6vg.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/13fbb773-4379-4adf-b527-145384637af6/air-jordan-9-g-golf-shoes-nNqtwL.png"
//   ];
// }

class ShoeData {
  final List<ShoeItem> shoes;

  ShoeData(this.shoes);
}

class ShoeItem {
  final String name;
  final String price;
  final String category;
  final String imageUrl;

  ShoeItem(
      {required this.name,
      required this.price,
      required this.category,
      required this.imageUrl});

  factory ShoeItem.fromJson(Map<String, dynamic> json) {
    return ShoeItem(
      name: json['name'],
      price: json['price'],
      category: json['category'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
    };
  }
}

final ShoeData shoeData = ShoeData([
  ShoeItem(
      name: "Tatum 2 PF",
      price: "₱12,202",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/30648388-71e0-4cd0-b2b3-72e5c458ec58/tatum-2-pf-basketball-shoes-8fp79D.png"),
  ShoeItem(
      name: "Tatum 2 'Sidewalk Chalk' PF",
      price: "₱12,202",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/ce8db870-78e9-4de3-be5b-744828105013/tatum-2-sidewalk-chalk-pf-basketball-shoes-SjC3nc.png"),
  ShoeItem(
    name: "Air Jordan 1 Low",
    price: "₱11,033",
    category: "Men's Shoes",
    imageUrl:
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/86991b52-33a2-4e41-aace-c05510832f84/air-jordan-1-low-shoes-6Q1tFM.png",
  ),
  ShoeItem(
      name: "Air Jordan 1 Low SE",
      price: "₱12,202",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/8c73dd3a-cfa4-49ca-b66c-065c233802dc/air-jordan-1-low-se-shoes-FTrFvs.png"),
  ShoeItem(
    name: "Air Jordan 1 Retro High",
    price: "₱15,698",
    category: "Men's Shoes",
    imageUrl:
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c51b161d-0d5a-4879-b192-980e29e0605d/air-jordan-1-retro-high-shoes-9qsmsF.png",
  ),
  ShoeItem(
      name: "Air Jordan 13 Retro 'Dune Red'",
      price: "₱15,698",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0c38ab1d-2e36-4eaa-95d6-ae7a34e351d5/air-jordan-13-retro-dune-red-shoes-xcK6vg.png"),
  ShoeItem(
      name: "Air Jordan 9 G",
      price: "₱18,033",
      category: "Golf Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/13fbb773-4379-4adf-b527-145384637af6/air-jordan-9-g-golf-shoes-nNqtwL.png"),
]);
















// class MyShoes {
//   final List<List> myShoes = [
//     ["Tatum 2 Vortex", "205", "Sustainable Materials"],
//     ["Tatum 2 PF", "235", "Sustainable Materials"],
//     ["Jordan Delta 3", "185", "Low Top"],
//   ];
// }

// class MyImage {
//   final List<String> imageUrl = [
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/30648388-71e0-4cd0-b2b3-72e5c458ec58/tatum-2-pf-basketball-shoes-8fp79D.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/ce8db870-78e9-4de3-be5b-744828105013/tatum-2-sidewalk-chalk-pf-basketball-shoes-SjC3nc.png",
//     "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/d53a40e2-c781-416a-aa91-0434582290da/tatum-2-vortex-pf-basketball-shoes-WWbXXK.png",
//   ];
// }
