/*
 * Immunization Indicator 2: Dropout of DTP1 through DTP3
 * 
 * Desired output is a single MeasureReport where:
 *  Id = IMMZ.IND.2
 *  Groups = One group representing the dropout count
 *      Numerator: Count of Immunizations which were DTP1 given in the reporting period
 *      Numerator Exclusion: Count of immunizations which were DTP3 given in the reporting period
 *      Denominator: Count of immunizations which were DTP1 in the reporting period
 *      Stratifiers: 
 *          - By Geographic Region
 * 
 * Discussion:
 *  1. Should discrete reporting of a single dropout be used? The one listed above is more of an aggregate count. Ideally we could represent:
 *      Numerator: Count of Patient where age > recommended date for DTP3 and exists an Immunization for DTP1 and where not exists an Immunization for DTP3 
 *      Denominator: Count of patient where age > recommended date for DTP3 and exists an Immunization for DTP1
 */