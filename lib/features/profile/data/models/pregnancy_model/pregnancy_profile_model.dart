import 'package:equatable/equatable.dart';

import 'user.dart';

class PregnancyProfileModel extends Equatable {
	final User? user;

	const PregnancyProfileModel({this.user});

	factory PregnancyProfileModel.fromJson(Map<String, dynamic> json) {
		return PregnancyProfileModel(
			user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
		);
	}

  get profileImageUrl => null;



	Map<String, dynamic> toJson() => {
				'user': user?.toJson(),
			};

	@override
	List<Object?> get props => [user];
}
