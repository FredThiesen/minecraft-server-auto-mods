pipeline {
    agent any
	stages {
        stage('Build Docker Image') {
			steps {
                script {
                    def app = docker.build("my-minecraft-server:${env.BUILD_ID}")
                }
            }
		}
		stage('Run Docker Container') {
			steps {
                sh 'docker-compose up -d'
            }
								}
		     stage('Install Mods') {

				 steps {
                sh 'docker-compose run --rm -v $(pwd)/mods.txt:/mods.txt minecraft sh -c "while read mod; do wget -P mods/ $mod; done < /mods.txt"'
            }
        }
    }
}

