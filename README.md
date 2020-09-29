# integral-workflow-scheme

```python
def general_integral_workflow(target_source_and_time_frame):
  # output: interpretted_source_spectra

  # list_observations: InputRequest -> List[Observation]
  observations = list_observations(target_source_and_time_frame) 

  for observation in observations:
    # process_image: Observation -> Image
    images[observation] = process_image(observation)
  
  # merge_images: List[Image] -> Tuple(Image, List[Observation])
  merged_image, observations_subset = merge_images(images)

  for observation in observations_subset:
    # process_observation_spectrum: (Observation, Image) -> Spectrum
    observation_spectra[observation] = process_observation_spectrum(observation, merged_image)
  
  # merge_spectra_per_source: List[ObservationSpectrum] -> List[SourceSpectrum]
  source_spectra = merge_spectra_per_source(observation_spectra)

  for source_spectrum in source_spectra:
    # model_source_spectrum:  SourceSpectrum -> SourceModel
    modelled_source_spectra[source_spectrum] = model_source_spectrum(source_spectrum)
  
  return modelled_source_spectra
```


```
interpretted_source_spectra = general_integral_workflow(target_source_and_time_frame)

# computing general_integral_workflow returns an workflow expression

interpretted_source_spectra = map(interpret_source_spectrum, merge_spectra_per_source(map()))
```
