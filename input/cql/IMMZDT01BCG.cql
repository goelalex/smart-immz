library IMMZDT01BCG
using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include IMMZConcepts called IMMZc

context Patient

//Check if patient has an immunization for BCG
//Move to IMZCommon
define "Get Immunization":
  [Immunization]

define "BCG Immunization":
  [Immunization: vaccineCode in IMMZc."BCG Vaccine"]



//check for Observation where patient is under immunized
