import 'dart:convert';


class ApiResponse<T> {
  String message;
  T data;
  String errorCode;

  ApiResponse({
    required this.message,
    required this.data,
    required this.errorCode,
  });

  ApiResponse<T> copyWith({
    String? message,
    T? data,
    String? errorCode,
    bool? success,
  }) {
    return ApiResponse<T>(
      message: message ?? this.message,
      data: data ?? this.data,
      errorCode: errorCode ?? this.errorCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reasonPhrase': message,
      'body': data,
      'statusCode': errorCode,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    if (map['reasonPhrase'] == null) {
      return ApiResponse<T>(
        message: '',
        data: map['body'] as T,
        errorCode: map['statusCode'] as String,
      );
    }
    return ApiResponse<T>(
      message: map['reasonPhrase'] as String,
      data: map['body'] as T,
      errorCode: map['statusCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiResponse(message: $message, data: $data, error: $errorCode)';
  }

  @override
  bool operator ==(covariant ApiResponse<T> other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.data == data &&
        other.errorCode == errorCode;
  }

  @override
  int get hashCode {
    return message.hashCode ^ data.hashCode ^ errorCode.hashCode;
  }
}
