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


```python
general_integral_workflow(target_source_and_time_frame)

# computing general_integral_workflow returns an workflow expression

general_integral_workflow(target_source_and_time_frame) == 
map(model_source_spectrum, 
    source_spectra(target_source_and_time_frame),
)

# during evaluation of source_spectra, another expression is returned:

source_spectra(target_source_and_time_frame) == 
map(lambda observation: process_observation_spectrum(observation, merged_image(merge_images(target_source_and_time_frame))),    
    observations_subset(merged_images(target_source_and_time_frame))
)

# and finally merged_images yields

merged_images(target_source_and_time_frame) ==
merge_images(map(process_image,
   	 			 find_observations(target_source_and_time_frame)
            )          


# 
```
