#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: /home/vsavchenko/cwl/merge-images.sh
inputs:
  images:
    type: File[]
    inputBinding:
      position: 1
outputs:
  merged_image:
    type: File
    outputBinding:
      glob: merged-image

