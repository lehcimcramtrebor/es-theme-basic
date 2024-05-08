French:

Le dossier "_BasicCustom" permet de personnaliser votre thème sans toucher au thème installé affin de permettre les mises à jour sans pertes de données.
Copiez-le à la racine de "SHARE" si vous utilisez Batocera, ou à la racine de Retrobat.

Une fois le dossier copié, ouvrez-le, vous y trouverez un dossier "_TEMPLATE_" : c'est le modèle à dupliquer pour commencer à personnaliser un système.


Donc admettons que vous souhaitiez personnaliser la Mégadrive, vous dupliquez "_TEMPLATE_" et le renommez en "megadrive", à l'intérieur vous trouverez:

	- infos.xml:

		Ce fichier permet de personnaliser les informations de chaque système comme le nom du fabriquant, l'année de parution ou encore la description.
		Par exemble, si vous souhaitez 	modifier l'année de sortie, vous devez supprimer les <!-- et --> avant et après la variable.
	
		Avant modification vous aviez:

		<!--<system.releaseYearOrNull>2023</system.releaseYearOrNull>-->

		vous devez avoir ceci:

		<system.releaseYearOrNull>2023</system.releaseYearOrNull>

	
		Toutes les informations y compris la description doivent toujours n'utiliser qu'une seule ligne.


	-art.png:
	
		C'est l'illustration du système, mettez-y celle de votre choix.
		Pour information, en 1080p, inutile de dépasser une hauteur de 972p.
		
	-logo.png:
	
		Vous pouvez aussi utiliser un svg, nommez-le simplement logo.svg. Dans ce cas supprimez le png.
		
		
	-video.m3u:
	
		Ne modifiez-pas le contenu dece fichier, c'est une playlist aléatoire pour vos vidéos custom.
		Vous devez-le supprimer si vous n'utilisez aucune video custom afin de permettre au thème
		d'utiliser les vidéos aléatoires de jeux.
		
		
	-video.mp4, video-01.mp4 etc:
	
		Vous pouvez utiliser une seule ou alors une centaine de vidéos custom par système qui seront
		jouées aléatoirement.
		
		Vos vidéos peuvent être nommées:
		
			-video.mp4
			-video-01.mp4
			-video-02.mp4 jusquà video-100.mp4
			
		A savoir que seul video.mp4 peut être lu en l'absence du fichier video.m3u,
		toutes les autres, y compris cette dernière seront lus avec le fichier m3u.
		
Si vous avez besoin de customiser une partie d'un système, supprimez simplement ce dont vous n'avezpas besoin.
Vous pouvez par exemple supprimer le .m3u et les .mp4 et ne customiser que le logo et les infos, ou encore ne conserver
que le fichier infos.xml et utiliser les logos, illustrations du thème etc..


English:

The "_BasicCustom" folder allows you to personalize your theme without changing the installed theme in order to allow updates without loss of data.
Copy it to the root of "SHARE" if you are using Batocera, or to the root of Retrobat.

Once the folder has been copied, open it, you will find a "_TEMPLATE_" folder there: this is the template to duplicate to start customizing a system.


So let's say you want to personalize the Megadrive, you duplicate "_TEMPLATE_" and rename it to "megadrive", inside you will find:

		- info.xml:

		This file allows you to personalize the information of each system such as the name of the manufacturer, the year of publication or even the description.
		For example, if you want to change the year of release, you must remove the <!-- and --> before and after the variable.

		Before modification you had:

		<!--<system.releaseYearOrNull>2023</system.releaseYearOrNull>-->

		you must have this:

		<system.releaseYearOrNull>2023</system.releaseYearOrNull>


		All information including the description should always use only one line.


		-art.png:

		This is the illustration of the system, put the one of your choice there.
		For information, in 1080p, there is no need to exceed a height of 972p.

		-logo.png:

		You can also use an svg, just name it logo.svg. In this case delete the png.


		-video.m3u:

		Do not modify the content of this file, it is a random playlist for your custom videos.
		You should delete it if you are not using any custom video in order to allow the theme
		to use random game videos.


		-video.mp4, video-01.mp4 etc:

		You can use just one or a hundred custom videos per system which will be
		played randomly.

		Your videos can be named:

			-video.mp4
			-video-01.mp4
			-video-02.mp4 up to video-100.mp4

		Please note that only video.mp4 can be played in the absence of the video.m3u file,
		all others, including this last one will be played with the m3u file.

If you need to customize part of a system, simply remove what you don't need.
For example, you can delete the .m3u and .mp4 and only customize the logo and information, or even keep
than the infos.xml file and use the logos, illustrations of the theme etc..