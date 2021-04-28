
Running the UI for HTCondor submission:
```bash
docker build . -t htc
docker run -ti -e _condor_COLLECTOR_HOST=<collector-url> -e _condor_SCHEDD_HOST=<schedd-url> htc bash
```

Then put the token in /tmp/token file and try out an htcondor command like:

```bash
condor_status -any
```
