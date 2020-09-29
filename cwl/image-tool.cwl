#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: /home/vsavchenko/cwl/image.sh
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

