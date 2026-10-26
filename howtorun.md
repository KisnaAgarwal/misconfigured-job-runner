# OPERATION: BLACK VEIL

## Build

```bash
cd misconfigured-job-runner
sudo docker build -t black-veil .
```

## Run

```bash
sudo docker run --rm -it --hostname NX-044 black-veil
```

## Start investigating

Inside the container:

```bash
whoami
ls -la
cat WELCOME.txt
cat MISSION_BRIEF.md
cat incident-report.txt
sudo -l
```

## Exit

```bash
exit
```

## Rebuild after changes

```bash
sudo docker build --no-cache -t black-veil .
```