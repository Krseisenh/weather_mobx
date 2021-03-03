class Covid {
  final int confirmed;
  final int recovered;
  final int hospitalized;
  final int deaths;
  final int newConfirm;
  final int newRecovered;
  final int newHospitalized;
  final int newDeaths;
  final String updateDated;
  final String source;

  Covid({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newConfirm,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.updateDated,
    this.source,
  });

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      confirmed: json['Confirmed'] as int,
      recovered: json['Recovered'] as int,
      hospitalized: json['Hospitalized'] as int,
      deaths: json['Deaths'] as int,
      newConfirm: json['NewConfirmed'] as int,
      newRecovered: json['NewRecovered'] as int,
      newHospitalized: json['NewHospitalized'] as int,
      newDeaths: json['NewDeaths'] as int,
      updateDated: json['UpdateDate'] as String,
      source: json['Source'] as String,
    );
  }
}
