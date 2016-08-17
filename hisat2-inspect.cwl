#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement
  - class: EnvVarRequirement
    envDef:
      HISAT2_INDEXES: /full/path/to/generated/index/files

inputs:
  across:
    type: int?
    inputBinding:
      position: 1
      prefix: -a

  names:
    type: boolean?
    inputBinding:
      position: 2
      prefix: -n

  summary:
    type: boolean?
    inputBinding:
      position: 3
      prefix: -s

  snp:
    type: boolean?
    inputBinding:
      position: 4
      prefix: --snp

  ss:
    type: boolean?
    inputBinding:
      position: 5
      prefix: --ss

  ss-all:
    type: boolean?
    inputBinding:
      position: 6
      prefix: --ss-all

  exon:
    type: boolean?
    inputBinding:
      position: 7
      prefix: --exon

  verbose:
    type: boolean?
    inputBinding:
      position: -1
      prefix: -v

  version:
    type: boolean?
    inputBinding:
      position: -2
      prefix: --version

  help:
    type: boolean?
    inputBinding:
      position: -3
      prefix: -h
  
  ht2_base:
    type: string
    inputBinding:
      position: 999

stdout: $(inputs.ht2_base + '.summary')
#stdout: output.summary
outputs:
  output:
    type: stdout

baseCommand: hisat2-inspect
