library IMMZCommon

using FHIR version '4.0.1'

include WHOCommon called WHOc
include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include IMMZConcepts called IMMZc

context Patient

//Get patient immunizations
define "Get Immunization":
  [Immunization]

//Get patient observations
define "Get Observations":
  [Observation]

//Get adverse events 
