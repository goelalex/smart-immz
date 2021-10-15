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

// check vaccine status
define "Immunization Status":
  [Immunization] I
    return I.status

//check Immunization.status for not-done
define "Immunization Completed":
  [Immunization] I
    where I.status in {'completed'}

//check Immunization.status for not-done
define "Immunization Not Done":
  [Immunization] I
    where I.status in {'not-done'}

//how do we handle entered-in-error? It seems like it should be different from not-done in how it should be handled? These should be ignored so we likely don't need to check for them

//check vaccine status reason - e.g. if vaccine was not given
define "Immunization StatusReason":
  [Immunization] I
    return I.statusReason

//define statusReason Immunizations for when it was not given

//Procedure for vaccine administration


//Get patient observations
define "Get Observations":
  [Observation]

//Get adverse events - should be captured in Observations
