class AiService {
  // Predictive analytics placeholder.
  // Use local heuristics now. Later swap for a model API.
  double momentumScore(List<double> prices) {
    if (prices.isEmpty) return 0;
    final recent = prices
        .sublist(prices.length - (prices.length >= 5 ? 5 : prices.length));
    final diff = recent.last - recent.first;
    return diff / (recent.first + 1);
  }

  String summarizeNews(String text) {
    // Simple extractive summary stub.
    final sentences = text.split(RegExp(r'[.!?]'));
    return sentences.take(2).join('. ').trim();
  }
}
