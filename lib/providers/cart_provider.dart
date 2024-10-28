import 'package:riverpod_files/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {

//Notifier<Set<Product>> {

  //initial value
  @override
  Set<Product> build() {
    return const {    //here we retun the set
    Product(id:"4", title: "Red Backpack", price: 14, image: "assets/products/backpack.png"),
    };
  }

  //methods to update state
  void addProduct(Product product){
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product){
    if(state.contains(product)){
      state = state.where((p)=> p.id !=product.id).toSet();
    }
  }
}

// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(()  {
//   return CartNotifier();
// });

//generate a notifier provider by providing a class not a function (unlike read only providers)
@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }
  return total;
}


  


