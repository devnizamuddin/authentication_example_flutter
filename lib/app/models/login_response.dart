// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class LoginResponseModel {
  String? session_id;
  String? consumer_uuid;
  LoginResponseModel({
    this.session_id,
    this.consumer_uuid,
  });

  LoginResponseModel copyWith({
    String? session_id,
    String? consumer_uuid,
  }) {
    return LoginResponseModel(
      session_id: session_id ?? this.session_id,
      consumer_uuid: consumer_uuid ?? this.consumer_uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session_id': session_id,
      'consumer_uuid': consumer_uuid,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      session_id:
          map['session_id'] != null ? map['session_id'] as String : null,
      consumer_uuid:
          map['consumer_uuid'] != null ? map['consumer_uuid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginResponseModel(session_id: $session_id, consumer_uuid: $consumer_uuid)';

  @override
  bool operator ==(covariant LoginResponseModel other) {
    if (identical(this, other)) return true;

    return other.session_id == session_id &&
        other.consumer_uuid == consumer_uuid;
  }

  @override
  int get hashCode => session_id.hashCode ^ consumer_uuid.hashCode;
}
