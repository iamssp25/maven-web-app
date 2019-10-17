node('master') {

try {
  stage('Code from SCM') {
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'iamgithub', url: 'https://github.com/iamssp25/maven-web-app.git']]])
    sh "ls -ltr"
  }
  stage('Package') {
  sh "cd ${WORKSPACE}"
  sh "/usr/local/src/apache-maven/bin/mvn clean package"
  sh "ls -ltr"
}
  stage('Deploy') {
    sh "cd ${WORKSPACE}/target"
    sh "sudo cp sspcloudproweb.war /home/ec2-user/tomcat8/webapps/"
  }
slackSend channel: '#july-devops', color: 'good', message: "Success ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|JenkinsUrl>)", teamDomain: 'sspcloudpro', tokenCredentialId: 'tokensspslack', username: 'sspcloudpro'
} catch(Exception ex) {
         println("Catching the exception");
         slackSend channel: '#july-devops', color: 'bad', message: 'Failed ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)', teamDomain: 'sspcloudpro', tokenCredentialId: 'tokensspslack', username: 'sspcloudpro'
      }


}
