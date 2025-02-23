<h1>Patch de traduction Française 1.0 du fork de julenvitoria (Ubuntu)</h1><br>

1) Il vous faut d'abord installer au préalable son dépot en ligne de commandes avec :<br>
<strong>cd ~</strong><br>
<strong>git clone https://github.com/julenvitoria/GnW</strong><br><br>

2) Ensuite vous pouvez télécharger mon patch FR directement dans votre dossier GnW, ça n'effacera aucun fichier original :<br>
<strong>cd ~</strong><br>
<strong>git clone https://github.com/Autokisscool/GnW.git GnW-FR</strong><br>
<strong>mv GnW-FR/* GnW/</strong><br>
<strong>rm -rf GnW-FR</strong><br>

3) Pour traduire en Français, tapez dans le terminal :<br>
<strong>chmod -R +x ./GnW </strong><br>
<strong>cd GnW</strong><br>
<strong>./0-patch-FR.sh</strong>
<br><br>
Les phrases originales seront traduites (dernier menu en date de julenvitoria au <strong>08/03/2022</strong>).<br>
A la fin de la traduction, le menu en Français se lance, il ne vous reste plus qu'à suivre les étapes pour modifier votre Game&Watch.<br><br>

Par la suite vous pourrez lancer le menu directement en tapant <strong>./menu.sh</strong> depuis votre dossier <strong>GnW</strong> en ligne de commande dans le terminal.
