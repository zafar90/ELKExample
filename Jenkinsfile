node {
	def application = "springbootapp"
	def dockerhubaccountid = "anujsharma1990"
	stage('Clone repository') {
		checkout scm
	}

	stage('Build image') {
		app = docker.build("${application}:${BUILD_NUMBER}")
	}

	stage('Push image') {
		app.push("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
		app.push("${dockerhubaccountid}/${application}:latest")
	}

	stage('Deploy') {
		sh ("docker run -d -p 80:8080 -v /var/log/:/var/log/ ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
	
	stage('Remove old images') {
		// remove docker pld images
		sh("${dockerhubaccountid}/${application}:latest ")
		sh("${application}:${BUILD_NUMBER}")
   }
}
