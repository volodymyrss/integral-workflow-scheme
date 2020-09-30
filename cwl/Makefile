TMPDIR?=/tmp
CWLCACHE=$(TMPDIR)/cwl-cache

cwl:
	mkdir -pv $(CWLCACHE)
	PATH=$(PWD):$(PATH) cwl-runner \
		--move-output \
		--debug \
		--cachedir $(CWLCACHE) \
		scatter-gather.cwl \
			--target test-target

