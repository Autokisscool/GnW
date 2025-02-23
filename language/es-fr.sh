#!/bin/bash

# Liste des répertoires à parcourir
REPERTOIRES_CIBLES=(
    "./instalacion"
    "./scene"
    "."
)

lang="Français"

# Récupérer le nom du fichier actuel
SCRIPT_ACTUEL=$(basename "$0")

# Vérifier si au moins un répertoire existe
REPERTOIRE_VALIDE=false
for REPERTOIRE in "${REPERTOIRES_CIBLES[@]}"; do
    if [[ -d "$REPERTOIRE" ]]; then
        REPERTOIRE_VALIDE=true
        break
    fi
done

if ! $REPERTOIRE_VALIDE; then
    echo "❌ Erreur : Aucun des répertoires spécifiés n'existe."
    read -p "Appuyez sur Entrée pour quitter..."
    exit 1
fi

# Fonction pour modifier certaines phrases dans un fichier
modifier_phrases() {
    local fichier="$1"

# Effectuer les modifications avec sed sans afficher les erreurs
sed -i "s#Menu ayuda para el flasheo#Menu d'aide pour le flashage#" "$fichier"
sed -i "s#Utilidades de flasheo#Utilitaires de flashage#" "$fichier"
sed -i "s#Menu de flasheo#Menu de flashage#" "$fichier"
sed -i "s#Consola seleccionada#Console sélectionnée#" "$fichier"
sed -i "s#Menu de utilidades de flasheo#Menu des utilitaires de flashage#" "$fichier"
sed -i "s#Selecciona con las flechas la opcion deseada:#Sélectionnez l'option souhaitée avec les flèches :#" "$fichier"
sed -i "s#Preparacion del sistema: update+upgrade+instalacion de paquetes (requerido si no se ha hecho antes)#Préparation du système : mise à jour + upgrade + installation des paquets (nécessaire si cela n'a pas été fait auparavant)#" "$fichier"
sed -i "s#Instalacion/Actualizacion del repo de las herramientas backup y restauracion#Installation ou actualisation du dépôt des outils de sauvegarde et de restauration#" "$fichier"
sed -i "s#Instalacion/Actualizacion del repo del flashloader#Installation ou actualisation du dépôt du flashloader#" "$fichier"
sed -i "s#Instalacion/Actualizacion del repo del emulador Retro-Go#Installation ou actualisation du dépôt de l'émulateur Retro-Go#" "$fichier"
sed -i "s#Instalacion/Actualizacion del repo del parche custom firmware para G&W Super Mario#Installation ou actualisation du dépôt du patch firmware personnalisé pour Game and Watch Super Mario#" "$fichier"
sed -i "s#Instalacion/Actualizacion del repo del reductor para juegos LCD de Mame (LCD-Game-Shrinker)#Installation ou actualisation du dépôt pour jeux LCD de Mame (LCD-Game-Shrinker)#" "$fichier"
sed -i "s#Actualizador del firmware del STLINK v2#Mise à jour du firmware du STLINK v2#" "$fichier"
sed -i "s#Utilidades de flasheo#Utilitaires de flashage#" "$fichier"
sed -i "s#menu de flasheo#menu de flashage#" "$fichier"   
sed -i "s#Usuario actual#Utilisateur actuel#" "$fichier"
sed -i "s#Selecciona con las flechas la opcion deseada#Sélectionnez l'option souhaitée avec les flèches#" "$fichier"
sed -i "s#Backup, restauracion y liberacion de la#Sauvegarde, restauration et libération de la#" "$fichier"
sed -i "s#Instalacion Custom FirmWare (CFW) y RetroGo y backup/restauracion#Installation de Custom Firmware (CFW) RetroGo et backup/restauration#" "$fichier"
sed -i "s#-restauracion de save states en#-restauration des save states sur#" "$fichier"
sed -i "s#Generación roms#Génération des roms#" "$fichier"
sed -i "s#Coloca tus roms y artworks de Game&Watch que desees transformar#Placez vos roms et artworks de Game and Watch que vous souhaitez transformer#" "$fichier"
sed -i "s#IMPORTANTE: Para que el script funcione deberas tener en cuenta lo siguiente:#IMPORTANT : Pour que le script fonctionne, veuillez tenir compte des éléments suivants :#" "$fichier"
sed -i "s#Las roms deben ser del romset 0.229 de Mame, en formato No-merged y deben ser colocadas en el directorio#Les roms doivent provenir du romset 0.229 de Mame, en format No-merged et doivent être placées dans le répertoire#" "$fichier"
sed -i "s#Los artworks deben copiarse al directorio#Les artworks doivent être copiés dans le répertoire#" "$fichier"
sed -i "s#Ambos archivos (rom y artwork) deben estar en formato zip y deben tener el mismo nombre.#Les deux fichiers (rom et artwork) doivent être au format zip et avoir le même nom.#" "$fichier"
sed -i "s#Recuerda: las roms convertidas las encontraras en#Rappelez-vous : les roms converties seront disponibles dans#" "$fichier"
sed -i "s#Presiona cualquier tecla para continuar#Appuyez sur n'importe quelle touche pour continuer#" "$fichier"
sed -i "s#Proceso cancelado#Processus annulé#" "$fichier"
sed -i "s#Proceso realizado. Presiona cualquier tecla para continuar#Processus terminé. Appuyez sur n'importe quelle touche pour continuer#" "$fichier"
sed -i "s#Encontrado paquete dialog, se prosigue...#Paquet dialog trouvé, on continue...#" "$fichier"
sed -i "s#No encontrado paquete dialog necesario, instalando...#Paquet dialog non trouvé, installation en cours...#" "$fichier"
sed -i "s#Instalado!!#Installé !!#" "$fichier"
sed -i "s#Cambio de usuario. IMPORTANTE: la primera vez es esencial ejecutar esto para el correcto funcionamiento#Changement d'utilisateur. IMPORTANT : La première fois, il est essentiel d'exécuter cela pour un fonctionnement correct#" "$fichier"
sed -i "s#Cambio de modelo de consola#Changement du modèle de console#" "$fichier"
sed -i "s#IMPORTANTE: Escoge el modelo correcto para el correcto funcionamiento#IMPORTANT : Choisissez le bon modèle pour un fonctionnement correct#" "$fichier"
sed -i "s#Menu instalacion paquetes y programas necesarios y actualizacion del firm del STLINK#Menu d'installation des paquets et programmes nécessaires et mise à jour du firmware du STLINK#" "$fichier"
sed -i "s#Menu scene: backup/restauracion/liberacion,flasheo custom firm con Retro-Go y backup/restauracion save states#Menu scène : sauvegarde/restauration/déverrouillage, flashage du firmware personnalisé avec Retro-Go et sauvegarde/restauration des save states#" "$fichier"
sed -i "s#Actualizar el repo local de estos scripts#Mettre à jour le dépôt local de ces scripts#" "$fichier"
sed -i "s#Se crea directorio#Création du répertoire#" "$fichier"
sed -i "s#se crea el entorno virtual de python, se activa y se instalan los modulos requeridos para los diferentes repos.#Création de l'environnement virtuel Python, activation et installation des modules requis pour les différents dépôts.#" "$fichier"
sed -i "s#Modulos requeridos para retrogo -> ver requirements.txt del repo de retrogo#Modules requis pour RetroGo -> voir requirements.txt du dépôt RetroGo#" "$fichier"
sed -i "s#Modulos requeridos para LCD-Shrinker -> ver requirements.txt del repo del LCD-Shrinker#Modules requis pour LCD-Shrinker -> voir requirements.txt du dépôt LCD-Shrinker#" "$fichier"
sed -i "s#Requerimientos por paquetes deprecados#Exigences pour les paquets obsolètes#" "$fichier"
sed -i "s#se activa y se instalan los modulos requeridos para el repo del patch.#Activation et installation des modules requis pour le dépôt du patch.#" "$fichier"
sed -i "s#Modulos requeridos para el patch -> ver requirements.txt del repo del patch#Modules requis pour le patch -> voir requirements.txt du dépôt du patch#" "$fichier"   
sed -i "s#hola#salut#" "$fichier"  
sed -i "s#adios#bye#" "$fichier" 
sed -i "s#POR FAVOR LEER#VEUILLEZ LIRE#" "$fichier"  
sed -i "s#MUY IMPORTANTE#TRÈS IMPORTANT#" "$fichier" 
sed -i "s#Dos normas son obligatorias#Deux règles sont obligatoires#" "$fichier"  
sed -i "s#NUNCA desconectes el stlink del usb#NE DÉBRANCHEZ JAMAIS le stlink du port USB#" "$fichier" 
sed -i "s#NUNCA BAJO NINGUN CONCEPTO sigas con el paso siguiente si el actual te dió error#EN AUCUN CAS ne passez à l’étape suivante si l’actuelle a échoué#" "$fichier"  
sed -i "s#El proceso de liberación consta de 5 pasos. Cada uno se encarga de un proceso vital en la liberación y no se debe saltar al paso siguiente hasta haber completado el actual. En algunos pasos el ordenador nos dará instrucciones sobre como proceder. Es importante seguirlas tal y como se exponen. Ademas, en algunos momentos puede parecer que el proceso se ha parado pero no es así; algunos pasos pueden tardar hasta 5 minutos en completarse. NOTA: Se recomienda realizar el proceso con la batería cargada al 100% para evitar sustos#Le processus de déverrouillage comporte 5 étapes. Chacune est essentielle et ne doit pas être sautée. L’ordinateur fournira des instructions à suivre strictement. Certains moments peuvent sembler figés, mais le processus peut prendre jusqu'à 5 minutes. REMARQUE : Il est recommandé d’effectuer la procédure avec une batterie chargée à 100% pour éviter les interruptions.#" "$fichier" 
sed -i "s#Sanity check: comprobacion de dependencias y elementos necesarios#Vérification : contrôle des dépendances et des éléments nécessaires#" "$fichier"  
sed -i "s#Backup flash externa: realiza un backup de la flash SPI. No modifica el contenido#Sauvegarde de la flash externe : effectue une copie de la flash SPI sans modification du contenu#" "$fichier" 
sed -i "s#Backup de la flash interna: ATENCION: se modifica el contenido de la flash SPI del punto anterior. Puede tardar hasta 5 min#Sauvegarde de la flash interne : ATTENTION : le contenu de la flash SPI précédente sera modifié. Cela peut prendre jusqu'à 5 minutes#" "$fichier"  
sed -i "s#Desbloqueo de la consola: Desactiva la proteccion contra escritura. ATENCION: este proceso BORRA la flash del STM32#Déverrouillage de la console : Désactive la protection en écriture. ATTENTION : ce processus EFFACE la flash du STM32#" "$fichier" 
sed -i "s#Restaurar el firmware original#Restaurer le firmware d’origine#" "$fichier"  
sed -i "s#Realizar copia de seguridad del firmware descargado#Effectuer une sauvegarde du firmware téléchargé#" "$fichier" 
sed -i "s#Borrar firmware descargado. ATENCION: realizar si se va a flashear una nueva#Supprimer le firmware téléchargé. ATTENTION : à effectuer uniquement avant un nouveau flashage#" "$fichier"  
sed -i "s#Se realizará una comprobacion de los elementos necesarios#Une vérification des éléments nécessaires sera effectuée#" "$fichier" 
sed -i "s#Si el proceso ha devuelto un error volver a reinstalar el software desde el menu de instalacion#Si une erreur s’est produite, réinstallez le logiciel depuis le menu d’installation#" "$fichier"  
sed -i "s#Backup flash externa#Sauvegarde de la flash externe#" "$fichier" 
sed -i "s#Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas#Il est recommandé d’effectuer la procédure avec une batterie chargée à 100% pour éviter les problèmes#" "$fichier"  
sed -i "s#Si el proceso ha devuelto un error e indica que no se puede conectar con la consola, manten pulsado el botón de encendido y repite el proceso#Si une erreur indique que la connexion à la console a échoué, maintenez le bouton d’alimentation enfoncé et recommencez#" "$fichier" 
sed -i "s#Backup de la flash interna#Sauvegarde de la flash interne#" "$fichier"  
sed -i "s#Desbloqueo de la consola#Déverrouillage de la console#" "$fichier" 
sed -i "s#Por favor, apaga la consola, despues pulsa el boton de encendido y mantenlo pulsado durante unos segundos hasta que empiece el proceso de flasheo. Mientras mantienes el boton pulsa cualquier tecla para continuar y el proceso comenzara#Veuillez éteindre la console, puis appuyer sur le bouton d’alimentation et le maintenir enfoncé quelques secondes jusqu’au début du processus de flashage. Pendant que vous maintenez le bouton, appuyez sur une touche pour continuer et lancer le processus#" "$fichier"  
sed -i "s#Proceso realizado. Quita el conector de la bateria y vuelve a conectarla, despues enciende la consola. Deberia correr el firm original#Processus terminé. Débranchez puis rebranchez la batterie, puis allumez la console. Elle devrait fonctionner avec le firmware d’origine#" "$fichier" 
sed -i "s#Realizar copia de seguridad del firmware descargado#Effectuer une sauvegarde du firmware téléchargé#" "$fichier" 
sed -i "s#Se realizara una copia de seguridad de los archivos del firmware descargados de la consola a#Une sauvegarde des fichiers du firmware téléchargés depuis la console sera effectuée à#" "$fichier" 
sed -i "s#Dentro de ese directorio se creara un subdirectorio con fecha y hora del momento de ejecucion de este proceso. ¿Deseas continuar?#Un sous-dossier avec la date et l'heure d’exécution de ce processus sera créé dans ce répertoire. Voulez-vous continuer ?#" "$fichier" 
sed -i "s#Se han copiado los archivos de la flash interna y externa#Les fichiers de la flash interne et externe ont été copiés#" "$fichier" 
sed -i "s#No se ha encontrado#Non trouvé#" "$fichier" 
sed -i "s#cancelando#annulation en cours#" "$fichier" 
sed -i "s#Proceso realizado#Processus terminé#" "$fichier" 
sed -i "s#Proceso cancelado#Processus annulé#" "$fichier" 
sed -i "s#Se realizara el borrado de los archivos del firmware descargados de la consola. SE RECOMIENDA ENCARECIDAMENTE tener copia de seguridad de dichos archivos. Los scripts no realizan la copia de seguridad de manera automatica por lo que se debera hacer de manera manual con la opcion 6 del menu#Les fichiers du firmware téléchargés depuis la console seront supprimés. IL EST FORTEMENT RECOMMANDÉ d’en avoir une copie de sauvegarde. Les scripts ne réalisent pas cette sauvegarde automatiquement, il faudra la faire manuellement avec l’option 6 du menu#" "$fichier" 
sed -i "s#Backup, restauracion y liberacion#Sauvegarde, restauration et déverrouillage#" "$fichier" 
sed -i "s#¿Deseas continuar?#Voulez-vous continuer ?#" "$fichier" 
sed -i "s#Borrando#Suppression en cours#" "$fichier" 
sed -i "s#Encontrado paquete libncurses5, se prosigue#Paquet libncurses5 trouvé, poursuite du processus#" "$fichier" 
sed -i "s#No encontrado paquete dialog necesario, instalando#Paquet dialog nécessaire non trouvé, installation en cours#" "$fichier" 
sed -i "s#Hacer backup de los save states existentes que hay en la#Effectuer une sauvegarde des états de sauvegarde existants dans la#" "$fichier" 
sed -i "s#Restaurar los save states desde el pc a la#Restaurer les états de sauvegarde du PC vers la#" "$fichier" 
sed -i "s#Borrar los saves states existentes en la#Supprimer les états de sauvegarde existants dans la#" "$fichier" 
sed -i "s#para dejarla limpia#pour la remettre à zéro#" "$fichier" 
sed -i "s#Exportar el guardado de la pila (srm) desde los save states#Exporter la sauvegarde de la pile (srm) à partir des états de sauvegarde#" "$fichier" 
sed -i "s#Importar el guardado de la pila (srm) a los save states#Importer la sauvegarde de la pile (srm) vers les états de sauvegarde#" "$fichier" 
sed -i "s#¡¡¡ATENCION!!! El proceso de BACKUP de los save states puede llegar a tardar varios minutos dependiendo de la cantidad de roms que haya en la G&W y pararlo puede ocasionar errores. ¿Deseas continuar?#ATTENTION !!! Le processus de SAUVEGARDE des états de sauvegarde peut prendre plusieurs minutes selon le nombre de ROMs présentes sur la G&W. L’arrêter peut entraîner des erreurs. Voulez-vous continuer ?#" "$fichier" 
sed -i "s#Enciende la consola y entra al menu Retro-Go con los botones LEFT+GAME y dejala esperando en el listado de las roms#Allumez la console et entrez dans le menu Retro-Go avec les boutons LEFT+GAME, puis laissez-la sur la liste des ROMs#" "$fichier" 
sed -i "s#Para continuar con el proceso pulsa cualquier tecla#Pour continuer le processus, appuyez sur une touche#" "$fichier" 
sed -i "s#Proceso realizado. Save states descargados#Processus terminé. États de sauvegarde téléchargés#" "$fichier" 
sed -i "s#¡¡¡ATENCION!!! El proceso RESTAURACION de los save states puede llegar a tardar varios minutos dependiendo de la cantidad de roms que haya en la#ATTENTION !!! Le processus de RESTAURATION des états de sauvegarde peut prendre plusieurs minutes selon le nombre de ROMs présentes sur la#" "$fichier" 
sed -i "s#y pararlo puede ocasionar errores. ¿Deseas continuar?#et l’arrêter peut entraîner des erreurs. Voulez-vous continuer ?#" "$fichier" 
sed -i "s#¡¡¡ATENCION!!! El proceso BORRAR los save states puede llegar a tardar varios minutos dependiendo de la cantidad de roms que haya en la#ATTENTION !!! Le processus de SUPPRESSION des états de sauvegarde peut prendre plusieurs minutes selon le nombre de ROMs présentes sur la#" "$fichier" 
sed -i "s#Compilar solo Retro-Go sin CFW para consola $consola original sin CFW#Compiler uniquement Retro-Go sans CFW pour la console $consola originale sans CFW#" "$fichier" 
sed -i "s#Descarga y restauracion de saves-states con parametros#Téléchargement et restauration des sauvegardes avec paramètres#" "$fichier"
sed -i "s#Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en#Il est recommandé d'effectuer le processus avec une batterie chargée à 100% pour éviter les problèmes. Seul l'émulateur Retro-Go sera flashé, nous n'aurons donc pas le menu original. Les ROMs existantes dans#" "$fichier"
sed -i "s#Si ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta#Si vous avez déjà exécuté cette option auparavant et qu'une erreur est survenue, démontez la console et relancez cette#" "$fichier"
sed -i "s#opcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente#option et, à ce stade, déconnectez la batterie et reconnectez-la avant de poursuivre#" "$fichier"
sed -i "s#Si durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si#Si, au cours du processus suivant, il indique que le flash a échoué, qu'il ne peut pas se connecter et demande si#" "$fichier"
sed -i "s#vamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo#nous allons effectuer un cycle d'alimentation (retirer la batterie, reconnecter et allumer), nous appuierons sur le bouton d'alimentation et le#" "$fichier"
sed -i "s#mantendremos pulsado unos segundos, le diremos que si con#maintiendrons enfoncé quelques secondes, puis nous confirmerons avec#" "$fichier"
sed -i "s#(yes), entonces el proceso continuara#(oui), alors le processus continuera#" "$fichier"
sed -i "s#ATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone#ATTENTION : Ne relâchez pas le bouton avant que la suppression de la mémoire externe ne commence (lorsque s'affiche#" "$fichier"
sed -i "s#en la pantalla#sur l'écran#" "$fichier"
sed -i "s#Herramientas y utilidades#Outils et utilitaires#" "$fichier"
sed -i "s#CFW con los parametros para#CFW avec les paramètres pour#" "$fichier"
sed -i "s#Compilar Retro-Go con los parametros para#Compiler Retro-Go avec les paramètres pour#" "$fichier"
sed -i "s#Flashear Retro-Go con los parametros para#Flasher Retro-Go avec les paramètres pour#" "$fichier"
sed -i "s#e recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Este proceso es solamente para una consola con el chip de 1MB instalado (chip original)#Il est recommandé d'effectuer le processus avec une batterie chargée à 100% pour éviter les problèmes. Ce processus est uniquement destiné à une console équipée de la puce de 1MB installée (puce d'origine)#" "$fichier"
sed -i "s#¡¡¡ATENCION!!!#ATTENTION !!!#" "$fichier"
sed -i "s#SI SE TIENE DIFERENTE CANTIDAD DE MEMORIA CANCELAR EL PROCESO y una vez vuelto al menu seleccionar el correcto#SI LA MÉMOIRE EST DIFFÉRENTE, ANNULER LE PROCESSUS et une fois revenu au menu, sélectionner la bonne option#" "$fichier"
sed -i "s#Se flasheara un custom firmware que consta del menu original de la consola ademas del emulador Retro-Go. El emulador aparecera al realizar el combo de botones#Un firmware personnalisé sera flashé, comprenant le menu original de la console ainsi que l'émulateur Retro-Go. L'émulateur apparaîtra après la combinaison de touches#" "$fichier"
sed -i "s#LEFT#GAUCHE#" "$fichier"
sed -i "s#Las roms que existan en#Les ROMs existantes dans#" "$fichier"
sed -i "s#tambien se subiran a la consola ¿Deseas continuar?#seront également téléchargées sur la console. Voulez-vous continuer ?#" "$fichier"
sed -i "s#encontrado#trouvé#" "$fichier"
sed -i "s#concluido#terminé#" "$fichier"
sed -i "s#Proceso#Processus#" "$fichier"
sed -i "s#Si ejecutas esta opcion y te devuelve un error con el texto#Si vous exécutez cette option et qu'une erreur apparaît avec le texte#" "$fichier"
sed -i "s#desconecta el stlink, vuelve a conectarlo y ejecuta de nuevo esta opcion#déconnectez le STLink, reconnectez-le et exécutez à nouveau cette option#" "$fichier"
sed -i "s#Enciende la consola y dejala en la pantalla del reloj. Despues pulsa cualquier tecla para continuar...#Allumez la console et laissez-la sur l'écran de l'horloge. Ensuite, appuyez sur une touche pour continuer...#" "$fichier"
sed -i "s#significa que no habra cancion de mario, no habra imagenes a la hora de dormir, se comprimira el resto del firm y se usara un flash interno indocumentado que requiere el openocd modificado. Esto permite que todo el firmware funcione sin utilizar ningún flash externo#cela signifie qu'il n'y aura pas de musique de Mario, pas d'images pour le mode veille, le reste du firmware sera compressé et un flash interne non documenté nécessitant OpenOCD modifié sera utilisé. Cela permet au firmware de fonctionner sans flash externe#" "$fichier"
sed -i "s#significa que se flasheara todo el firmware completo por lo que se usará parte de la flash externa con lo cual que se podran meter menos roms#cela signifie que tout le firmware sera flashé, utilisant une partie de la mémoire flash externe, réduisant ainsi le nombre de ROMs pouvant être ajoutées#" "$fichier"
sed -i "s#Por contra se obtienen ciertos beneficios que son: tener la cancion de mario, las imagenes de dormir y se gestionarán mejor la configuracion y los highscores porque con CFW#En revanche, certains avantages sont obtenus : la musique de Mario, les images de veille et une meilleure gestion de la configuration et des scores élevés grâce au CFW#" "$fichier"
sed -i "s#se pierden cuando la bateria esta baja o desenchufada#sont perdus lorsque la batterie est faible ou déconnectée#" "$fichier"
sed -i "s#y parametros#et paramètres#" "$fichier"
sed -i "s#Instalar CFW slim en#Installer CFW Slim sur#" "$fichier"
sed -i "s#con 16MB#avec 16MB#" "$fichier"
sed -i "s#Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Este proceso es solamente para una consola con el chip#Il est recommandé d'effectuer le processus avec une batterie chargée à 100% pour éviter les problèmes. Ce processus est uniquement destiné à une console avec la puce#" "$fichier"
sed -i "s#SI SE TIENE DIFERENTE CANTIDAD DE MEMORIA CANCELAR EL PROCESO y una vez vuelto al menu seleccionar el correcto.\n\nSe flasheara un custom firmware que consta del menu original de la consola ademas del emulador Retro-Go. El emulador aparecera al realizar el combo de botones#SI LA MÉMOIRE EST DIFFÉRENTE, ANNULER LE PROCESSUS et une fois revenu au menu, sélectionner la bonne option.\n\nUn firmware personnalisé sera flashé, comprenant le menu original de la console ainsi que l'émulateur Retro-Go. L'émulateur apparaîtra après la combinaison de touches#" "$fichier"
sed -i "s#Activar el flasheo con caratulas de juegos#Activer le flashage avec les jaquettes des jeux#" "$fichier"
sed -i "s#Desactivar el flasheo con caratulas de juegos#Désactiver le flashage avec les jaquettes des jeux#" "$fichier"
sed -i "s#Opcion caratulas ACTIVADA. NOTA:Para flashear caratulas de roms en el menú hará falta colocar en el mismo directorio de la rom un archivo jpg, bmp o png con el mismo nombre de la rom y el propio programa se encargara de comprimirla y subirla a la#Option jaquettes ACTIVÉE. REMARQUE : Pour flasher les jaquettes des ROMs dans le menu, il faut placer un fichier jpg, bmp ou png avec le même nom que la ROM dans le même répertoire, et le programme se chargera de le compresser et de l'ajouter à la#" "$fichier"
sed -i "s#Opcion caratulas DESACTIVADA#Option jaquettes DÉSACTIVÉE#" "$fichier"
sed -i "s#Abrir el actualizador del firm del stlink#Ouvrir le programme de mise à jour du firmware du STLink#" "$fichier"
sed -i "s#Realizar un make reset (realizar solo si la consola se queda en negro y no llega al menu)#Effectuer un make reset (uniquement si la console reste noire et n'atteint pas le menu)#" "$fichier"
sed -i "s#Realizar un flash test (para verificar la conexion con el chip de memoria)#Effectuer un test de flash (pour vérifier la connexion avec la puce mémoire)#" "$fichier"
sed -i "s#Encontrado paquete java, se prosigue...#Paquet Java trouvé, poursuite du processus...#" "$fichier"
sed -i "s#No encontrado paquete java necesario, instalando...#Paquet Java nécessaire non trouvé, installation en cours...#" "$fichier"
sed -i "s#Conecta la consola con el stlink y pulsa cualquier tecla para realizar el reset...#Connectez la console avec le STLink et appuyez sur une touche pour effectuer le reset...#" "$fichier"
sed -i "s#Proceso terminado. Pulsa cualquier tecla para continuar...#Processus terminé. Appuyez sur une touche pour continuer...#" "$fichier"
sed -i "s#¡¡¡ATENCION!!! El programa de test de la flash externa se carga en la memoria interna para poder realizarse. Esto quiere decir que si tenemos dual boot con CFW+Retro-Go ademas de retrogo también habrá que reflashear el CFW porque éste será reemplazado por el programa de test de la flash. Si tenemos consola con solo Retro-Go tendremos que reflashear Retro-Go completo#Attention !!! Le programme de test de la mémoire flash externe est chargé dans la mémoire interne pour pouvoir être exécuté. Cela signifie que si nous avons un dual boot avec CFW+Retro-Go, en plus de Retro-Go, il faudra également reflasher le CFW car il sera remplacé par le programme de test de la flash. Si nous avons une console avec uniquement Retro-Go, nous devrons reflasher Retro-Go complètement.#" "$fichier"
sed -i "s#¡¡¡IMPORTANTE!!! Para realizar el proceso de test de la flash es necesario haber compilado Retro-Go para tu tipo de memoria con al menos una rom de manera satisfactoria. Si no lo realizaste vuelve atras y compila Retro-Go con al menos una rom. Si no lo compilaste y prosigues dara error y la consola se quedara con la pantalla en negro. Si ya lo hiciste prosigue con el proceso. ¿Deseas continuar?#Important !!! Pour effectuer le processus de test de la mémoire flash, il est nécessaire d'avoir compilé Retro-Go pour votre type de mémoire avec au moins une ROM de manière satisfaisante. Si vous ne l'avez pas fait, retournez en arrière et compilez Retro-Go avec au moins une ROM. Si vous ne l'avez pas compilé et que vous continuez, cela entraînera une erreur et la console restera avec un écran noir. Si vous l'avez déjà fait, continuez le processus. Voulez-vous continuer ?#" "$fichier"
sed -i "s#Conecta la consola con el stlink y pulsa cualquier tecla para realizar el test...#Connectez la console avec le STLink et appuyez sur une touche pour effectuer le test...#" "$fichier"
sed -i "s#A continuacion se realizará un make reset porque en la mayoria de los casos ayuda a poder apagar la consola despues de haber realizado el test#Ensuite, un make reset sera effectué car dans la plupart des cas, cela aide à éteindre la console après avoir effectué le test.#" "$fichier"
sed -i "s#¡¡¡ATENCION!!! Proceso realizado, pero RECUERDA: El programa de test de la flash externa se carga en la memoria interna para poder realizarse. Esto quiere decir que si tenemos dual boot con CFW+Retro-Go habra que habrá que reflashear el CFW porque éste será reemplazado por el programa de test de la flash. Si tenemos consola con solo Retro-Go tendremos que reflashear Retro-Go completo#Attention !!! Processus terminé, mais RAPPELEZ-VOUS : Le programme de test de la mémoire flash externe est chargé dans la mémoire interne pour pouvoir être exécuté. Cela signifie que si nous avons un dual boot avec CFW+Retro-Go, il faudra reflasher le CFW car il sera remplacé par le programme de test de la flash. Si nous avons une console avec uniquement Retro-Go, nous devrons reflasher Retro-Go complètement.#" "$fichier"
sed -i "s#El directorio del repo no se ha detectado, no se puede proseguir#Le répertoire du dépôt n'a pas été détecté, impossible de continuer.#" "$fichier"
sed -i "s#El proceso de flasheo se puede realizar de diferentes maneras, elige la mas conveniente a tu hardware. Si se ha cambiado el chip de memoria deberas haber restaurado el firmware original en la opcion 5 del menu#Le processus de flash peut être effectué de différentes manières, choisissez la plus appropriée pour votre matériel. Si la puce mémoire a été changée, vous devrez avoir restauré le firmware d'origine dans l'option 5 du menu.#" "$fichier"
sed -i "s#scene>backup, restauracion y liberacion de la consola#scene>backup, restauration et déverrouillage de la console#" "$fichier"
sed -i "s#NOTA: Se recomienda realizar el proceso con la batería cargada al 100% para evitar sustos#REMARQUE : Il est recommandé d'effectuer le processus avec la batterie chargée à 100 % pour éviter les surprises.#" "$fichier"
sed -i "s#Opcion caratulas#Option jaquettes#" "$fichier"
sed -i "s#Opcion flasheo con caratula. Actualmente:#Option flash avec jaquette. Actuellement :#" "$fichier"
sed -i "s#0=NO y 1=SI#0=NON et 1=OUI#" "$fichier"
sed -i "s#sin CFW: Menu flasheo solo Retro-Go + backup#sans CFW : Menu flash seulement Retro-Go + backup#" "$fichier"
sed -i "s#restauracion save states en consola#restauration des sauvegardes sur la console#" "$fichier"
sed -i "s#Menu CFW + Retro-Go + backup#Menu CFW + Retro-Go + backup#" "$fichier"
sed -i "s#Actualizacion del directorio del repo local de Retro-Go#Mise à jour du répertoire du dépôt local de Retro-Go#" "$fichier"
sed -i "s#Indicame el nombre de usuario con el que quieres ejecutar las utilidades#Indiquez-moi le nom d'utilisateur avec lequel vous souhaitez exécuter les utilitaires#" "$fichier"
sed -i "s#El nombre de usuario introducido es#Le nom d'utilisateur saisi est#" "$fichier"
sed -i "s#¿Es correcto?#Est-ce correct ?#" "$fichier"
sed -i "s#Si es correcto presiona S para continuar, si no lo es cualquier otra tecla#Si c'est correct, appuyez sur S pour continuer, sinon, appuyez sur une autre touche.#" "$fichier"
sed -i "s#¡¡Aplicado!!#Appliqué!!#" "$fichier"
sed -i "s#Cancelado...#Annulé...#" "$fichier"
sed -i "s#Opcion mario aplicada#Option Mario appliquée#" "$fichier"
sed -i "s#Opcion zelda aplicada#Option Zelda appliquée#" "$fichier"
sed -i "s#Encontrado paquete p7zip, se prosigue...#Paquet p7zip trouvé, on continue...#" "$fichier"
sed -i "s#No encontrado paquete p7zip necesario, instalando...#Paquet p7zip nécessaire non trouvé, installation en cours...#" "$fichier"
sed -i "s#instalar virtualenv, crear el directorio#Installer virtualenv, créer le répertoire#" "$fichier"
sed -i "s#y si existe borrarlo y volverlo a crear, crear un entorno virtual de python en dicho directorio e instalar los modulos de python requeridos#le supprimer et le recréer s'il existe, créer un environnement virtuel Python dans ce répertoire et y installer les modules Python requis#" "$fichier"
sed -i "s#se crea el entorno virtual de python, se activa y se instalan los modulos requeridos para los diferentes repos#L'environnement virtuel Python est créé, activé et les modules requis pour les différents dépôts sont installés#" "$fichier"
sed -i "s#Modulos requeridos para el patch -> ver requirements.txt del repo del patch#Modules requis pour le patch -> voir requirements.txt du dépôt du patch#" "$fichier"
sed -i "s#Modulos requeridos para retrogo -> ver requirements.txt del repo de retrogo#Modules requis pour RetroGo -> voir requirements.txt du dépôt de RetroGo#" "$fichier"
sed -i "s#Modulos requeridos para LCD-Shrinker -> ver requirements.txt del repo del LCD-Shrinker#Modules requis pour LCD-Shrinker -> voir requirements.txt du dépôt de LCD-Shrinker#" "$fichier"
sed -i "s#Requerimientos por paquetes deprecados#Dépendances pour les paquets obsolètes#" "$fichier"
sed -i "s#ATENCION: el cambio de usuario es MUY IMPORTANTE para el correcto funcionamiento de los scripts#ATTENTION : Le changement d'utilisateur est TRÈS IMPORTANT pour le bon fonctionnement des scripts#" "$fichier"
sed -i "s#¡¡¡Si no se ha realizado correctamente los scripts no funcionaran correctamente!!!#!!!Si cela n'est pas fait correctement, les scripts ne fonctionneront pas correctement!!!#" "$fichier"
sed -i "s#Por favor, indicame si realizaste el cambio de usuario con la opcion 1 del menu...#Veuillez indiquer si vous avez effectué le changement d'utilisateur avec l'option 1 du menu...#" "$fichier"
sed -i "s#Si realizaste el cambio presiona presiona S para continuar, si no lo hiciste cualquier otra tecla:#Si vous avez effectué le changement, appuyez sur S pour continuer, sinon appuyez sur n'importe quelle autre touche:#" "$fichier"
sed -i "s#Se continua con la instalacion...#On continue l'installation...#" "$fichier"
sed -i "s#Creando directorio gameandwatch#Création du répertoire gameandwatch#" "$fichier"
sed -i "s#Borrando directorio existente y volviendo a descargar...#Suppression du répertoire existant et nouveau téléchargement en cours...#" "$fichier"
sed -i "s#¡¡¡ATENCION!!! Se recomienda realizar un reinicio despues de preparar el sistema para asegurar que todo funcione correctamente. Si no lo realizas ahora recuerda hacerlo mas tarde. ¿Deseas reiniciar el sistema?#!!!ATTENTION!!! Il est recommandé de redémarrer après la préparation du système pour garantir son bon fonctionnement. Si vous ne le faites pas maintenant, pensez à le faire plus tard. Voulez-vous redémarrer le système?#" "$fichier"
sed -i "s#Preparacion del sistema#Préparation du système#" "$fichier"
sed -i "s#Reiniciando el sistema...#Redémarrage du système...#" "$fichier"
sed -i "s#Recuerda realizar el reinicio mas tarde :)#N'oubliez pas de redémarrer plus tard :)#" "$fichier"
sed -i "s#Ya existe el directorio gameandwatch#Le répertoire gameandwatch existe déjà#" "$fichier"
sed -i "s#Descarga del sitio original y descomprime el .deb#Téléchargement depuis le site officiel et extraction du .deb#" "$fichier"
sed -i "s#Descomprimimos el .deb que tenemos descargado de nuestro propio github y lo instalamos#Extraction du .deb téléchargé depuis notre propre GitHub et installation#" "$fichier"
sed -i "s#esta ya en el bashrc#Déjà présent dans le bashrc#" "$fichier"
sed -i "s#no esta aun en el bashrc, añadiendo...#Pas encore présent dans le bashrc, ajout en cours...#" "$fichier"
sed -i "s#¡¡¡ATENCION!!! Se recomienda realizar un reinicio despues de instalar OPENOCD para asegurar que todo funcione correctamente. Si no lo realizas ahora recuerda hacerlo mas tarde. ¿Deseas reiniciar el sistema?#!!!ATTENTION!!! Il est recommandé de redémarrer après l'installation d'OPENOCD pour garantir son bon fonctionnement. Si vous ne le faites pas maintenant, pensez à le faire plus tard. Voulez-vous redémarrer le système?#" "$fichier"
sed -i "s#Nueva instalacion de las herramientas de backup y restauracion#Nouvelle installation des outils de sauvegarde et de restauration#" "$fichier"
sed -i "s#Actualizacion del directorio del repo#Mise à jour du répertoire du dépôt#" "$fichier"
sed -i "s#Reset del directorio del repo y descarga desde 0#Réinitialisation du répertoire du dépôt et téléchargement depuis zéro#" "$fichier"
sed -i "s#Nueva instalacion del flashloader#Nouvelle installation du flashloader#" "$fichier"
sed -i "s#Nueva instalacion del emulador Retro-Go#Nouvelle installation de l'émulateur Retro-Go#" "$fichier"
sed -i "s#Actualizacion del directorio del repo local de Retro-Go conectando al GitHub#Mise à jour du répertoire local du dépôt Retro-Go en se connectant à GitHub#" "$fichier"
sed -i "s#Se comprueba si el directorio tama existe, si no existe se crea. Esto se hizo porque#On vérifie si le répertoire tama existe, s'il n'existe pas, il est créé. Cela a été fait parce que#" "$fichier"
sed -i "s#cuando se incluyo el emulador tamagotchi no se creaba este directorio y habia error de compilacion#lorsque l'émulateur Tamagotchi a été ajouté, ce répertoire n'était pas créé, ce qui entraînait une erreur de compilation#" "$fichier"
sed -i "s#antiguo metodo usado para instalar los paquetes requeridos. A partir de ubuntu 23.04 no se puede usar este metodo#Ancienne méthode utilisée pour installer les paquets requis. À partir d'Ubuntu 23.04, cette méthode ne peut plus être utilisée#" "$fichier"
sed -i "s#menu parche custom firmware para#Menu du patch du firmware personnalisé pour#" "$fichier"
sed -i "s#Nueva instalacion del parche custom firmware#Nouvelle installation du patch du firmware personnalisé#" "$fichier"
sed -i "s#menu reductor para juegos LCD de Mame#Menu réducteur pour les jeux LCD de Mame#" "$fichier"
}

# Boucle sur chaque répertoire
for REPERTOIRE in "${REPERTOIRES_CIBLES[@]}"; do
    if [[ ! -d "$REPERTOIRE" ]]; then
        continue
    fi

    # Boucle sur tous les fichiers .sh du répertoire
    for FICHIER in "$REPERTOIRE"/*.sh; do
        # Exclure le fichier qui exécute le script
        if [[ $(basename "$FICHIER") == "$SCRIPT_ACTUEL" ]]; then
            continue
        fi

        if [[ -e "$FICHIER" && -f "$FICHIER" ]]; then
            # Modifier les phrases dans le fichier
            modifier_phrases "$FICHIER"

            # Vérifier si l'écriture a réussi
            if [[ $? -eq 0 ]]; then
            	sed -i 's/^lang=.*$/'lang=\""français"\"'/g' ./language/es-fr.sh
                echo "✅ Modification terminée pour : $FICHIER"
            fi

            # Rendre le script exécutable si ce n'était pas déjà le cas
            chmod +x "$FICHIER"
        fi
    done
done

echo "✅ Traduction en $lang effectuée"
read -p "Appuyez sur Entrée pour continuer..."

