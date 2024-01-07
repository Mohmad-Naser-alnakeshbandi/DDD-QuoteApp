import 'package:floor/floor.dart';

import '../../domain/entities/quote.dart';

@Entity(tableName: 'quote', primaryKeys: ['id'])
class QuoteModel extends QuoteEntity {
  const QuoteModel({
    int? id,
    String? authorName,
    String? description,
    String? content,
    String? url,
    String? tags,
  }) : super(
            id: id,
            authorName: authorName,
            description: description,
            content: content,
            url: url,
            tags: tags);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json['id'] ?? "",
        authorName: json['originator']['name'] ?? "",
        description: json['originator']['description'] ?? "",
        url: json['originator']['url'] ?? "",
        content: json['content'] ?? "",
        tags: json['tags'].join(', ') ?? "",
      );

  QuoteEntity toEntity() => QuoteEntity(
      id: id,
      authorName: authorName,
      description: description,
      content: content,
      url: url,
      tags: tags);

  factory QuoteModel.fromEntity(QuoteEntity quote) {
    return QuoteModel(
        id: quote.id,
        authorName: quote.authorName,
        description: quote.description,
        content: quote.content,
        url: quote.url,
        tags: quote.tags);
  }
}
