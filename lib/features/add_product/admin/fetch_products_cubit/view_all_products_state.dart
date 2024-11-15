part of 'view_all_products_cubit.dart';

sealed class ViewAllProductsState extends Equatable {
  const ViewAllProductsState();

  @override
  List<Object> get props => [];
}

final class ViewAllProductsInitial extends ViewAllProductsState {}

final class ViewAllProductsLoading extends ViewAllProductsState {}

final class ViewAllProductsSuccess extends ViewAllProductsState {
  final List<ProductModel> productModel;
  const ViewAllProductsSuccess({required this.productModel});
}

final class ViewAllProductsFailure extends ViewAllProductsState {
  final String errorMsg;

  const ViewAllProductsFailure({required this.errorMsg});
}
