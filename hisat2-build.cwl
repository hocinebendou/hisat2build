#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

inputs:
  reference_in:
    type: { type: array, items: File }
    inputBinding:
      position: 1
      prefix: -f

  large_index:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --large-index

  no_auto_depend:
    type:
      - "null"
      - type: record
        name: no_auto_depend
        fields:
          b_max:
            type: int?
            inputBinding:
              position: 4
              prefix: --bmax
          b_max_divn:
            type: int?
            inputBinding:
              position: 5
              prefix: --bmaxdivn
          dcv:
            type: int?
            inputBinding:
              position: 6
              prefix: --dcv
          no_auto:
            type: boolean
            inputBinding:
              position: 3
              prefix: --noauto

  no_dc:
    type: boolean?
    inputBinding:
      position: 7
      prefix: --nodc

  exclusive_bitpacking:
    type:
      - "null"
      - type: record
        name: nopack
        fields:
          nopack:
            type: boolean
            inputBinding:
              position: 8
              prefix: -r
      - type: record
        name: pack
        fields:
          pack:
            type: boolean
            inputBinding:
              position: 8
              prefix: "-3"

  offrate:
    type: int?
    inputBinding:
      position: 9
      prefix: -t

  loffrate:
    type: int?
    inputBinding:
      position: 10
      prefix: --localoffrate

  threads:
    type: int?
    inputBinding:
      position: 11
      prefix: -p
  
  snps:
    type: File?
    inputBinding:
      position: 12
      prefix: --snp
  
  haplotype:
    type: File?
    inputBinding:
      position: 13
      prefix: --haplotype

  ss_exon:
    type:
      - "null"
      - type: record
        name: ss_exon
        fields:
          ss:
            type: File?
            inputBinding:
              position: 14
              prefix: --ss
          exon:
            type: File?
            inputBinding:
              position: 15
              prefix: --exon

  seed:
    type: int?
    inputBinding:
      position: 16
      prefix: --seed

  cutoff:
    type: int?
    inputBinding:
      position: 17
      prefix: --cutoff

  quiet:
    type: boolean?
    inputBinding:
      position: 18
      prefix: -q

  help:
    type: boolean?
    inputBinding:
      position: 0
      prefix: -h

  version:
    type: boolean?
    inputBinding:
      position: -1
      prefix: --version

  out_name:
    type: string
    default: "index"
    inputBinding:
      position: 999

outputs:
  hisat_indexes:
    type: { type: array, items: File }
    outputBinding:
      glob: $(inputs.out_name + '.[1-8].ht2')

baseCommand: hisat2-build  
