French:

IMPORTANT:

Sur console portable, les arrières-plans sont désactivés.


Le dossier "_BasicCustom" permet de personnaliser votre thème sans toucher au thème installé afin de permettre les mises à jour sans pertes de données.
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

	-bg.m3u:
	
		Ne modifiez-pas le contenu de ce fichier, c'est une playlist aléatoire pour vos backgrounds custom.
		Vous devez-le supprimer si vous n'utilisez aucun background custom afin de permettre au thème
		d'utiliser les fanarts aléatoires de jeux.
		
	-bg.png ou bg.jpg:
	
		Ce sont les backgrounds de la vue système, mettez-y ceux de votre choix.
		Vous pouvez utiliser du .jpg ou du .png ou les deux combinés.
		
		Vos backgrounds peuvent être nommées:
		
			-bg.jpg
			-bg.png
			-bg-01.jpg
			-bg-02.jpg jusquà bg-100.jpg
			-bg-01.png
			-bg-02.png jusquà bg-png.jpg
			
		A titre d'exemple: bg-01.png et bg-01.jpg peuvent cohabiter.
			
		A savoir que seul bg.jpg ou bg.png peut être lu en l'absence du fichier bg.m3u,
		tous les autres, y compris ce dernier seront lus avec le fichier m3u.
		
	-video.m3u:
	
		Ne modifiez-pas le contenu de ce fichier, c'est une playlist aléatoire pour vos vidéos custom.
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

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PERSONNALISATION GENERALE DU THEME:

	-Vous pouvez mettre un fichier bg.png ou bg.jpg à la racine du dossier "_BasicCustom" afin d'avoir un unique arrière-plan pour tout le thème.

	-Vous pouvez sinon y placer un fichier default-bg.png ou default-bg.jpg afin d'avoir un arrière-plan par défaut quand aucun custom ou random n'existe.

	-Vous pouvez éditer le fichier custom-name.xml pour afficher votre nom en haut à droite du thème, pour cela retirez <!-- et --> autour de <custom.name>Your_name_here</custom.name>:

		"<!--<custom.name>Your_name_here</custom.name>"--> doit devenir "<custom.name>Your_name_here</custom.name>".
		
		Par défaut, le login des rétro succès s'affiche lorsque ces derniers sont activés.

	-override.xml: dans ce fichier qui se lit à la fin du thème, vous pouvez faire ce que vous voulez, reprenez les objets du thème et modifiez-les ou ajoutez en de nouveaux.
		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


English:

GOOD TO KNOW:

On handheld devices, backgrounds are deactivated.


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

		-bg.m3u:
	
		Do not modify the content of this file, it is a random playlist for your custom backgrounds.
		You must delete it if you are not using any custom background in order to allow the theme
		to use random game fanarts.
		
		-bg.png or bg.jpg:
	
		These are the backgrounds of the system view, put the ones of your choice there.
		You can use .jpg or .png or both combined.
		
		Your backgrounds can be named:
		
			-bg.jpg
			-bg.png
			-bg-01.jpg
			-bg-02.jpg up to bg-100.jpg
			-bg-01.png
			-bg-02.png to bg-png.jpg
			
		For example: bg-01.png and bg-01.jpg can coexist.
			
		Note that only bg.jpg or bg.png can be read in the absence of the bg.m3u file,
		all others, including this last one will be played with the m3u file.

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


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

GENERAL THEME CUSTOMIZATION:

	- You can put a bg.png or bg.jpg file at the root of the "_BasicCustom" folder in order to have a single background for the entire theme.

	-You can otherwise place a default-bg.png or default-bg.jpg file there in order to have a default background when no custom or random exists.
	
	-You can edit the custom-name.xml file to display your name at the top right of the theme, to do this remove <!-- and --> around <custom.name>Your_name_here</custom.name>:

		"<!--<custom.name>Your_name_here</custom.name>"--> should become "<custom.name>Your_name_here</custom.name>".
		
		By default, the login for retro achievements is displayed when they are activated.

	-override.xml: in this file which is read at the end of the theme, you can do what you want, take the theme objects and modify them or add new ones.

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

