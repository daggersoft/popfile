FROM alpine:latest
LABEL maintainer="Kristopher Nelson <kristopher+docker-popfile@krisnelson.org>"
LABEL modifier="Nick Collett <Nick.Collett@daggersoft.co.uk>"

# Update base system
RUN	apk update && \
	apk upgrade && \
 	apk add --no-cache ca-certificates && \
 	update-ca-certificates

# Install Perl dependencies
RUN	apk add perl \
		perl-dbi \
		perl-dbd-sqlite \
		perl-date-format \
		perl-html-template \
		perl-io-socket-ssl \
		perl-html-tagset 

# Get source of POPFile
RUN	wget http://getpopfile.org/downloads/popfile-1.1.3.zip -P /tmp/
# File Provided if official site is down
# COPY popfile-1.1.3.zip /tmp/

# Expand file
WORKDIR /var/lib/popfile
 RUN unzip /tmp/popfile-1.1.3.zip && \
	 chmod ug+x popfile.pl

# A data/config/storage volume
WORKDIR /data
VOLUME ["/data"]

# Available ports
EXPOSE 110 8080

# Popfile Directories
ENV	POPFILE_ROOT=/var/lib/popfile/ \
	POPFILE_USER=/data

CMD ["perl", "/var/lib/popfile/popfile.pl", "--set", "html_local=0"]
