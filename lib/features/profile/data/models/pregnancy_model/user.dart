import 'package:equatable/equatable.dart';

import 'pregnant.dart';

class User extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final String? role;
	final dynamic emailVerifiedAt;
	final int? otpVerified;
	final dynamic profilePicture;
	final dynamic phoneNumber;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final String? profileImageUrl;
	final Pregnant? pregnant;

	const User({
		this.id, 
		this.name, 
		this.email, 
		this.role, 
		this.emailVerifiedAt, 
		this.otpVerified, 
		this.profilePicture, 
		this.phoneNumber, 
		this.createdAt, 
		this.updatedAt, 
		this.profileImageUrl, 
		this.pregnant, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				role: json['role'] as String?,
				emailVerifiedAt: json['email_verified_at'] as dynamic,
				otpVerified: json['otp_verified'] as int?,
				profilePicture: json['profile_picture'] as dynamic,
				phoneNumber: json['phone_number'] as dynamic,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				profileImageUrl: json['profile_image_url'] as String?,
				pregnant: json['pregnant'] == null
						? null
						: Pregnant.fromJson(json['pregnant'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'role': role,
				'email_verified_at': emailVerifiedAt,
				'otp_verified': otpVerified,
				'profile_picture': profilePicture,
				'phone_number': phoneNumber,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'profile_image_url': profileImageUrl,
				'pregnant': pregnant?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				email,
				role,
				emailVerifiedAt,
				otpVerified,
				profilePicture,
				phoneNumber,
				createdAt,
				updatedAt,
				profileImageUrl,
				pregnant,
		];
	}
}
