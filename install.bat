java --version
if errorlevel 1 goto ERROR
goto FABRIC

:ERROR
    echo "Java non installé sur la machine : installation de JDK 25"
    winget install --exact --id Oracle.JDK.25

:FABRIC    
    echo "Section Installation de Fabric"
    rem Création dossier temporaire
    cd %userprofile%

    echo "Téléchargement fabric.jar"
    rem télécharge fabric
    
    curl --output fabric.jar --url https://maven.fabricmc.net/net/fabricmc/fabric-installer/1.1.1/fabric-installer-1.1.1.jar

    echo "Début installation Fabric"
    java -jar fabric.jar client -dir "%userprofile%\AppData\Roaming\.minecraft"

    if errorlevel 1 goto EOERR

    del fabric.jar

    echo "Installation de Fabric réussi"
    goto INSTALLMODS

:INSTALLMODS
    echo "Téléchargement et installation des mods"
    cd "%userprofile%\AppData\Roaming\.minecraft\mods"
    curl -O --url https://mediafilez.forgecdn.net/files/7598/646/xaerominimap-fabric-1.21.11-25.3.10.jar
    curl -O --url https://mediafilez.forgecdn.net/files/7525/82/iris-fabric-1.10.5%2Bmc1.21.11.jar
    curl -O --url https://cdn.modrinth.com/data/uXXizFIs/versions/Ii0gP3D8/ferritecore-8.2.0-fabric.jar
    curl -O --url https://cdn.modrinth.com/data/AANobbMI/versions/1OWNgWVR/sodium-fabric-0.8.4%2Bmc1.21.11.jar
    curl -O --url https://cdn.modrinth.com/data/gvQqBUqZ/versions/qvNsoO3l/lithium-fabric-0.21.3%2Bmc1.21.11.jar
    curl -O --url https://mediafilez.forgecdn.net/files/7614/201/voicechat-fabric-1.21.11-2.6.12.jar
    curl -O --url https://mediafilez.forgecdn.net/files/7361/977/fabric-api-0.140.2%2B1.21.11.jar
    curl -O --url https://mediafilez.forgecdn.net/files/7598/539/xaeroworldmap-fabric-1.21.11-1.40.11.jar
    goto EOF

:EOERR
    echo "Erreur lors de l'installation"
    exit /b 1


:EOF
    echo "Installation réussi"
    exit /b 0
