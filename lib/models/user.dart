// Impor library dan kelas yang diperlukan
import 'dart:convert';
import 'user.dart';

// Mendefinisikan kelas User
class User {
  String? token;
  int? id;
  String? name;
  final String email;
  String? phoneNumber;
  String? emailVerifiedAt;
  final String password;
  String? photoProfile;
  String? gender;
  String? birth_place;
  String? birth_date;
  String? maried_status;
  String? country_id;
  String? province_id;
  String? city_id;
  String? district_id;
  String? area_id;
  String? pos_code;
  String? address;
  String? blood_type;
  String? last_education;
  String? bio;
  String? nik;
  String? npwp;
  String? nip;
  // Tambahkan properti lain sesuai dengan respons API yang diberikan

  User({
    this.token,
    this.id,
    this.name,
    required this.email,
    this.phoneNumber,
    this.emailVerifiedAt,
    required this.password,
    this.photoProfile,
    this.gender,
    this.birth_place,
    this.birth_date,
    this.maried_status,
    this.country_id,
    this.province_id,
    this.city_id,
    this.district_id,
    this.area_id,
    this.pos_code,
    this.address,
    this.blood_type,
    this.last_education,
    this.bio,
    this.nik,
    this.npwp,
    this.nip,
    // Inisialisasi properti lainnya
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      token: json['token'], // Memperbaiki akses ke properti 'token'
      id: json['id'],
      name: json['name'] ?? '',
      photoProfile: json['image'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      emailVerifiedAt: json['email_verified_at'] ?? '',
      gender: json['gender'] ?? '',
      birth_place: json['birth_place'] ?? '',
      birth_date: json['birth_date'] ?? '',
      maried_status: json['maried_status'] ?? '',
      country_id: json['country_id'] ?? '',
      province_id: json['province_id'] ?? '',
      city_id: json['city_id'] ?? '',
      district_id: json['district_id'] ?? '',
      area_id: json['area_id'] ?? '',
      pos_code: json['pos_code'] ?? '',
      address: json['address'] ?? '',
      blood_type: json['blood_type'] ?? '',
      last_education: json['last_education'] ?? '',
      bio: json['bio'] ?? '',
      nik: json['nik'] ?? '',
      npwp: json['npwp'] ?? '',
      nip: json['nip'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'name': name,
      'email': email,
      'image': photoProfile,
      'phone_number': phoneNumber,
      'email_verified_at': emailVerifiedAt,
      'gender': gender,
      'birth_place': birth_place,
      'birth_date': birth_date,
      'maried_status': maried_status,
      'country_id': country_id,
      'province_id': province_id,
      'city_id': city_id,
      'district_id': district_id,
      'area_id': area_id,
      'pos_code': pos_code,
      'address': address,
      'blood_type': blood_type,
      'last_education': last_education,
      'bio': bio,
      'nik': nik,
      'npwp': npwp,
      'nip': nip,
      // Tambahkan properti lainnya sesuai dengan respons API
    };
  }
}
