FROM jenkins/jenkins:2.518-jdk21

USER root

# update system and install tools
RUN apt-get update && apt-get install -y lsb-release ca-certificates curl && \
		install -m 0755 -d /etc/apt/keyrings && \
		curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
		chmod a+r /etc/apt/keyrings/docker.asc && \
		echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
		https://download.docker.com/linux/debian $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" \
		| tee /etc/apt/sources.list.d/docker.list > /dev/null && \
		apt-get update && apt-get install -y docker-ce-cli && \
		apt-get clean && rm -rf /var/lib/apt/lists/*

USER jenkins

# copy the list of plugins to install
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

