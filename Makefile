VOLUME="/root/H@H"
PORT=65432

install-docker-ce-for-xenial-amd64:
	sudo apt-get remove docker docker-engine
	sudo apt-get install apt-transport-https curl \
		software-properties-common ca-certificates
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
	sudo apt-get update
	sudo apt-get install docker-ce

install-docker:
	nohup firefox "https://docs.docker.com/engine/installation/" &

run: download-client setup-docker
	docker run -it \
		-v `pwd`: $(VOLUME)\
		-p $(PORT):$(PORT) \
		-w $(VOLUME) \
		-name HatH anapsix/alpine-java java -jar HentaiAtHome.jar

setup-docker: grant-access
	docker pull anapsix/alpine-java

grant-access:
	sudo usermod -aG docker `whoami`
	newgrp docker
	sudo service docker restart

download-client:
	wget repo.e-hentai.org/hath/HentaiAtHome_1.4.1.zip
	unzip HentaiAtHome_1.4.1.zip