import 'package:tmsgraduatework/src/model.dart';

abstract class ApiState {}

class ApiLoadingState extends ApiState {}
class ApiLoadedState extends ApiState {
  final List<dynamic> list;
  ApiLoadedState({required this.list});
}
class ApiEmptySate extends ApiState {}
class ApiErrorState extends ApiState {
  final String error;
  ApiErrorState(this.error);
}