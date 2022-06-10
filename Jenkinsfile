pipeline {
    agent {
        dockerfile {
            args '-v ${WORKSPACE}:/ws -v pi-volume:/ws/pi'
        }
    }
    stages {
        stage('Fetch') {
            steps {
                checkout scm
                sh '/ws/scripts/fetch.sh'
            }
        }
        stage('Build') {
            steps {
                sh '/ws/scripts/build.sh'
            }
        }
        stage('Package') {
            steps {
                sh 'mkdir /ws/output/'
                sh 'cp /ws/pi/build/tmp/deploy/images/raspberrypi0-2w-64/core-image-minimal-raspberrypi0-2w-64.wic.bmap /ws/output/'
                sh 'cp /ws/pi/build/tmp/deploy/images/raspberrypi0-2w-64/core-image-minimal-raspberrypi0-2w-64.wic.xz /ws/output/'
                sh 'tar cf /ws/pi-image.$(basename ${GIT_BRANCH})-b${BUILD_NUMBER}-c${GIT_COMMIT} /ws/output/'
                sh 'md5sum /ws/pi-image* > /ws/pi-image.$(basename ${GIT_BRANCH})-b${BUILD_NUMBER}-c${GIT_COMMIT}.md5'
            }
        }
        stage('Deploy') {
            steps {
                sshagent(credentials : ['06923055-62f3-4e61-a366-9a138ec74015']) {
                    sh '''
                        [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
                        ssh-keyscan -t rsa,dsa ahepp.dev >> ~/.ssh/known_hosts
                        ssh root@ahepp.dev "ssh-keyscan -t rsa,dsa www.lan" >> ~/.ssh/known_hosts
                        scp -J root@ahepp.dev /ws/pi-image* root@www.lan:/usr/local/www/pi/
                    '''
                }
            }
        }
        stage('Clean') {
            steps {
                sh 'rm -r /ws/output'
                sh 'rm /ws/pi-image*'
            }
        }
    }
}
