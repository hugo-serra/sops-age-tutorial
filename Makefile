pub-keys := awk -v d="," -F'=' '{s=(NR==1?s:s d)$$2}END{print s}' < secrets/public-age-keys.txt

encrypt:
	sops -e --age $(shell $(pub-keys)) -i $(file)

decrypt:
	SOPS_AGE_KEY_FILE=$(shell pwd)/secrets/age-key.txt sops -d --age $(shell $(pub-keys)) -i $(file)
