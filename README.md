# integral-workflow-scheme

```python
def general_integral_workflow(target_source, time_frame):
  # output: interpretted_source_spectra

  observations = list_observations(target_source, time_frame) 

  for observation in observations:
    images[observation] = process_image(observation)
  
  merged_image, observations_subset = merge_images(images)

  for observation in observations_subset:
    spectra[observation] = process_observation_spectrum(observation, merged_image)
  
  merge_spectra_by_source = merge_spectra_per_source(spectra)

  for source_spectrum in merge_spectra_by_source:
    interpretted_source_spectra[source_spectrum] = interpret_source_spectrum(source_spectrum)
  
  return interpretted_source_spectra
```

