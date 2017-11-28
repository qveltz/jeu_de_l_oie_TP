{Le jeu de l'oie se joue seul. Le joueur est caracterisé par un nombre appelé 'place' compris entre 0 et 66 qui indique sa position dans le jeu,
 sachant qu'après le jet de deux dé6 on avance du nombre de case indiqué par la somme des dés. Si on arrive pile sur la case 66 le jeux est
 terminé sinon on recule du reste de déplacement. Toute les 9 palces il y à une place oie qui fait avancer de la somme des deux dés le joueur. 
 La case 58 renvoie au position de départ (place 0).

	Instructions :
-Employer le max de constantes
-produire un algo et un code lisible et claire
-commenter le programme
-verifier si le jet de dé valide (entre 2 et 12)



ALGO : TP_jeu_de_l_oie
BUT : A l'aide d'informations entré par le joueurs il faut déplacer son "pion" afin qu'il arrive sur la dernière case et finisse le jeu. Attention au case piège !
ENTRE : Nombres de déplacement entré par le joueurs.
SORTIE :  le joueurs gagne.


CONST
	placemax <- 66 : ENTIER
	place_dstv <-  63 : ENTIER
	danger <- 58 : ENTIER
	

VAR
	nb_de1,nb_de2,pos,sommeD,reste : ENTIER
	vldt : CHAR


DEBUT

	vldt <- ' '
	pos <- 0
	nb_de1 <- 0
	nb_de2 <- 0
	sommeD <- 0
	reste <- 0


	ECRIRE "Voulez-vous jouer au jeu de l'oie ? Y/N"
	LIRE vldt

	SI vldt='Y' ALORS
		ECRIRE "Bienvenue dans le jeu de l'oie !"
		REPETER
			ECRIRE "Entrez une valeur pour le de 1 et 2 !"
			ECRIRE "RAPPEL : vous utilisez un de à 6 faces !!"
			ECRIRE " "
			ECRIRE "Vous êtes actuellement sur la place ",pos
			LIRE nb_de1,nb_de2

			SI ((nb_de1 < 1) OU (nb_de1 > 6) OU (nb_de2 < 1) OU (nb_de2 > 6)) ALORS
				REPETER
					ECRIRE "La valeur de chaque de doit etre comprise entre 1 et 6, Reessayez avec d'autres valeurs"
					LIRE nb_de1,nb_de2
				JUSQU'A ((nb_de1 >= 1) OU (nb_de1 <= 6) ET (nb_de2 >= 1) ET (nb_de2 <= 6))
			FIN SI

			sommeD <- nb_de1 + nb_de2
			pos <- pos + sommeD

			SI ((pos MOD 9 = 0) ET (sommeD=9)) ALORS
				REPETER
					ECRIRE "Vous etes tomber sur une case oie et avancez de ",sommeD
					pos <- pos + sommeD
				JUSQU'A pos = place_dstv
			SINON SI (pos MOD 9 = 0) ALORS			
				ECRIRE "Vous etes tomber sur une case oie et avancez de ",sommeD
				pos <- pos + sommeD
			SINON SI (pos + sommeD > placemax) ALORS
				reste <- pos - placemax
				pos <- placemax - reste
			FIN SI

			SI (pos = place_dstv) ALORS
				pos <- pos
			FIN SI

			SI (pos = danger) ALORS
				pos <- 0
			FIN SI

		JUSQU'A pos=66

		ECRIRE "BRAVO VOUS AVEZ TERMINER LE JEU DE L''OIE !!!!"

	SINON
		ECRIRE "Une autre fois peu être.."
	FIN SI
FIN
}


program TP_jeu_de_l_oie;

uses crt;

CONST
	placemax = 66;
	place_dstv = 63;
	danger = 58;
	

VAR
	nb_de1,nb_de2,pos,sommeD,reste : integer;
	vldt : char;


begin

	clrscr;
	vldt := ' ';
	pos := 0;
	nb_de1 := 0;
	nb_de2 := 0;
	sommeD := 0;
	reste := 0;

	writeln('Voulez-vous jouer au jeu de l''oie ? Y/N');
	readln(vldt);
	if ((vldt='Y') or (vldt='y')) then
		begin

			clrscr;


			writeln('Bienvenue dans le jeu de l''oie !');
			repeat
				begin
					
					clrscr;


					writeln ('Entrez une valeur pour le de 1 et 2 !');
					writeln ('(RAPPEL : vous utilisez un de a 6 faces !!)');
					writeln('');
					writeln ('Vous etes actuellement sur la place ',pos);
					readln (nb_de1,nb_de2);
					if ((nb_de1 < 1) or (nb_de1 > 6) or (nb_de2 < 1) or (nb_de2 > 6)) then
						repeat
							begin
								writeln ('La valeur de chaque de doit etre comprise entre 1 et 6, Reessayez avec d''autres valeurs');
								readln (nb_de1,nb_de2);
							end;
						until ((nb_de1 >= 1) or (nb_de1 <= 6) and (nb_de2 >= 1) and (nb_de2 <= 6));

					sommeD := nb_de1 + nb_de2;
					pos := pos + sommeD ;

					if ((pos MOD 9 = 0) and (sommeD=9)) then
						begin
							repeat
								writeln('Vous etes tomber sur une case oie et avancez de ',sommeD);
								pos := pos + sommeD;
							until pos = place_dstv;
						end
					else if (pos MOD 9 = 0) then
						begin
							writeln('Vous etes tomber sur une case oie et avancez de ',sommeD);
							pos := pos + sommeD;
						end
					else if (pos + sommeD > placemax) then
						begin
							reste := pos - placemax;
							pos := placemax - reste;
						end;

					if (pos = place_dstv) then
						pos := pos;

					if (pos = danger) then
						pos := 0;
						
				end;
			until pos = placemax;

			writeln('BRAVO VOUS AVEZ TERMINER LE JEU DE L''OIE !!!!');
		end
	else
		begin
			writeln ('Une autre fois peut-etre..');
		end;
	readln;
end.