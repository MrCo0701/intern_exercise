import 'package:exercise_1/data/dummy_data/duumy_data.dart';
import 'package:exercise_1/data/model/category_model.dart';
import 'package:exercise_1/data/model/product_model.dart';

class ProductRepository {
  List<ProductModel> allProduct() {
    List<ProductModel> offerProducts = DummyData().ExclusiveOfferProducts;
    List<ProductModel> bestSellingProducts = DummyData().BestSellingProducts;
    List<ProductModel> fishAndMeatProducts = DummyData().FishAndMeat;

    return offerProducts + bestSellingProducts + fishAndMeatProducts;
  }

  List<ProductModel> getProductsWithCategory(String categoryId) {
    final allProducts = allProduct();
    return allProducts.where((product) => product.idCategory == categoryId).toList();
  }
}
