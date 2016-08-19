#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement
  - class: EnvVarRequirement
    envDef:
      HISAT2_INDEXES: /full/path/to/generated/index/files

inputs:

  hisat2_idx:
    type: string
    default: "index"
    inputBinding:
      position: 1
      prefix: -x
  
  exclusive_reads:
    type:
      - type: record
        name: paired
        fields:
          mate_1:
            type:
              type: array
              items: File
            inputBinding:
              prefix: "-1"
          mate_2:
            type:
              type: array
              items: File
            inputBinding:
              prefix: "-2"
      - type: record
        name: unpaired
        fields:
          unpaired:
            type:
              type: array
              items: File
            inputBinding:
              prefix: -U

  sra_number:
    type:
      - "null"
      - type: array
        items: string
        inputBinding:
          position: 5
          prefix: --sra-acc

  file_format:
    type:
      - type: record
        name: fastq
        fields:
          fastq:
            type: boolean
            inputBinding:
              prefix: -C
      - type: record
        name: fasta
        fields:
          fasta:
            type: boolean
            inputBinding:
              prefix: -f
      - type: record
        name: oneseq
        fields:
          oneseq:
            type: boolean
            inputBinding:
              prefix: -r
      - type: record
        name: qseq
        fields:
          qseq:
            type: boolean
            inputBinding:
              prefix: --qseq

  outfilename:
    type: string
    default: alignments.sam
    inputBinding:
      prefix: -S
      position: 999
     
outputs:

   hit:
    type: File
    outputBinding:
      glob: $(inputs.outfilename)

baseCommand: hisat2
