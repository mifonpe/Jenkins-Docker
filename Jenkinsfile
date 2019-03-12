pipeline {
    agent any
    
    tools {
        maven 'LocalMaven'
    }
    
    stages {
        stage ('Build Servlet Project') {
            steps {
                /*For windows machine */
               //bat  'mvn clean package'

                /*For Mac & Linux machine */
                sh  'mvn clean package'
            }

            post{
                success{
                    echo 'Now Archiving ....'

                    archiveArtifacts artifacts : '**/*.war'
                }
            }
        }

        stage ('Create Tomcat Docker Image') {
            steps{
                sh "sudo docker build . -t tomcatwebapp:${env.BUILD_ID}"

                //bat "docker build . -t tomcatwebapp:${$env.BUILD_ID}"

            }
            
            
            post{
                success{
                    sh "sudo docker run -p 8083:8083 tomcatwebapp:${env.BUILD_ID}"
                }
            }
        }

    }
}
