import 'package:equatable/equatable.dart';

class PregnancyModel extends Equatable {
  final int? week;
  final double? length;
  final double? weight;
  final String? hCgNorms;
  final String? heartRate;
  final String? title1;
  final String? description1;
  final String? title2;
  final String? description2;
  final String? title3;
  final String? description3;
  final String? title4;
  final String? description4;
  final String? fruitsAndVeggies;
  final String? fruitsAndVeggiesPhoto;
  final String? babyPhoto;
  final String? youtupeVedio;

  const PregnancyModel({
    this.week,
    this.length,
    this.weight,
    this.hCgNorms,
    this.heartRate,
    this.title1,
    this.description1,
    this.title2,
    this.description2,
    this.title3,
    this.description3,
    this.title4,
    this.description4,
    this.fruitsAndVeggies,
    this.fruitsAndVeggiesPhoto,
    this.babyPhoto,
    this.youtupeVedio,
  });

  factory PregnancyModel.fromJson(Map<String, dynamic> json) {
    return PregnancyModel(
      week: json['week'] as int?,
      length: (json['length'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      hCgNorms: json['hCG norms'] as String?,
      heartRate: json['Heart_rate'] as String?,
      title1: json['Title1'] as String?,
      description1: json['Description1'] as String?,
      title2: json['Title2'] as String?,
      description2: json['Description2'] as String?,
      title3: json['Title3'] as String?,
      description3: json['Description3'] as String?,
      title4: json['Title4'] as String?,
      description4: json['Description4'] as String?,
      fruitsAndVeggies: json['Fruits_and_Veggies'] as String?,
      fruitsAndVeggiesPhoto: json['Fruits_and_Veggies_photo'] as String?,
      babyPhoto: json['baby_photo'] as String?,
      youtupeVedio: json['youtupe_vedio'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'week': week,
        'length': length,
        'weight': weight,
        'hCG norms': hCgNorms,
        'Heart_rate': heartRate,
        'Title1': title1,
        'Description1': description1,
        'Title2': title2,
        'Description2': description2,
        'Title3': title3,
        'Description3': description3,
        'Title4': title4,
        'Description4': description4,
        'Fruits_and_Veggies': fruitsAndVeggies,
        'Fruits_and_Veggies_photo': fruitsAndVeggiesPhoto,
        'baby_photo': babyPhoto,
        'youtupe_vedio': youtupeVedio,
      };

  @override
  List<Object?> get props {
    return [
      week,
      length,
      weight,
      hCgNorms,
      heartRate,
      title1,
      description1,
      title2,
      description2,
      title3,
      description3,
      title4,
      description4,
      fruitsAndVeggies,
      fruitsAndVeggiesPhoto,
      babyPhoto,
      youtupeVedio,
    ];
  }
}
