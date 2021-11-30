/*
 * Immunization Indicator 1: Vaccine coverage for each vaccine in the national schedule
 * 
 * Desired output is a single MeasureReport where:
 *  Id = IMMZ.IND.1
 *  Groups = One Group per Antigen / Dose Sequence Number (example: OPV1 group, OPV2 group, OPV3 group)
 *      Numerator: Count of Immunization resources administered during the reporting period with the vaccine code falls within a category (BCG, OPV, etc.) and dose sequence number matches group
 *      Denominator: Count of ImmunizationRecommendation resources due during the reporting period with the vaccine recommended (BCG, OPV, etc.) and dose sequence number matches group
 *      Stratifiers: 
 *          - By Age (toddler or infant doses are used)
 *          - By Geographic Region
 * 
 * Discussion:
 *  1. Figure out how to have multiple groups as output for the CQL tooling (most of the examples are one group with one denominator)
 *      - Potentially will need to create separate indicators for each of the vaccine codes/dose sequence?
 *  2. Validate the stratifier selectors (see IMMZStratifiers.cql) 
 */

 
library IMMZIND01

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include IMMZConcepts called IMMZc
include IMMZStratifiers called IMMZStratifiers
include IMMZVaccineLibrary called IMMZvl

parameter "Measurement Period" Interval<Date>

context Patient 

// TODO: How to group these so the CQL processor can create the proper measure resources

define "BCG Coverage Numerator":
    [Immunization: vaccineCode in IMMZc."BCG Vaccine"] I
        where I.occurenceDateTime during "Measurement Period"

define "BCG Coverage Denominator":
    [ImmunizationRecommendation: recommendation.vaccineCode in IMMZc."BCG Vaccine"] I
        where I.recommendation.dateCriterion.select(value during "Measurement Period")

define "BCG Age Stratifier":
    IMMZStratifiers."Infant By Age Stratifier"

define "BCG Geographic Region Stratifier":
    IMMZStratifiers."By Geographic Region Stratifier"


