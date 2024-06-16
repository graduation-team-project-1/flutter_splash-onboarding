import 'package:equatable/equatable.dart';

class GeneralArticleModel extends Equatable {
	final String? title;
	final String? imageUrl;
	final int? imageWidth;
	final int? imageHeight;
	final String? thumbnailUrl;
	final int? thumbnailWidth;
	final int? thumbnailHeight;
	final String? source;
	final String? domain;
	final String? link;
	final String? googleUrl;
	final int? position;

	const GeneralArticleModel({
		this.title, 
		this.imageUrl, 
		this.imageWidth, 
		this.imageHeight, 
		this.thumbnailUrl, 
		this.thumbnailWidth, 
		this.thumbnailHeight, 
		this.source, 
		this.domain, 
		this.link, 
		this.googleUrl, 
		this.position, 
	});

	factory GeneralArticleModel.fromJson(Map<String, dynamic> json) {
		return GeneralArticleModel(
			title: json['title'] as String?,
			imageUrl: json['imageUrl'] as String?,
			imageWidth: json['imageWidth'] as int?,
			imageHeight: json['imageHeight'] as int?,
			thumbnailUrl: json['thumbnailUrl'] as String?,
			thumbnailWidth: json['thumbnailWidth'] as int?,
			thumbnailHeight: json['thumbnailHeight'] as int?,
			source: json['source'] as String?,
			domain: json['domain'] as String?,
			link: json['link'] as String?,
			googleUrl: json['googleUrl'] as String?,
			position: json['position'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'title': title,
				'imageUrl': imageUrl,
				'imageWidth': imageWidth,
				'imageHeight': imageHeight,
				'thumbnailUrl': thumbnailUrl,
				'thumbnailWidth': thumbnailWidth,
				'thumbnailHeight': thumbnailHeight,
				'source': source,
				'domain': domain,
				'link': link,
				'googleUrl': googleUrl,
				'position': position,
			};

	@override
	List<Object?> get props {
		return [
				title,
				imageUrl,
				imageWidth,
				imageHeight,
				thumbnailUrl,
				thumbnailWidth,
				thumbnailHeight,
				source,
				domain,
				link,
				googleUrl,
				position,
		];
	}
}
