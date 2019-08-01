node {
	def application = "springbootapp"
	def dockerhubaccountid = "anujsharma1990"
	stage('Clone repository') {
		checkout scm
	}

	stage('Build image') {
		app = docker.build("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}

	stage('Push image') {
		app.push()
		app.push("latest")
	}

	stage('Deploy') {
		sh ("docker run -d -p 80:8080 -v /var/log/:/var/log/ ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
	
	stage('Remove old images') {
		// remove docker pld images
		sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")
		sh("docker rmi ${application}:${BUILD_NUMBER} -f")
   }
}
