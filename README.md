# Plugged-Jenkins
This repo contains Jenkins Dockerfile setup with preinstalled plugins
### How to run this?

**Option 1:**
```bash
git clone https://github.com/nilanjanb3/Plugged-Jenkins.git
cd Plugged-Jenkins
docker compose up -d
```

**Option 2:**
```bash
docker run -d \
  --name jenkins \
  --network host \
  -e JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
  -e JENKINS_OPTS="--prefix=/jenkins" \
  -v jenkins_home:/var/jenkins_home \
  -p 8080:8080 \
  -p 50000:50000 \
  --restart always \
  nilanjanb3/plugged-jenkins:latest
```
Jenkins will run at: http://<your machine ip / localhost>:8080

> I prefer to run Jenkins in Host Network for a POC, it'll automatically discard the port mapping. 
You can do either of one 😊
