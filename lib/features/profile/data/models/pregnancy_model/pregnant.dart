import 'package:equatable/equatable.dart';

class Pregnant extends Equatable {
	final int? id;
	final int? userId;
	final dynamic firstDayOfLastPeriod;
	final String? dueDate;
	final dynamic dateOfConception;
	final int? ageByWeek;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Pregnant({
		this.id, 
		this.userId, 
		this.firstDayOfLastPeriod, 
		this.dueDate, 
		this.dateOfConception, 
		this.ageByWeek, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Pregnant.fromJson(Map<String, dynamic> json) => Pregnant(
				id: json['id'] as int?,
				userId: json['user_id'] as int?,
				firstDayOfLastPeriod: json['first_day_of_last_period'] as dynamic,
				dueDate: json['due_date'] as String?,
				dateOfConception: json['date_of_conception'] as dynamic,
				ageByWeek: json['age_by_week'] as int?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'first_day_of_last_period': firstDayOfLastPeriod,
				'due_date': dueDate,
				'date_of_conception': dateOfConception,
				'age_by_week': ageByWeek,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				userId,
				firstDayOfLastPeriod,
				dueDate,
				dateOfConception,
				ageByWeek,
				createdAt,
				updatedAt,
		];
	}
}
