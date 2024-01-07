import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:equatable/equatable.dart';

abstract class LocalQuotsState extends Equatable {
  final List<QuoteEntity>? quots;

  const LocalQuotsState({this.quots});

  @override
  List<Object> get props => [quots!];
}

class LocalQuotsLoading extends LocalQuotsState {
  const LocalQuotsLoading();
}

class LocalQuotsDone extends LocalQuotsState {
  const LocalQuotsDone(List<QuoteEntity> quots) : super(quots: quots);
}
