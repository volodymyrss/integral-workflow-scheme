#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: image.sh
inputs:
  observation:
    type: File
    inputBinding:
      position: 1
outputs:
   image:
     type: File
     outputBinding:
       glob: image

