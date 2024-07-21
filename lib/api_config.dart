class ApiConfig {
  static const String _baseFinnhubURL = 'https://finnhub.io/api/v1';

  static String getProfileUrl(String symbol, String apiKey) {
    return '$_baseFinnhubURL/stock/profile2?symbol=$symbol&token=$apiKey';
  }

  static String getQuoteUrl(String symbol, String apiKey) {
    return '$_baseFinnhubURL/quote?symbol=$symbol&token=$apiKey';
  }
}
