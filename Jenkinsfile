node('docker') {
    def app
    def VERSION=env.VERSION
    stage('Preparation') { // for display purposes
        if (env.NO_CACHE.toBoolean()) cleanWs()
        checkout scm
        if (! VERSION) VERSION="latest"
    }
    stage('Build') {
        def PARAM="."
        if (env.NO_CACHE.toBoolean()) PARAM="--no-cache ${PARAM}"
        app = docker.build("haoling/openconnect", PARAM)
    }
    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push(VERSION);
        }
    }
}
