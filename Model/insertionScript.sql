BEGIN TRANSACTION;
DROP TABLE IF EXISTS "race";
CREATE TABLE IF NOT EXISTS "race" (
	"idR"	INTEGER NOT NULL,
	"nameR"	TEXT NOT NULL,
	"descR"	TEXT NOT NULL,
	"bForceR"	INTEGER NOT NULL,
	"bDexR"	INTEGER NOT NULL,
	"bConstR"	INTEGER NOT NULL,
	"bIntR"	INTEGER NOT NULL,
	"bSageR"	INTEGER NOT NULL,
	"bCharR"	INTEGER NOT NULL,
	PRIMARY KEY("idR")
);
DROP TABLE IF EXISTS "proficiency";
CREATE TABLE IF NOT EXISTS "proficiency" (
	"pID"	INTEGER NOT NULL,
	"pName"	INTEGER NOT NULL,
	PRIMARY KEY("pID")
);
DROP TABLE IF EXISTS "class";
CREATE TABLE IF NOT EXISTS "class" (
	"idC"	INTEGER NOT NULL,
	"nameC"	TEXT NOT NULL,
	"descC"	BLOB NOT NULL,
	"hitPointC"	INTEGER NOT NULL,
	"isSpellcaster"	BOOLEAN NOT NULL,
	"bProfficiency"	INTEGER NOT NULL,
	"bProfficiencyAmount"	INTEGER NOT NULL,
	PRIMARY KEY("idC")
);
DROP TABLE IF EXISTS "attribute";
CREATE TABLE IF NOT EXISTS "attribute" (
	"idAttr"	INTEGER NOT NULL,
	"nameAttr"	TEXT NOT NULL,
	"descAttr"	TEXT NOT NULL,
	PRIMARY KEY("idAttr")
);
DROP TABLE IF EXISTS "class_proficiency";
CREATE TABLE IF NOT EXISTS "class_proficiency" (
	"idC"	INTEGER NOT NULL,
	"pID"	INTEGER NOT NULL,
	FOREIGN KEY("idC") REFERENCES "class" ON DELETE CASCADE,
	FOREIGN KEY("pID") REFERENCES "proficiency" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "class_attribute";
CREATE TABLE IF NOT EXISTS "class_attribute" (
	"idC"	INTEGER NOT NULL,
	"idAttr"	INTEGER NOT NULL,
	FOREIGN KEY("idAttr") REFERENCES "attribute" ON DELETE CASCADE,
	FOREIGN KEY("idC") REFERENCES "class" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "weapontype";
CREATE TABLE IF NOT EXISTS "weapontype" (
	"wtID"	INTEGER,
	"wtName"	TEXT,
	PRIMARY KEY("wtID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "armortype";
CREATE TABLE IF NOT EXISTS "armortype" (
	"atID"	INTEGER,
	"atName"	TEXT,
	PRIMARY KEY("atID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "weapon";
CREATE TABLE IF NOT EXISTS "weapon" (
	"weaponID"	INTEGER,
	"weaponName"	TEXT,
	"weaponDice"	TEXT,
	PRIMARY KEY("weaponID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "equipment";
CREATE TABLE IF NOT EXISTS "equipment" (
	"equipmentID"	INTEGER,
	"equipmentName"	TEXT,
	PRIMARY KEY("equipmentID")
);
DROP TABLE IF EXISTS "armor_armortype";
CREATE TABLE IF NOT EXISTS "armor_armortype" (
	"armorID"	INTEGER,
	"atID"	INTEGER,
	FOREIGN KEY("atID") REFERENCES "armortype" ON DELETE CASCADE,
	FOREIGN KEY("armorID") REFERENCES "armor" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "weapon_weapontype";
CREATE TABLE IF NOT EXISTS "weapon_weapontype" (
	"weaponID"	INTEGER,
	"wtID"	INTEGER,
	FOREIGN KEY("weaponID") REFERENCES "weapon" ON DELETE CASCADE,
	FOREIGN KEY("wtID") REFERENCES "weapontype" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choice";
CREATE TABLE IF NOT EXISTS "choice" (
	"choiceID"	INTEGER,
	"choiceName"	TEXT,
	PRIMARY KEY("choiceID")
);
DROP TABLE IF EXISTS "choice_weapon";
CREATE TABLE IF NOT EXISTS "choice_weapon" (
	"choiceID"	INTEGER,
	"weaponID"	INTEGER,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE,
	FOREIGN KEY("weaponID") REFERENCES "weapon" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choice_equipment";
CREATE TABLE IF NOT EXISTS "choice_equipment" (
	"choiceID"	INTEGER,
	"equipmentID"	INTEGER,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE,
	FOREIGN KEY("equipmentID") REFERENCES "equipment" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choice_armor";
CREATE TABLE IF NOT EXISTS "choice_armor" (
	"choiceID"	INTEGER,
	"armorID"	INTEGER,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE,
	FOREIGN KEY("armorID") REFERENCES "armor" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "instrument";
CREATE TABLE IF NOT EXISTS "instrument" (
	"instrumentID"	INTEGER,
	"instrumentName"	TEXT,
	PRIMARY KEY("instrumentID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "choice_instrument";
CREATE TABLE IF NOT EXISTS "choice_instrument" (
	"choiceID"	INTEGER,
	"instrumentID"	INTEGER,
	FOREIGN KEY("instrumentID") REFERENCES "instrument" ON DELETE CASCADE,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choice_choiceCollection";
CREATE TABLE IF NOT EXISTS "choice_choiceCollection" (
	"choiceID"	INTEGER,
	"choiceCollectionID"	INTEGER,
	FOREIGN KEY("choiceCollectionID") REFERENCES "choiceCollection" ON DELETE CASCADE,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choiceCollection";
CREATE TABLE IF NOT EXISTS "choiceCollection" (
	"choiceCollectionID"	INTEGER,
	"choiceCollectionName"	TEXT,
	PRIMARY KEY("choiceCollectionID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "class_choiceCollection";
CREATE TABLE IF NOT EXISTS "class_choiceCollection" (
	"idC"	INTEGER,
	"choiceCollectionID"	INTEGER,
	FOREIGN KEY("idC") REFERENCES "class" ON DELETE CASCADE,
	FOREIGN KEY("choiceCollectionID") REFERENCES "choiceCollection" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choice_weapontype";
CREATE TABLE IF NOT EXISTS "choice_weapontype" (
	"choiceID"	INTEGER,
	"wtID"	INTEGER,
	FOREIGN KEY("wtID") REFERENCES "weapontype" ON DELETE CASCADE,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choice_armortype";
CREATE TABLE IF NOT EXISTS "choice_armortype" (
	"choiceID"	INTEGER,
	"atID"	INTEGER,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE,
	FOREIGN KEY("atID") REFERENCES "armortype" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "armor";
CREATE TABLE IF NOT EXISTS "armor" (
	"armorID"	INTEGER,
	"armorName"	TEXT,
	"armorClass"	INTEGER,
	"armorDexState"	INTEGER,
	"armorForce"	INTEGER,
	"armorDiscretionDisadvantage"	BOOLEAN,
	"armorIsShield"	BOOLEAN,
	PRIMARY KEY("armorID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "instrumenttype";
CREATE TABLE IF NOT EXISTS "instrumenttype" (
	"itID"	INTEGER,
	"itName"	TEXT,
	PRIMARY KEY("itID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "instrument_instrumenttype";
CREATE TABLE IF NOT EXISTS "instrument_instrumenttype" (
	"instrumentID"	INTEGER,
	"itID"	INTEGER,
	FOREIGN KEY("instrumentID") REFERENCES "instrument" ON DELETE CASCADE,
	FOREIGN KEY("itID") REFERENCES "instrumenttype" ON DELETE CASCADE
);
DROP TABLE IF EXISTS "choice_instrumenttype";
CREATE TABLE IF NOT EXISTS "choice_instrumenttype" (
	"choiceID"	INTEGER,
	"itID"	INTEGER,
	FOREIGN KEY("itID") REFERENCES "instrumenttype" ON DELETE CASCADE,
	FOREIGN KEY("choiceID") REFERENCES "choice" ON DELETE CASCADE
);
INSERT INTO "race" ("idR","nameR","descR","bForceR","bDexR","bConstR","bIntR","bSageR","bCharR") VALUES (110,'Sangdragon','Les Draconiques ressemblent beaucoup à des dragons se tenant debout sous une forme humanoïde, bien qu''ils n''aient ni ailes ni queue.',2,0,0,0,0,1),
 (120,'Nain de colline','Audacieux et robustes, les nains sont connus pour être d''habiles guerriers, mineurs et travailleurs de la pierre et du métal. En tant que nain des collines, vous avez des sens aiguisés, une profonde intuition et une remarquable résilience. Les nains d''or de Faerûn dans leur puissant royaume du sud sont des nains des collines, tout comme les Neidar exilés et les Klar avilis de Krynn dans le cadre de Dragonlance.',0,0,2,0,1,0),
 (121,'Nain de montagne','Audacieux et robustes, les nains sont connus pour être d''habiles guerriers, mineurs et travailleurs de la pierre et du métal. En tant que nain des montagnes, vous êtes fort et robuste, habitué à une vie difficile en terrain accidenté. Vous êtes probablement de grande taille (pour un nain) et avez tendance à avoir une couleur plus claire. Les nains de bouclier du nord de Faerûn, ainsi que le clan Hylar au pouvoir et le noble clan Daewar de Dragonlance, sont des nains des montagnes.',2,0,2,0,0,0),
 (130,'Haut elfe','Les eladrins sont un peuple magique d''une grâce surnaturelle, vivant dans le monde mais n''en faisant pas entièrement partie. En tant que haut elfe, vous avez un esprit vif et vous maîtrisez au moins les bases de la magie. Dans de nombreux mondes de D&D, il existe deux types de hauts elfes. Le premier type (qui comprend les elfes gris et les elfes des vallées de Greyhawk, les Silvanesti de Dragonlance, et les elfes du soleil des Royaumes oubliés) est hautain et reclus, et se croit supérieur aux non-elfes et même aux autres elfes. L''autre type (y compris les hauts elfes de Greyhawk, les Qualinesti de Dragonlance et les elfes de la lune des royaumes oubliés) est plus commun et plus amical, et on le rencontre souvent parmi les humains et les autres races. Les elfes du soleil de Faerûn (également appelés elfes d''or ou elfes du soleil levant) ont une peau de bronze et des cheveux cuivrés, noirs ou blond doré. Leurs yeux sont dorés, argentés ou noirs. Les elfes de la lune (également appelés elfes d''argent ou elfes gris) sont beaucoup plus pâles, avec une peau d''albâtre parfois teintée de bleu. Leurs cheveux sont souvent blancs argentés, noirs ou bleus, mais il n''est pas rare qu''ils soient blonds, bruns ou roux. Leurs yeux sont bleus ou verts et mouchetés d''or.',0,2,0,1,0,0),
 (131,'Elfe sylvestre','Les eladrins sont un peuple magique d''une grâce surnaturelle, vivant dans le monde mais n''en faisant pas entièrement partie. En tant qu''elfe des bois, vous avez des sens aiguisés et de l''intuition, et vos pieds légers vous portent rapidement et furtivement dans vos forêts natales. Cette catégorie comprend les elfes sauvages (grugach) de Greyhawk et les Kagonesti de Dragonlance, ainsi que les races appelées elfes des bois dans Greyhawk et les Royaumes oubliés. À Faerûn, les elfes des bois (également appelés elfes sauvages, elfes verts ou elfes des forêts) sont reclus et se méfient des non-elfes. La peau des elfes des bois a tendance à être de couleur cuivrée, avec parfois des traces de vert. Leurs cheveux sont plutôt bruns et noirs, mais ils sont parfois blonds ou cuivrés. Leurs yeux sont verts, bruns ou noisette.',0,2,0,0,1,0),
 (132,'Elfe noir','Les eladrins sont un peuple magique d''une grâce surnaturelle, vivant dans le monde mais n''en faisant pas entièrement partie. Cette version de l''eladrin est apparue à l''origine dans le Guide du Maître du Donjon comme un exemple pour créer vos propres sous-races. Créatures magiques fortement liées à la nature, les eladrins vivent dans le royaume crépusculaire de la Féerie. Leurs villes traversent parfois le plan matériel, apparaissant brièvement dans des vallées montagneuses ou des clairières de forêts profondes avant de disparaître dans le monde féerique.',0,2,0,0,0,1),
 (140,'Demi-elfe','Les demi-elfes combinent ce que certains appellent les meilleures qualités de leurs parents elfes et humains.',0,0,0,0,0,2),
 (150,'Demi-orc','Certains demi-orques s''élèvent pour devenir de fiers leaders de communautés orques. D''autres s''aventurent dans le monde pour prouver leur valeur. Beaucoup d''entre eux deviennent des aventuriers, atteignant la grandeur grâce à leurs exploits.',2,0,1,0,0,0),
 (160,'Halfelin aux pieds légers','Les halflings de petite taille survivent dans un monde rempli de créatures plus grandes en évitant de se faire remarquer ou, à défaut, en évitant de se faire attaquer. En tant que halfling aux pieds légers, vous pouvez facilement vous cacher, même en utilisant d''autres personnes comme couverture. Vous avez tendance à être affable et à bien vous entendre avec les autres. Dans les Royaumes Oubliés, les halflings aux pieds clairs se sont répandus le plus loin et sont donc la variété la plus commune. Les pieds-légers sont plus enclins à l''errance que les autres halflings, et s''installent souvent aux côtés d''autres races ou adoptent une vie nomade. Dans le monde de Greyhawk, on appelle ces halflings des pieds de poils ou des tallfellows.',0,2,0,0,0,1),
 (161,'Halfelin Robuste','Les halflings de petite taille survivent dans un monde rempli de créatures plus grandes en évitant de se faire remarquer ou, à défaut, en évitant de se faire attaquer. En tant que halfling corpulent, vous êtes plus résistant que la moyenne et vous avez une certaine résistance au poison. Certains disent que les stouts ont du sang nain. Dans les Royaumes oubliés, on appelle ces halflings des cœurs forts, et ils sont plus courants dans le sud.',0,2,1,0,0,0),
 (170,'Humain','Les humains sont les personnes les plus adaptables et les plus ambitieuses parmi les races communes. Quelle que soit leur motivation, les humains sont les innovateurs, les réalisateurs et les pionniers des mondes.',1,1,1,1,1,1),
 (180,'Gnome des roches','L''énergie et l''enthousiasme d''un gnome pour la vie transparaissent dans chaque centimètre de son petit corps. En tant que gnome des rochers, vous avez une inventivité et une résistance naturelles supérieures à celles des autres gnomes. La plupart des gnomes des mondes de D&D sont des gnomes de roche, y compris les gnomes bricoleurs de Dragonlance.',0,0,1,2,0,0),
 (181,'Gnome de foret','L''énergie et l''enthousiasme d''un gnome pour la vie transparaissent dans chaque centimètre de son petit corps. En tant que gnome des rochers, vous avez une inventivité et une résistance naturelles supérieures à celles des autres gnomes. La plupart des gnomes des mondes de D&D sont des gnomes de roche, y compris les gnomes bricoleurs de Dragonlance.',0,1,0,2,0,0),
 (190,'Tieffelin','Être accueilli par des regards et des chuchotements, subir la violence et les insultes dans la rue, voir la méfiance et la peur dans chaque regard : tel est le lot du tiefling.',0,0,0,1,0,2);
INSERT INTO "proficiency" ("pID","pName") VALUES (401,'Acrobatie'),
 (402,'Arcanes'),
 (403,'Athlétisme'),
 (404,'Discrétion'),
 (405,'Dressage'),
 (406,'Escamotage'),
 (407,'Histoire'),
 (408,'Intimidation'),
 (409,'Investigation'),
 (410,'Médecine'),
 (411,'Nature'),
 (412,'Perception'),
 (413,'Perspicacité'),
 (414,'Persuasion'),
 (415,'Religion'),
 (416,'Représentation'),
 (417,'Supercherie'),
 (418,'Survie');
INSERT INTO "class" ("idC","nameC","descC","hitPointC","isSpellcaster","bProfficiency","bProfficiencyAmount") VALUES (301,'Barbare','Un guerrier féroce d''origine primitive qui peut entrer dans une rage de combat.',12,0,2,2),
 (302,'Barde','Un magicien inspirant dont le pouvoir fait écho à la musique de la création',8,1,2,3),
 (303,'Clerc','Un champion sacerdotal qui manie la magie divine au service d''une puissance supérieure.',8,1,2,2),
 (304,'Druide','Un prêtre de l''Ancienne Foi, maniant les pouvoirs de la nature et adoptant des formes animales.',8,1,2,2),
 (305,'Guerrier','Un maître du combat martial, habile avec une variété d''armes et d''armures.',10,0,2,2),
 (306,'Moine','Un maître des arts martiaux, qui exploite la puissance du corps dans la poursuite de la perfection physique et spirituelle.',8,0,2,2),
 (307,'Paladin','Un guerrier saint lié à un serment sacré',10,0,2,2),
 (308,'Rôdeur','Un guerrier qui combat les menaces aux frontières de la civilisation.',10,0,2,3),
 (309,'Roublard ','Un scélérat qui utilise la discrétion et la ruse pour surmonter les obstacles et les ennemis.',8,0,2,4),
 (310,'Ensorceleur','Un lanceur de sorts qui utilise la magie inhérente d''un don ou d''une lignée.',6,1,2,2),
 (311,'Sorcier','Manipulateur de magie issue d''un marché avec une entité extraplanaire.',8,0,2,2),
 (312,'Magicien','Un utilisateur de magie érudit capable de manipuler les structures de la réalité.',6,1,2,2);
INSERT INTO "attribute" ("idAttr","nameAttr","descAttr") VALUES (201,'Rage','Au combat, vous vous battez avec une férocité primitive. À votre tour, vous pouvez entrer en rage comme une action bonus.

Lorsque vous êtes en rage, vous bénéficiez des avantages suivants si vous ne portez pas d''armure lourde :

Vous avez l''avantage sur les tests de Force et les jets de sauvegarde de Force.

Lorsque vous effectuez une attaque à l''arme de mêlée en utilisant la Force, vous bénéficiez d''un bonus au jet de dégâts qui augmente à mesure que vous gagnez des niveaux en tant que barbare, comme indiqué dans la colonne Dégâts de rage de la table Barbare.

Vous avez une résistance aux dégâts de matraquage, de perçage et d''entaille.

Si vous êtes capable de lancer des sorts, vous ne pouvez pas les lancer ou vous concentrer sur eux pendant votre rage.

Votre rage dure 1 minute. Elle se termine prématurément si vous êtes assommé ou si votre tour se termine et que vous n''avez pas attaqué une créature hostile depuis votre dernier tour ou subi de dégâts depuis. Vous pouvez également mettre fin à votre rage à votre tour en tant qu''action bonus.

Une fois que vous vous êtes mis en rage le nombre de fois indiqué pour votre niveau de barbare dans la colonne Rages de la table des barbares, vous devez terminer un long repos avant de pouvoir vous remettre en rage.'),
 (202,'Défense sans armure (Barbare)','Lorsque vous ne portez pas d''armure, votre classe d''armure est égale à 10 + votre modificateur de Dextérité + votre modificateur de Constitution. Vous pouvez utiliser un bouclier et bénéficier de cet avantage.'),
 (203,'Incontation','Vous avez appris à démêler et à remodeler le tissu de la réalité en harmonie avec vos souhaits et votre musique. Vos sorts font partie de votre vaste répertoire, une magie que vous pouvez adapter à différentes situations. Consultez les Règles des sorts pour connaître les règles générales du lancement de sorts et la Liste des sorts pour connaître la liste des sorts.'),
 (204,'Inspiration bardique','Vous pouvez inspirer les autres par des paroles ou de la musique émouvantes. Pour ce faire, vous utilisez une action bonus à votre tour pour choisir une créature autre que vous-même dans un rayon de 60 pieds de vous et qui peut vous entendre. Cette créature gagne un dé d''inspiration bardique, un d6.'),
 (205,'Domaine Divin','Choisissez un domaine lié à votre divinité : connaissance, vie, lumière, nature, tempête, ruse ou guerre. Le domaine Vie est détaillé à la fin de la description de la classe et fournit des exemples de dieux qui lui sont associés. Votre choix vous confère des sorts de domaine et d''autres caractéristiques lorsque vous le choisissez au 1er niveau. Il vous accorde également des moyens supplémentaires d''utiliser Canalisation de la divinité lorsque vous gagnez cette caractéristique au 2e niveau, et des avantages supplémentaires aux 6e, 8e et 17e niveaux.'),
 (206,'Druidique','Vous connaissez le druidique, le langage secret des druides. Vous pouvez parler cette langue et l''utiliser pour laisser des messages cachés. Vous et les autres personnes qui connaissent cette langue repèrent automatiquement un tel message. Les autres repèrent la présence du message en réussissant un test de Sagesse (Perception) DC 15, mais ne peuvent pas le déchiffrer sans magie.'),
 (207,'Style de combat','Vous adoptez un style de combat particulier comme spécialité. Choisissez l''une des options suivantes. Vous ne pouvez pas prendre une option de style de combat plus d''une fois, même si vous pouvez choisir à nouveau plus tard.'),
 (208,'Second Vent','Vous disposez d''une réserve d''endurance limitée dans laquelle vous pouvez puiser pour vous protéger des blessures. À votre tour, vous pouvez utiliser une action bonus pour regagner un nombre de points de vie égal à 1d10 + votre niveau de combattant. Une fois que vous avez utilisé cette caractéristique, vous devez terminer un repos court ou long avant de pouvoir l''utiliser à nouveau.'),
 (209,'Arts martiaux','Au 1er niveau, votre pratique des arts martiaux vous confère la maîtrise des styles de combat utilisant les frappes à mains nues et les armes de moine, c''est-à-dire les épées courtes et toute arme de mêlée simple qui n''a pas la propriété à deux mains ou lourde.

 Vous gagnez les avantages suivants lorsque vous êtes désarmé ou que vous maniez uniquement des armes de moine et que vous ne portez pas d''armure ou ne maniez pas de bouclier :

 Vous pouvez utiliser la Dextérité au lieu de la Force pour les jets d''attaque et de dégâts de vos frappes à mains nues et de vos armes de moine.

 Vous pouvez lancer un d4 à la place des dégâts normaux de votre frappe à mains nues ou de votre arme de moine. Ce dé change à mesure que vous gagnez des niveaux de moine, comme indiqué dans la colonne Arts martiaux de la table des moines.

 Lorsque vous utilisez l''action Attaque avec une frappe à mains nues ou une arme de moine à votre tour, vous pouvez effectuer une frappe à mains nues comme action bonus. Par exemple, si vous utilisez l''action Attaque et que vous attaquez avec une quarterstaff, vous pouvez également effectuer une frappe à mains nues en tant qu''action bonus, en supposant que vous n''ayez pas déjà effectué une action bonus ce tour-ci.

 Certains monastères utilisent des formes spécialisées des armes de moine. Par exemple, vous pouvez utiliser une massue constituée de deux morceaux de bois reliés par une courte chaîne (appelée nunchaku) ou une faucille à la lame plus courte et plus droite (appelée kama). Quel que soit le nom que vous donnez à une arme de moine, vous pouvez utiliser les statistiques de jeu fournies pour cette arme dans la section Armes.'),
 (210,'Le sens divin','La présence d''un mal puissant est perceptible à vos sens comme une odeur nocive, et un bien puissant résonne à vos oreilles comme une musique céleste. Comme une action, vous pouvez ouvrir votre conscience pour détecter de telles forces. Jusqu''à la fin de votre prochain tour, vous connaissez l''emplacement de tout céleste, démon ou mort-vivant se trouvant à moins de 60 pieds de vous et qui n''est pas totalement couvert. Vous connaissez le type (céleste, démon ou mort-vivant) de tout être dont vous sentez la présence, mais pas son identité (le vampire Comte Strahd von Zarovich, par exemple). Dans le même rayon, vous détectez également la présence de tout lieu ou objet qui a été consacré ou profané, comme avec le sort hallow.

 Vous pouvez utiliser cette caractéristique un nombre de fois égal à 1 + votre modificateur de Charisme. Lorsque vous terminez un long repos, vous récupérez toutes les utilisations dépensées.'),
 (211,'Imposition des mains','Votre toucher béni peut guérir les blessures. Vous disposez d''une réserve de pouvoir de guérison qui se reconstitue lorsque vous prenez un long repos. Avec cette réserve, vous pouvez restaurer un nombre total de points de vie égal à votre niveau de paladin × 5.'),
 (212,'Ennemi favori','À partir du 1er niveau, vous avez une expérience significative dans l''étude, la traque, la chasse et même la conversation avec un certain type d''ennemi.'),
 (213,'Explorateur naturel','Vous êtes particulièrement familier avec un type d''environnement naturel et êtes capable de voyager et de survivre dans ces régions. Choisissez un type de terrain favori : arctique, côte, désert, forêt, prairie, montagne, marécage ou souterrain. Lorsque vous effectuez un test d''Intelligence ou de Sagesse lié à votre terrain favori, votre bonus de compétence est doublé si vous utilisez une compétence que vous maîtrisez.'),
 (214,'Expertise','Au 1er niveau, choisissez deux de vos compétences, ou une de vos compétences et votre compétence en outils de voleur. Votre bonus de compétence est doublé pour tout test d''aptitude que vous effectuez et qui utilise l''une ou l''autre des compétences choisies.'),
 (215,'Attaque sournoise','À partir du 1er niveau, vous savez comment frapper subtilement et exploiter la distraction d''un ennemi. Une fois par tour, vous pouvez infliger 1d6 dégâts supplémentaires à une créature que vous touchez avec une attaque si vous avez l''avantage sur le jet d''attaque. L''attaque doit utiliser une arme fine ou à distance.'),
 (216,'Chant des voleurs','Pendant votre formation de voleur, vous avez appris le cant des voleurs, un mélange secret de dialecte, de jargon et de code qui vous permet de cacher des messages dans une conversation apparemment normale. Seule une autre créature connaissant le cant des voleurs peut comprendre de tels messages. Il faut quatre fois plus de temps pour transmettre un tel message que pour exprimer la même idée en clair.'),
 (217,'Origine sorcière','Choisissez une origine sorcière, qui décrit la source de votre pouvoir magique inné : Lignée de sang draconique, détaillée à la fin de la description de la classe, ou une autre source.'),
 (218,'Patron d''un autre monde','Au 1er niveau, vous avez conclu un marché avec un être d''un autre monde de votre choix : le Fiend, qui est détaillé à la fin de la description de classe, ou un autre. Votre choix vous accorde des caractéristiques au 1er niveau, puis au 6ème, 10ème et 14ème niveau.'),
 (219,'Pacte Magique','Vos recherches arcaniques et la magie que vous a conférée votre protecteur vous ont permis d''acquérir une certaine facilité avec les sorts. Voir les Règles des sorts pour les règles générales du lancement de sorts et la Liste des sorts pour la liste des sorts du sorcier.

 Cantrips

 Vous connaissez deux cantrips de votre choix dans la liste des sorts de sorcier. Vous apprenez des cantrips supplémentaires de votre choix à des niveaux supérieurs, comme indiqué dans la colonne Cantrips Known de la table Warlock.

 Emplacements pour les sorts

 La table des sorciers indique le nombre d''emplacements de sorts dont vous disposez pour lancer vos sorts de sorcier du 1er au 5e niveau. La table indique également le niveau de ces emplacements ; tous vos emplacements de sorts sont de même niveau. Pour lancer un de vos sorts de sorcier de 1er niveau ou plus, vous devez dépenser un emplacement de sort. Vous récupérez tous les emplacements de sorts de Pacte Magique dépensés lorsque vous terminez un repos court ou long.

 Par exemple, lorsque vous êtes au 5e niveau, vous avez deux emplacements pour sorts de 3e niveau. Pour lancer le sort de 1er niveau Éclair de sorcière, vous devez dépenser un de ces emplacements, et vous le lancez comme un sort de 3ème niveau.

 Sorts connus de 1er niveau et plus

 Au 1er niveau, vous connaissez deux sorts de 1er niveau de votre choix dans la liste des sorts de sorcier.

 La colonne Sorts connus de la table des sorciers indique quand vous apprenez d''autres sorts de sorcier de votre choix, de 1er niveau et plus. Le sort que vous choisissez doit être d''un niveau qui n''est pas supérieur à celui indiqué dans la colonne Slot Level de la table pour votre niveau. Lorsque vous atteignez le 6e niveau, par exemple, vous apprenez un nouveau sort de sorcier, qui peut être de 1er, 2e ou 3e niveau.

 De plus, lorsque vous gagnez un niveau dans cette classe, vous pouvez choisir un des sorts de sorcier que vous connaissez et le remplacer par un autre sort de la liste des sorts de sorcier, qui doit également être d''un niveau pour lequel vous avez des emplacements de sorts.

 Capacité de lanceur de sorts

 Le charisme est votre capacité de lanceur de sorts pour vos sorts de sorcier. Vous utilisez donc votre charisme chaque fois qu''un sort fait référence à votre capacité de lanceur de sorts. De plus, vous utilisez votre modificateur de Charisme pour déterminer le jet de sauvegarde d''un sort de sorcier que vous lancez et pour effectuer un jet d''attaque avec un tel sort.

 Valeur de sauvegarde des sorts = 8 + votre bonus de compétence + votre modificateur de Charisme.

 Modificateur d''attaque des sorts = votre bonus de compétence + votre modificateur de Charisme.

 Focalisation des sorts

 Vous pouvez utiliser un foyer arcanique (voir la section Équipement d''aventurier) comme foyer de lancement de sorts pour vos sorts de sorcier.'),
 (220,'Récupération des arcanes ','1er niveau

 Vous avez appris à récupérer une partie de votre énergie magique en étudiant votre livre de sorts. Une fois par jour, lorsque vous terminez un court repos, vous pouvez choisir des emplacements de sorts dépensés pour récupérer. Les emplacements de sorts peuvent avoir un niveau combiné égal ou inférieur à la moitié de votre niveau de magicien (arrondi au supérieur), et aucun des emplacements ne peut être de 6e niveau ou plus.

 Par exemple, si vous êtes un sorcier de 4e niveau, vous pouvez récupérer jusqu''à deux niveaux d''emplacements de sorts. Vous pouvez récupérer soit un emplacement de sort de 2ème niveau, soit deux emplacements de sort de 1er niveau.'),
 (221,'Défense sans armure (Moine)','Dès le niveau 1, si vous ne portez pas d''armures ni de bouclier, votre CA est égal a 10+ votre modificateur de Dextérité + votre modificateur de Sagesse');
INSERT INTO "class_proficiency" ("idC","pID") VALUES (301,405),
 (301,401),
 (301,408),
 (301,411),
 (301,412),
 (301,418),
 (302,401),
 (302,402),
 (302,403),
 (302,404),
 (302,405),
 (302,406),
 (302,407),
 (302,408),
 (302,409),
 (302,410),
 (302,411),
 (302,412),
 (302,413),
 (302,414),
 (302,415),
 (302,416),
 (302,417),
 (302,418),
 (303,407),
 (303,410),
 (303,414),
 (303,415),
 (303,413),
 (304,402),
 (304,405),
 (304,413),
 (304,410),
 (304,411),
 (304,412),
 (304,415),
 (304,418),
 (305,401),
 (305,405),
 (305,403),
 (305,407),
 (305,413),
 (305,412),
 (305,418),
 (305,408),
 (306,401),
 (306,403),
 (306,407),
 (306,413),
 (306,415),
 (306,404),
 (307,403),
 (307,413),
 (307,408),
 (307,410),
 (307,414),
 (307,415),
 (308,405),
 (308,403),
 (308,413),
 (308,409),
 (308,411),
 (308,412),
 (308,418),
 (308,404),
 (309,401),
 (309,404),
 (309,403),
 (309,416),
 (309,413),
 (309,408),
 (309,409),
 (309,412),
 (309,414),
 (310,402),
 (310,417),
 (310,413),
 (310,408),
 (310,414),
 (310,415),
 (311,402),
 (311,417),
 (311,407),
 (311,408),
 (311,409),
 (311,411),
 (311,415),
 (312,402),
 (312,413),
 (312,407),
 (312,415),
 (312,409),
 (312,410);
INSERT INTO "class_attribute" ("idC","idAttr") VALUES (301,201),
 (301,202),
 (302,203),
 (302,204),
 (303,203),
 (303,205),
 (304,203),
 (304,206),
 (305,207),
 (305,208),
 (306,221),
 (306,209),
 (307,210),
 (307,211),
 (308,212),
 (308,213),
 (309,214),
 (309,215),
 (309,216),
 (310,203),
 (310,217),
 (311,218),
 (311,219),
 (312,203),
 (312,220);
INSERT INTO "weapontype" ("wtID","wtName") VALUES (901,'Armes de corps à corps courantes'),
 (902,'Armes à distance courantes'),
 (903,'Armes de corps à corps de guerre'),
 (904,'Armes à distance de guerre');
INSERT INTO "armortype" ("atID","atName") VALUES (501,'Armures légères'),
 (502,'Armures intermédiaires'),
 (503,'Armures lourdes'),
 (504,'Bouclier');
INSERT INTO "weapon" ("weaponID","weaponName","weaponDice") VALUES (701,'Bâton','1d6'),
 (702,'Dague','1d4'),
 (703,'Gourdin','1d4'),
 (704,'Hachette','1d6'),
 (705,'Javeline','1d6'),
 (706,'Lance','1d6'),
 (707,'Marteau léger','1d4'),
 (708,'Masse d''armes','1d6'),
 (709,'Massue','1d8'),
 (710,'Serpe','1d4'),
 (711,'Arbalète legere','1d8'),
 (712,'Arc court','1d6'),
 (713,'Fléchette','1d4'),
 (714,'Fronde','1d4'),
 (715,'Cimeterre','1d6'),
 (716,'Coutille','1d10'),
 (717,'Épée a deux mains','1d6'),
 (718,'Épée courte','1d6'),
 (719,'Épée longue','1d8'),
 (720,'Fléau','1d8'),
 (721,'Fouet','1d4'),
 (722,'Hàche a deux mains','1d12'),
 (723,'Hache d''armes','1d8'),
 (724,'Hallebarde','1d10'),
 (725,'Lance d''arcccon','1d12'),
 (726,'Maillet d''armes','2d6'),
 (727,'Marteau de guerre','1d8'),
 (728,'Morgenstern','1d8'),
 (729,'Pic de guerre','1d8'),
 (730,'Pique','1d10'),
 (731,'Rapière','1d8'),
 (732,'Trident','1d6'),
 (733,'Arbalète de poing','1d6'),
 (734,'Arbalète lourde','1d10'),
 (735,'Arc long','1d8'),
 (736,'Filet','0'),
 (737,'Sarbacane','1'),
 (738,'2 Dagues','1d4'),
 (739,'4 Javelines','1d6'),
 (740,'2 Hachettes','1d6'),
 (741,'10 Fléchettes','1d4'),
 (742,'5 Javelines','1d6'),
 (743,'2 Épées courtes','1d6');
INSERT INTO "equipment" ("equipmentID","equipmentName") VALUES (101,'Un paquetage d''explorateur'),
 (102,'Un paquetage de diplomate'),
 (103,'Un paquetage d''artiste'),
 (104,'Un paquetage d''ecclésiastique'),
 (105,'20 Carreaux'),
 (106,'Un Symbole sacré'),
 (107,'Un Bouclier de bois'),
 (108,'Un Focaliseur druidique'),
 (109,'Une sacoche a composantes'),
 (110,'Un Focaliseur'),
 (111,'Un Focaliseur arcanique'),
 (112,'Un paquetage d''exploration souterraine'),
 (113,'20 Flèches'),
 (114,'Un Carquois'),
 (115,'Un paquetage de cambrioleur'),
 (116,'Outils de voleur'),
 (117,'Un paquetage d''érudit'),
 (118,'Un Grimoire');

INSERT INTO "weapon_weapontype" ("weaponID","wtID") VALUES (701,901),
 (702,901),
 (703,901),
 (704,901),
 (705,901),
 (706,901),
 (707,901),
 (708,901),
 (709,901),
 (710,901),
 (711,902),
 (712,902),
 (713,902),
 (714,902),
 (715,903),
 (716,903),
 (717,903),
 (718,903),
 (719,903),
 (720,903),
 (721,903),
 (722,903),
 (723,903),
 (724,903),
 (725,903),
 (726,903),
 (727,903),
 (728,903),
 (729,903),
 (730,903),
 (731,903),
 (732,903),
 (733,904),
 (734,904),
 (735,904),
 (736,904),
 (737,904);
INSERT INTO "choice" ("choiceID","choiceName") VALUES (1,'barbare-a'),
 (2,'barbare-b'),
 (3,'barbare-c'),
 (4,'barbare-d'),
 (5,'barbare-e'),
 (6,'barde-a'),
 (7,'barde-b'),
 (8,'barde-c'),
 (9,'barde-d'),
 (10,'barde-e'),
 (11,'barde-f'),
 (12,'clerc-a'),
 (13,'clerc-b'),
 (14,'clerc-c'),
 (15,'clerc-d'),
 (16,'clerc-e'),
 (17,'clerc-f'),
 (18,'clerc-g'),
 (19,'clerc-h'),
 (20,'clerc-i'),
 (21,'clerc-j'),
 (22,'druide-a'),
 (23,'druide-b'),
 (24,'druide-c'),
 (25,'druide-d'),
 (26,'druide-e'),
 (27,'guerrier-a'),
 (28,'guerrier-b'),
 (29,'guerrier-c'),
 (30,'guerrier-d'),
 (31,'guerrier-e'),
 (32,'guerrier-f'),
 (33,'guerrier-g'),
 (34,'guerrier-h'),
 (35,'moine-a'),
 (36,'moine-b'),
 (37,'moine-c'),
 (38,'moine-d'),
 (39,'moine-e'),
 (40,'paladin-a'),
 (41,'paladin-b'),
 (42,'paladin-c'),
 (43,'paladin-d'),
 (44,'paladin-e'),
 (45,'paladin-f'),
 (46,'paladin-g'),
 (47,'rodeur-a'),
 (48,'rodeur-b'),
 (49,'rodeur-c'),
 (50,'rodeur-d'),
 (51,'rodeur-e'),
 (52,'rodeur-f'),
 (53,'rodeur-g'),
 (54,'roublard-a'),
 (55,'roublard-b'),
 (56,'roublard-c'),
 (57,'roublard-d'),
 (58,'roublard-e'),
 (59,'roublard-f'),
 (60,'roublard-g'),
 (61,'roublard-h'),
 (62,'ensorceleur-a'),
 (63,'ensorceleur-b'),
 (64,'ensorceleur-c'),
 (65,'ensorceleur-d'),
 (66,'ensorceleur-e'),
 (67,'ensorceleur-f'),
 (68,'ensorceleur-g'),
 (69,'sorcier-a'),
 (70,'sorcier-b'),
 (71,'sorcier-c'),
 (72,'sorcier-d'),
 (73,'sorcier-e'),
 (74,'sorcier-f'),
 (75,'sorcier-g'),
 (76,'magicien-a'),
 (77,'magicien-b'),
 (78,'magicien-c'),
 (79,'magicien-d'),
 (80,'magicien-e'),
 (81,'magicien-f'),
 (82,'magicien-g');
INSERT INTO "choice_weapon" ("choiceID","weaponID") VALUES (1,722),
 (3,738),
 (5,705),
 (6,731),
 (7,719),
 (11,702),
 (12,708),
 (13,727),
 (17,711),
 (24,715),
 (28,735),
 (31,711),
 (32,740),
 (35,718),
 (39,741),
 (42,742),
 (49,743),
 (53,735),
 (54,731),
 (55,718),
 (56,712),
 (57,718),
 (61,738),
 (62,711),
 (68,738),
 (69,711),
 (75,738),
 (76,701),
 (77,702);
INSERT INTO "choice_equipment" ("choiceID","equipmentID") VALUES (5,101),
 (9,102),
 (17,105),
 (19,104),
 (20,101),
 (21,106),
 (22,107),
 (26,101),
 (26,108),
 (28,113),
 (31,105),
 (33,112),
 (34,101),
 (37,112),
 (38,101),
 (44,104),
 (45,101),
 (46,106),
 (51,112),
 (52,101),
 (53,114),
 (53,113),
 (56,114),
 (56,113),
 (58,115),
 (59,112),
 (60,101),
 (61,116),
 (62,105),
 (64,109),
 (65,111),
 (66,112),
 (67,101),
 (69,105),
 (71,109),
 (72,111),
 (73,117),
 (74,112),
 (78,109),
 (79,111),
 (80,117),
 (81,101),
 (82,118);

 INSERT INTO "armor" ("armorID","armorName","armorClass","armorDexState","armorForce","armorDiscretionDisadvantage","armorIsShield") VALUES (601,'Armure Matelassée',11,1,0,1,0),
 (602,'Armure de Cuir',11,1,0,0,0),
 (603,'Armure de Cuir clouté',12,1,0,0,0),
 (604,'Armure de Peau',12,2,0,0,0),
 (605,'Chemise de mailles',13,2,0,0,0),
 (606,'Armure d''Écailles',14,2,0,1,0),
 (607,'Cuirasse',14,2,0,0,0),
 (608,'Demi-plate',15,2,0,1,0),
 (609,'Broigne',14,0,0,1,0),
 (610,'Cotte de mailles',16,0,13,1,0),
 (611,'Clibanion',17,0,15,1,0),
 (612,'Harnois',18,0,15,1,0),
 (613,'Bouclier',2,0,0,0,1);
INSERT INTO "instrument" ("instrumentID","instrumentName") VALUES (1,'Chalemie'),
 (2,'Cor'),
 (3,'Cornemuse'),
 (4,'Flute'),
 (5,'Luth'),
 (6,'Lyre'),
 (7,'Tambour'),
 (8,'Tympanon'),
 (9,'Viole');
 INSERT INTO "armor_armortype" ("armorID","atID") VALUES (601,501),
 (602,501),
 (603,501),
 (604,502),
 (605,502),
 (606,502),
 (607,502),
 (608,502),
 (609,503),
 (610,503),
 (611,503),
 (612,503),
 (613,504);
 INSERT INTO "choice_armor" ("choiceID","armorID") VALUES (11,602),
 (14,606),
 (15,602),
 (16,610),
 (21,613),
 (26,602),
 (27,610),
 (28,602),
 (29,613),
 (40,613),
 (46,610),
 (47,606),
 (48,602),
 (61,602),
 (75,602);

INSERT INTO "choiceCollection" ("choiceCollectionID","choiceCollectionName") VALUES (1,'barbare-1'),
 (2,'barbare-2'),
 (3,'barbare-3'),
 (4,'barde-1'),
 (5,'barde-2'),
 (6,'barde-3'),
 (7,'barde-4'),
 (8,'clerc-1'),
 (9,'clerc-2'),
 (10,'clerc-3'),
 (11,'clerc-4'),
 (12,'clerc-5'),
 (13,'druide-1'),
 (14,'druide-2'),
 (15,'druide-3'),
 (16,'guerrier-1'),
 (17,'guerrier-2'),
 (18,'guerrier-3'),
 (19,'guerrier-4'),
 (20,'moine-1'),
 (21,'moine-2'),
 (22,'moine-3'),
 (23,'paladin-1'),
 (24,'paladin-2'),
 (25,'paladin-3'),
 (26,'paladin-4'),
 (27,'rodeur-1'),
 (28,'rodeur-2'),
 (29,'rodeur-3'),
 (30,'rodeur-4'),
 (31,'roublard-1'),
 (32,'roublard-2'),
 (33,'roublard-3'),
 (34,'roublard-4'),
 (35,'ensorceleur-1'),
 (36,'ensorceleur-2'),
 (37,'ensorceleur-3'),
 (38,'ensorceleur-4'),
 (39,'sorcier-1'),
 (40,'sorcier-2'),
 (41,'sorcier-3'),
 (42,'sorcier-4'),
 (43,'magicien-1'),
 (44,'magicien-2'),
 (45,'magicien-3'),
 (46,'magicien-4');
 INSERT INTO "choice_choiceCollection" ("choiceID","choiceCollectionID") VALUES (1,1),
 (2,1),
 (3,2),
 (4,2),
 (5,3),
 (6,4),
 (7,4),
 (8,4),
 (9,5),
 (10,6),
 (11,7),
 (12,8),
 (13,8),
 (14,9),
 (15,9),
 (16,9),
 (17,10),
 (18,10),
 (19,11),
 (20,11),
 (21,12),
 (22,13),
 (23,13),
 (24,14),
 (25,14),
 (26,15),
 (27,16),
 (28,16),
 (29,17),
 (30,17),
 (31,18),
 (32,18),
 (33,19),
 (34,19),
 (35,20),
 (36,20),
 (37,21),
 (38,21),
 (39,22),
 (40,23),
 (41,23),
 (42,24),
 (43,24),
 (44,25),
 (45,25),
 (46,26),
 (47,27),
 (48,27),
 (49,28),
 (50,28),
 (51,29),
 (52,29),
 (53,30),
 (54,31),
 (55,31),
 (56,32),
 (57,32),
 (58,33),
 (59,33),
 (60,33),
 (61,34),
 (62,35),
 (63,35),
 (64,36),
 (65,36),
 (66,37),
 (67,37),
 (68,38),
 (69,39),
 (70,39),
 (71,40),
 (72,40),
 (73,41),
 (74,41),
 (75,42),
 (76,43),
 (77,43),
 (78,44),
 (79,44),
 (80,45),
 (81,45),
 (82,46);
INSERT INTO "class_choiceCollection" ("idC","choiceCollectionID") VALUES (301,1),
 (301,2),
 (301,3),
 (302,4),
 (302,5),
 (302,6),
 (302,7),
 (303,8),
 (303,9),
 (303,10),
 (303,11),
 (303,12),
 (304,13),
 (304,14),
 (304,15),
 (305,16),
 (305,17),
 (305,18),
 (305,19),
 (306,20),
 (306,21),
 (306,22),
 (307,23),
 (307,24),
 (307,25),
 (307,26),
 (308,27),
 (308,28),
 (308,29),
 (308,30),
 (309,31),
 (309,32),
 (309,33),
 (309,34),
 (310,35),
 (310,36),
 (310,37),
 (310,38),
 (311,39),
 (311,40),
 (311,41),
 (311,42),
 (312,43),
 (312,44),
 (312,45),
 (312,46);
INSERT INTO "choice_weapontype" ("choiceID","wtID") VALUES (2,903),
 (4,901),
 (4,902),
 (8,901),
 (8,902),
 (23,901),
 (23,902),
 (25,901),
 (18,901),
 (18,902),
 (75,901),
 (75,902),
 (70,901),
 (70,902),
 (63,901),
 (63,902),
 (50,901),
 (50,901),
 (41,903),
 (41,904),
 (43,901),
 (36,901),
 (36,902),
 (29,903),
 (29,904),
 (30,903),
 (30,904),
 (30,903),
 (30,904),
 (40,903),
 (40,904),
 (41,903),
 (41,904);

INSERT INTO "instrumenttype" ("itID","itName") VALUES (1,'Instrument de musique');
INSERT INTO "instrument_instrumenttype" ("instrumentID","itID") VALUES (1,1),
 (2,1),
 (3,1),
 (4,1),
 (5,1),
 (6,1),
 (7,1),
 (8,1),
 (9,1);
INSERT INTO "choice_instrumenttype" ("choiceID","itID") VALUES (10,1);
COMMIT;
