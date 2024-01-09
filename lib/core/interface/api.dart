import 'package:shoal_app/core/typedef/typedef.dart';

abstract class Api<T> {
  ResultType<T> getAll();
  ResultType<T> addItem();
  ResultType<T> updateItem();
  ResultType<T> deleteItem();
}
