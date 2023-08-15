pipeline {
    agent {
        docker {
            image 'maven:3.9.0'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Manual Approve') {
            steps {
                
                input message:'Lanjut ke Deploy Stage ?'
            }
        }
        stage('Deploy') {
            steps {
                
                sh './jenkins/scripts/deliver.sh'
                sleep(time:1,unit:"MINUTES")
            }
        }
    }
}