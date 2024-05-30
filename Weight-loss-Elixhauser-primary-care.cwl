cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  abnormal-weight-loss-elixhauser-primary-care---primary:
    run: abnormal-weight-loss-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  moderate-weight-loss-elixhauser-primary-care---primary:
    run: moderate-weight-loss-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: abnormal-weight-loss-elixhauser-primary-care---primary/output
  weight-loss-elixhauser-primary-care-protein---primary:
    run: weight-loss-elixhauser-primary-care-protein---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: moderate-weight-loss-elixhauser-primary-care---primary/output
  proteinenergy-weight-loss-elixhauser-primary-care---primary:
    run: proteinenergy-weight-loss-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care-protein---primary/output
  weight-loss-elixhauser-primary-care-deficiency---primary:
    run: weight-loss-elixhauser-primary-care-deficiency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: proteinenergy-weight-loss-elixhauser-primary-care---primary/output
  nutritional-weight-loss-elixhauser-primary-care---primary:
    run: nutritional-weight-loss-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care-deficiency---primary/output
  weight-loss-elixhauser-primary-care-unspecified---primary:
    run: weight-loss-elixhauser-primary-care-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: nutritional-weight-loss-elixhauser-primary-care---primary/output
  weight-loss-elixhauser-primary-care---primary:
    run: weight-loss-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care-unspecified---primary/output
  weight-loss-elixhauser-primary-care-anaemia---primary:
    run: weight-loss-elixhauser-primary-care-anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care---primary/output
  weight-loss-elixhauser-primary-care-kwashiorkor---primary:
    run: weight-loss-elixhauser-primary-care-kwashiorkor---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care-anaemia---primary/output
  weight-loss-elixhauser-primary-care-specified---primary:
    run: weight-loss-elixhauser-primary-care-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care-kwashiorkor---primary/output
  weight-loss-elixhauser-primary-care-sequelae---primary:
    run: weight-loss-elixhauser-primary-care-sequelae---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care-specified---primary/output
  severe-weight-loss-elixhauser-primary-care---primary:
    run: severe-weight-loss-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: weight-loss-elixhauser-primary-care-sequelae---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: severe-weight-loss-elixhauser-primary-care---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
