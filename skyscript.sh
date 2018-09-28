#!/bin/bash
#tpaulmye
bold=$(tput bold)
normal=$(tput sgr0)

#display a question from the pdf
function displayq {
	echo "${bold}$1${normal}"
}

function displaya {
	cat $1
	echo "output:"
	$1
}

function displaya_noexec {
	cat $1
}

function correctNetwork {
	displayq "NETWORK"
	displayq "1. Récupérez la liste des interfaces réseau de la machine sans afficher aucun détail pour ces interfaces. Vraiment juste la liste des noms"
	displaya network/01
	read
	displayq "2. Identifiez l’adresse IP de l’interface Ethernet"
	displaya network/02
	read
	displayq "3. Identifiez l’adresse MAC de la carte Wi-Fi"
	displaya network/03
	read
	displayq "4. Identifiez la gateway par défaut dans la table de routage"
	displaya network/04
	read
	displayq "5. Identifiez l’IP du serveur DNS qui répond sur le domaine suivant : slash16.org"
	displaya network/05
	read
	displayq "6. Récupérez le path complet du fichier dans lequel est écrit l’adresse IP du serveur DNS que vous utilisez"
	displaya_noexec network/06
	read
	displayq "7. Interrogez un serveur DNS externe sur le même nom de domaine (ex : google 8.8.8.8)"
	displaya network/07
	read
	displayq "8. Trouver chez quel hébergeur est le site de Slash16"
	displaya_noexec network/08
	read
	displayq "9. Trouver l’IP Publique de 42.fr"
	displaya_noexec network/09
	read
	displayq "10. Identifiez les différents appareils réseaux entre votre poste et le domaine slash16.org"
	displaya network/10
	read
	displayq "11. Trouvez grâce au résultat de la commande précédente le nom et l’IP du matériel qui fait le lien entre vous (réseau local) et l’extérieur"
	displaya_noexec network/11
	read
	displayq "12. Vérifiez que le serveur avec l’adresse IP 10.51.1.253 est touchable depuis votre poste"
	displaya network/12
	read
	displayq "13. Vérifiez grâce au Reverse DNS le nom du serveur correspondant à l’IP 10.51.1.81"
	displaya_noexec network/13
	read
	displayq "14. Quel est le fichier contenant les entrées locales DNS ?"
	displaya_noexec network/14
	read
	displayq "15. Faites pointer l’adresse suivante 62.210.207.183 sur l’adresse : intra.42.fr"
	displaya_noexec network/15
	read
}

function correctSystem {
	displayq "SYSTEM"
	displayq "1. Dans quel fichier se trouve la version installée de votre Debian ?"
	displaya_noexec system/01
	read
	displayq "2. Quelle commande permet de renommer votre système ?"
	displaya_noexec system/02
	read
	displayq "3. Quel est le fichier à modifier pour rendre cela permanent ?"
	displaya_noexec system/03
	read
	displayq "4. Quelle commande donne le temps depuis laquelle votre système est allumé ?"
	displaya system/04
	read
	displayq "5. Déterminez l’état du service SSH"
	displaya system/05
	read
	displayq "6. Donnez la commande pour le redémarrer"
	displaya_noexec system/06
	read
	displayq "7. Déterminez le PID du service SSHD"
	displaya system/07
	read
	displayq "8. Quel fichier contient les clés RSA autorisées à se connecter via SSH ?"
	displaya_noexec system/08
	read
	displayq "9. Quelle commande permet de savoir quelles personnes sont connectées sur le sys- tème ?"
	displaya system/09
	read
	displayq "10. Quelle commande permet de lister les tables de partitions des périphériques ?"
	displaya system/10
	read
	displayq "11. Quelle commande permet d’afficher l’espace disponible par le système ?"
	displaya system/11
	read
	displayq "12. Déterminez la taille exacte de chaque dossier de /var"
	displaya system/12
	read
	displayq "13. Trouvez la commande qui permet de trouver les processus en cours d’exécution"
	displaya_noexec system/13
	read
	displayq "14. Lancez en background la commande tail -f /var/log/syslog"
	displaya system/14
	read
	displayq "15. Trouvez la commande qui permet de tuer le processus de la commande en back- ground"
	displaya system/15
	read
	displayq "16. Trouvez le service qui permet de lancer des tâches à horaires régulières"
	displaya_noexec system/16
	read
	displayq "17. Trouvez la commande qui donne la liste des règles de pare-feu"
	displaya system/17
	read
	displayq "18. Avec la commande précédente, autorisez uniquement les IPs provenant de 10.0.0.0/8 à se connecter sur votre système"
	displaya system/18
	read
	displayq "19. Avec la commande précédente, interdisez le reste"
	displaya system/19
	read
}

function correctScript {
	displayq "SCRIPTS"
	displayq "1. Réaliser un script qui affiche seulement le login, le UID et le Path du fichier /etc/passwd"
	displaya scripts/01
	read
	displayq "2. Réaliser un script qui met à jour l’ensemble des sources de package, puis de vos packages et qui log l’ensemble dans un fichier nommé /var/log/update_script.log. Créez une tache plannifiée pour ce script une fois par semaine à 4h00 du matin."
	displaya scripts/02
	read
	displayq "3. Réaliser un script qui affiche la liste des fichiers triés par taille présents dans le dossier passé en argument"
	displaya scripts/03
	read
	displayq "4. Réaliser un script qui permet de surveiller les modifications du fichier /etc/crontab et envoie un mail à root si celui-ci a été modifié. Créez une tache plannifiée pour script tous les jours à minuit."
	displaya scripts/04
	read
	dislayq "5. Réaliser un script qui affiche 42."
	displaya scripts/05
	read
}

#MAIN
if [ "$1" = "network" ]
	then correctNetwork
elif [ "$1" = "system" ]
	then correctSystem
elif [ "$1" = "scripts" ]
	then correctScript
else
 	correctNetwork; correctSystem; correctScript
fi
