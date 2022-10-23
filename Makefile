pub-keys := awk -v d="," -F'=' '{s=(NR==1?s:s d)$$2}END{print s}' < secrets/public-age-keys.txt

encrypt:
	sops --encrypt --age $(shell $(pub-keys)) -i .env

decrypt:
	SOPS_AGE_KEY_FILE=$(shell pwd)/secrets/age-key.txt sops --decrypt --age $(shell $(pub-keys)) -i .env
