// import 'package:equatable/equatable.dart';

// class PregnancyProfileModel extends Equatable {
//   final int? id;
//   final String? name;
//   final String? email;
//   final dynamic emailVerifiedAt;
//   final String? profilePicture;
//   final int? phoneNumber;
//   final String? dueDate;
//   final dynamic role;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? profileImageUrl;

//   const PregnancyProfileModel({
//     this.id,
//     this.name,
//     this.email,
//     this.emailVerifiedAt,
//     this.profilePicture,
//     this.phoneNumber,
//     this.dueDate,
//     this.role,
//     this.createdAt,
//     this.updatedAt,
//     this.profileImageUrl,
//   });

//   factory PregnancyProfileModel.fromJson(Map<String, dynamic> json) =>
//       PregnancyProfileModel(
//         id: json['id'] as int?,
//         name: json['name'] as String?,
//         email: json['email'] as String?,
//         emailVerifiedAt: json['email_verified_at'] as dynamic,
//         profilePicture: json['profile_picture'] as String?,
//         phoneNumber: json['phone_number'] as int?,
//         dueDate: json['due_date'] as String?,
//         role: json['role'] as dynamic,
//         createdAt: json['created_at'] == null
//             ? null
//             : DateTime.parse(json['created_at'] as String),
//         updatedAt: json['updated_at'] == null
//             ? null
//             : DateTime.parse(json['updated_at'] as String),
//         profileImageUrl: json['profile_image_url'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'email': email,
//         'email_verified_at': emailVerifiedAt,
//         'profile_picture': profilePicture,
//         'phone_number': phoneNumber,
//         'due_date': dueDate,
//         'role': role,
//         'created_at': createdAt?.toIso8601String(),
//         'updated_at': updatedAt?.toIso8601String(),
//         'profile_image_url': profileImageUrl,
//       };

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       name,
//       email,
//       emailVerifiedAt,
//       profilePicture,
//       phoneNumber,
//       dueDate,
//       role,
//       createdAt,
//       updatedAt,
//       profileImageUrl,
//     ];
//   }
// }
