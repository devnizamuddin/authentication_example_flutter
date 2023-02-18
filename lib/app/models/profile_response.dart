// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileResponseModel {
  String? consumer_uuid;
  String? email;
  String? username;
  List? files;
  Profile? profile;
  ProfileResponseModel({
    this.consumer_uuid,
    this.email,
    this.username,
    this.files,
    this.profile,
  });

  ProfileResponseModel copyWith({
    String? consumer_uuid,
    String? email,
    String? username,
    List? files,
    Profile? profile,
  }) {
    return ProfileResponseModel(
      consumer_uuid: consumer_uuid ?? this.consumer_uuid,
      email: email ?? this.email,
      username: username ?? this.username,
      files: files ?? this.files,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'consumer_uuid': consumer_uuid,
      'email': email,
      'username': username,
      // 'files': files?.toMap(),
      'profile': profile?.toMap(),
    };
  }

  factory ProfileResponseModel.fromMap(Map<String, dynamic> map) {
    return ProfileResponseModel(
      consumer_uuid:
          map['consumer_uuid'] != null ? map['consumer_uuid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      //files: map['files'] != null ? List.fromMap(map['files'] as Map<String,dynamic>) : null,
      profile: map['profile'] != null
          ? Profile.fromMap(map['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileResponseModel.fromJson(String source) =>
      ProfileResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileResponseModel(consumer_uuid: $consumer_uuid, email: $email, username: $username, files: $files, profile: $profile)';
  }

  @override
  bool operator ==(covariant ProfileResponseModel other) {
    if (identical(this, other)) return true;

    return other.consumer_uuid == consumer_uuid &&
        other.email == email &&
        other.username == username &&
        other.files == files &&
        other.profile == profile;
  }

  @override
  int get hashCode {
    return consumer_uuid.hashCode ^
        email.hashCode ^
        username.hashCode ^
        files.hashCode ^
        profile.hashCode;
  }
}

class Profile {
  String? last_name;
  String? first_name;
  Profile({
    this.last_name,
    this.first_name,
  });

  Profile copyWith({
    String? last_name,
    String? first_name,
  }) {
    return Profile(
      last_name: last_name ?? this.last_name,
      first_name: first_name ?? this.first_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'last_name': last_name,
      'first_name': first_name,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Profile(last_name: $last_name, first_name: $first_name)';

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.last_name == last_name && other.first_name == first_name;
  }

  @override
  int get hashCode => last_name.hashCode ^ first_name.hashCode;
}
