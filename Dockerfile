FROM anapsix/alpine-java

RUN mkdir -p /home/hath \
    cd /home/hath

RUN wget repo.e-hentai.org/hath/HentaiAtHome_1.4.1.zip

RUN unzip HentaiAtHome_1.4.1.zip

ENTRYPOINT ["java", "-jar", "HentaiAtHome.jar"]