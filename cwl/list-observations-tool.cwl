#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: list-observations.sh
inputs:
  target:
    type: string
    inputBinding:
      position: 1
outputs:
  observations:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*.obs"

