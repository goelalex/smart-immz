/**
 * Immunization Common Stratifiers
 */

library IMMZStratifiers

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include IMMZConcepts called IMMZc
include IMMZVaccineLibrary called Vaccines

codesystem "ISO-8601-Derived Periods": 'http://ohie.org/CodeSystem/iso-8601-derived-periods'

parameter "Measurement Period" Interval<Date>

// Age Groups for Vaccines for infants
code "P0Y--P1Y": 'P0Y--P1Y' from "ISO-8601-Derived Periods" display '< 1 year'
code "P1Y--P9999Y": 'P1Y--P9999Y' from "ISO-8601-Derived Periods" display '> 1 year'

// Age Groups for Vaccines for Toddlers
code "P0Y--P2Y": 'P0Y--P2Y' from "ISO-8601-Derived Periods" display '< 2 years'
code "P2Y--P9999Y": 'P2Y--P9999Y' from "ISO-8601-Derived Periods" display '> 2 years'

context Patient 

// Vaccinations given to infants stratified by age is < 1 yr or > 1 yr
define "Infant Vaccine By Age Stratifier":
    case 
        when AgeInYearsAt(start of "Measurement Period") in Interval[0,1] then "P0Y--P1Y"
        when AgeInYearsAt(start of "Measurement Period") >= 1 then "P1Y--P9999Y"
        else null
    end

// Vaccinations given to toddlers stratified by age is < 2 yr or > 2 yr
define "Toddler Vaccine By Age Stratifier":
    case 
        when AgeInYearsAt(start of "Measurement Period") in Interval[0,2] then "P0Y--P2Y"
        when AgeInYearsAt(start of "Measurement Period") >= 2 then "P2Y--P9999Y"
        else null
    end

// By Geographic Region where the vaccination was provided     
define "By Geographic Region Stratifier": Immunization.location.address.district

// By vaccine dose sequence 
define "By Vaccine Dose Sequence Stratifier": Immunization.protocolApplied.doseNumberPositiveInt

// By Vaccine antigen classification
define "By Vaccine Type Stratifier":
    // TODO: How to apply a case statement to an Immunization? This is my best shot
    case 
        when vaccineCode in IMMZc."BCG Vaccine" then "BCG"
        when vaccineCode in IMMZc."OPV Vaccine" then "OPV"
        // Repeat - for each type of vaccine
    end
