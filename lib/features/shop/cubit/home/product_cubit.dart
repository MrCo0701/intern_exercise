import 'package:exercise_1/data/dummy_data/duumy_data.dart';
import 'package:exercise_1/data/model/product_model.dart';
import 'package:exercise_1/features/shop/cubit/home/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit()
    : super(ProductState(bestSelling: [], exclusiveOffer: [], fishAndMeat: []));

  void addProduct(ProductModel product) {
    if (product.type == 'exclusiveOffer') {
      final newList = List<ProductModel>.from(state.exclusiveOffer)
        ..add(product);
      emit(state.copyWith(exclusiveOffer: newList));
    } else if (product.type == 'bestSelling') {
      final newList = List<ProductModel>.from(state.bestSelling)..add(product);
      emit(state.copyWith(bestSelling: newList));
    } else if (product.type == 'fishAndMeat') {
      final newList = List<ProductModel>.from(state.fishAndMeat)..add(product);
      emit(state.copyWith(fishAndMeat: newList));
    }
  }

  void addAllProducts() {
    List<ProductModel> offerProducts = DummyData().ExclusiveOfferProducts;
    List<ProductModel> bestSellingProducts = DummyData().BestSellingProducts;
    List<ProductModel> fishAndMeatProducts = DummyData().FishAndMeat;

    emit(state.copyWith(bestSelling: bestSellingProducts));
    emit(state.copyWith(exclusiveOffer: offerProducts));
    emit(state.copyWith(fishAndMeat: fishAndMeatProducts));
  }
}
