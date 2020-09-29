cwl:
	cwltool --move-output --debug scatter-gather.cwl --target test-target

pull-co:
  co --docid 67797105 --store-config pull
