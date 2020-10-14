#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
 ScatterFeatureRequirement: {}

inputs:
  target: string
  data: Directory

steps:
  list_observations:
    run: list-observations-tool.cwl
    in:
      target: target
      data: data
    out: [observations]
  image:
    run: image-tool.cwl
    scatter: observation
    in:
      observation: list_observations/observations
    out: [image]
  merge_images:
    run: merge-images-tool.cwl
    in:
      images: image/image
    out: [merged_image]

outputs:
  merged_image:
    type: File
