library IMMZDT01BCG
using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include IMMZConcepts called IMMZc

context Patient



//Check if the patient recieved an immunization for BCG
define "BCG Immunization":
  [Immunization: vaccineCode in IMMZc."BCG Vaccine"]

//Check for Observation where patient is under immunized
