#!/usr/bin/env cwl-runner


cwlVersion: "cwl:draft-3"
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

inputs:
  - id: reference_in
    type: 
      type: array
      items: File
    inputBinding:
      position: 1
      prefix: -f 
  
  - id: large_index
    type: ["null", boolean]
    inputBinding:
      position: 2
      prefix: --large-index
  
  - id: no_auto_depend
    type:
      - "null"
      - type: record
        name: no_auto_depend
        fields:
          - name: b_max
            type: ["null", int]
            inputBinding:
              position: 3
              prefix: --bmax
          - name: b_max_divn
            type: ["null", int]
            inputBinding:
              position: 3
              prefix: --bmaxdivn
          - name: dcv
            type: ["null", int]
            inputBinding:
              position: 3
              prefix: --dcv
          - name: no_auto
            type: boolean
            inputBinding:
              position: 2
              prefix: --noauto

  - id: no_dc
    type: ["null", boolean]
    inputBinding:
      position: 3
      prefix: --nodc
  
  - id: exclusive_bitpacking
    type:
      - "null"
      - type: record
        name: nopack
        fields:
          - name: nopack
            type: boolean
            inputBinding:
              position: 4
              prefix: -r
      - type: record
        name: pack
        fields:
          - name: pack
            type: boolean
            inputBinding:
              position: 4
              prefix: "-3"

  - id: offrate
    type: ["null", int]
    inputBinding:
      position: 5
      prefix: -o

  - id: ftab
    type: ["null", int]
    inputBinding:
      position: 5
      prefix: -t

  - id: loffrate
    type: ["null", int]
    inputBinding:
      position: 5
      prefix: --localoffrate

  - id: threads
    type: ["null", int]
    inputBinding:
      position: 5
      prefix: -p

  - id: snps
    type: ["null", File]
    inputBinding:
      position: 5
      prefix: --snp
  
  - id: haplotype
    type: ["null", File]
    inputBinding:
      position: 5
      prefix: --haplotype
  
  - id: ss_exon
    type:
      - "null"
      - type: record
        name: ss_exon_depend
        fields:
          - name: ss
            type: ["null", File]
            inputBinding:
              position: 6
              prefix: --ss
          - name: exon
            type: ["null", File]
            inputBinding:
              position: 7
              prefix: --exon
 
  - id: seed
    type: ["null",int]
    inputBinding:
      position: 8
      prefix: --seed

  - id: cutoff
    type: ["null", int]
    inputBinding:
      position: 8
      prefix: --cutoff

  - id: quiet
    type: ["null", boolean]
    inputBinding:
      position: 8
      prefix: -q

  - id: help
    type: ["null", boolean]
    inputBinding:
      position: 1
      prefix: -h

  - id: version
    type: ["null", boolean]
    inputBinding:
      position: 1
      prefix: --version

  - id: out_name
    type: string
    default: "default"
    inputBinding:
      position: 999

outputs:
  - id: output
    type: { type: array, items: File }
    outputBinding:
      glob: $(inputs.out_name + '.[1-8].ht2')

baseCommand: hisat2-build

