FROM dodasts/persistent-storage-base:v2

RUN wget -qO -  https://research.cs.wisc.edu/htcondor/repo/8.9/RPM-GPG-KEY-HTCondor | apt-key add -

RUN add-apt-repository 'deb [arch=amd64] http://research.cs.wisc.edu/htcondor/repo/ubuntu/8.9 bionic main'

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y condor

COPY ./ca.crt /ca.crt

ENV _condor_AUTH_SSL_CLIENT_CAFILE=/ca.crt
ENV _condor_SEC_DEFAULT_AUTHENTICATION_METHODS=SCITOKENS
ENV _condor_SCITOKENS_FILE=/tmp/token
ENV _condot_TOOL_DEBUG=D_FULLDEBUG,D_SECURITY

ENV _condor_COLLECTOR_HOST=131.154.97.120.myip.cloud.infn.it:30618
ENV _condor_SCHEDD_HOST=schedd.cert-manager.svc.cluster.local
