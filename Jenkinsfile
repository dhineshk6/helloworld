node {
    stage('checkout'){
        
        git url: 'https://github.com/dhineshk6/helloworld.git'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
        }
    
	stage('create docker image') {
		        sh ("docker build -t hello-docker .")
		        sh ("docker tag  hello-docker dhineshk6/test:hello-docker")
    	}
    	
    	stage('push docker image'){
			      sh ("docker push dhineshk6/test:hello-docker")
    	}
	stage('create deployment'){
	      
		sh ("kubectl delete deployments hello-docker-deployment || true")
		sh ("kubectl delete svc hello-docker || true")
	      sh  ("kubectl create -f deployment.yaml --validate=false") 
	      sh ("kubectl create -f services.yaml --validate=false")   
    	}
 }
    
    
