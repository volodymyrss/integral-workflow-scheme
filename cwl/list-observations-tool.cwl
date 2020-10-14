#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [ "bash", "list-observations.sh" ]
hints:
  DockerRequirement:
    dockerPull: centos:7
requirements:
  InitialWorkDirRequirement:
    listing:
    - $(inputs.data)
    - entryname: list-observations.sh
      entry: |-
        #!/bin/bash
        
        ls -ltorR
        
        for i in \$(seq 1 3); do
          date > \$i.obs
          cat data/\$i.data >> \$i.obs
        done


inputs:
  target:
    type: string
    inputBinding:
      position: 1
  data:
    type: Directory
    inputBinding:
      position: 2
outputs:
  observations:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*.obs"

