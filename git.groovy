node {
    stage("download code source"){
        checkout([$class: "GitSCM",
        branches: [[name: "master"]],
        userRemoteConfigs: [[
        credentialsId: "",
        url: "https://github.com/CarlosPalaciosC/simple-java-maven-app.git"
        ]]])

    }
}    