part of 'add_new_product_cubit.dart';

sealed class AddNewProductState extends Equatable {
  const AddNewProductState();

  @override
  List<Object> get props => [];
}

final class AddNewProductInitial extends AddNewProductState {}

final class AddNewProductLoading extends AddNewProductState {}

final class AddNewProductSuccess extends AddNewProductState {}

final class AddNewProductFailure extends AddNewProductState {
  final String failureMsg;

  const AddNewProductFailure({required this.failureMsg});
}
