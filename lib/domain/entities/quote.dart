import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final int? id;
  final String? authorName;
  final String? description;
  final String? content;
  final String? url;
  final String? tags;

  const QuoteEntity(
      {this.id,
      this.authorName,
      this.description,
      this.content,
      this.url,
      this.tags});

  @override
  List<Object?> get props {
    return [
      id,
      authorName,
      description,
      content,
      url,
      tags,
    ];
  }
}
