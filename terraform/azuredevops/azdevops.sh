#!/bin/bash

# Download the agent
wget https://vstsagentpackage.azureedge.net/agent/3.230.0/vsts-agent-linux-x64-3.230.0.tar.gz

# Create the agent
mkdir myagent && cd myagent
tar zxvf ~/vsts-agent-linux-x64-3.230.0.tar.gz


# temp
chmod 777 /home/testadmin/myagent