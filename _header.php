<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/x-icon" href="imgs/favicon.ico">
	<title><?=$pageTitle?></title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>
		<nav>
			<ul>
				<!-- <li><?=dateNow(DATETIME_FORMAT)?></li> -->
				<li><a href="index.php">Accueil</a></li>
				<li><a>|</a></li>
				<li><a href="usersimplelist.php">Liste Simple</a></li>
				<li><a href="usersimplefrmrec.php">Ajouter Simple</a></li>
				<li><a href="usersimplefrm.htm">Ajouter Simple (Html)</a></li>
				<li><a>|</a></li>
				<li><a href="userlist.php">Liste des utilisateurs</a></li>
				<li><a href="userfrm.php">Ajouter un utilisateur</a></li>
				<li><a href="userfrmlist.php">Ajouter avec listes</a></li>
				<li><?=SITE_NAME?></li>
			</ul>
		</nav>
	</header>
	<main>
		<h1><?=$pageTitle?></h1>
	
