VOLUME=/root/H@H
PORT=65432
PWD=$(shell pwd)

install-docker-ce-for-xenial-amd64:
	# sudo apt-get purge -m -y docker docker-engine
	sudo apt-get install -y apt-transport-https curl \
		software-properties-common ca-certificates
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
	sudo apt-get update
	sudo apt-get install -y docker-ce

install-docker:
	nohup firefox "https://docs.docker.com/engine/installation/" &

run:
	docker pull anapsix/alpine-java
	docker run -it \
		-v $(PWD):$(VOLUME)\
		-p $(PORT):$(PORT) \
		-w $(VOLUME) \
		--name HatH anapsix/alpine-java java -jar HentaiAtHome.jar

pre-setup: grant-access download-client

grant-access:
	sudo usermod -aG docker `whoami`
	newgrp docker
	sudo service docker restart

download-client:
	wget repo.e-hentai.org/hath/HentaiAtHome_1.4.1.zip
	unzip HentaiAtHome_1.4.1.zip



