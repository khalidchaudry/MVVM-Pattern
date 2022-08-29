import 'package:mvvm/data/response/status.dart';

class APIResponse<T> {
  Status status;
  T? data;
  String? message;
  APIResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  APIResponse.loading() : status = Status.LOADING;

  APIResponse.completed() : status = Status.COMPLETED;
  APIResponse.error() : status = Status.ERROR;
  @override
  String toString() {
    return 'Status: $status\nMessage:$message\n data:$data';
  }
}
