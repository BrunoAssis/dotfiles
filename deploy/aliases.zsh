alias avengers-assemble="gradle clean assemble && ansible-playbook -i hosts deploy-service.yml -u bruno.assis"
alias avengers-shadow="gradle clean shadowJar && ansible-playbook -i hosts deploy-monitor.yml -u bruno.assis"
alias avengers-pollock="ansible-playbook -i hosts deploy.yml -u bruno.assis --ask-sudo-pass"