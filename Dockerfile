FROM openjdk:8-jre-alpine3.9

ENV JMETER_VERSION=5.4.1
# https://downloads.apache.org/jmeter/binaries/apache-jmeter-5.4.1.tgz.sha512
ENV JMETER_SHA512_HASH=bfc0faa84769b58c1fd498417b3a5c65749f52226bd6e3533f08ca7ea4a3798bb8d2cbd7091b443dd6837f3cbea5565c3c18e6497b40bec95616bf44dfdf590d
# https://ftp.tsukuba.wide.ad.jp/software/apache//jmeter/binaries/apache-jmeter-5.4.1.tgz
ENV DOWNLOAD_URL=https://ftp.tsukuba.wide.ad.jp/software/apache//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

RUN wget -O /tmp/apache-jmeter.tar.gz $DOWNLOAD_URL -q \
 && echo "${JMETER_SHA512_HASH}  /tmp/apache-jmeter.tar.gz" | sha512sum -c \
 && mkdir /opt/jmeter \
 && tar -zxf /tmp/apache-jmeter.tar.gz -C /opt/jmeter/ --strip=1 \
 && mkdir /opt/jmeter/reports

CMD [ "/opt/jmeter/bin/jmeter", "-n", "-t", "/jmeter.jmx", "-l", "/jmeter.result", "-o", "/opt/jmeter/reports" ]
