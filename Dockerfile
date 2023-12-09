# Use the official Jenkins LTS image as base
FROM jenkins/jenkins:lts

# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install suggested plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install suggested plugins using jenkins-plugin-cli
RUN jenkins-plugin-cli --plugins $(cat /usr/share/jenkins/ref/plugins.txt)

# Set Jenkins home directory permissions
USER root
RUN chown -R jenkins:jenkins /var/jenkins_home

# Switch back to the jenkins user
USER jenkins
