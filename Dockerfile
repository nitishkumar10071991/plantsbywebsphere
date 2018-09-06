
#IMAGE: Get the base image for Liberty
FROM websphere-liberty:webProfile7

#BINARIES: Add in all necessary application binaries
COPY ./server.xml /config
COPY ./binary/application/* /config/dropins/
RUN mkdir /config/lib
COPY ./binary/lib/* /config/lib/

#FEATURES: Install any features that are required
RUN apt-get update && apt-get dist-upgrade -y \
&& rm -rf /var/lib/apt/lists/*
RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense \
	jsp-2.3 \
	ejbLite-3.2 \
	ejbRemote-3.2 \
	servlet-3.1 \
	mdb-3.2 \
	jndi-1.0 \
	jdbc-4.2 \
	jms-2.0 \
	jpa-2.1 \
	wasJmsServer-1.0 \
	javaMail-1.5 \
	wasJmsClient-2.0; exit 0

