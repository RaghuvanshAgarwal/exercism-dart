class Etl {
  Map<String, int> transform(Map<String, List<String>> legacyData) {
    Map<String, int> transformedData = {};
    for (final entryChunk in legacyData.entries) {
      for (String entry in entryChunk.value) {
        transformedData[entry.toLowerCase()] = int.parse(entryChunk.key);
      }
    }
    return transformedData;
  }
}
