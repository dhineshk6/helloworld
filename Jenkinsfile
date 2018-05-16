node {
    docker.withRegistry('https://hub.docker.com/', 'docker-hub-credentials') {
    	
    	stage('checkout'){
        
        git url: 'https://github.com/dhineshk6/helloworld.git'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
        }
    
    	stage('create docker image'){
		        sh 'docker login --username dhineshk6 --password Docker@1234'
		        sh ("docker build -t hello-world-image .")
		        sh ("docker tag  hello-world-image dhineshk6/test:hello-world-image")
    	}
    	
    	stage('push docker image'){
			      sh ("docker push dhineshk6/test:hello-world-image")
    	}
	stage('create deployment'){
    	      sh 'kubectl delete deployment hello-world-deployment || true' 
	          sh 'kubectl create -f deployment.yaml'
    	}
    	
    	
    }
    }
