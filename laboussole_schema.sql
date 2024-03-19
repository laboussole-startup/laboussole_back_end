-- Table Universités
CREATE TABLE Universite (
    universite_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) UNIQUE NOT NULL,
    ville VARCHAR(255) NOT NULL,
    descriptif TEXT NOT NULL,
    email VARCHAR(255) NOT NULL,
    telephone VARCHAR(255) NOT NULL,
    site_web VARCHAR(255),
    image_url VARCHAR(255)
);

-- Table Facultés
CREATE TABLE Faculte (
    faculte_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    descriptif TEXT,
    condition_admission TEXT,
    email VARCHAR(255),
    telephone VARCHAR(255),
    image_url VARCHAR(255),
    universite_id INT REFERENCES Universite(universite_id) ON DELETE CASCADE NOT NULL
);

-- Table Filieres
CREATE TABLE Filieres (
    filieres_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    descriptif TEXT NOT NULL,
    duree INT NOT NULL,
    cout DECIMAL(10, 2) NOT NULL,
    langue_enseignement VARCHAR(50) NOT NULL,
    diplome_delivre VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    faculte_id INT REFERENCES Faculte(faculte_id) ON DELETE CASCADE NOT NULL
);
-- Ajouter une nouvelle université
INSERT INTO Universite (nom, ville, descriptif, email, telephone, site_web)
VALUES (
    'UNIVERSITE DE YAOUNDE I',
    'Yaoundé',
    'L’Université de Yaoundé I est implantée sur la colline de Ngoa Ekelle, à l’ouest de la ville de Yaoundé, capitale politique du Cameroun. Elle est composée de quatre grandes facultés et de quatre grandes écoles. On y retrouve également des écoles doctorales.',
    'rectorat@univ-yaounde1.cm',
    '237 222 221 320',
    'www.uy1.uninet.cm'
);
-- Ajouter une nouvelle faculté
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Faculté des Arts, Lettres et Sciences Humaines',
    'La Faculté des Arts, Lettres et Sciences Humaines (F.A.L.S.H.) est un établissement public de l’Université de Yaoundé I. Jadis appelée Faculté des Lettres et Sciences Humaines, elle doit son actuelle dénomination de la Réforme universitaire de 1993 avec les décrets 93/027 et 93/036 du 19 janvier 1993 du Président de la République portant respectivement dispositions communes aux universités d’État et organisation administrative et académique de l’Université de Yaoundé I.',
    'Peuvent être admis à s’inscrire à la FALSH en première année d’études les Camerounais et les étrangers qui en font la demande, sans distinction d’âge, de sexe ou de religion.',
    'falsh@univ-yaounde1.cm',
    '222 22 24 05',
    1  -- universite_id correspondant à l'Université de Yaoundé I (ajustez si nécessaire)
);
-- Ajouter toutes les filières avec les descriptif s spécifiées
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Anthropologie', 'Étude approfondie des cultures humaines, des sociétés et des comportements, en mettant l''accent sur l''analyse comparative et la compréhension des diverses traditions.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Archéologie et gestion du patrimoine', 'Exploration des civilisations passées à travers l''analyse des artefacts et des sites archéologiques, combinée à la préservation et à la gestion du patrimoine culturel.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Arts plastiques et histoire de l’art', 'Apprentissage des techniques artistiques, exploration de l''histoire de l''art, et développement de compétences créatives dans les domaines des arts plastiques.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Arts du spectacle et cinématographique', 'Étude des différentes formes d''expression artistique telles que le théâtre, la danse, et le cinéma, avec un accent sur la théorie et la pratique.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Etudes bilingues (bilingue anglophone)', 'Programme offrant une approche équilibrée entre les langues française et anglaise, avec une compréhension approfondie des cultures et des littératures.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Etudes bilingues (Bilingue francophone)', 'Programme similaire à celui bilingue anglophone, mais mettant l''accent sur les cultures et les littératures francophones.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('English', 'Exploration approfondie de la langue anglaise, de sa littérature et de ses usages, avec une attention particulière portée à la linguistique et à la communication.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Géographie', 'Analyse des phénomènes géographiques, des structures naturelles et humaines, avec un accent sur la cartographie et la compréhension des dynamiques spatiales.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Histoire', 'Étude des événements passés, des mouvements historiques et des personnages clés, avec un accent sur la recherche et l''analyse critique.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Langues littérature et civilisations ibériques ibéro-américaines et italiennes', 'Exploration des langues, littératures et civilisations des régions ibériques, ibéro-américaines et italiennes, mettant en lumière la diversité culturelle.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Langues littérature et civilisations germaniques', 'Étude approfondie des langues, littératures et civilisations germaniques, mettant l''accent sur la compréhension des traditions culturelles et littéraires.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Lettres modernes françaises', 'Exploration des œuvres littéraires françaises modernes, analyse des mouvements littéraires contemporains, et développement de compétences critiques.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Linguistique générale et appliquée', 'Étude approfondie des principes linguistiques généraux, avec une application pratique dans divers contextes linguistiques.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Langues africaines et linguistique', 'Exploration des langues africaines, avec un accent sur la linguistique et la compréhension des structures linguistiques.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Littérature et civilisation africaines', 'Étude approfondie de la littérature et de la civilisation africaines, mettant en lumière les œuvres et les mouvements littéraires.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Philosophie', 'Exploration des principaux courants philosophiques, analyse des œuvres philosophiques majeures, et développement de compétences philosophiques critiques.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Psychologie', 'Étude approfondie des processus mentaux, des comportements humains et des applications pratiques de la psychologie.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Sociologie', 'Analyse des structures sociales, des relations humaines et des phénomènes sociaux, avec un accent sur la compréhension critique de la société.', 5, 50000, 'Français et Anglais', 'Master degree', 1),
    ('Sciences du langage', 'Étude approfondie des aspects linguistiques et communicationnels, avec une focalisation sur les théories et les applications dans les sciences du langage.', 5, 50000, 'Français et Anglais', 'Master degree', 1);

-- Ajouter une nouvelle faculté
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Faculté des Sciences (FS)',
    'La Faculté des Sciences de l’Université de Yaoundé fut créée en juillet 1962 au sein de l’Université Fédérale du Cameroun (décret n°62/DF/289 du 26 juillet 1962). Les premiers enseignements se sont déroulés dans les bâtisses de l’actuel deuxième campus ou Annexe. En octobre 1967, fut inauguré le Campus principal. Elle est devenue la Faculté des Sciences de l’Université de Yaoundé I après la Réforme Universitaire de 1993 avec les décrets N° 93/027 et N°93/036 du 19 janvier 1993 du Président de la République portant respectivement dispositions communes aux universités d’Etat et organisation administrative et académique de l’Université de Yaoundé I.',
    'Peuvent être admis à s’inscrire à la Faculté des Sciences en première année d’études les Camerounais et les étrangers qui en font la demande, sans distinction d’âge, de sexe ou de religion.',
    'facsciences@univ-yaounde1.cm',
    '222 23 44 96',
    1  -- universite_id correspondant à l'Université de Yaoundé I (ajustez si nécessaire)
);
-- Ajouter les filières avec les descriptif s spécifiées
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Chimie', 'Étude des propriétés et des transformations de la matière, avec un accent sur les réactions chimiques, l''analyse des composés et les applications pratiques dans divers domaines.', 5, 50000, 'Français et Anglais', 'Master degree', 2),
    ('Biosciences', 'Exploration approfondie des sciences de la vie, y compris la biologie cellulaire, la génétique, l''écologie, et la physiologie, avec une emphase sur la compréhension des organismes vivants.', 5, 50000, 'Français et Anglais', 'Master degree', 2),
    ('Géosciences', 'Étude des processus géologiques, géophysiques, et géochimiques qui façonnent la Terre, en mettant l''accent sur la compréhension des phénomènes naturels et des ressources géologiques.', 5, 50000, 'Français et Anglais', 'Master degree', 2),
    ('Informatique', 'Apprentissage des fondements de l''informatique, du développement de logiciels, de la gestion de données et de la résolution de problèmes informatiques, avec une perspective pratique.', 5, 50000, 'Français et Anglais', 'Master degree', 2),
    ('Mathématiques', 'Exploration des concepts mathématiques fondamentaux, y compris l''algèbre, la géométrie, l''analyse, et la logique, avec une application aux problèmes théoriques et pratiques.', 5, 50000, 'Français et Anglais', 'Master degree', 2),
    ('Physique', 'Étude des lois fondamentales de la nature et du comportement de la matière et de l''énergie, avec un accent sur les principes physiques et les applications dans divers domaines.', 5, 50000, 'Français et Anglais', 'Master degree', 2);
-- Ajouter une nouvelle faculté
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Faculté des Sciences de l’Éducation (FSE)',
    'La Faculté des Sciences de l’Éducation de l’Université de Yaoundé I a été créée sous les auspices de la Réforme Universitaire de 1993, avec les décrets N° 93/027 et N°93/036 du 19 janvier 1993 du Président de la République portant respectivement dispositions communes aux universités d’État et organisation administrative et académique de l’Université de Yaoundé I. La Faculté voit finalement son ouverture définitive aboutir en 2013.',
    'Pour le cycle de Master I, l’entrée est réservée aux seuls titulaires des Licences en Anthropologie, Philosophie, Psychologie et Sociologie. Le passage en Master 2 est rigoureusement sélectif. Il en est de même pour l’accès au cycle de Doctorat.',
    'facsciences@univ-yaounde1.cm',
    '222 23 44 96',
    1  -- universite_id correspondant à l'Université de Yaoundé I (ajustez si nécessaire)
);
-- Ajouter les filières avec les descriptif s spécifiées
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Didactique des disciplines', 'Apprentissage des méthodes et des stratégies d''enseignement spécifiques à chaque discipline, mettant l''accent sur le développement des compétences pédagogiques et la compréhension approfondie des matières enseignées.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Curriculum et évaluation', 'Étude du développement, de l''implémentation et de l''évaluation des programmes éducatifs, avec un focus sur la conception de programmes et l''analyse des méthodes d''évaluation.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Management de l’éducation', 'Formation aux principes de gestion et d''administration dans le domaine de l''éducation, couvrant la planification, la gestion des ressources, et la prise de décisions stratégiques.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Education spécialisée (EDS)', 'Formation pour répondre aux besoins éducatifs des apprenants ayant des besoins spéciaux, en se concentrant sur des stratégies d''enseignement adaptées et la création d''environnements inclusifs.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Spécialisation 1 : handicaps mentaux; Habileté mentales et conseil', 'Approfondissement des connaissances en éducation spécialisée avec une concentration sur les handicaps mentaux, les habiletés mentales, et le counseling éducatif.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Spécialisation 2 : handicaps mentaux, habileté mentales et conseil', 'Continuation de la spécialisation en éducation spécialisée avec un focus spécifique sur les handicaps mentaux, les habiletés mentales, et le counseling éducatif.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Spécialisation 3 : handicaps sociaux et conseils', 'Exploration des défis éducatifs liés aux handicaps sociaux, en mettant l''accent sur le counseling et les stratégies pour soutenir les apprenants confrontés à des difficultés sociales.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Sociologie et anthropologie de l’éducation', 'Étude des structures sociales et des aspects culturels de l''éducation, en mettant l''accent sur la compréhension des dynamiques sociales et culturelles dans les contextes éducatifs.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('Psychologie de l’éducation', 'Exploration des théories et des applications de la psychologie dans le domaine éducatif, en se concentrant sur le développement cognitif, émotionnel et social des apprenants.', 5, 50000, 'Français et Anglais', 'Master degree', 3),
    ('TIC et éducation', 'Intégration des technologies de l''information et de la communication (TIC) dans le processus éducatif, avec un accent sur l''utilisation des outils numériques pour l''enseignement et l''apprentissage.', 5, 50000, 'Français et Anglais', 'Master degree', 3);
-- Ajouter une nouvelle faculté
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Faculté de Médecine et de Sciences Biomédicales (FMSB)',
    'La Faculté de Médecine et des Sciences Biomédicales est un établissement de l’Université de Yaoundé 1 qui a pour mission la formation de personnels de santé de haut niveau, adaptés au contexte national et international. Mais son rôle s’étend au-delà de la formation des médecins généralistes. Plusieurs autres professionnels de la santé y sont formés, notamment des médecins spécialistes, des pharmaciens, des chirurgiens dentistes, des techniciens biomédicaux et médico-sanitaires. Le profil des diplômés est celui de praticiens polyvalents nantis de solides connaissances scientifiques et d’une orientation en santé publique. Selon les disciplines, ils sont capables de prestations sanitaires sur le plan du diagnostic, du traitement, de la réhabilitation et de la promotion de la santé. Ils sont également capables de faire des propositions à visée préventive pour l’individu, la famille et la collectivité et de participer à l’éducation sanitaire des malades et de leur famille. Ils doivent pouvoir s’occuper de leur formation continue et du recyclage des personnels de l’équipe sanitaire. Ils doivent enfin contribuer au progrès des sciences de la santé par la recherche appliquée et fondamentale.',
    'La seule voie d’admission en vigueur à la FMSB est le concours National. Un baccalauréat ou le GCE/AL série scientifique D ou C est requis. La Licence est obligatoire pour les niveaux Masters. L’entrée dans le cycle de spécialisation se fait également sur concours National ouvert conjointement par les Ministres de l’Enseignement Supérieur et de la Santé. Les Doctorats en Sciences Médico-Sanitaires et Biomédicales peuvent être organisés dans tous les Départements de la FMSB. Ils font l’objet de conditions et de textes particuliers et sont ouverts à tous les Masters Professionnels de la Santé. Il est par ailleurs possible pour le titulaire d’un Doctorat en Médecine, en Pharmacie ou en Buccodentaire de poursuivre ses études au sein de l’Ecole Doctorale rattachée à la FMSB.',
    'fmsb@univ-yaounde1.cm',
    '222 03 88 43',
    1  -- universite_id correspondant à l'Université de Yaoundé I (ajustez si nécessaire)
);
-- Ajouter les filières avec les descriptif s spécifiées
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Médecine bucco-dentaire', 'Formation en médecine dentaire, couvrant le diagnostic, le traitement, et la prévention des maladies bucco-dentaires. Les étudiants acquièrent des compétences pour la pratique de la dentisterie générale.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Médecine générale', 'Programme complet de formation médicale générale, préparant les étudiants à devenir des médecins généralistes. Il englobe une large gamme de disciplines médicales.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Pharmacie', 'Formation en pharmacie, couvrant la dispensation de médicaments, la gestion des effets des médicaments sur le corps, et la promotion de la santé. Les pharmaciens jouent un rôle essentiel dans les soins de santé.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Anatomie pathologique', 'Étude des altérations cellulaires et tissulaires associées aux maladies. Les anatomopathologistes analysent les échantillons de tissus pour diagnostiquer les maladies.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Anesthésie-Réanimation', 'Formation en anesthésiologie et soins intensifs. Les étudiants apprennent à administrer des anesthésiques et à prendre en charge les patients en période critique.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Médecine interne et spécialités', 'Formation approfondie en médecine interne, couvrant les maladies internes et les spécialités médicales. Les étudiants développent des compétences diagnostiques et thérapeutiques.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Gynéco-Obstétrique', 'Spécialisation en gynécologie et obstétrique. Les étudiants se concentrent sur la santé reproductive des femmes, la grossesse, et les soins obstétricaux.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Pharmacie galénique et législation pharmaceutique', 'Étude de la formulation et de la fabrication des médicaments, ainsi que de la législation régissant l''industrie pharmaceutique.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Pharmacognosie et chirurgie pharmaceutique', 'Exploration des sources naturelles de médicaments (pharmacognosie) et des procédures chirurgicales dans la pharmacie.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Oto-Rhino-Laryngologie', 'Spécialisation en ORL, couvrant les troubles de l''oreille, du nez, de la gorge, et des structures connexes.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Radiologie et Imagerie Médicale', 'Formation à l''utilisation des techniques d''imagerie médicale pour diagnostiquer et traiter les maladies.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Chirurgie générale et spécialités', 'Programme de chirurgie générale avec des possibilités de spécialisation dans différentes branches chirurgicales.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Biologie clinique', 'Étude des tests de laboratoire pour diagnostiquer et surveiller les maladies. Les biologistes cliniques jouent un rôle clé dans les soins de santé.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Ophtalmologie', 'Spécialisation en ophtalmologie, axée sur la santé oculaire, la vision, et les interventions chirurgicales oculaires.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Radiothérapie', 'Formation à l''utilisation de la radiothérapie pour traiter les maladies, en particulier le cancer.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Pédiatrie', 'Spécialisation en pédiatrie, se concentrant sur la santé et le bien-être des enfants, des nourrissons et des adolescents.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Chirurgie et spécialités (Anesthésie, réanimation, résident, internat)', 'Formation chirurgicale avancée avec des possibilités de spécialisation en anesthésiologie, réanimation, résidence et internat.', 5, 50000, 'Français et Anglais', 'Master degree', 4),
    ('Pharmacotoxicologie et pharmacocinétique', 'Étude des interactions médicamenteuses, des effets toxiques des médicaments et de leur métabolisme dans le corps.', 5, 50000, 'Français et Anglais', 'Master degree', 4);
-- Ajouter l'Ecole Normale Supérieure (ENS)
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
    ('Ecole Normale Supérieure (ENS)', 'L’ENS est un établissement supérieur pour les études centrées sur l’éducation. Elle comporte 14 départements d’enseignement. Elle confère des diplômes nationaux (DIPES 1, DIPES 2, DIP. CO et DIPEN).', 
    'Pour le premier cycle, l’admission se fait - par voie de concours, sur épreuves ou sur études de dossiers, ouverts aux Camerounais des deux sexes titulaires du Baccalauréat, du GCE/AL ou de tout autre diplôme reconnu équivalent. Les candidats doivent avoir 28 ans au plus, le 1er janvier de l’année à concourir. - Sur titre et dans les limites des places disponibles aux ressortissants des pays étrangers remplissant les conditions d’inscription et autorisés par le Gouvernement de leurs pays; - A titre exceptionnel, dans les limites des places disponibles et en qualité d’auditeurs libres, aux candidats présentés par des organismes d’Enseignement privé camerounais. Pour le Second cycle de l’Ecole Normale Supérieure, l’admission se fait : - Par voie de concours, sur épreuves ou sur dossier, ouvert aux Camerounais des deux sexes titulaires d’une Licence ou d’un Bachelors degree ou d’un diplôme reconnu équivalent. Les candidats doivent avoir au plus 32 ans au 1er janvier de l’année à concourir. - Sur titre et conformément à la réglementation en vigueur, aux titulaires du diplôme du premier cycle; - Sur titre et dans les limites des places disponibles aux ressortissants des pays étrangers remplissant les conditions d’inscription et autorisés par leur Gouvernement; - À titre exceptionnel, dans les limites des places disponibles et en qualité d’auditeurs libres, aux candidats présentés par des organismes d’Enseignement privé camerounais. - Le quota d’admission des auditeurs libres ne peut excéder 5% de l’effectif global de l’établissement. - L’admission au cycle des études doctorales se fait sur étude du dossier. Elle est ouverte aux Camerounais des deux sexes titulaires de la Maîtrise, du DEA, du Master ou d’un des diplômes suivants: CNH, DIPLEG, DIPES II, DIPEN II ou tout autre diplôme reconnu équivalent.', 
    'email@ens.cm', '237 24 22 31 215', 1);
-- Ajouter les filières de l'Ecole Normale Supérieure (ENS)
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Lettres modernes anglaises (2nd cycle uniquement)', 'Formation avancée en littérature anglaise moderne, mettant accent sur analyse critique et la compréhension approfondie des œuvres littéraires anglophones. Le programme est réservé aux étudiants du deuxième cycle.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Chimie', 'Programme de formation approfondie en chimie, couvrant les principes fondamentaux et les applications avancées. Les étudiants acquièrent des compétences pratiques en laboratoire et développent une compréhension approfondie de la chimie.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Lettres bilingues', 'Formation en littérature avec une approche bilingue, mettant en valeur les œuvres littéraires dans deux langues. Les étudiants développent des compétences dans l analyse critique et la rédaction dans les langues concernées.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Lettres modernes françaises', 'Programme approfondi en littérature française moderne, explorant les mouvements littéraires, les genres et les auteurs clés. Les étudiants développent des compétences en analyse littéraire et en rédaction.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Géographie', 'Formation approfondie en géographie, explorant les aspects physiques et humains du monde. Les étudiants acquièrent des compétences en cartographie, en analyse spatiale et en compréhension des phénomènes géographiques.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Histoire', 'Programme de formation historique couvrant différentes époques et régions du monde. Les étudiants acquièrent des compétences en recherche, en analyse critique des sources historiques et en rédaction.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Informatique', 'Formation avancée en informatique, couvrant la programmation, les bases de données, l intelligence artificielle et d autres domaines. Les étudiants développent des compétences techniques et pratiques en résolution de problèmes informatiques.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Langues et cultures camerounaises', 'Exploration des langues et cultures du Cameroun, mettant l accent sur la préservation et la promotion du patrimoine linguistique et culturel. Les étudiants acquièrent des compétences en linguistique et en études culturelles.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Allemand', 'Formation en langue allemande et culture germanique. Les étudiants développent des compétences en communication en allemand, ainsi qu une compréhension approfondie de la culture germanique.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Espagnol', 'Programme d études avancées en langue espagnole et cultures hispanophones. Les étudiants acquièrent des compétences linguistiques en espagnol et une compréhension approfondie de la diversité culturelle des pays hispanophones.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Lettres classiques', 'Formation approfondie en littérature classique, couvrant les œuvres de la Grèce et de Rome antiques. Les étudiants développent des compétences en interprétation des textes classiques et en compréhension de la civilisation antique.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Mathématiques', 'Programme avancé en mathématiques, couvrant les principaux domaines des mathématiques pures et appliquées. Les étudiants développent des compétences en résolution de problèmes mathématiques et en analyse.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Philosophie', 'Formation approfondie en philosophie, explorant les grandes questions philosophiques et les théories philosophiques clés. Les étudiants développent des compétences en analyse conceptuelle et en pensée critique.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Biologie', 'Programme de formation approfondie en biologie, couvrant la diversité du monde vivant, la génétique, l écologie et d autres domaines. Les étudiants développent des compétences en recherche biologique et en laboratoire.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Conseillers d’orientation', 'Formation pour devenir conseillers d’orientation, aidant les étudiants à faire des choix éducatifs et professionnels éclairés. Les étudiants acquièrent des compétences en conseil et en orientation professionnelle.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Sciences de l’éducation', 'Programme de formation en sciences de l’éducation, explorant les théories de l’apprentissage, la pédagogie et la gestion de classe. Les étudiants développent des compétences pour travailler dans le domaine de l’éducation.', 5, 50000, 'Français et Anglais', 'Master degree', 5),
    ('Physique', 'Formation approfondie en physique, couvrant les lois fondamentales de la nature, les phénomènes physiques et les applications. Les étudiants développent des compétences en expérimentation physique et en modélisation.', 5, 50000, 'Français et Anglais', 'Master degree', 5);
-- Ajouter l'École Normale Supérieure de l’Enseignement Technique d’Ebolowa (ENSET)
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
    ('École Normale Supérieure de l’Enseignement Technique d’Ebolowa (ENSET)', 
    'L’École Normale Supérieure d’Enseignement Technique de l’Université de Yaoundé I à Ebolowa est le premier établissement de l’Université de Yaoundé à ouvrir ses portes dans la région du Sud du Cameroun. Cette école est la quatrième École normale à vocation technique créée après celles de Kumba, Bambili et de Douala. Elle est ouverte aux postulants camerounais et étrangers.', 
    'L’admission à l’ENSET se fait par voie de concours sur épreuve uniquement, sur titre et comme auditeurs libres, dans la limite des places disponibles. Les candidats au concours doivent être âgés de 28 ans au plus pour le 1er cycle et être titulaires du Baccalauréat A, C, D et E, F, du GCE/AL ou de tout autre diplôme reconnu équivalent par le Ministère de l’Enseignement Supérieur (MINESUP). Ceux du 2nd cycle doivent être âgés de 31 ans au plus et être titulaires du DIPET I et (ou) d’une Licence correspondant à la filière sollicitée, ou d’un diplôme reconnu équivalent par le MINESUP.', 
    'rectorat@univ-yaounde1.cm', '237 222 22 45 47', 1);
-- Ajouter les filières de l'École Normale Supérieure de l’Enseignement Technique (ENSET)
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Maintenance Informatique', 'Formation spécialisée en maintenance informatique, couvrant les aspects matériels et logiciels des systèmes informatiques. Les étudiants acquièrent des compétences pour résoudre les problèmes techniques liés aux équipements informatiques.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Electrotechnique', 'Programme de formation en électrotechnique, couvrant la conception, l’installation et la maintenance des systèmes électriques. Les étudiants développent des compétences en électricité, électronique et automatisation.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Agriculture et agropastorale', 'Formation en agriculture et agropastorale, mettant l’accent sur les techniques modernes de production agricole et d’élevage. Les étudiants acquièrent des compétences pour gérer les exploitations agricoles de manière durable.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Industrie textile de l’Habillement 1', 'Programme axé sur l’industrie textile et de l’habillement, couvrant la conception, la fabrication et la gestion de la production textile. Les étudiants acquièrent des compétences pratiques dans le domaine de la mode et du textile.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Maintenance et Installation des systèmes électroniques', 'Formation avancée en maintenance et installation des systèmes électroniques, couvrant les composants électroniques, les circuits et les dispositifs. Les étudiants acquièrent des compétences pour assurer le bon fonctionnement des équipements électroniques.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Génie informatique', 'Programme de génie informatique, mettant l’accent sur la conception et le développement de systèmes informatiques avancés. Les étudiants acquièrent des compétences en programmation, en conception de logiciels et en gestion de projets informatiques.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Nutrition humaine et diététique', 'Formation spécialisée en nutrition humaine et diététique, couvrant les principes de la nutrition, les régimes alimentaires et la gestion de la santé. Les étudiants acquièrent des compétences pour conseiller sur une alimentation saine.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Tourisme', 'Programme axé sur le tourisme, couvrant les aspects de la gestion touristique, du marketing et de la planification des voyages. Les étudiants acquièrent des compétences pour travailler dans l’industrie du tourisme.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Génie mécanique : construction mécanique', 'Formation approfondie en génie mécanique avec une spécialisation en construction mécanique. Les étudiants acquièrent des compétences dans la conception et la fabrication de structures mécaniques.', 5, 50000, 'Français et Anglais', 'Master degree', 6),
    ('Génie mécanique : mécanique automobile', 'Programme spécialisé en génie mécanique avec une orientation vers la mécanique automobile. Les étudiants acquièrent des compétences dans la conception, la maintenance et la réparation des véhicules.', 5, 50000, 'Français et Anglais', 'Master degree', 6);
-- Ajouter l'École Nationale Supérieure Polytechnique de Yaoundé (ENSPY)
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
    ('École Nationale Supérieure Polytechnique de Yaoundé (ENSPY)', 
    'L’Ecole Nationale Supérieure Polytechnique (ENSP) a été créée le 04 juin 1971 pour former les cadres techniques, et développer ses recherches pour appuyer le développement du pays. Depuis 1991, l’ENSP a arrêté avec la formation courte et a conservé uniquement la formation longue. Les cinq spécialités de formation à l’ENSP se font sur deux cycles : le premier cycle d’une durée de deux ans offre aux étudiants un enseignement de base en mathématiques, en sciences physiques et en sciences de l’ingénieur; le second cycle encore appelé cycle de spécialité d’une durée de trois ans forme les étudiants dans le métier. Il existe à l’Ecole Nationale Supérieure Polytechnique de Yaoundé, 3 niveaux d’études : Les ingénieurs de conception (1er cycle universitaire) sont des programmes de formation d’ingénieur donnant accès au titre d’ingénieur et à la pratique de l’ingénierie dans le monde entier. Les études supérieures (2e et 3e cycles universitaires) sont des programmes accessibles uniquement après avoir complété le cycle d’ingénieur de conception du 1er cycle universitaire, ou un programme équivalent. Les sciences de l’ingénieur de 1er cycle sont des programmes de formation continue de 1er cycle universitaire adapté à une clientèle non ingénieur. Il est aussi possible de demander à s’inscrire comme étudiant à une formation de certificat (CARD) ou à des masters professionnels en revanche des conditions particulières s’appliquent.',
    'L’accès au premier cycle de l’ENSP est conditionné par la réussite à un concours scientifique. Les candidats, titulaires d’un Baccalauréat C, D, E et F ou d’un diplôme reconnu équivalent, sont soumis à une épreuve de Physiques et une épreuve de Mathématiques d’une durée de 4 heures chacune.', 
    'contact@polytechnique.cm', '237 222 22 45 47', 1);
-- Ajouter les filières de l'École Nationale Supérieure Polytechnique de Yaoundé (ENSPY)
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Mathématiques et Sciences Physiques', 'Cette filière combine les mathématiques avancées et les sciences physiques pour former des ingénieurs capables de résoudre des problèmes complexes dans divers domaines tels que l’ingénierie, la physique appliquée et la recherche scientifique. Les étudiants acquièrent des compétences approfondies en analyse mathématique, en physique théorique et expérimentale, ainsi qu’en modélisation et simulation numériques. Cette formation leur permet de contribuer à la conception et à la résolution de défis technologiques et scientifiques contemporains.', 5, 50000, 'Français et Anglais', 'Master degree', 7),
    ('Arts numériques', 'La filière des Arts Numériques prépare les étudiants à une carrière dans le domaine de la création artistique numérique. Les étudiants acquièrent des compétences en conception graphique, en animation, en modélisation 3D, en création sonore et en réalité virtuelle. Ils explorent les outils et les technologies numériques pour créer des œuvres artistiques innovantes dans des domaines tels que l’animation, les effets visuels, les jeux vidéo, et la réalité augmentée. Cette formation leur permet de développer leur créativité et de maîtriser les techniques numériques pour s’exprimer artistiquement dans un monde de plus en plus connecté.', 5, 50000, 'Français et Anglais', 'Master degree', 7),
    ('Humanités numériques', 'La filière des Humanités Numériques explore l’intersection entre les sciences humaines et les technologies de l’information. Les étudiants acquièrent des compétences en analyse de données, en traitement du langage naturel, en gestion de l’information numérique et en conception de projets numériques dans des domaines tels que l’histoire, la linguistique, la sociologie et la littérature. Cette formation leur permet de mener des projets de recherche interdisciplinaires, d’exploiter les technologies numériques pour étudier et comprendre les phénomènes humains, et de développer des applications innovantes dans le domaine des sciences humaines et sociales.', 5, 50000, 'Français et Anglais', 'Master degree', 7);
-- Ajouter l'Institut Universitaire de Technologie du Bois (IUT)
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
    ('Institut Universitaire de Technologie du Bois (IUT)', 
    'L’IUT est situé à l’École des Eaux et Forêts de Mbalmayo.', 
    'L’admission à l’IUT Bois de Mbalmayo se fait par voie de concours. Celui-ci est ouvert aux titulaires d’un bac C, D, E, F4 (Génie Civil), et aux titulaires d’un Brevet des Techniciens (BT) en Industrie du Bois, Exploitation Forestière, Menuiserie et Ebéniste ou de tout autre diplôme reconnu en équivalent. Il faut être âgé de 28 ans au plus à la date du concours. A ce jour, cette Ecole ne possède qu’une seule filière dénommée Génie Civil du Bois. Les autres se mettent progressivement en place.',
    NULL, NULL, 1);
-- Ajouter les filières de l'IUT Bois de Mbalmayo
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Science Du Papier Et Bioenergie (Spb)', 'La filière Science Du Papier Et Bioenergie (Spb) se concentre sur l’étude des processus de production du papier, de la bioénergie et des biomatériaux. Les étudiants acquièrent des compétences dans les technologies liées à la transformation du bois en papier, ainsi que dans la production d’énergie à partir de sources biologiques.', 5, 50000, 'Français et Anglais', 'Master degree', 8),
    ('Chimie Du Bois (Chb)', 'La filière Chimie Du Bois (Chb) met l’accent sur l’analyse chimique et les processus de transformation du bois. Les étudiants explorent les propriétés chimiques du bois et apprennent à appliquer ces connaissances dans diverses industries chimiques et forestières.', 5, 50000, 'Français et Anglais', 'Master degree', 8),
    ('Construction Bois (Cb)', 'La filière Construction Bois (Cb) se concentre sur les techniques de construction utilisant le bois comme matériau principal. Les étudiants acquièrent des compétences dans la conception et la réalisation de structures en bois, en mettant laccent sur la durabilité et l’efficacité énergétique.', 5, 50000, 'Français et Anglais', 'Master degree', 8);
-- Ajouter l'Université de Yaoundé II
INSERT INTO Universite (nom, ville, descriptif, email, telephone, site_web)
VALUES
    ('UNIVERSITE DE YAOUNDE II', 
    'Yaoundé', 
    'L’Université de Yaoundé II a été créée le 19 janvier 1993 par décret N° 93/026 portant création des Universités d’État du Cameroun. Elle est donc issue de l’ancienne Université de Yaoundé. Elle est construite sur cinq (05) campus : -le campus de Soa qui abrite la Faculté de Sciences Juridiques et Politiques (FSJP) et Faculté de Sciences Économiques et de Gestion (FSEG) - le campus de Ngoa Ekelle où est construite l’École Supérieure des Sciences et Techniques de l’Information et de la Communication (ESSTIC) et Institut de Formation et Recherche Démographiques (IFORD) - le campus d’Obili où est logé l’Institut des Relations Internationales du Cameroun (IRIC) - le campus de Bertoua, Annexe de la Faculté de Sciences Juridiques et Politiques (FSJP) - le campus d’Ebolowa, Annexe de la Faculté de Sciences Juridiques et Politiques (FSJP)',
    'courrier@univ-yaounde2.org',
    '242 32 21 32',
    NULL);
-- Ajouter la Faculté des Sciences Juridiques et Politiques (FSJP) de l'Université de Yaoundé II
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
    ('Faculté des Sciences Juridiques et Politiques (FSJP)', 
    NULL, 
    'BACC. ou GCE/AL ou diplôme équivalent ou capacité en droit, avec une moyenne d’au moins 12/20 + Étude de dossier',
    NULL,
    NULL,
    2);
-- Ajouter la filière DROIT
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('DROIT', 
    'La filière de Droit à la Faculté des Sciences Juridiques et Politiques (FSJP) offre une formation complète et approfondie dans les domaines du droit public et privé. Les étudiants acquièrent des connaissances juridiques solides, comprennent les institutions légales et développent des compétences en analyse juridique et en plaidoyer. La durée de la formation est de 5 ans, le coût est de 50 000 FCFA par an, et la langue d’enseignement est le français et l’anglais. Le diplôme délivré est un Master degré en Droit.', 
    5,
    50000,
    'francais, anglais',
    'Master',
    9);

-- Ajouter la filière SCIENCE POLITIQUE
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('SCIENCE POLITIQUE', 
    'La filière de Science Politique à la Faculté des Sciences Juridiques et Politiques (FSJP) forme les étudiants aux concepts, théories et méthodes d’analyse politiques. Les étudiants acquièrent une compréhension approfondie des systèmes politiques, des institutions et des processus politiques. La durée de la formation est de 5 ans, le coût est de 50 000 FCFA par an, et la langue d’enseignement est le français et l’anglais. Le diplôme délivré est un Master degré en Science Politique.', 
    5,
    50000,
    'francais, anglais',
    'Master',
    9);
-- Ajouter la Faculté des Sciences Économiques et de Gestion (FSEG) de l'Université de Yaoundé II
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
    ('Faculté des Sciences Économiques et de Gestion (FSEG)', 
    'PARCOURS CLASSIQUE Cycle Licence', 
    'Bacc. ou GCE/AL ou diplôme équivalent et étude de dossier',
    NULL,
    NULL,
    2);
-- Ajouter la filière "Economie et Gestion" de la Faculté des Sciences Économiques et de Gestion (FSEG)
INSERT INTO Filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
    ('Economie et Gestion',
    'La filière "Economie et Gestion" de la Faculté des Sciences Économiques et de Gestion (FSEG) offre une formation complète dans les domaines de l’économie et de la gestion. Les étudiants acquièrent des compétences en analyse économique, gestion d’entreprise, finance, marketing, et bien d’autres. Le programme met l’accent sur la compréhension des concepts économiques, la prise de décision stratégique, et la résolution de problèmes liés aux entreprises et aux organisations. Les étudiants seront préparés à occuper des postes variés dans le secteur économique et financier.',
    3,
    50000,
    'francais et anglais',
    'Master degree',
    10);
-- Ajouter l'École Supérieure des Sciences et Techniques de l’Information et de la Communication (ESSTIC) de l'Université de Yaoundé II
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
    ('École Supérieure des Sciences et Techniques de l’Information et de la Communication (ESSTIC)', 
    NULL, 
    'Bac Concours',
    NULL,
    NULL,
    2);
-- Ajout des filières pour la Faculté ayant l'ID 10
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Journalisme', 'La filière de journalisme forme les étudiants aux différentes techniques et pratiques du journalisme. Les étudiants acquièrent des compétences en rédaction, en investigation, en montage audiovisuel et en gestion de l''information. Ils sont préparés à travailler dans divers médias tels que la presse écrite, la radio, la télévision et les médias en ligne.', 5, 50000, 'francais et anglais', 'Master degré', 11),
  ('Communication des Organisations', 'Cette filière prépare les étudiants à gérer la communication au sein des organisations. Les étudiants apprennent les stratégies de communication interne et externe, la gestion des relations publiques, et l''utilisation des médias sociaux. Ils sont formés pour occuper des postes de responsabilité au sein des entreprises, des institutions et des agences de communication.', 5, 50000, 'francais et anglais', 'Master degré', 11),
  ('Édition', 'La filière d''édition forme les étudiants aux aspects éditoriaux des médias imprimés et numériques. Les étudiants acquièrent des compétences en édition de livres, magazines et supports en ligne. Ils sont préparés à travailler dans l''édition, la production et la gestion de contenus éditoriaux.', 5, 50000, 'francais et anglais', 'Master degré', 11),
  ('Publicité', 'La filière de publicité forme les étudiants aux techniques de conception, de planification et de mise en œuvre de campagnes publicitaires. Les étudiants apprennent à créer des messages persuasifs, à utiliser les médias publicitaires et à comprendre les comportements des consommateurs. Ils sont préparés à travailler dans le domaine de la publicité et de la communication marketing.', 5, 50000, 'francais et anglais', 'Master degré', 11),
  ('Bibliothéconomie et Documentation', 'Cette filière forme les étudiants aux techniques de gestion de l''information, à la conservation des documents et à la gestion des bibliothèques. Les étudiants acquièrent des compétences en catalogage, en archivage et en recherche documentaire. Ils sont préparés à travailler dans les bibliothèques, les centres de documentation et les institutions culturelles.', 5, 50000, 'francais et anglais', 'Master degré', 11),
  ('Archivistique et Records Management', 'Cette filière forme les étudiants à la gestion et à la préservation des archives et des documents administratifs. Les étudiants apprennent les techniques de classement, de conservation et de gestion des archives électroniques. Ils sont préparés à travailler dans les archives nationales, les entreprises et les administrations publiques.', 5, 50000, 'francais et anglais', 'Master degré', 11);
-- Ajout des informations pour l'IRIC
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
  ('Institut des Relations Internationales du Cameroun (IRIC)', null, 'Licence, Étude de dossier', null, null, 2);
-- Ajout des informations pour les filières de l'IRIC
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('STAGE DIPLOMATIQUE ET PROTOCOLAIRE', 'Cette filière forme les étudiants aux différents aspects du protocole diplomatique, des négociations internationales et des relations diplomatiques. Elle met l’accent sur les compétences nécessaires pour travailler dans les services diplomatiques et les organisations internationales.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('FRANCOPHONIE ET MONDIALISATION', 'Cette filière explore les enjeux liés à la francophonie et à la mondialisation. Elle permet aux étudiants de comprendre les dynamiques culturelles, politiques et économiques au sein de l’espace francophone et à l’échelle mondiale.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('BANQUE-MONNAIE-FINANCE INTERNATIONALES', 'Cette filière forme les étudiants aux aspects financiers et économiques des relations internationales. Les étudiants acquièrent des compétences en finance internationale, gestion monétaire et bancaire dans un contexte mondial.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('COOPERATION INTERNATIONALE, ACTION HUMANITAIRE ET DÉVELOPPEMENT DURABLE', 'Cette filière se concentre sur la coopération internationale, l’action humanitaire et le développement durable. Les étudiants apprennent à concevoir et à gérer des projets humanitaires et de développement dans un contexte international.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('COMMUNICATION ET ACTION PUBLIQUE INTERNATIONALES', 'Cette filière prépare les étudiants à travailler dans le domaine de la communication internationale et de l’action publique. Les compétences incluent la communication interculturelle, la diplomatie publique et la gestion de l’information internationale.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('CONTENTIEUX INTERNATIONAL', 'Cette filière se concentre sur les aspects juridiques du contentieux international. Elle forme les étudiants à comprendre et à résoudre les litiges internationaux, en mettant l’accent sur le droit international public et privé.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('INTÉGRATION RÉGIONALE ET MANAGEMENT DES INSTITUTIONS COMMUNAUTAIRES', 'Cette filière explore les processus d’intégration régionale et le management des institutions communautaires. Les étudiants acquièrent une compréhension approfondie des organisations régionales et de leur fonctionnement.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('MARKETING INTERNATIONAL', 'Cette filière forme les étudiants aux principes du marketing appliqués au contexte international. Les étudiants développent des compétences en analyse de marché mondial, gestion de la marque et stratégies marketing internationales.', 5, 50000, 'francais et anglais', 'Master', 12),
  ('DIVERSITE CULTURELLE, PAIX ET COOPERATION INTERNATIONALE', 'Cette filière examine les liens entre la diversité culturelle, la paix et la coopération internationale. Les étudiants explorent les moyens de promouvoir la compréhension interculturelle et la collaboration internationale pour la paix.', 5, 50000, 'francais et anglais', 'Master', 12);
-- Ajout des informations pour l'IFORD
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
  ('Institut de Formation et de Recherche Démographiques (IFORD)', null, 'Etre titulaire d’une licence en Démographie, Géographie, Sociologie ou Anthropologie ; ou être titulaire d’un diplôme d’ingénieur des travaux statistiques ou d’une licence en Sciences Économiques, Statistique, Mathématiques ou Informatique (Entrée sur concours)', null, null, 2);
-- Ajout des informations pour la filière "Recherche Démographique"
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Recherche Démographique', 'La filière de Recherche Démographique forme les étudiants à comprendre, analyser et interpréter les données démographiques. Les étudiants acquièrent des compétences en méthodologies de recherche, en collecte et analyse de données démographiques, ainsi qu’en modélisation démographique. La durée du programme est de 5 ans, avec un coût de 50 000, enseigné en français et en anglais. Le diplôme délivré est un Master.', 5, 50000, 'francais et anglais', 'Master', 13);
-- Ajout des informations pour l'Université de Douala
INSERT INTO Universite (nom, ville, descriptif, email, telephone, site_web)
VALUES
  ('UNIVERSITE DE DOUALA', 'Douala', 'UNIVERSITE DE DOUALA : créée par décret N° 93/026 du 19 janvier 1993. l’Université de Douala (UD) est située dans le chef-lieu de la région du Littoral, capitale économique. l’Université de Douala comprend cinq Facultés et six grandes Écoles.', 'ud@camnet.cm', '233 40 64 15', NULL);

-- Ajout des informations pour la Faculté des Lettres et Sciences Humaines (FLSH) de l'Université de Douala
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
  ('FACULTE DES LETTRES ET SCIENCES HUMAINES (FLSH)', NULL, NULL, NULL, NULL, 3);

-- Ajout des informations pour la filière Linguistique et littérature française
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre,  faculte_id)
VALUES
  ('Linguistique et littérature française', 'Cette filière vise à explorer en profondeur la langue française, sa linguistique, ainsi que la littérature francophone. Les étudiants développeront une compréhension approfondie des aspects linguistiques, littéraires et culturels de la francophonie.', 5, 50000, 'francais', 'Master degre' , 14);

-- Ajout des informations pour la filière Langue, littérature et culture
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Langue, littérature et culture', 'Cette filière offre une étude approfondie des langues, littératures et cultures. Elle permet aux étudiants de développer des compétences linguistiques avancées et une compréhension approfondie de la littérature et de la culture.', 5, 50000, 'francais', 'Master degre', 14);

-- Ajout des informations pour la filière Communication
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Communication', 'Cette filière se concentre sur les aspects théoriques et pratiques de la communication. Les étudiants acquièrent des compétences en communication stratégique, en médias et en relations publiques.', 5, 50000, 'francais', 'Master degre', 14);

-- Ajout des informations pour la filière Anthropologie
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Anthropologie', 'La filière Anthropologie explore les différentes dimensions de l’anthropologie, y compris la socio-anthropologie, l’ethnologie et l’anthropologie culturelle. Les étudiants comprennent les cultures humaines dans divers contextes.', 5, 50000, 'francais', 'Master degre', 14);

-- Ajout des informations pour la filière Psychologie
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Psychologie', 'La filière Psychologie explore les aspects théoriques et appliqués de la psychologie. Les étudiants acquièrent une compréhension approfondie des processus mentaux et du comportement humain.', 5, 50000, 'francais', 'Master degre', 14);

-- Ajout des informations pour la filière Géographie
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Geographie', 'La filière Géographie se concentre sur l’étude des phénomènes géographiques, de la cartographie et de la planification spatiale. Les étudiants développent des compétences en analyse spatiale et en gestion des ressources.', 5, 50000, 'francais', 'Master degre', 14);

-- Ajout des informations pour la filière Histoire
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Histoire', 'La filière Histoire offre une exploration approfondie des événements passés, des sociétés et des cultures. Les étudiants acquièrent une expertise historique critique.', 5, 50000, 'francais', 'Master degre', 14);

-- Ajout des informations pour la filière Philosophie
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Philosophie', 'La filière Philosophie explore les grandes idées philosophiques, les théories éthiques et les questions fondamentales de la pensée humaine. Les étudiants développent une pensée critique et analytique.', 5, 50000, 'francais', 'Master degre', 14);

-- Ajout des informations pour la Faculté des Sciences (FS)
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
  ('FACULTÉ DES SCIENCES (FS)', null, null, null, null, 3);

-- Assurez-vous que les informations ont été ajoutées correctement
SELECT * FROM Faculte WHERE universite_id = 3;
-- Ajout des filières pour la Faculté des Sciences (FS) - Université de Douala
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Biochimie', 'La filière de Biochimie offre une compréhension approfondie des processus chimiques qui se déroulent au niveau moléculaire dans les organismes vivants. Les étudiants acquièrent des compétences pour analyser et interpréter les mécanismes biochimiques, avec des applications dans la recherche, la santé et l’industrie.', 5, 50000, 'francais, anglais', 'Master', 15),
  ('Biologie des organismes animaux (BOA)', 'Cette filière se concentre sur l’étude approfondie des organismes animaux, couvrant leur anatomie, physiologie, écologie et comportement. Les étudiants acquièrent des connaissances pour comprendre la diversité et le fonctionnement des animaux, avec des implications pour la préservation de la biodiversité.', 5, 50000, 'francais, anglais', 'Master', 15),
  ('Biologie des organismes vivants (BOV)', 'La filière BOV explore la biologie des organismes vivants dans leur ensemble, en mettant l’accent sur la diversité, l’écologie, l’évolution et la physiologie. Les étudiants développent une compréhension holistique des êtres vivants, de leurs interactions et de leur adaptation à l’environnement.', 5, 50000, 'francais, anglais', 'Master', 15),
  ('Sciences et Technologies', 'Cette filière offre une formation pluridisciplinaire en sciences et technologies, combinant des disciplines telles que la physique, la chimie, les mathématiques et l’informatique. Les étudiants acquièrent des compétences polyvalentes pour aborder des problèmes scientifiques complexes.', 5, 50000, 'francais, anglais', 'Master', 15),
  ('Mathématiques', 'La filière de Mathématiques approfondit la compréhension des concepts mathématiques fondamentaux, des théories aux applications pratiques. Les étudiants développent des compétences analytiques et logiques, essentielles dans divers domaines tels que la recherche, la finance et l’informatique.', 5, 50000, 'francais, anglais', 'Master', 15),
  ('Informatique', 'La filière Informatique forme des experts en sciences informatiques, couvrant la programmation, les bases de données, les réseaux et la conception logicielle. Les étudiants acquièrent des compétences pour résoudre des problèmes complexes et développer des solutions informatiques innovantes.', 5, 50000, 'francais, anglais', 'Master', 15),
  ('Chimie', 'La filière de Chimie explore les principes fondamentaux de la chimie, couvrant la chimie organique, inorganique et analytique. Les étudiants acquièrent des compétences expérimentales et théoriques pour comprendre et manipuler la matière à l’échelle moléculaire.', 5, 50000, 'francais, anglais', 'Master', 15),
  ('Physique', 'Cette filière offre une exploration approfondie des lois fondamentales de la physique, couvrant la mécanique, l’électromagnétisme, l’optique et la thermodynamique. Les étudiants développent une compréhension approfondie des phénomènes physiques et leurs applications.', 5, 50000, 'francais, anglais', 'Master', 15);
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Faculté des Sciences Economiques et de Gestions Appliquees (FSEGA)', null, null, null, null, 3);
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Economiques et de Gestions Appliquees', 
        'La filière Sciences Economiques et de Gestions Appliquees vise à former des professionnels capables d’analyser et de comprendre les enjeux économiques et gestionnaires. Les étudiants acquièrent des connaissances approfondies en économie, finance, gestion, marketing, et d’autres domaines connexes. La formation met l’accent sur l’application pratique des théories économiques et des techniques de gestion dans des contextes réels. Les diplômés de cette filière sont préparés à occuper des postes dans le domaine des affaires, de la finance, de la gestion d’entreprise et d’autres secteurs connexes.', 
        3, 50000, 'francais et anglais', 'Master degre', 16);
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Faculté des Sciences Juridiques et Politiques (FSJP)', 
        null, 
        null, 
        null, 
        null, 
        3);
-- Ajout de la filière Sciences Juridiques et Politiques
INSERT INTO Filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Juridiques et Politiques', 
        'La filière Sciences Juridiques et Politiques est conçue pour former des professionnels du droit et de la science politique. Pendant ces cinq années d’études, les étudiants acquerront des connaissances approfondies dans le domaine juridique et politique. Le programme comprend des cours théoriques, des travaux pratiques, des stages et des projets de recherche. Les étudiants seront préparés à comprendre, interpréter et appliquer le droit, ainsi qu’à analyser les enjeux politiques. La filière offre un enseignement bilingue (français et anglais) pour assurer une maîtrise complète des deux langues. À la fin du programme, les diplômés seront décernés avec un Master degré en Sciences Juridiques et Politiques, les préparant à une carrière dans le domaine juridique, politique, ou dans le secteur public.', 
        5, 
        50000, 
        'francais et anglais', 
        'Master degre', 
        17);
-- Ajout de la faculté de Médecine et des Sciences Pharmaceutiques
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Faculté de Médecine et des Sciences Pharmaceutiques', 
        null, 
        null, 
        null, 
        null, 
        3);
-- Ajout des filières de la faculté de Médecine et des Sciences Pharmaceutiques
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
    ('MEDECINE', 
     'La filière de Médecine forme des professionnels de la santé aptes à diagnostiquer, traiter et prévenir les maladies. Les étudiants acquièrent des connaissances approfondies en sciences médicales et développent des compétences pratiques à travers des stages cliniques.', 
     5, 
     50000, 
     'francais, anglais', 
     'Master degree', 
     18),
     
    ('PHARMACIE', 
     'La filière de Pharmacie prépare les étudiants à exercer le métier de pharmacien. Ils étudient les médicaments, leur composition, leurs effets et dispensent des conseils aux patients. La formation combine des connaissances en sciences pharmaceutiques et des stages pratiques.', 
     5, 
     50000, 
     'francais, anglais', 
     'Master degree', 
     18);
-- Ajout des informations pour l'École Normale Supérieure de l’Enseignement Technique Douala (ENSET)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES 
    ('Ecole Normale Supérieure de l’Enseignement Technique Douala (ENSET)', 
     NULL, 
     NULL, 
     NULL, 
     NULL, 
     3);
-- Ajout des filières pour la faculté avec faculte_id = 18

INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
  ('Industrie d’Habillement', 'Cette filière forme des professionnels capables de concevoir, fabriquer et gérer les processus de production dans l''industrie de l''habillement. Les étudiants apprennent les techniques de conception, de coupe, de couture et de finition des vêtements, ainsi que les aspects liés à la gestion de la production et à la qualité des produits finis.', 5, 50000, 'francais et anglais', 'Master degre', 19),
  ('Chimie Industrielle', 'La filière de Chimie Industrielle vise à former des spécialistes en chimie capables de travailler dans divers secteurs industriels tels que la fabrication de produits chimiques, la pharmacie, l''agroalimentaire, etc. Les étudiants acquièrent des compétences dans la manipulation des produits chimiques, la conception de processus de production efficaces et la gestion de la qualité.', 5, 50000, 'francais et anglais', 'Master degre', 19),
  ('Construction Mécanique', 'Cette filière forme des ingénieurs spécialisés dans la conception, la fabrication et la maintenance des équipements mécaniques utilisés dans divers secteurs industriels tels que l''automobile, l''aéronautique, l''énergie, etc. Les étudiants étudient les principes de base de la mécanique, la conception assistée par ordinateur (CAO), la fabrication assistée par ordinateur (FAO) et la gestion de la production.', 5, 50000, 'francais et anglais', 'Master degre', 19),
  ('Mécanique Automobile', 'La filière de Mécanique Automobile forme des spécialistes capables de concevoir, réparer et entretenir les véhicules automobiles. Les étudiants étudient les principes de base de la mécanique, les systèmes de transmission, les moteurs, les systèmes de suspension, les systèmes de freinage, etc. Ils acquièrent également des compétences en diagnostic et en réparation des véhicules.', 5, 50000, 'francais et anglais', 'Master degre', 19);
-- Ajout des informations pour l'Institut Universitaires de Technologie (IUT) Douala
INSERT INTO Faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Institut Universitaires de Technologie (IUT) Douala', -- Nom de la faculté
    NULL, -- Descriptif (non spécifié)
    NULL, -- Conditions d'admission (non spécifiées)
    NULL, -- Adresse email (non spécifiée)
    NULL, -- Numéro de téléphone (non spécifié)
    3     -- Identifiant de l'université associée (Université de Douala)
);
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('GESTION DES ENTREPRISES ET ADMINISTRATION (GEA)',
 'Cette filière forme des professionnels de la gestion d''entreprises avec une expertise approfondie en administration. Les étudiants acquièrent des compétences en finance, marketing, ressources humaines et gestion stratégique.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('GENIE LOGISTIQUE ET TRANSPORT (GLT)',
 'La filière de Génie Logistique et Transport forme des experts dans la gestion efficace de la chaîne logistique et des systèmes de transport. Les étudiants développent des compétences en planification logistique, gestion des stocks et logistique internationale.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('ORGANISATION ET GESTION ADMINISTRATIVE (OGA)',
 'Cette filière vise à former des professionnels qualifiés dans la gestion administrative des organisations. Les étudiants apprennent les meilleures pratiques en matière d’organisation, de gestion des ressources et de coordination administrative.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('TECHNOLOGIE DU TERTIAIRE',
 'La filière Technologie du Tertiaire prépare les étudiants à travailler dans le secteur tertiaire en mettant l’accent sur les compétences technologiques nécessaires pour réussir dans des domaines tels que les services, la finance et l’informatique.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('GENIE THERMIQUE ET ENERGIE',
 'Les étudiants de cette filière acquièrent des compétences avancées dans le domaine du génie thermique et de l’énergie. Ils apprennent à concevoir, optimiser et gérer les systèmes thermiques et énergétiques.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('BIOTECHNOLOGIE ET TECHNOLOGIE ALIMENTAIRE',
 'Cette filière combine la biotechnologie et la technologie alimentaire pour former des experts capables de travailler dans l’industrie alimentaire. Les étudiants apprennent à appliquer des techniques biotechnologiques à la production alimentaire.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('GENIE INDUSTRIEL ET MAINTENANCE',
 'Les étudiants de cette filière acquièrent des compétences approfondies dans le génie industriel et la maintenance. Ils sont formés pour optimiser les processus de production et assurer la maintenance efficace des équipements industriels.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('GENIE CIVIL',
 'La filière de Génie Civil forme des professionnels capables de concevoir, construire et entretenir des infrastructures civiles. Les étudiants acquièrent des compétences en conception structurelle, gestion de projet et matériaux de construction.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('GENIE DES MINES',
 'Les étudiants de cette filière sont formés pour travailler dans le secteur minier. Ils apprennent les techniques d’exploration, d’extraction et de traitement des minerais, ainsi que les aspects environnementaux liés à l’industrie minière.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('GENIE METALLURGIE',
 'La filière de Génie Métallurgie forme des experts dans le traitement des métaux. Les étudiants apprennent les techniques de production, de transformation et de contrôle de la qualité des matériaux métalliques.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('GENIE MECANIQUE ET PRODUCTIQUE',
 'Cette filière combine le génie mécanique avec la productique pour former des ingénieurs spécialisés dans la conception et la fabrication de produits mécaniques. Les étudiants apprennent à utiliser des technologies avancées pour optimiser les processus de production.',
 5, 50000, 'francais et anglais', 'Master degre', 20),

('TECHNOLOGIES DE L’INFORMATION ET DU NUMÉRIQUE',
 'Les étudiants de cette filière acquièrent des compétences avancées dans les technologies de l’information et du numérique. Ils sont formés pour concevoir, développer et gérer des systèmes informatiques et des solutions numériques innovantes.',
 5, 50000, 'francais et anglais', 'Master degre', 20);
-- Ajout de la faculté ESSEC Douala
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Ecole Supérieure des Sciences Economiques et Commerciales (ESSEC) Douala',
 null,
 null,
 null,
 null,
 3);
-- Ajout de la filière Sciences Economiques et Commerciales à l'ESSEC Douala
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Sciences Economiques et Commerciales',
 'La filière Sciences Economiques et Commerciales à l''ESSEC Douala forme les étudiants aux différentes disciplines liées à l''économie et au commerce. Les cours couvrent des sujets tels que la microéconomie, la macroéconomie, la comptabilité, la gestion, le marketing, etc. Les étudiants acquièrent des compétences analytiques et opérationnelles pour comprendre les enjeux économiques et commerciaux. La durée du programme est de 5 ans, le coût est de 50 000, et le diplôme délivré est un Master degré. Les cours sont dispensés en français et en anglais.',
 5,
 50000,
 'francais, anglais',
 'Master',
 21);
-- Ajout de la faculté Institut des Sciences Halieutiques (ISH) Douala
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Institut des Sciences Halieutiques (ISH) Douala',
 NULL,
 NULL,
 NULL,
 NULL,
 3);
-- Ajout de la filière Sciences Halieutiques dans la faculté Institut des Sciences Halieutiques (ISH) Douala
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Sciences Halieutiques',
 'La filière Sciences Halieutiques forme les étudiants aux sciences relatives à la pêche et à l’aquaculture. Les étudiants acquièrent des connaissances approfondies sur la gestion durable des ressources aquatiques, la biologie des poissons, la technologie de la pêche, et d’autres domaines liés à l’exploitation des ressources halieutiques. Le programme de 5 ans offre une formation complète pour les futurs professionnels du secteur halieutique.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 22);
-- Ajout de la faculté Ecole Nationale Supérieure Polytechnique de Douala (ENSPD)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Ecole Nationale Supérieure Polytechnique de Douala (ENSPD)',
 null,
 null,
 null,
 null,
 3);
-- Ajout des filières pour l'Ecole Nationale Supérieure Polytechnique de Douala (ENSPD)
-- Filière : Mathématiques et Sciences Physiques
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Mathématiques et Sciences Physiques',
 'Cette filière vise à former des experts dans les domaines des mathématiques et des sciences physiques. Les étudiants acquièrent des connaissances approfondies en mathématiques pures et appliquées ainsi qu’en physique. Le programme inclut des cours théoriques, des travaux pratiques et des projets de recherche.',
 5,
 50000,
 'francais et anglais',
 'Master degree',
 23);

-- Filière : Techniques de L’ingénieur
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Techniques de L’ingénieur',
 'Cette filière forme des ingénieurs spécialisés dans les techniques de l’ingénierie. Les étudiants acquièrent des compétences techniques avancées dans des domaines tels que la mécanique, l’électricité, l’électronique et l’informatique. Le programme comprend des cours théoriques, des travaux pratiques et des stages en entreprise.',
 5,
 50000,
 'francais et anglais',
 'Master degree',
 23);

-- Filière : Sciences Humaines et Sociales
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Sciences Humaines et Sociales',
 'Cette filière offre une formation approfondie dans les sciences humaines et sociales, couvrant des domaines tels que la sociologie, la psychologie, la philosophie et l’anthropologie. Les étudiants développent une compréhension critique des enjeux sociaux et des compétences analytiques.',
 5,
 50000,
 'francais et anglais',
 'Master degree',
 23);
-- Ajout de l'Institut des Beaux Arts (IBA) Nkongsamba
-- Faculté : Institut des Beaux Arts (IBA)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Institut des Beaux Arts (IBA) Nkongsamba',
 null,
 null,
 null,
 null,
 3);
-- Ajout des filières de l'Institut des Beaux Arts (IBA) Nkongsamba
-- Filière : Arts plastiques et histoire de l’art
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Arts plastiques et histoire de l’art',
 'Cette filière offre une exploration approfondie des arts plastiques et de l’histoire de l’art. Les étudiants développent des compétences artistiques, créatives et critiques, tout en acquérant une compréhension approfondie de l’évolution des mouvements artistiques.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 24);

-- Filière : Cinéma et audiovisuel
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Cinéma et audiovisuel',
 'Cette filière forme les étudiants aux divers aspects de la production cinématographique et audiovisuelle. Ils acquièrent des compétences techniques, créatives et narratives nécessaires pour réussir dans l’industrie du cinéma et de l’audiovisuel.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 24);

-- Filière : Patrimoine et muséologie
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Patrimoine et muséologie',
 'Cette filière prépare les étudiants à la préservation, à la gestion et à la mise en valeur du patrimoine culturel. Ils explorent les techniques de conservation, la gestion muséale et les enjeux liés à la préservation du patrimoine.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 24);

-- Filière : Architecture et urbanisme
INSERT INTO filieres (nom, descriptif , duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Architecture et urbanisme',
 'Cette filière forme les étudiants à concevoir des projets architecturaux et urbains durables. Ils acquièrent des compétences en conception, en planification urbaine et en gestion de projets architecturaux, tout en comprenant les aspects esthétiques, fonctionnels et environnementaux.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 24);
-- Ajout de l'Université de Maroua
INSERT INTO universite (nom, ville, descriptif, email, telephone, site_web)
VALUES
('UNIVERSITE DE MAROUA',
 'Maroua',
 'Historique et données géographiques Créée par Décret n°2008/280 du 9 août 2008, l’Université de Maroua est la dernière-née des institutions universitaires publiques au Cameroun. Elle comprend cinq Facultés et deux (2) Grandes Ecoles.',
 'rectorat@univ-Maroua.cm',
 '237 222 29 28 52',
 NULL);
-- Ajout de la Faculté des Lettres et Sciences Humaines à l'Université de Maroua
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Lettres et Sciences Humaines (FALSH)',
 'Créée par décret présidentiel, 2013/333 du 13 septembre 2013, fonctionnelle depuis la rentrée académique 2013/2014, la Faculté des Lettres et Sciences Humaines offre des formations dans les disciplines suivantes : histoire, langues (français, anglais, espagnol, allemand, etc.) et les lettres.',
 NULL,
 NULL,
 NULL,
 4);
-- Ajout des filières à la Faculté des Lettres et Sciences Humaines (FALSH) de l'Université de Maroua
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Géographie',
 'La filière de Géographie explore les différentes facettes de la science géographique, allant de l’étude des cartes et de la topographie à la compréhension des phénomènes sociaux et environnementaux liés à la localisation des populations.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Langue et littérature française',
 'Cette filière met l’accent sur l’étude approfondie de la langue française, de sa littérature et de son évolution au fil du temps. Les étudiants développent des compétences linguistiques avancées et une compréhension approfondie de la littérature francophone.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Lettres bilingues',
 'La filière de Lettres bilingues combine l’étude des langues et de la littérature française et anglaise. Les étudiants acquièrent une double compétence linguistique et littéraire, ce qui les prépare à des carrières variées dans le domaine des langues.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Philosophie et Psychologie',
 'Cette filière explore les théories philosophiques et psychologiques, offrant aux étudiants une compréhension approfondie de la pensée humaine et de ses implications dans la société. Elle favorise le développement de la pensée critique et analytique.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Allemand',
 'La filière d’Allemand se concentre sur l’apprentissage approfondi de la langue allemande, de sa structure grammaticale à son utilisation quotidienne. Les étudiants sont exposés à la culture allemande et développent des compétences linguistiques avancées.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Espagnol',
 'La filière d’Espagnol vise à développer la maîtrise de la langue espagnole et à approfondir la compréhension de la culture hispanophone. Les étudiants acquièrent des compétences linguistiques avancées et une connaissance approfondie de la littérature espagnole.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Arabe',
 'La filière d’Arabe met l’accent sur l’apprentissage de la langue arabe, de son écriture à sa conversation. Les étudiants explorent également la littérature et la culture arabes, acquérant ainsi une compréhension approfondie de cet aspect diversifié du monde.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Chinois',
 'La filière de Chinois offre aux étudiants la possibilité d’apprendre la langue chinoise, avec un accent particulier sur les caractères chinois, la grammaire et la prononciation. Elle ouvre des perspectives sur la culture et la société chinoises.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Sociologie et Anthropologie',
 'Cette filière explore les théories et méthodologies de la sociologie et de l’anthropologie. Les étudiants analysent les structures sociales, les comportements humains et les cultures, développant une perspective critique sur la société.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25),

('Histoire',
 'La filière d’Histoire plonge les étudiants dans l’étude des événements passés, des civilisations et des cultures. Ils acquièrent une compréhension approfondie des forces historiques qui ont façonné le monde moderne.',
 5,
 50000,
 'Français et Anglais',
 'Master degré',
 25);
-- Ajout de la Faculté des Sciences à l'Université de Maroua
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Sciences',
 'La Faculté des Sciences cultive l’excellence avec un enseignement et une recherche de pointe dans de nombreux domaines incluant la Biologie, la Chimie, l’Informatique, la Physique, les mathématiques, les sciences de la Terre et de l’environnement. Formation : Les enseignements sont dispensés dans 5 départements, ceux-ci couvrent toutes les disciplines Scientifiques telles : l’informatique, les Mathématiques, la Mécanique, les Sciences Biologiques, les Sciences Environnementales, les Sciences pour l’ingénieur, les Sciences de la Matière (physique et Chimie) et les Sciences de la Terre.',
 null,
 null,
 null,
 4);
-- Ajout des filières à la Faculté des Sciences de l'Université de Maroua
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Informatique',
 'La filière Informatique offre une formation approfondie en sciences informatiques, couvrant les domaines tels que la programmation, les bases de données, les réseaux informatiques et les systèmes d’information. Les étudiants acquièrent des compétences pratiques et théoriques pour répondre aux défis du monde numérique.',
 5,
 50000,
 'Français et Anglais',
 'Master degree',
 26),
('Mathématiques',
 'La filière Mathématiques propose une formation avancée en mathématiques pures et appliquées. Les étudiants développent des compétences analytiques et résolutives, essentielles pour résoudre des problèmes complexes dans divers domaines tels que la finance, la science des données et la recherche.',
 5,
 50000,
 'Français et Anglais',
 'Master degree',
 26),
('Physique',
 'La filière Physique offre une formation approfondie en physique théorique et expérimentale. Les étudiants acquièrent des compétences dans la modélisation, l’expérimentation et l’analyse des phénomènes physiques. Cette formation ouvre des opportunités dans la recherche, l’industrie et l’enseignement.',
 5,
 50000,
 'Français et Anglais',
 'Master degree',
 26),
('Sciences biologiques',
 'La filière Sciences Biologiques propose une exploration approfondie du monde du vivant, couvrant la biologie moléculaire, la génétique, l’écologie et d’autres domaines connexes. Les étudiants développent une compréhension approfondie des organismes vivants et de leurs interactions.',
 5,
 50000,
 'Français et Anglais',
 'Master degree',
 26);
-- Ajout de la Faculté des Sciences Économiques et de Gestion de l'Université de Maroua
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Sciences Économiques et de Gestion (FSEG)',
 'La formation en Sciences Économiques et Gestion permet d’acquérir un certain nombre de compétences généralistes et transversales. Notamment elle permet d’appréhender l’environnement économique et social, analyser les enjeux de l’actualité, comprendre le fonctionnement des entreprises et leurs stratégies. La formation en Licence en Sciences Économiques commence par un tronc commun de quatre semestres et se poursuit par la spécialisation en Sciences Économiques et Sciences de Gestion.',
 null,
 null,
 null,
 4);
-- Ajout de la filière "ECONOMIE ET GESTION" à la Faculté des Sciences Économiques et de Gestion de l'Université de Maroua
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('ECONOMIE ET GESTION',
 'La filière "Économie et Gestion" offre une formation complète dans les domaines de l’économie, de la gestion et des sciences économiques. Elle permet aux étudiants d’acquérir des compétences en analyse économique, compréhension des enjeux économiques actuels, gestion d’entreprise, stratégies économiques, etc. La durée du programme est de 3 ans, avec un coût annuel de 50 000 FCFA. Les cours sont dispensés en français et en anglais. À la fin du cursus, les étudiants obtiennent un diplôme de Master degré.',
 3,
 50000,
 'francais et anglais',
 'Master degre',
 27);
-- Ajout de la Faculté des Sciences Juridiques et Politiques à l'Université de Maroua
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Sciences Juridiques et Politiques',
 'La Faculté des Sciences Juridiques et Politiques offre une formation en Licence en Sciences Juridiques et Politiques permettant d’acquérir des compétences généralistes et transversales dans les domaines juridiques et politiques. Les étudiants apprennent à comprendre l’environnement juridique et politique, à analyser les enjeux de l’actualité, etc. La formation commence par un tronc commun de quatre semestres et se poursuit par la spécialisation en Licence en droit privé, Licence en droit public, et Licence en Science politique. Les conditions d’admission varient. Contactez-nous pour plus d’informations.',
 null,
 null,
 null,
 4);
-- Ajout de la filière Droit à la Faculté des Sciences Juridiques et Politiques de l'Université de Maroua
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Droit',
 'La filière Droit à la Faculté des Sciences Juridiques et Politiques offre une formation complète en sciences juridiques. Pendant cinq ans, les étudiants étudieront les différentes branches du droit, acquérant des connaissances approfondies en droit privé et public. La formation met l’accent sur la compréhension de l’environnement juridique, l’analyse critique des textes de loi, et le développement des compétences juridiques nécessaires à la pratique du droit. Le programme est dispensé en français et en anglais, avec un coût de scolarité de 50 000 FCFA par an. À la fin du programme, les diplômés recevront un Master degré en Droit.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 28);
-- Ajout de la faculté Ecole Normale Supérieure à l'Université de Maroua
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Ecole Normale Supérieure',
 'L’Ecole Normale Supérieure a pour missions spécifiques d’assurer la formation initiale des Professeurs de l’Enseignement Secondaire Général, des Professeurs de l’Enseignement Normal et des Conseillers d’Orientation Scolaire, Universitaire et Professionnelle. Elle assure également la formation continue, le recyclage et le perfectionnement des personnels enseignants et administratifs du système éducatif et des Conseillers d’Orientation Scolaire, Universitaire et Professionnelle. L’ENS compte 13 départements.',
 'L’admission à l’ENS se fait par voie de concours sur épreuves, sur étude de dossier, sur titre et comme auditeurs libres, dans la limite des places disponibles. Les candidats au concours doivent être âgés de 28 ans au plus pour le première cycle et être titulaires du Baccalauréat A, C, D et E, du GCE A/L ou de tout autre diplôme reconnu équivalent par le Ministère de l’Enseignement Supérieur. Ceux du seconde cycle doivent être âgés de 31 ans au plus et être titulaires du DIPES I et (ou) d’une Licence correspondant à la filière sollicitée, ou d’un diplôme reconnu équivalent par le MINESUP.',
 null,
 '(237)22.29.19.87',
 4);
-- Ajout des filières à la Faculté des Sciences de l'Université de Maroua
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Chimie', 'La filière Chimie offre une formation approfondie dans les principaux domaines de la chimie, couvrant à la fois la chimie organique, inorganique et physique. Elle prépare les étudiants à des carrières dans la recherche, l’industrie chimique, et d’autres secteurs connexes.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Géographie', 'La filière Géographie permet d’acquérir des compétences en analyse spatiale, en cartographie, en gestion de l’environnement et en planification territoriale. Les étudiants exploreront les aspects physiques, humains et environnementaux de la géographie.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Informatique', 'La filière Informatique forme des experts en informatique capables de concevoir, développer et maintenir des systèmes logiciels. Les étudiants acquièrent des compétences avancées en programmation, en conception de bases de données et en développement d’applications.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Langue anglaise et littérature d’expression anglaise', 'La filière Langue anglaise et littérature d’expression anglaise offre une expertise approfondie dans la langue anglaise, la littérature et la culture anglophones. Elle prépare les étudiants à des carrières dans l’enseignement, la traduction, et la communication internationale.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('PHYSIQUE', 'La filière Physique propose une formation complète en physique théorique et expérimentale. Les étudiants développent des compétences en analyse mathématique, en modélisation physique et en expérimentation scientifique.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Langue française et littérature d’expression française', 'La filière Langue française et littérature d’expression française met l’accent sur l’étude approfondie de la langue française, de la littérature et de la culture francophones. Elle prépare les étudiants à des carrières dans l’enseignement, la rédaction, et la communication.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Allemand', 'La filière Allemand offre une formation avancée en langue allemande, en littérature et en culture germanophones. Elle prépare les étudiants à des carrières dans la traduction, l’interprétation et les relations internationales.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Espagnol', 'La filière Espagnol vise à développer les compétences en langue espagnole, en littérature et en culture hispanophones. Elle ouvre des opportunités dans les domaines de l’éducation, de la traduction et des affaires internationales.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Arabe', 'La filière Arabe propose une formation approfondie en langue arabe, en littérature et en culture arabes. Elle prépare les étudiants à des carrières dans la traduction, la diplomatie et les relations internationales.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Italien', 'La filière Italien offre une expertise en langue italienne, en littérature et en culture italiennes. Elle prépare les étudiants à des carrières dans la traduction, le journalisme et la diplomatie.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Chinois', 'La filière Chinois vise à développer les compétences en langue chinoise, en littérature et en culture chinoises. Elle ouvre des perspectives dans le domaine des affaires internationales, de la traduction et de la communication.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Lettres Bilingues', 'La filière Lettres Bilingues permet d’acquérir des compétences approfondies en littérature, langues et cultures en français et dans une autre langue. Elle prépare les étudiants à des carrières dans la traduction, l’enseignement et la communication internationale.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Mathématiques', 'La filière Mathématiques offre une formation avancée en mathématiques pures et appliquées. Elle prépare les étudiants à des carrières dans la recherche, l’enseignement et l’industrie.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('PHILOSOPHIE', 'La filière Philosophie propose une exploration approfondie de la philosophie occidentale et africaine. Elle développe la pensée critique et prépare les étudiants à des carrières dans l’enseignement, la recherche et la réflexion philosophique.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('CONSEILLER D’ORIENTATION', 'La filière CONSEILLER D’ORIENTATION forme des professionnels capables d’accompagner les individus dans leur orientation scolaire et professionnelle. Les étudiants acquièrent des compétences en psychologie, en éducation et en conseil.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Biologie', 'La filière Biologie offre une formation approfondie en biologie cellulaire, en génétique, en écologie et en physiologie. Elle prépare les étudiants à des carrières dans la recherche, la santé et l’environnement.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('Science de l’éducation', 'La filière Science de l’éducation vise à former des professionnels de l’éducation, notamment des enseignants et des formateurs. Elle aborde les théories de l’éducation, la psychologie de l’apprentissage et les méthodes pédagogiques.', 5, 50000, 'francais, anglais', 'Master degree', 29),
('SCIENCES PHYSIQUES', 'La filière SCIENCES PHYSIQUES offre une formation complète en sciences physiques, combinant la physique théorique et expérimentale. Elle prépare les étudiants à des carrières dans la recherche, l’enseignement et l’industrie.', 5, 50000, 'francais, anglais', 'Master degree', 29);
-- Ajout de l'École Nationale Supérieure Polytechnique Maroua (ENSPM) à l'Université de Maroua
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Ecole Nationale Supérieure Polytechnique Maroua (ENSPM)',
 'L’ENSPM (Ex Institut Supérieur du Sahel) de l’Université de Maroua est un pôle d’Excellence polytechnique au service du développement local, national et sous régional. Elle offre des formations de pointe dans divers domaines polytechniques, contribuant ainsi au progrès scientifique et technologique.',
 null,
 null,
 '(237)22.29.19.87',
 4);
-- Ajout des filières de l'École Nationale Supérieure Polytechnique Maroua (ENSPM)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Informatique et télécommunications (INFOTEL)',
 'La filière Informatique et Télécommunications forme des ingénieurs capables de concevoir, développer et gérer des systèmes informatiques et des réseaux de communication. Les étudiants acquièrent des compétences approfondies en programmation, sécurité informatique, réseaux, et télécommunications.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30),

('Energies renouvelables (ENREN)',
 'La filière Énergies Renouvelables vise à former des ingénieurs spécialisés dans le domaine des énergies renouvelables. Les étudiants apprennent à concevoir, mettre en œuvre et gérer des systèmes utilisant des sources d’énergie renouvelable, contribuant ainsi au développement durable.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30),

('Traitement des matériaux, architecture et habitat (TRAMARH)',
 'La filière Traitement des Matériaux, Architecture et Habitat forme des ingénieurs compétents dans le domaine des matériaux de construction, de l’architecture et de l’habitat durable. Les étudiants acquièrent des connaissances approfondies sur les matériaux, les techniques de construction et la conception architecturale.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30),

('Génie du textile et du cuir (GTC)',
 'La filière Génie du Textile et du Cuir forme des ingénieurs spécialisés dans la production et la transformation des textiles et du cuir. Les étudiants acquièrent des compétences techniques et technologiques nécessaires pour travailler dans l’industrie textile et du cuir.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30),

('Agriculture, élevage et produits dérivés (AGEPD)',
 'La filière Agriculture, Élevage et Produits Dérivés vise à former des ingénieurs agronomes capables de contribuer au développement de l’agriculture et de l’élevage. Les étudiants apprennent les techniques modernes de gestion agricole et d’élevage, ainsi que la transformation des produits dérivés.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30),

('Sciences environnementales (SCIENVI)',
 'La filière Sciences Environnementales forme des ingénieurs spécialisés dans la préservation de l’environnement. Les étudiants étudient les sciences naturelles, l’écologie, la gestion des ressources naturelles et la protection de l’écosystème pour contribuer à un environnement durable.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30),

('Hydraulique et maîtrise des eaux (HYMAE)',
 'La filière Hydraulique et Maîtrise des Eaux forme des ingénieurs spécialisés dans la gestion de l’eau. Les étudiants acquièrent des compétences en conception, construction et gestion des infrastructures hydrauliques pour répondre aux besoins en eau de la société.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30),

('Climatologie, hydrologie et pédologie (CLIMATO)',
 'La filière Climatologie, Hydrologie et Pédologie forme des ingénieurs spécialisés dans l’étude du climat, de l’eau et des sols. Les étudiants contribuent à la compréhension des phénomènes climatiques, de la gestion des ressources hydriques et de la conservation des sols.',
 5,
 50000,
 'francais, anglais',
 'Master',
 30);
-- Ajout de la Faculté des Mines et des Industries Pétrolières (FMIP)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Mines et des Industries Pétrolières (FMIP)',
 'La formation à la FMIP a pour but de donner aux étudiants des connaissances et un langage communs leur permettant de s’insérer dans le monde des industries minières et pétrolières, dans le monde des métiers du pétrole et du gaz. Elle vise aussi la mise au point de produits et de techniques de traitements des gisements pétroliers, des matériels pour l’exploration et la production pétrolière, des produits de raffinage, des nouveaux carburants et des matériaux pour l’énergie.
Formation : Pour assurer la formation, l’Institut des Mines et des Industries Pétrolières (IMP) est doté des Départements suivants :
Département d’Ingénierie Minière et Traitement des Minerais ;
Département d’Exploration Minière, Pétrolière, Gazière et Ressources en Eau;
Département de Raffinage et de Pétrochimie ;
Département de Génie Mécanique, Pétrolier et Gazier ;
Département de Sécurité Industrielle, Qualité et Environnement ;
Département de l’Économie, Gestion et Législation Minière, Pétrolière et Gazière ;
Département des Sciences fondamentales, de Droit et des Humanités.',
 null,
 null,
 null,
 4);
-- Ajout des filières de la Faculté des Mines et des Industries Pétrolières (FMIP)
-- Génie Mécanique, Pétrolier et Gazier (GMPG)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Génie Mécanique, Pétrolier et Gazier (GMPG)',
 'La filière GMPG forme des ingénieurs capables de concevoir, développer, produire et gérer des systèmes mécaniques liés à l’industrie pétrolière et gazière. Les étudiants acquièrent des compétences en génie mécanique, en technologies pétrolières et gazières, ainsi qu’en gestion de projets.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 31);

-- MINES ET CARRIERES (MIC)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('MINES ET CARRIERES (MIC)',
 'La filière MIC forme des professionnels spécialisés dans l’exploitation des mines et carrières. Les étudiants développent des compétences en géologie, en extraction minière, en gestion des ressources naturelles et en environnement.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 31);

-- Raffinage et Pétrochimie (RPC)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Raffinage et Pétrochimie (RPC)',
 'La filière RPC prépare les étudiants à travailler dans les secteurs du raffinage et de la pétrochimie. Ils acquièrent des connaissances en procédés de raffinage, en génie chimique et en production de produits pétroliers et chimiques.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 31);

-- Securite industrielle qualite et environnement (SQE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Securite industrielle qualite et environnement (SQE)',
 'La filière SQE forme des professionnels spécialisés dans la sécurité industrielle, la gestion de la qualité et la préservation de l’environnement. Les étudiants acquièrent des compétences en gestion des risques, en contrôle qualité et en protection de l’environnement.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 31);

-- Exploration Pétrolière et Gazière (XMPE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Exploration Pétrolière et Gazière (XMPE)',
 'La filière XMPE forme des experts dans l’exploration des gisements pétroliers et gaziers. Les étudiants apprennent les techniques d’exploration, la géologie pétrolière, la géophysique et la gestion des ressources énergétiques.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 31);

-- Economie, Gestion et Législation minière, Pétrolière et Gazière (EGLM)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Economie, Gestion et Législation minière, Pétrolière et Gazière (EGLM)',
 'La filière EGLM forme des professionnels dans l’économie, la gestion et la législation liées aux industries minières, pétrolières et gazières. Les étudiants développent des compétences en économie, en gestion des ressources naturelles et en droit minier et pétrolier.',
 5,
 50000,
 'francais et anglais',
 'Master degre',
 31);
-- Ajout de l'Université de Ngaoundéré
INSERT INTO universite (nom, ville, descriptif, email, telephone, site_web)
VALUES
('UNIVERSITE DE NGAOUNDERE',
 'Ngaoundéré',
 'L‘Université de Ngaoundéré est créée par décret présidentiel N° 93/028 du 19 janvier 1993. Elle est issue de la transformation du Centre Universitaire de Ngaoundéré en Université. Localisation: L’Université de Ngaoundéré se trouve à Dang, une banlieue située à 15 km de Ngaoundéré, chef lieu de la région de l’Adamaoua. Ngaoundéré est une ville carrefour qui sert de transition entre le Nord et le Sud Cameroun. Elle est considérée comme le château d’eau du Cameroun, car de nombreux cours d’eau y prennent leur source.',
 'un@univ-ndere.cm',
 '237 222 25 40 02',
 'www.univ-ndere.cm');

INSERT INTO Faculte(nom, descriptif, condition_admission,email, telephone, universite_id)
VALUES
('Faculté des Arts, Lettres et Sciences Humaines (FALSH)',
 'La Faculté des Arts, Lettres et Sciences Humaines (FALSH) de l’Université de Ngaoundéré compte six départements. Elle délivre des diplômes de Licence, de Master et de Doctorat en Histoire, Géographie, Sociologie-Anthropologie, Littérature et Linguistique et participe à plusieurs masters complémentaires.',
 null,
 null,
 null,
 '5');
-- Ajout des filières à la Faculté des Arts, Lettres et Sciences Humaines (FALSH) de l'Université de Ngaoundéré
-- Commentaire : Ajout des filières à la Faculté des Arts, Lettres et Sciences Humaines (FALSH)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Anglais', 'La filière Anglais vise à former des experts en langue anglaise, capables de maîtriser la communication écrite et orale dans cette langue. Les étudiants acquièrent également des connaissances approfondies sur la culture anglophone.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Sociologie', 'La filière Sociologie forme des professionnels capables d’analyser les structures sociales, les comportements individuels et collectifs, ainsi que les phénomènes sociaux. Elle offre une compréhension approfondie des dynamiques sociales.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Anthropologie', 'La filière Anthropologie se concentre sur l’étude des sociétés humaines, des cultures, des traditions et des comportements humains. Les étudiants acquièrent une perspective globale sur la diversité culturelle et sociale.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Géographie', 'La filière Géographie forme des experts en analyse spatiale, cartographie et gestion de l’environnement. Les étudiants acquièrent des compétences pour comprendre les interactions entre l’homme et son environnement géographique.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Histoire', 'La filière Histoire offre une compréhension approfondie des événements passés, des sociétés et des cultures. Elle forme des historiens capables d’analyser et d’interpréter le passé.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Langue Et Civilisation Arabes', 'La filière Langue Et Civilisation Arabes se concentre sur l’étude approfondie de la langue arabe et de sa civilisation. Les étudiants acquièrent des compétences linguistiques et culturelles.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Lettres Modernes Françaises', 'La filière Lettres Modernes Françaises forme des experts en littérature française moderne. Les étudiants étudient les œuvres littéraires et développent des compétences analytiques et interprétatives.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Informatique', 'La filière Informatique vise à former des professionnels capables de concevoir, développer et maintenir des systèmes informatiques. Les étudiants acquièrent des compétences en programmation, en gestion de projets et en résolution de problèmes informatiques.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Mathématiques et Informatique', 'La filière Mathématiques et Informatique combine les aspects théoriques des mathématiques avec les compétences pratiques de l’informatique. Les étudiants développent des compétences en modélisation mathématique et en résolution de problèmes informatiques.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Mathématiques Pures', 'La filière Mathématiques Pures se concentre sur l’étude approfondie des concepts mathématiques abstraits. Les étudiants développent une compréhension profonde des théories mathématiques fondamentales.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Biologie des Organismes', 'La filière Biologie des Organismes explore la diversité du monde vivant, de l’échelle cellulaire à l’écosystème. Les étudiants acquièrent des compétences en biologie cellulaire, écologie et taxonomie.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Chimie', 'La filière Chimie forme des experts en sciences chimiques, couvrant des domaines tels que la chimie organique, inorganique et analytique. Les étudiants développent des compétences en laboratoire et en résolution de problèmes chimiques.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Physique', 'La filière Physique se concentre sur l’étude des lois fondamentales de la nature. Les étudiants acquièrent des compétences en physique théorique, expérimentale et appliquée.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Radiologie et Imagerie Médicale', 'La filière Radiologie et Imagerie Médicale forme des professionnels de la santé spécialisés dans l’utilisation des techniques d’imagerie médicale pour le diagnostic. Les étudiants apprennent à utiliser des équipements radiologiques et à interpréter les images médicales.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Sciences Biomédicales', 'La filière Sciences Biomédicales combine des aspects de la biologie, de la médecine et de la recherche médicale. Les étudiants acquièrent des compétences pour comprendre les processus biologiques liés à la santé et aux maladies.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Sciences Infirmières', 'La filière Sciences Infirmières forme des infirmières professionnelles capables de fournir des soins de santé holistiques. Les étudiants apprennent les compétences cliniques, éthiques et de leadership nécessaires pour travailler dans le domaine de la santé.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Sciences Médico-Sanitaire', 'La filière Sciences Médico-Sanitaire aborde les aspects médicaux et sanitaires de la santé publique. Les étudiants acquièrent des compétences pour travailler dans la gestion des services de santé et la promotion de la santé publique.', '5', '50000', 'francais et anglais', 'Master', '32'),
('Géosciences et Environnement', 'La filière Géosciences et Environnement explore les processus géologiques, climatiques et environnementaux. Les étudiants acquièrent des compétences pour comprendre et gérer les ressources naturelles et les problèmes environnementaux.', '5', '50000', 'francais et anglais', 'Master', '32');
-- Ajout de la Faculté des Sciences Economiques et de Gestion (FSEG) de l'Université de Ngaoundéré
-- Commentaire : Ajout de la Faculté des Sciences Economiques et de Gestion (FSEG)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Sciences Economiques et de Gestion (FSEG)', null, null, null, '237 222 256 725', '5');
-- Ajout de la filière Sciences et Techniques de Gestion de la Faculté des Sciences Economiques et de Gestion (FSEG)
-- Commentaire : Ajout de la filière Sciences et Techniques de Gestion
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Sciences et Techniques de Gestion', 'La filière Sciences et Techniques de Gestion forme les étudiants aux principaux domaines de la gestion, de la comptabilité, du marketing, et de la finance. Les étudiants acquièrent des compétences polyvalentes pour évoluer dans le monde des affaires.', 3, 50000, 'francais et anglais', 'Master degre', '33');

-- Ajout de la filière Sciences Economiques de la Faculté des Sciences Economiques et de Gestion (FSEG)
-- Commentaire : Ajout de la filière Sciences Economiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Sciences Economiques', 'La filière Sciences Economiques offre une formation approfondie en économie, permettant aux étudiants de comprendre les mécanismes économiques, d’analyser les politiques économiques et d’appréhender les enjeux du monde économique.', 3, 50000, 'francais et anglais', 'Master degre', '33');
-- Ajout de la Faculté des Sciences Juridiques et Politiques (FSJP) à l'Université de Ngaoundéré
-- Commentaire : Ajout de la Faculté des Sciences Juridiques et Politiques (FSJP)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Sciences Juridiques et Politiques (FSJP)', null, null, null, null, '5');
-- Ajout de la filière Droit Fondamental à la Faculté des Sciences Juridiques et Politiques (FSJP)
-- Commentaire : Ajout de la filière Droit Fondamental
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Droit Fondamental', 'La filière Droit Fondamental permet aux étudiants d’acquérir une compréhension approfondie des principes et des fondements du droit. Elle explore les différentes branches du droit, offrant une perspective globale sur le système juridique.', '4', '50000', 'francais et anglais', 'Master degré', '34');
-- Ajout de la Faculté des Sciences de l’Education (FSE)
-- Commentaire : Ajout de la Faculté des Sciences de l’Education (FSE)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté des Sciences de l’Education (FSE)', null, null, null, null, '5');
-- Ajout de la filière "Droit Fondamental" à la Faculté des Sciences Juridiques et Politiques (FSJP)
-- Descriptif : Formation axée sur les fondements juridiques et les principes fondamentaux du droit. La durée est de 3 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Droit Fondamental" à la Faculté des Sciences Juridiques et Politiques (FSJP)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Droit Fondamental', 'Formation axée sur les fondements juridiques et les principes fondamentaux du droit. La durée est de 3 ans, le coût est de 50 mille. La langue d’enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 3, 50000, 'francais, anglais', 'Master degre', '33');

-- Ajout de la filière "Enseignements Fondamentaux en Education" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : Cette filière offre une formation approfondie sur les principes et les méthodologies des enseignements fondamentaux en éducation. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Enseignements Fondamentaux en Education" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Enseignements Fondamentaux en Education', 'Cette filière offre une formation approfondie sur les principes et les méthodologies des enseignements fondamentaux en éducation. La durée est de 5 ans, le coût est de 50 mille. La langue d’enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');

-- Ajout de la filière "Administration de l’Education" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : La filière "Administration de l’Education" forme des professionnels capables de gérer et administrer les institutions éducatives. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Administration de l’Education" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Administration de l’Education', 'La filière "Administration de l’Education" forme des professionnels capables de gérer et administrer les institutions éducatives. La durée est de 5 ans, le coût est de 50 mille. La langue d’enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');

-- Ajout de la filière "Mesure et Evaluation" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : La filière "Mesure et Evaluation" se focalise sur les méthodologies de mesure et d'évaluation des apprentissages et des performances éducatives. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Mesure et Evaluation" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Mesure et Evaluation', 'La filière "Mesure et Evaluation" se focalise sur les méthodologies de mesure et d''évaluation des apprentissages et des performances éducatives. La durée est de 5 ans, le coût est de 50 mille. La langue d''enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');

-- Ajout de la filière "Education Physique et Motricité" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : La filière "Education Physique et Motricité" forme des professionnels de l'éducation physique avec une expertise en motricité. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Education Physique et Motricité" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Education Physique et Motricité', 'La filière "Education Physique et Motricité" forme des professionnels de l''éducation physique avec une expertise en motricité. La durée est de 5 ans, le coût est de 50 mille. La langue d''enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');

-- Ajout de la filière "Animation Socio-Culturel et Loisir" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : La filière "Animation Socio-Culturel et Loisir" forme des professionnels capables d'animer et organiser des activités socio-culturelles et de loisirs. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Animation Socio-Culturel et Loisir" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Animation Socio-Culturel et Loisir', 'La filière "Animation Socio-Culturel et Loisir" forme des professionnels capables d''animer et organiser des activités socio-culturelles et de loisirs. La durée est de 5 ans, le coût est de 50 mille. La langue d''enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');

-- Ajout de la filière "Psychologie et Sciences de l’Orientation" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : La filière "Psychologie et Sciences de l’Orientation" offre une formation approfondie en psychologie et en orientation scolaire et professionnelle. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Psychologie et Sciences de l’Orientation" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Psychologie et Sciences de l’Orientation', 'La filière "Psychologie et Sciences de l’Orientation" offre une formation approfondie en psychologie et en orientation scolaire et professionnelle. La durée est de 5 ans, le coût est de 50 mille. La langue d''enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');

-- Ajout de la filière "Didactique des Disciplines" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : La filière "Didactique des Disciplines" forme des spécialistes de la didactique pour l'enseignement des différentes disciplines. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Didactique des Disciplines" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Didactique des Disciplines', 'La filière "Didactique des Disciplines" forme des spécialistes de la didactique pour l''enseignement des différentes disciplines. La durée est de 5 ans, le coût est de 50 mille. La langue d''enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');

-- Ajout de la filière "Education Spécialisée" à la Faculté des Sciences de l’Education (FSE)
-- Descriptif : La filière "Education Spécialisée" forme des professionnels pour l'éducation des personnes en situation de handicap. La durée est de 5 ans, le coût est de 50 mille. La langue d'enseignement est le français et l'anglais. Elle délivre un diplôme de Master degré.
-- Commentaire : Ajout de la filière "Education Spécialisée" à la Faculté des Sciences de l’Education (FSE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES
('Education Spécialisée', 'La filière "Education Spécialisée" forme des professionnels pour l''éducation des personnes en situation de handicap. La durée est de 5 ans, le coût est de 50 mille. La langue d''enseignement est le français et l''anglais. Elle délivre un diplôme de Master degré.', 5, 50000, 'francais, anglais', 'Master degre', '35');
-- Ajout de la Faculté de Médecine et de Sciences Biomédicales (FMSB) de Garoua à l'Université de Ngaoundéré
-- Descriptif : La Faculté de Médecine et de Sciences Biomédicales (FMSB) de Garoua offre une formation approfondie en médecine et sciences biomédicales. Elle vise à former des professionnels de la santé compétents.
-- Commentaire : Ajout de la Faculté de Médecine et de Sciences Biomédicales (FMSB) de Garoua à l'Université de Ngaoundéré
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES
('Faculté de Médecine et de Sciences Biomédicales (FMSB) de Ngaoundéré', null, null, null, null, 5);

-- Ajout de la filière "Radiologie et d’Imagerie Médicale"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Radiologie et d’Imagerie Médicale', 'Cette filière se concentre sur l’utilisation de techniques d’imagerie médicale pour diagnostiquer et traiter diverses conditions médicales. Les étudiants apprendront les principes de la radiologie et de l’imagerie médicale.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "D’ophtalmologie, d’ORL et de Stomatologie"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('D’ophtalmologie, d’ORL et de Stomatologie', 'Cette filière se concentre sur les maladies et les traitements liés aux yeux, aux oreilles, au nez, à la gorge et à la stomatologie. Les étudiants acquerront des compétences spécialisées dans ces domaines médicaux.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Gynécologie Obstétrique"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Gynécologie Obstétrique', 'Cette filière se concentre sur la santé reproductive des femmes, y compris la gestion des grossesses, des accouchements et des problèmes gynécologiques. Les étudiants seront formés pour travailler dans le domaine de la gynécologie et de l’obstétrique.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Microbiologie, Parasitologie, Hématologie et Maladies Infectieuses"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Microbiologie, Parasitologie, Hématologie et Maladies Infectieuses', 'Cette filière se concentre sur l’étude des micro-organismes, des parasites, des maladies du sang et des infections. Les étudiants apprendront à diagnostiquer et à traiter des maladies infectieuses.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Pédiatrie"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Pédiatrie', 'Cette filière se concentre sur la médecine des enfants et des adolescents. Les étudiants apprendront à diagnostiquer et à traiter les maladies pédiatriques, ainsi qu’à promouvoir la santé et le bien-être des enfants.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Santé Publique"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Santé Publique', 'Cette filière se concentre sur la promotion de la santé au niveau de la population. Les étudiants apprendront à concevoir et à mettre en œuvre des programmes de santé publique pour améliorer la santé globale d’une communauté.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Chirurgie et spécialites"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Chirurgie et spécialites', 'Cette filière se concentre sur l’étude et la pratique de la chirurgie générale et de spécialités chirurgicales. Les étudiants seront formés pour effectuer des interventions chirurgicales et traiter diverses conditions médicales.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Sciences Morphologiques et d’Anatomie Pathologique"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Morphologiques et d’Anatomie Pathologique', 'Cette filière se concentre sur l’étude des tissus, des organes et des anomalies anatomiques. Les étudiants apprendront à effectuer des analyses anatomiques et pathologiques pour diagnostiquer les maladies.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Sciences Physiologiques et de Biochimie"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Physiologiques et de Biochimie', 'Cette filière se concentre sur l’étude des processus physiologiques et biochimiques du corps humain. Les étudiants acquerront des connaissances approfondies sur le fonctionnement des organes et des systèmes biologiques.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Médecine et de Pharmacologie Traditionnelle"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Médecine et de Pharmacologie Traditionnelle', 'Cette filière combine les aspects de la médecine moderne avec l’étude des approches traditionnelles de guérison. Les étudiants apprendront à intégrer des méthodes de médecine conventionnelle et traditionnelle.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);

-- Ajout de la filière "Médecine et Spécialités"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Médecine et Spécialités', 'Cette filière offre une formation générale en médecine, avec la possibilité de se spécialiser dans divers domaines médicaux. Les étudiants suivront un programme complet couvrant les principales spécialités médicales.', 5, 50000, 'Français, Anglais', 'Licence, Master', 36);
-- Ajout de la faculté "Institut Universitaire de Technologie de Ngaoundéré (IUT)"
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Institut Universitaire de Technologie de Ngaoundéré (IUT)',
    'Les études à l’IUT de l’Université de Ngaoundéré sont sanctionnées par le Diplôme Universitaire de Technologie (DUT). En outre, l’IUT prépare au Brevet de Technicien Supérieur (BTS) dans différentes spécialités. L’IUT de Ngaoundéré a été créée le 19 Janvier 1993 par décret présidentiel N°010/CAB/PR.',
    'L’admission à l’IUT se fait par voie de concours sur épreuves écrites. Elle est ouverte aux candidats résidant au Cameroun, titulaires d’un Baccalauréat de série C, D, E, F ou d’un Brevet de Technicien dans les spécialités des Techniques Industrielles ou du GCE/AL obtenu dans deux au moins des matières suivantes : Mathématiques Pures, Mathématiques Appliquées, Physique, Chimie ou Biologie, ou de tout autre diplôme admis en équivalence. N.B : Les candidats résidant hors du Cameroun peuvent être admis sur titre par voie d’étude de dossiers.',
    'iutund@caramail.com / iutngaoundere@yahoo.fr',
    '(+237) 22 15 83 86 / 77 11 22 18 / 22 99 40 49',
    5
);
-- Ajout de la filière "Génie Biologique"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Biologique',
    'La filière de Génie Biologique à l’Institut Universitaire de Technologie de Ngaoundéré forme des techniciens supérieurs spécialisés dans l’application des sciences biologiques et des technologies associées. Les étudiants apprendront à utiliser des techniques avancées pour la manipulation et l’analyse des organismes vivants, contribuant ainsi à divers domaines tels que la santé, l’environnement et l’agroalimentaire.',
    5,
    50000,
    'Français, Anglais',
    'DUT, BTS',
    37
);

-- Ajout de la filière "Génie Industriel et Maintenance"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Industriel et Maintenance',
    'La filière de Génie Industriel et Maintenance à l’Institut Universitaire de Technologie de Ngaoundéré forme des professionnels capables de concevoir, mettre en œuvre et optimiser des systèmes de production industrielle. Les étudiants acquerront des compétences en gestion de la maintenance, en optimisation des processus et en gestion de la qualité, contribuant ainsi à l’efficacité opérationnelle des entreprises.',
    5,
    50000,
    'Français, Anglais',
    'DUT, BTS',
    37
);

-- Ajout de la filière "Génie Informatique"
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Informatique',
    'La filière de Génie Informatique à l’Institut Universitaire de Technologie de Ngaoundéré forme des professionnels spécialisés dans les technologies de l’information et de la communication. Les étudiants apprendront à concevoir, développer et gérer des systèmes informatiques, contribuant ainsi à répondre aux besoins croissants de la société en matière de technologie.',
    5,
    50000,
    'Français, Anglais',
    'DUT, BTS',
    37
);
-- Ajout de la faculté "Ecole Nationale Supérieure des Sciences Agro-Industrielles (ENSAI)"
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Ecole Nationale Supérieure des Sciences Agro-Industrielles (ENSAI)',
    NULL,
    NULL,
    'ensai.nqaoundere@yahoo.com',
    '(+237) 222 252 751 / (+237) 699 841 654',
    5
);
-- Ajout de la filière Industries Agricoles et Alimentaires
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Industries Agricoles et Alimentaires', 
        'La filière IAA forme des professionnels capables de concevoir, gérer et améliorer les processus de production dans les industries agricoles et alimentaires. Les étudiants acquièrent des connaissances approfondies sur la transformation des matières premières en produits alimentaires.', 
        3, 50000, 'Français, Anglais', 'Licence', 38);

-- Ajout de la filière Maintenance Industrielle et Productique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Maintenance Industrielle et Productique', 
        'La filière MIP forme des experts en maintenance industrielle, en mettant l''accent sur la planification, la prévention et la résolution des problèmes liés aux équipements de production. Les étudiants apprennent à assurer la disponibilité et la fiabilité des machines industrielles.', 
        3, 50000, 'Français, Anglais', 'Licence', 38);

-- Ajout de la filière Chimie Industrielle et Génie de l’Environnement
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Chimie Industrielle et Génie de l’Environnement', 
        'La filière CIGE forme des professionnels polyvalents dans le domaine de la chimie industrielle et de la préservation de l''environnement. Les étudiants acquièrent des compétences en gestion durable des ressources chimiques et en protection de l''environnement.', 
        3, 50000, 'Français, Anglais', 'Licence', 38);
-- Ajout de la filière Gestion et contrôle de la qualité
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Gestion et contrôle de la qualité', 
        'La filière Gestion et contrôle de la qualité forme des experts capables d''assurer la qualité des produits et services dans divers secteurs industriels. Les étudiants acquièrent des compétences en gestion de la qualité, contrôle statistique, et normes de certification.', 
        4, 50000, 'Français, Anglais', 'Master II professionnel', 38);

-- Ajout de la filière Nutrition appliquée
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Nutrition appliquée', 
        'La filière Nutrition appliquée forme des professionnels spécialisés dans l''application des principes de nutrition pour promouvoir la santé et prévenir les maladies. Les étudiants apprennent à concevoir des plans nutritionnels et à promouvoir de saines habitudes alimentaires.', 
        4, 50000, 'Français, Anglais', 'Master II professionnel', 38);

-- Ajout de la filière Sécurité Industrielle et Management de l’Environnement
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sécurité Industrielle et Management de l’Environnement', 
        'La filière SIMME forme des professionnels compétents dans la gestion de la sécurité industrielle et la préservation de l''environnement. Les étudiants acquièrent des compétences en gestion des risques, sécurité au travail et management environnemental.', 
        4, 50000, 'Français, Anglais', 'Master II professionnel', 38);

-- Ajout de la filière Maintenance et Gestion des systèmes Frigorifiques et Thermiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Maintenance et Gestion des systèmes Frigorifiques et Thermiques', 
        'La filière MG-SFT forme des experts en maintenance et gestion des systèmes frigorifiques et thermiques. Les étudiants apprennent à assurer la fiabilité et l''efficacité des systèmes de réfrigération et de chauffage.', 
        4, 50000, 'Français, Anglais', 'Master II professionnel', 38);
-- Ajout de la filière Génie Alimentaire et BioProcédés
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie Alimentaire et BioProcédés', 
        'La filière Génie Alimentaire et BioProcédés forme des ingénieurs spécialisés dans la conception, la production et la gestion des procédés alimentaires. Les étudiants acquièrent des compétences en biotechnologie, génie des procédés et gestion de la qualité alimentaire.', 
        4, 50000, 'Français, Anglais', 'Master recherche', 38);

-- Ajout de la filière Génie Chimique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie Chimique', 
        'La filière Génie Chimique forme des ingénieurs spécialisés dans la conception, la modélisation et la gestion des procédés chimiques. Les étudiants développent des compétences en génie des réactions chimiques, en conception d''installations et en contrôle de procédés.', 
        4, 50000, 'Français, Anglais', 'Master recherche', 38);

-- Ajout de la filière Sciences et Technologies Post-récoltes
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences et Technologies Post-récoltes', 
        'La filière Sciences et Technologies Post-récoltes forme des professionnels spécialisés dans la préservation et le traitement des produits agricoles après la récolte. Les étudiants acquièrent des compétences en gestion de la qualité, stockage et transformation des produits agricoles.', 
        4, 50000, 'Français, Anglais', 'Master recherche', 38);

-- Ajout de la filière Sciences Alimentaires et Nutrition
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Alimentaires et Nutrition', 
        'La filière Sciences Alimentaires et Nutrition forme des experts en sciences de l''alimentation et de la nutrition. Les étudiants apprennent à analyser les propriétés nutritionnelles des aliments, à concevoir des produits alimentaires et à promouvoir une alimentation saine.', 
        4, 50000, 'Français, Anglais', 'Master recherche', 38);

-- Ajout de la filière Chimie Industrielle et Environnement
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Chimie Industrielle et Environnement', 
        'La filière Chimie Industrielle et Environnement forme des chimistes spécialisés dans l''application des principes de la chimie industrielle tout en tenant compte des enjeux environnementaux. Les étudiants acquièrent des compétences en gestion des déchets, traitement de l''eau et chimie verte.', 
        4, 50000, 'Français, Anglais', 'Master recherche', 38);

-- Ajout de la filière Energétique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Energétique', 
        'La filière Energétique forme des ingénieurs spécialisés dans la gestion et la production d''énergie. Les étudiants acquièrent des compétences en conception de systèmes énergétiques, énergies renouvelables et efficacité énergétique.', 
        4, 50000, 'Français, Anglais', 'Master recherche', 38);

-- Ajout de la filière Mécanique et Productique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Mécanique et Productique', 
        'La filière Mécanique et Productique forme des ingénieurs spécialisés dans la conception, la fabrication et la gestion des systèmes mécaniques. Les étudiants développent des compétences en conception assistée par ordinateur, fabrication mécanique et gestion de la production.', 
        4, 50000, 'Français, Anglais', 'Master recherche', 38);
-- Ajout de la filière Génie des Procédés
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie des Procédés', 
        'La filière Génie des Procédés forme des ingénieurs spécialisés dans la conception, l’optimisation et la gestion des procédés industriels. Les étudiants acquièrent des compétences en génie chimique, en thermodynamique et en contrôle des procédés.', 
        7, 50000, 'Français, Anglais', 'Doctorat', 38);

-- Ajout de la filière Sciences des Aliments
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences des Aliments', 
        'La filière Sciences des Aliments forme des scientifiques spécialisés dans l’étude des propriétés physiques, chimiques et microbiologiques des aliments. Les étudiants apprennent à assurer la sécurité alimentaire, la qualité des produits alimentaires et l’innovation alimentaire.', 
        7, 50000, 'Français, Anglais', 'Doctorat', 38);

-- Ajout de la filière Nutrition
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Nutrition', 
        'La filière Nutrition forme des professionnels spécialisés dans l’étude des besoins nutritionnels, de l’alimentation équilibrée et de la santé. Les étudiants acquièrent des compétences en nutrition clinique, nutrition sportive et sécurité alimentaire.', 
        7, 50000, 'Français, Anglais', 'Doctorat', 38);

-- Ajout de la filière Chimie Industrielle
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Chimie Industrielle', 
        'La filière Chimie Industrielle forme des chimistes spécialisés dans l’application des principes de la chimie à des fins industrielles. Les étudiants développent des compétences en synthèse chimique, en analyse industrielle et en gestion des procédés chimiques.', 
        7, 50000, 'Français, Anglais', 'Doctorat', 38);
-- Ajout de la faculté Ecole des Sciences et de Médecine Vétérinaire (ESMV)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Ecole des Sciences et de Médecine Vétérinaire (ESMV)', 
        'Elle a été créée en 1993 par décret présidentiel n° 93/028 du 19 janvier 1993, portant organisation Administrative et Académique de l’Université de Ngaoundéré, et par Arrêté n° 07/0176/MINESUP du 30 octobre 2007, portant ouverture de l’Ecole des Sciences et de Médecine Vétérinaire de l’Université de Ngaoundéré. Objectifs - Formation des cadres de haut niveau en santé et productions animales ; - Appui au développement ; - Recyclage et perfectionnement des cadres en santé et productions animales.', 
        'Par concours et sur étude de dossier. Le diplôme requis est le Baccalauréat ou le GCE-Advanced Level. Les candidats admis sur étude de dossier sont tenus de s’acquitter de leurs droits universitaires d’un montant d’un million (1.000.000) FCFA, conformément au décret N° 93/033 du 19 janvier 1993, modifiant certaines dispositions du décret n0791186 du 17 mai 1979 fixant le taux de paiement des droits universitaires.', 
        'ecoleveterinaire@yahoo.fr', 
        NULL, 
        5);
-- Ajout de la filière Sciences Vétérinaires
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Vétérinaires', 
        'La filière Sciences Vétérinaires forme des professionnels de la santé animale. Les étudiants acquièrent des connaissances approfondies en médecine vétérinaire, pathologie animale, épidémiologie, et d’autres disciplines liées à la santé des animaux. Ils sont préparés à diagnostiquer, traiter et prévenir les maladies animales, contribuant ainsi à la santé globale de la faune et du bétail.', 
        3, 
        50000, 
        'Français, Anglais', 
        'Licence', 
        39);
-- Ajout de la faculté EGEM
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('École de Géologie et d’Exploitation Minière de Meiganga (EGEM)', 
        'Créée en 2011, l’EGEM est un établissement d’enseignement scientifique, technologique et professionnel. Elle a pour mission de former des ingénieurs spécialisés dans les domaines de la prospection, de l’exploration, de la production et de la transformation des matières premières minières, pétrolières et gazières. L’objectif est de fournir des ressources humaines qualifiées aux secteurs des industries extractives et de l’énergie, contribuant ainsi au développement industriel du Cameroun.', 
        'L’admission à l’EGEM se fait par voie de concours sur épreuves écrites. Les candidats doivent être titulaires d’un Baccalauréat C, D, E, F, CI ou TI, ou équivalent. Les candidats étrangers sont soumis aux mêmes conditions académiques que les candidats camerounais, avec des possibilités spécifiques pour les ressortissants des pays membres de la CEMAC.', 
        NULL, -- Email non fourni
        NULL, -- Téléphone non fourni
        5);    -- Université ID 5
-- Ajout des filières pour la faculté EGEM
-- Génie géologique minier : Géologie Minière et d’Exploration
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie géologique minier : Géologie Minière et d’Exploration',
        'Formation axée sur les principes et techniques de la géologie minière, avec un accent sur l’exploration des gisements minéraux. Les étudiants acquièrent des compétences en géologie, en cartographie géologique et en prospection minière.',
        5, -- Durée
        50000, -- Coût
        'Français, Anglais',
        'INGÉNIEUR DE CONCEPTION',
        40); -- Faculté ID

-- Génie géologique minier : Géostatistique Applicable à l’Industrie Minière
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie géologique minier : Géostatistique Applicable à l’Industrie Minière',
        'Cette filière se concentre sur l’application de la géostatistique dans l’industrie minière. Les étudiants apprennent à analyser et interpréter des données géologiques pour optimiser l’exploration et l’exploitation minière.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Génie géologique minier : Géophysique Appliquée à l’Exploration
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie géologique minier : Géophysique Appliquée à l’Exploration',
        'Cette filière met l’accent sur l’application de la géophysique dans le domaine de l’exploration minière. Les étudiants acquièrent des compétences en acquisition, traitement et interprétation des données géophysiques.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Cartographie géologique et géomatique : Géomatique Appliquée à l’Exploration et aux Mines
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Cartographie géologique et géomatique : Géomatique Appliquée à l’Exploration et aux Mines',
        'Cette filière combine la cartographie géologique et la géomatique pour fournir des compétences nécessaires à la gestion des données géologiques et à la création de cartes utiles dans le secteur minier.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Génie minier : Géotechnique et Exploration des Mines
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie minier : Géotechnique et Exploration des Mines',
        'Cette filière se concentre sur la géotechnique et l’exploration des mines, enseignant aux étudiants les principes de l’ingénierie géotechnique appliquée à l’industrie minière.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Génie minier : Exploitation Minière et Traitement des Minerais
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie minier : Exploitation Minière et Traitement des Minerais',
        'Cette filière forme les étudiants à l’exploitation minière durable et au traitement des minerais. Ils apprennent les techniques d’extraction et de traitement des minerais de manière responsable.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Génie de pétrole et gaz : Exploration Pétrolière et Gazière
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie de pétrole et gaz : Exploration Pétrolière et Gazière',
        'Cette filière se concentre sur les techniques d’exploration des réserves de pétrole et de gaz. Les étudiants apprennent les méthodes de prospection et d’évaluation des gisements.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Génie de pétrole et gaz : Forage et Production
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie de pétrole et gaz : Forage et Production',
        'Cette filière se concentre sur les techniques de forage et la production d’hydrocarbures. Les étudiants acquièrent des compétences dans la conception, le forage et la production pétrolière et gazière.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Génie de pétrole et gaz : Réservoir et Production
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie de pétrole et gaz : Réservoir et Production',
        'Cette filière se concentre sur la gestion des réservoirs pétroliers et gaziers, ainsi que sur les techniques de production. Les étudiants acquièrent des compétences pour maximiser l’extraction des hydrocarbures.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);

-- Management global RSE et développement durable : Qualité, Hygiène, Sécurité et Environnement Applicables à l’Industrie Minière, Pétrolière et Gazière
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Management global RSE et développement durable : Qualité, Hygiène, Sécurité et Environnement Applicables à l’Industrie Minière, Pétrolière et Gazière',
        'Cette filière forme des professionnels capables de gérer les aspects liés à la responsabilité sociale des entreprises (RSE) et au développement durable dans les industries minières, pétrolières et gazières.',
        5, 50000, 'Français, Anglais', 'INGÉNIEUR DE CONCEPTION', 40);
-- Ajout de la faculté EGCIM
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Ecole de Génie Chimique et des Industries Minérales (EGCIM)',
        NULL, -- Descriptif
        NULL, -- Condition d'admission
        NULL, -- Email
        NULL, -- Téléphone
        5);   -- Université ID
-- Ajout des filières
-- Filière : Sciences Chimiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Chimiques',
        'Cette filière offre une formation approfondie dans le domaine des sciences chimiques, couvrant divers aspects de la chimie théorique et appliquée.',
        5, -- Durée en ans
        50000, -- Cout en FCFA
        'Français, Anglais',
        'Master', -- Diplôme délivré
        41);    -- Faculté ID

-- Filière : Informatique et Génie Informatique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Informatique et Génie Informatique',
        'Cette filière forme des experts en informatique et génie informatique, dotés de compétences tant théoriques que pratiques pour répondre aux défis du monde numérique.',
        5, 50000, 'Français, Anglais', 'Master', 41);

-- Filière : Sciences de la vie /Sciences Biologiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences de la vie /Sciences Biologiques',
        'Cette filière explore les sciences de la vie, couvrant la biologie moléculaire, la génétique, l’écologie et d’autres domaines pour former des professionnels compétents.',
        5, 50000, 'Français, Anglais', 'Master', 41);

-- Filière : Biotechnologies et Ingénierie Biologique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Biotechnologies et Ingénierie Biologique',
        'Cette filière se concentre sur les applications des biotechnologies et de l’ingénierie biologique dans divers secteurs industriels, formant des spécialistes polyvalents.',
        5, 50000, 'Français, Anglais', 'Master', 41);

-- Filière : Géoscience
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Géoscience',
        'La filière de Géoscience aborde l’étude de la Terre, ses composants, et ses processus géologiques, formant des professionnels capables de comprendre et gérer les ressources naturelles.',
        5, 50000, 'Français, Anglais', 'Master', 41);

-- Filière : Génie Agro-Industriel et Agro-Alimentaire
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie Agro-Industriel et Agro-Alimentaire',
        'Cette filière forme des ingénieurs capables de concevoir, optimiser et gérer les processus de production agro-industrielle et agro-alimentaire, en intégrant les aspects technologiques et économiques.',
        5, 50000, 'Français, Anglais', 'Master', 41);

-- Filière : Génie Minier/Mining
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Génie Minier/Mining',
        'La filière de Génie Minier forme des experts en exploitation minière, en génie géologique et en gestion des ressources minérales, contribuant au développement durable de l’industrie minière.',
        5, 50000, 'Français, Anglais', 'Master', 41);
-- Ajout de la faculté
-- Faculté : Ecole Normale Supérieure de Bertoua
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Ecole Normale Supérieure de Bertoua',
        NULL, -- Descriptif (à compléter si nécessaire)
        NULL, -- Conditions d'admission (à compléter si nécessaire)
        NULL, -- Email (à compléter si nécessaire)
        NULL, -- Téléphone (à compléter si nécessaire)
        5);   -- Université ID

-- Commentaire : Ajout de la faculté Ecole Normale Supérieure de Bertoua
-- Ajout de la filière Espagnol
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Espagnol',
        'Formation approfondie en langue espagnole, incluant la littérature, la grammaire et la culture hispanique.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Espagnol

-- Ajout de la filière Italien
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Italien',
        'Formation approfondie en langue italienne, incluant la littérature, la grammaire et la culture italienne.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Italien

-- Ajout de la filière Français
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Français',
        'Formation approfondie en langue française, incluant la littérature, la grammaire et la culture francophone.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Français

-- Ajout de la filière Anglais
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Anglais',
        'Formation approfondie en langue anglaise, incluant la littérature, la grammaire et la culture anglophone.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Anglais

-- Ajout de la filière Lettres bilingues
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Lettres bilingues',
        'Formation en lettres bilingues, incluant l’étude approfondie de deux langues.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Lettres bilingues

-- Ajout de la filière Mathématiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Mathématiques',
        'Formation approfondie en mathématiques, incluant les différents domaines des mathématiques pures et appliquées.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Mathématiques

-- Ajout de la filière Informatique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Informatique',
        'Formation approfondie en informatique, incluant les domaines du développement logiciel, de l’intelligence artificielle et des systèmes d’information.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Informatique

-- Ajout de la filière Philosophie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Philosophie',
        'Formation approfondie en philosophie, incluant l’étude des grands courants de la pensée philosophique.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Philosophie

-- Ajout de la filière Sciences de la vie et de la terre
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences de la vie et de la terre',
        'Formation approfondie en sciences de la vie et de la terre, incluant la biologie, la géologie et l’écologie.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Sciences de la vie et de la terre

-- Ajout de la filière Chimie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Chimie',
        'Formation approfondie en chimie, incluant la chimie organique, inorganique et analytique.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Chimie

-- Ajout de la filière Sciences de l’Éducation
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences de l’Éducation',
        'Formation en sciences de l’éducation, incluant la pédagogie, la psychologie de l’éducation et la gestion éducative.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Sciences de l’Éducation

-- Ajout de la filière Conseillers d’Orientation
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Conseillers d’Orientation',
        'Formation pour devenir conseiller d’orientation, aidant les individus dans leurs choix de carrière.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Conseillers d’Orientation

-- Ajout de la filière Sciences physiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences physiques',
        'Formation approfondie en sciences physiques, incluant la physique, la chimie physique et les sciences des matériaux.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Sciences physiques

-- Ajout de la filière Géographie/éducation à la citoyenneté
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Géographie/éducation à la citoyenneté',
        'Formation combinant la géographie et l’éducation à la citoyenneté, préparant les étudiants à enseigner ces matières.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Géographie/éducation à la citoyenneté

-- Ajout de la filière Histoire
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Histoire',
        'Formation approfondie en histoire, incluant l’étude des événements passés et de leurs conséquences.',
        5, -- Durée : 5 ans
        50000, -- Coût : 50 000 FCFA
        'Français, Anglais', -- Langue d'enseignement
        'Master', -- Diplôme délivré : Master
        42); -- Faculté ID

-- Commentaire : Ajout de la filière Histoire
-- Ajout de l'université UNIVERSITE DE DSCHANG
INSERT INTO universite (nom, ville, descriptif, email, telephone, site_web)
VALUES ('UNIVERSITE DE DSCHANG',
        'Bambui, Belabo, Ebolowa, Maroua, Yaoundé-Nkolbisson, Bafia', 
        'L’Université de Dschang (UDs) fait partie des 08 universités d’Etat du Cameroun. 
         Créée à la faveur de la réforme universitaire 
         par le décret n° 93/026 du 19 janvier 1993, 
         elle hérite de l’ex Centre universitaire 
         de Dschang qui avait une vocation 
         essentiellement agro sylvo pastorale. A ce 
         jour, huit établissements y fonctionnent 
         effectivement.
         L’institution dispose de neuf campus dans 
         6 des 10 régions du pays, à savoir, des 
         antennes pédagogiques et de recherche 
         à Bambui (Nord-Ouest), Belabo (Est), 
         Ebolowa (Sud), Maroua (Extrême-Nord), Yaoundé-Nkolbisson (Centre), 
         Bafia (Centre). A l’Ouest, on a le campus 
         principal à Dschang et deux établissements 
         à Bandjoun et à Foumban.',
        'rectorat@univ-yaounde1.cm',
        '237 233 45 13 81',
        'https://www.univ-dschang.org');

-- Commentaire : Ajout de l'université UNIVERSITE DE DSCHANG
-- Ajout de la faculté Faculté des Lettres et Sciences Humaines (FALSH)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Faculté des Lettres et Sciences Humaines (FALSH)',
        null,
        null,
        null,
        null,
        6);

-- Commentaire : Ajout de la faculté Faculté des Lettres et Sciences Humaines (FALSH)
-- Ajout de la filière Modern English Letters (MEL)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Modern English Letters (MEL)',
        'Filière axée sur l’étude approfondie de la langue anglaise et de la littérature anglaise moderne.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Modern English Letters (MEL)

-- Ajout de la filière Lettre bilingue
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Lettre bilingue',
        'Filière axée sur l’étude de la littérature et de la langue dans un contexte bilingue.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Lettre bilingue

-- Ajout de la filière Filière Lettres d’Expression Française (LEF)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Filière Lettres d’Expression Française (LEF)',
        'Filière mettant l’accent sur l’expression écrite et orale en langue française.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Filière Lettres d’Expression Française (LEF)

-- Ajout de la filière Lettres Trilingues (Français, Anglais, Allemand)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Lettres Trilingues (Français, Anglais, Allemand)',
        'Filière mettant l’accent sur l’étude des langues française, anglaise et allemande.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Lettres Trilingues (Français, Anglais, Allemand)

-- Ajout de la filière (Trilingue Espagnol, Italien)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Trilingue Espagnol, Italien',
        'Filière trilingue mettant l’accent sur l’étude des langues espagnole, italienne et française.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Trilingue Espagnol, Italien

-- Ajout de la filière Géographie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Géographie',
        'Filière axée sur l’étude de la géographie physique et humaine.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Géographie

-- Ajout de la filière Histoire
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Histoire',
        'Filière axée sur l’étude de l’histoire des civilisations, des événements et des personnages historiques.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Histoire

-- Ajout de la filière Philosophie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Philosophie',
        'Filière centrée sur l’étude des grandes questions philosophiques, des doctrines et des courants de pensée.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Philosophie

-- Ajout de la filière Psychologie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Psychologie',
        'Filière consacrée à l’étude du comportement humain, des processus mentaux et des troubles psychologiques.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Psychologie

-- Ajout de la filière Sociologie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sociologie',
        'Filière axée sur l’étude des structures sociales, des relations et des phénomènes sociaux.',
        5,
        50000,
        'Français, Anglais',
        'Master',
        43);

-- Commentaire : Ajout de la filière Sociologie
-- Ajout de la faculté Faculté des Sciences Économiques et de Gestion (FSEG)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Faculté des Sciences Économiques et de Gestion (FSEG)',
        NULL,
        NULL,
        NULL,
        NULL,
        6);

-- Commentaire : Ajout de la faculté Faculté des Sciences Économiques et de Gestion (FSEG)
-- Ajout de la filière Sciences Économiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences Économiques',
        'La filière Sciences Économiques offre une formation approfondie dans le domaine de l’économie, permettant aux étudiants d’acquérir des connaissances théoriques et pratiques pour comprendre les mécanismes économiques et analyser les phénomènes sociaux liés à l’économie.',
        3,
        50000,
        'Français, Anglais',
        'Master',
        44);

-- Commentaire : Ajout de la filière Sciences Économiques

-- Ajout de la filière Sciences de Gestion
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences de Gestion',
        'La filière Sciences de Gestion offre une formation complète en gestion d’entreprise, préparant les étudiants à comprendre les aspects organisationnels, financiers et stratégiques nécessaires pour diriger et gérer efficacement une entreprise.',
        3,
        50000,
        'Français, Anglais',
        'Master',
        44);

-- Commentaire : Ajout de la filière Sciences de Gestion
-- Ajout de la faculté des Sciences Juridiques et Politiques (FSJP)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Faculté des Sciences Juridiques et Politiques (FSJP)',
        NULL, -- Descriptif non spécifié
        NULL, -- Condition d'admission non spécifiée
        NULL, -- Email non spécifié
        NULL, -- Téléphone non spécifié
        6);

-- Commentaire : Ajout de la faculté des Sciences Juridiques et Politiques (FSJP)
-- Ajout de la filière Sciences juridiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences juridiques',
        'La filière Sciences juridiques propose une formation approfondie en droit, couvrant divers domaines tels que le droit civil, le droit pénal, le droit administratif, etc. Les étudiants acquièrent des connaissances juridiques solides et développent des compétences analytiques essentielles pour comprendre et appliquer le droit dans différentes situations.',
        3,
        50000,
        'Français, Anglais',
        'Master',
        45);

-- Commentaire : Ajout de la filière Sciences juridiques

-- Ajout de la filière Sciences politiques
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('Sciences politiques',
        'La filière Sciences politiques offre une formation approfondie en sciences politiques, étudiant les systèmes politiques, les théories politiques, la gouvernance et les relations internationales. Les étudiants acquièrent une compréhension critique des processus politiques et développent des compétences analytiques nécessaires pour évaluer les structures politiques et les politiques publiques.',
        3,
        50000,
        'Français, Anglais',
        'Master',
        45);

-- Commentaire : Ajout de la filière Sciences politiques
-- Ajout de la faculté Faculté des Sciences (FS)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES ('Faculté des Sciences (FS)',
        NULL,
        NULL,
        NULL,
        NULL,
        6);
-- Ajout des filières de la Faculté des Sciences (FS)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Biologie Animale', 'Cette filière explore le règne animal, allant des aspects cellulaires aux comportements complexes. Les étudiants acquièrent des connaissances approfondies sur la biologie des organismes animaux.', 3, 50000, 'Français, Anglais', 'Licence', 46),

  ('Biologie Végétale', 'Cette filière se concentre sur l’étude des plantes, de leur structure à leur physiologie. Les étudiants développent des compétences en botanique et en écologie végétale.', 3, 50000, 'Français, Anglais', 'Licence', 46),

  ('Biochimie', 'La filière de Biochimie explore les aspects moléculaires des organismes vivants, mettant l’accent sur les processus chimiques au niveau cellulaire. Les étudiants apprennent les mécanismes biochimiques fondamentaux.', 3, 50000, 'Français, Anglais', 'Licence', 46),

  ('Chimie', 'Cette filière offre une compréhension approfondie des principes chimiques et de leurs applications. Les étudiants développent des compétences en analyse chimique et en synthèse.', 3, 50000, 'Français, Anglais', 'Licence', 46),

  ('Mathématiques Informatique', 'La filière de Mathématiques Informatique combine les domaines des mathématiques pures et de l’informatique. Les étudiants acquièrent des compétences en résolution de problèmes et en programmation.', 3, 50000, 'Français, Anglais', 'Licence', 46),

  ('Sciences de la santé', 'Cette filière offre une formation multidisciplinaire en sciences de la santé, couvrant des aspects tels que la physiologie, la pathologie et les soins de santé. Les étudiants sont préparés à des carrières dans le domaine médical.', 3, 50000, 'Français, Anglais', 'Licence', 46);

-- Commentaire : Ajout des filières de la Faculté des Sciences (FS)-- Ajout de la Faculté d’Agronomie et des Sciences Agricoles (FASA)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Faculté d’Agronomie et des Sciences Agricoles (FASA)',
    'La Faculté d’Agronomie et des Sciences Agricoles dispose d’un campus principal à Dschang, et des Antennes à : BAMBUI dans la Région du Nord-Ouest, BELABO dans la Région de L’Est, EBOLWA dans la Région du Sud, NKOLBISSON-YAOUNDE dans la région du Centre, MAROUA dans la Région de l’Extrême Nord. Les sciences du sol (fertilité, cartographie, classification, pollution, etc) La gestion forestière et la problématique de l’environnement La mécanisation et l’amélioration de la production rurale (énergie, hydraulique, conservation/transformation des produits agricoles, etc.) L’économie rurale La vulgarisation agricole et sociologie rurale. Les grands pôles de compétences sont: Les productions animales L’agriculture La protection des végétaux (entomologie, phytopathologie, etc.)',
    'Le concours commun d’entrée en première année du cycle d’Ingénieurs : Filière Agronomie et Foresterie, Campus de Dschang, Filière professionnelle des métiers du bois, de l’eau et de l’environnement, Antenne d’Ebolowa. Les concours spéciaux d’entrée aux niveaux II, III, IV du cycle d’ingénieurs. Sont éligibles : Les Camerounais de deux sexes, Les candidats ressortissants des pays de la CEMAC ayant ratifié les textes relatifs au traitement national des étudiants justifiant des qualifications requises, Les candidats ressortissants des autres pays qui ne participent pas au concours mais bénéficiaires d’une bourse peuvent être admis sous étude de dossier. Diplômes requis: Bac C, D, et GCE advance level ou tout autre diplôme reconnu équivalent',
    null,
    null,
    6
);
-- Commentaire : Ajout de la Faculté d’Agronomie et des Sciences Agricoles (FASA)
-- Ajout des filières de la Faculté des Sciences Agronomiques et Agricoles (FSAA)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Agronomie', 'La filière d’Agronomie forme des professionnels dans le domaine de la production agricole. Les étudiants acquièrent des connaissances en sciences agricoles, en gestion des cultures et des sols, ainsi qu’en technologies agricoles modernes.', 5, 50000, 'Français, Anglais', 'Master', 47),

  ('Sciences agricoles', 'Cette filière englobe divers aspects des sciences agricoles, y compris la biologie végétale, la zoologie, la génétique, la gestion des ressources naturelles et la technologie agricole. Les étudiants obtiennent une compréhension globale du secteur agricole.', 5, 50000, 'Français, Anglais', 'Master', 47);

-- Commentaire : Ajout des filières de la Faculté des Sciences Agronomiques et Agricoles (FSAA)
-- Ajout de la Faculté de Médecine et des Sciences Pharmaceutiques (FMSP)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES 
  ('Faculté de Médecine et des Sciences Pharmaceutiques (FMSP)', null, null, null, null, 6);

-- Commentaire : Ajout de la Faculté de Médecine et des Sciences Pharmaceutiques (FMSP)
-- Ajout de la filière Médecine
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Médecine', 'La filière de Médecine forme des professionnels de la santé compétents pour la pratique médicale. Les étudiants acquièrent des connaissances approfondies en sciences médicales et développent des compétences cliniques essentielles.', 5, 50000, 'Français, Anglais', 'Master', 48);

-- Commentaire : Ajout de la filière Médecine

-- Ajout de la filière Pharmacie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Pharmacie', 'La filière de Pharmacie forme des pharmaciens experts dans la dispensation de médicaments, la gestion pharmaceutique, et la promotion de la santé. Les étudiants acquièrent des connaissances approfondies en pharmacologie et en pratiques pharmaceutiques.', 5, 50000, 'Français, Anglais', 'Master', 48);

-- Commentaire : Ajout de la filière Pharmacie

-- Ajout de la filière Kinésithérapie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Kinésithérapie', 'La filière de Kinésithérapie forme des kinésithérapeutes spécialisés dans la rééducation physique. Les étudiants développent des compétences pratiques et théoriques pour traiter les troubles musculo-squelettiques et neurologiques.', 5, 50000, 'Français, Anglais', 'Master', 48);

-- Commentaire : Ajout de la filière Kinésithérapie
-- Ajout de la faculté Institut des Beaux-Arts de Foumban (IBAF)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES 
  ('Institut des Beaux-Arts de Foumban (IBAF)', NULL, NULL, NULL, NULL, 6);

-- Commentaire : Ajout de la faculté Institut des Beaux-Arts de Foumban (IBAF)
-- Ajout de la filière ARTS PLASTIQUES
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('ARTS PLASTIQUES', 'Formation approfondie en arts plastiques, incluant des cours pratiques et théoriques sur diverses techniques artistiques et mouvements artistiques.', 5, 50000, 'Français, Anglais', 'Master', 49);

-- Commentaire : Ajout de la filière ARTS PLASTIQUES

-- Ajout de la filière HISTOIRE DE L’ART
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('HISTOIRE DE L’ART', 'Étude approfondie de l’évolution de l’art à travers les époques, y compris les mouvements artistiques, les artistes influents et les tendances culturelles.', 5, 50000, 'Français, Anglais', 'Master', 49);

-- Commentaire : Ajout de la filière HISTOIRE DE L’ART

-- Ajout de la filière ARTS DECORATIFS
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('ARTS DECORATIFS', 'Formation axée sur la création d’objets décoratifs, en mettant l’accent sur les techniques artisanales et les tendances esthétiques contemporaines.', 5, 50000, 'Français, Anglais', 'Master', 49);

-- Commentaire : Ajout de la filière ARTS DECORATIFS

-- Ajout de la filière ARTS DE SPECTACLE
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('ARTS DE SPECTACLE', 'Formation complète sur les arts du spectacle, y compris le théâtre, la danse, et les arts de la scène en général, avec un équilibre entre pratique et théorie.', 5, 50000, 'Français, Anglais', 'Master', 49);

-- Commentaire : Ajout de la filière ARTS DE SPECTACLE

-- Ajout de la filière ART TECHNOLOGIQUE ET PATRIMOINE
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('ART TECHNOLOGIQUE ET PATRIMOINE', 'Formation sur la préservation du patrimoine artistique, en intégrant des aspects technologiques et les défis contemporains de conservation.', 5, 50000, 'Français, Anglais', 'Master', 49);

-- Commentaire : Ajout de la filière ART TECHNOLOGIQUE ET PATRIMOINE

-- Ajout de la filière ARCHITECTURE ET ART DE L’INGENIEUR
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('ARCHITECTURE ET ART DE L’INGENIEUR', 'Formation combinant les principes architecturaux avec les compétences techniques de l’ingénierie, en mettant l’accent sur la conception créative.', 5, 50000, 'Français, Anglais', 'Master', 49);

-- Commentaire : Ajout de la filière ARCHITECTURE ET ART DE L’INGENIEUR
-- Ajout de la faculté Institut Universitaire de Technologie Fotso Victor de Bandjoun (IUT)
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES 
  ('Institut Universitaire de Technologie Fotso Victor de Bandjoun (IUT)', 
   'L’IUT / FV forme des Techniciens, des Cadres et professionnels dans trois cycles de formation: BTS, DUT, et Licence Technologique.', 
   NULL, 
   NULL, 
   NULL, 
   6);

-- Commentaire : Ajout de la faculté Institut Universitaire de Technologie Fotso Victor de Bandjoun (IUT)
-- Ajout des filières pour la faculté avec l'ID 50
-- Génie informatique et réseaux (GIR)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Génie informatique et réseaux (GIR)', 
   'Formation axée sur l’informatique, les réseaux et les systèmes d’information. Les étudiants acquièrent des compétences en programmation, en administration réseau et en gestion des systèmes informatiques.', 
   3, 
   50000, 
   'Français, Anglais', 
   'Licence', 
   50);

-- Commentaire : Ajout de la filière Génie informatique et réseaux (GIR)

-- Génie électrique (GE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Génie électrique (GE)', 
   'Formation centrée sur l’électricité, l’électronique et les systèmes électriques. Les étudiants acquièrent des compétences en conception, installation et maintenance des systèmes électriques.', 
   3, 
   50000, 
   'Français, Anglais', 
   'Licence', 
   50);

-- Commentaire : Ajout de la filière Génie électrique (GE)

-- Génie télécommunication et réseaux (GTR)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Génie télécommunication et réseaux (GTR)', 
   'Formation axée sur les télécommunications, les réseaux de communication et les technologies associées. Les étudiants développent des compétences en conception, installation et gestion des réseaux de communication.', 
   3, 
   50000, 
   'Français, Anglais', 
   'Licence', 
   50);

-- Commentaire : Ajout de la filière Génie télécommunication et réseaux (GTR)

-- Génie civil (GCI)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Génie civil (GCI)', 
   'Formation portant sur la conception, la construction et la maintenance d’infrastructures civiles. Les étudiants acquièrent des compétences en génie civil, en construction et en gestion de projets.', 
   3, 
   50000, 
   'Français, Anglais', 
   'Licence', 
   50);

-- Commentaire : Ajout de la filière Génie civil (GCI)

-- Génie mécanique et productique (GRP)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Génie mécanique et productique (GRP)', 
   'Formation axée sur la mécanique, la conception de produits et les procédés de fabrication. Les étudiants développent des compétences en conception mécanique et en gestion de la production.', 
   3, 
   50000, 
   'Français, Anglais', 
   'Licence', 
   50);

-- Commentaire : Ajout de la filière Génie mécanique et productique (GRP)

-- Génie thermique, énergie et environnement (GTE)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Génie thermique, énergie et environnement (GTE)', 
   'Formation axée sur le génie thermique, les systèmes énergétiques et la gestion de l’environnement. Les étudiants acquièrent des compétences en thermique, énergétique et en gestion environnementale.', 
   3, 
   50000, 
   'Français, Anglais', 
   'Licence', 
   50);

-- Commentaire : Ajout de la filière Génie thermique, énergie et environnement (GTE)

-- Gestion comptable et financière (GCF)
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
  ('Gestion comptable et financière (GCF)', 
   'Formation axée sur la comptabilité, la finance et la gestion d’entreprise. Les étudiants développent des compétences en comptabilité, en analyse financière et en gestion budgétaire.', 
   3, 
   50000, 
   'Français, Anglais', 
   'Licence', 
   50);

-- Commentaire : Ajout de la filière Gestion comptable et financière (GCF)
 -- Création de la table centre_interet
CREATE TABLE centre_interet (
    Id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    Filieres_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (Filieres_id) REFERENCES filieres(Filieres_id)
);
-- Commentaire : Table pour stocker les centres d'intérêt liés aux filières
-- Ajout des centres d'intérêt pour la filière avec l'id 1
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Anthropologie', 1),
    ('Cultures et traditions du monde', 1),
    ('Origines de l''humanité', 1),
    ('Diversité ethnique', 1),
    ('Comportements sociaux', 1);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 1
-- Ajout des centres d'intérêt pour la filière avec l'id 2
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Archéologie et gestion du patrimoine', 2),
    ('Histoire ancienne', 2),
    ('Civilisations disparues', 2),
    ('Conservation des vestiges', 2),
    ('Gestion culturelle', 2);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 2
-- Ajout des centres d'intérêt pour la filière avec l'id 3
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Arts plastiques et histoire de l''art', 3),
    ('Beaux-arts', 3),
    ('Peinture', 3),
    ('Sculpture', 3),
    ('Mouvements artistiques', 3),
    ('Analyse d''œuvres', 3),
    ('Créativité', 3);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 3
-- Ajout des centres d'intérêt pour la filière avec l'id 4
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Arts du spectacle et cinématographique', 4),
    ('Cinéma', 4),
    ('Théâtre', 4),
    ('Danse', 4),
    ('Divertissement', 4);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 4
-- Ajout des centres d'intérêt pour la filière avec l'id 5
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Études bilingues', 5),
    ('Langues étrangères', 5),
    ('Cultures étrangères', 5),
    ('Communication interculturelle', 5),
    ('Traduction/Interprétation', 5);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 5
-- Ajout des centres d'intérêt pour la filière avec l'id 7
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Anglais', 7),
    ('Langue anglaise', 7),
    ('Littérature anglophone', 7),
    ('Civilisations anglophones', 7);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 7
-- Ajout des centres d'intérêt pour la filière avec l'id 8
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Géographie', 8),
    ('Environnements naturels', 8),
    ('Cultures du monde', 8),
    ('Voyages', 8),
    ('Développement durable', 8);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 8
-- Ajout des centres d'intérêt pour la filière avec l'id 9
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Histoire', 9),
    ('Civilisations anciennes', 9),
    ('Évènements historiques', 9),
    ('Personnages marquants', 9),
    ('Patrimoine historique', 9);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 9
-- Ajout des centres d'intérêt pour la filière avec l'id 10
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Langues', 10),
    ('Littératures', 10),
    ('Civilisations', 10);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 10
-- Ajout des centres d'intérêt pour la filière avec l'id 12
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Littérature française', 12),
    ('Analyse littéraire', 12),
    ('Écrivains français', 12),
    ('Langue française', 12);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 12
-- Ajout des centres d'intérêt pour la filière avec l'id 13
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Théories linguistiques', 13),
    ('Langues du monde', 13),
    ('Traduction', 13),
    ('Enseignement des langues', 13);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 13
-- Ajout des centres d'intérêt pour la filière avec l'id 14
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Langues africaines', 14),
    ('Cultures africaines', 14);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 14
-- Ajout des centres d'intérêt pour la filière avec l'id 15
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Littératures africaines', 15),
    ('Traditions africaines', 15),
    ('Histoire africaine', 15);
-- Commentaire : Ajout des centres d'intérêt pour la filière avec l'id 15
-- Ajout du centre d'intérêt pour la filière avec l'id 16
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Philosophie', 16),
    ('Pensée critique', 16),
    ('Éthique et morale', 16);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 16
-- Ajout du centre d'intérêt pour la filière avec l'id 17
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Psychologie', 17),
    ('Comportement humain', 17),
    ('Développement personnel', 17),
    ('Troubles mentaux', 17),
    ('Psychothérapies', 17);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 17
-- Ajout du centre d'intérêt pour la filière avec l'id 17
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Sociologie', 18),
    ('Cultures et sociétés', 18);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 18
-- Ajout du centre d'intérêt pour la filière avec l'id 19
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Sciences du langage', 19),
    ('Linguistique', 19),
    ('Acquisition du langage', 19);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 19
-- Ajout du centre d'intérêt pour la filière avec l'id 20
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Chimie', 20),
    ('Applications industrielles', 20);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 20
-- Ajout du centre d'intérêt pour la filière avec l'id 21
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Biosciences', 21),
    ('Microbiologie', 21),
    ('Biologie animale', 21),
    ('Biologie végétale', 21),
    ('Biochimie', 21);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 21
-- Ajout du centre d'intérêt pour la filière avec l'id 23
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Informatique', 23),
    ('Programmation', 23),
    ('Développement d''applications', 23),
    ('Intelligence artificielle', 23),
    ('Nouvelles technologies', 23);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 23
-- Ajout du centre d'intérêt pour la filière avec l'id 24
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Mathématiques', 24),
    ('Calculs et statistiques', 24),
    ('Logique et raisonnement', 24),
    ('Cryptographie', 24);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 24
-- Ajout du centre d'intérêt pour la filière avec l'id 25
INSERT INTO centre_interet (nom, Filieres_id) VALUES
    ('Physique', 25),
    ('Mécanique', 25),
    ('Optique', 25),
    ('Électromagnétisme', 25);
-- Commentaire : Ajout du centre d'intérêt pour la filière avec l'id 25

-- Création de la table Bourse_Etude
CREATE TABLE Bourse_Etude (
    Id_Bourse SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Date_limite DATE,
    Niveau VARCHAR(255),
    Finance VARCHAR(255),
    Ouvert_pour VARCHAR(255),
    Pays VARCHAR(255),
    Statut VARCHAR(255),
    Description TEXT,
    Etablissements_Hotes TEXT,
    Programme_eligible TEXT,
    Nombre_Bourse VARCHAR(255),
    Duree VARCHAR(255),
    Groupe_Cible VARCHAR(255),
    Avantages_Bourse TEXT,
    Critères_eligibilite TEXT,
    Comment_Postuler TEXT,
    Page_officielle VARCHAR(255),
    image_url VARCHAR(255)
);

-- Commentaire : Table pour stocker les informations sur les bourses d'études
-- Création de la table Administrateur
CREATE TABLE Administrateur (
    Id_Admin SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Mail VARCHAR(255),
    Mot_de_passe VARCHAR(255),
    Telephone VARCHAR(20),
    Derniere_Connexion TIMESTAMP,
    photo_de_profil VARCHAR(255)
);

-- Commentaire : Table pour stocker les informations sur les administrateurs
-- Création de la table Utilisateur
CREATE TABLE Utilisateur (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    Niveau VARCHAR(50),
    Genre VARCHAR(10),
    Date_de_Naissance DATE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    Telephone VARCHAR(20),
    photo_de_profil VARCHAR(255),
    Dernier_Diplome VARCHAR(255),
    Serie VARCHAR(50),
    is_staff BOOLEAN,
    is_superuser BOOLEAN,
    is_active BOOLEAN,
    last_login TIMESTAMP,
    date_joined TIMESTAMP,
    Date_Inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Commentaire : Table pour stocker les informations sur les utilisateurs
-- Création de la table Témoignage
CREATE TABLE Temoignage (
    Id_Temoignage SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Telephone VARCHAR(20),
    Contenu TEXT,
    photo VARCHAR(255),
    Profession VARCHAR(255)
);

-- Commentaire : Table pour stocker les témoignages
-- Création de la table Metiers
CREATE TABLE Metiers (
    Id_Metiers SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Description TEXT,
    EntreprisesRecrutent TEXT,
    SalaireMoyen TEXT,
    CompetencesCles TEXT,
    image_url VARCHAR(255)
);

-- Commentaire : Table pour stocker les informations sur les métiers
-- Ajout de la colonne Filiere_id comme clé étrangère dans la table Metiers
ALTER TABLE Metiers
ADD COLUMN Filieres_id INT,
ADD CONSTRAINT FK_Metiers_Filieres
    FOREIGN KEY (Filieres_id) REFERENCES filieres(Filieres_id);

-- Commentaire : Ajout d'une clé étrangère pour lier les métiers à une filière
-- Mise à jour de la valeur de la colonne diplome_delivre
UPDATE Filieres
SET diplome_delivre = 'Licence, Master',
       Langue_enseignement = 'Français, Anglais'
WHERE diplome_delivre = 'Master degre';

-- Commentaire : Modification de la valeur du diplôme délivré de "Master degre" à "Licence, Master"
-- Mise à jour de la valeur de la colonne diplome_delivre
UPDATE Filieres
SET diplome_delivre = 'Licence, Master'
WHERE diplome_delivre = 'Master';

-- Commentaire : Modification de la valeur du diplôme délivré de "Master" à "Licence, Master"

-- Mise à jour des informations dans la table faculte
UPDATE faculte
SET descriptif = 'La Faculté des Lettres et Sciences Humaines (FLSH) de l’Université de Douala se dresse comme une forteresse de savoir au cœur de la ville dynamique de Douala. Avec une histoire riche et une réputation qui la précède, la FLSH s’affirme comme un bastion académique, propulsant les étudiants vers l’excellence intellectuelle. La FLSH offre un large éventail de programmes académiques, allant des langues classiques à la philosophie, en passant par les sciences sociales. Chaque département est méticuleusement conçu pour offrir une approche holistique de l’éducation, garantissant que les étudiants explorent divers domaines dans leur quête de connaissance.',
    condition_admission = 'Titulaire du Bacc ou GCE A/L Cycle Licence'
WHERE faculte_id = 14;

-- Commentaire : Mise à jour des informations de la Faculté des Lettres et Sciences Humaines (FLSH) de l'Université de Douala
-- Ajout de la filiere Arts du Spectacle et Cinématographie
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Arts du Spectacle et Cinématographie',
    'La filière Arts du Spectacle et Cinématographie forme des professionnels du domaine artistique et cinématographique. Les étudiants explorent les différentes formes d’expression artistique, y compris le théâtre, la danse, le cinéma et d’autres formes de spectacle. Le programme met l’accent sur la compréhension théorique, la pratique artistique et les compétences techniques nécessaires dans le monde du spectacle et du cinéma.',
    5,
    50000.00,
    'Français, Anglais',
    'Licence, Master',
    14
);

-- Commentaire : Ajout de la filiere Arts du Spectacle et Cinématographie
-- Modification de la faculté des Sciences (FS)
UPDATE faculte
SET
    descriptif = 'Au cœur de l’effervescente ville de Douala, la Faculté des Sciences (FS) de l’Université de Douala se distingue comme un bastion du savoir scientifique, façonnant l’avenir par le biais de l’éducation et de la recherche. Embarquez pour un voyage captivant à travers les couloirs du progrès scientifique avec la FS. La FS propose une gamme diversifiée de programmes, de la biologie à la physique, en passant par la chimie et les sciences de l’environnement. Chaque département est conçu pour offrir une formation complète, intégrant théorie et pratique.',
    condition_admission = 'Etre titulaire d’un bac Scientifique'
WHERE faculte_id = 15;

-- Commentaire : Modification de la faculté des Sciences (FS)
-- Modification de la Faculté des Sciences Économiques et de Gestion Appliquées (FSEGA)
UPDATE faculte
SET
    descriptif = 'La Faculté des Sciences Économiques et de Gestion Appliquées (FSEGA) de l’Université de Douala se distingue comme un bastion de connaissances économiques et de compétences managériales de premier plan. Au cœur de l’éducation supérieure, la FSEGA incarne l’esprit d’innovation et de compréhension approfondie des dynamiques économiques mondiales. La FSEGA propose une variété de programmes académiques, couvrant une gamme étendue de disciplines, de l’économie à la gestion, en passant par la finance. Chaque département est structuré de manière à offrir une formation approfondie, mettant l’accent sur l’acquisition de compétences pratiques et la compréhension des concepts économiques et des principes de gestion.',
    condition_admission = 'Titulaire du Bacc ou GCE A/L Cycle Licence'
WHERE faculte_id = 16;

-- Commentaire : Modification de la Faculté des Sciences Économiques et de Gestion Appliquées (FSEGA)
-- Modification de la durée des filières pour la faculté ayant l'ID 16
UPDATE filieres
SET duree = 5
WHERE faculte_id = 16;

-- Commentaire : Modification de la durée des filières pour la faculté ayant l'ID 16
-- Modification des informations pour la faculté ayant l'ID 17
UPDATE faculte
SET descriptif = 'La Faculté des Sciences Juridiques et Politiques (FSJP) de l’Université de Douala se dresse comme une forteresse intellectuelle, où la justice et la gouvernance prennent vie. Ancrée dans l’héritage de l’éducation juridique et politique, la FSJP s’impose comme une institution incontournable formant la prochaine génération de leaders juridiques et politiques. La FSJP propose une gamme de programmes académiques allant du droit à la science politique, couvrant tous les aspects cruciaux de la justice et de la gouvernance. Chaque département offre un parcours pédagogique rigoureux, mettant l’accent sur la compréhension des lois, des principes politiques et des enjeux sociaux.',
    condition_admission = 'Titulaire du Bacc ou GCE A/L Cycle Licence'
WHERE faculte_id = 17;

-- Commentaire : Modification des informations pour la faculté ayant l'ID 17
-- Ajout des informations pour la filière Droit
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Droit',
    'La filière de Droit offre une formation approfondie dans les domaines juridiques, couvrant divers aspects du système légal et de la justice. Les étudiants acquièrent des connaissances théoriques solides et développent des compétences pratiques essentielles pour évoluer dans le monde juridique.',
    5,
    50000.00,
    'Français, Anglais',
    'Licence, Master',
    14
);

-- Commentaire : Ajout de la filière Droit

-- Ajout des informations pour la filière English Law
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'English Law',
    'La filière English Law propose un programme exclusivement en anglais, offrant aux étudiants une immersion complète dans le système juridique anglais. Cette filière prépare les étudiants à comprendre et à pratiquer le droit en anglais, ouvrant des opportunités internationales.',
    5,
    50000.00,
    'Anglais',
    'Licence, Master',
    14
);

-- Commentaire : Ajout de la filière English Law
-- Modification des informations pour la filière Science Politique
UPDATE filieres
SET
    nom = ' Science Politique ',
    descriptif = ' La filière de Science Politique explore les théories politiques, les systèmes gouvernementaux et les dynamiques politiques nationales et internationales. Les étudiants acquièrent une compréhension approfondie des processus politiques et développent des compétences analytiques critiques. '
WHERE filieres_id = 123;
-- Commentaire : Modification de la filière Science Politique
-- Modification des informations pour la Faculté de Médecine et des Sciences Pharmaceutiques (FMSP)
UPDATE faculte
SET
    descriptif = 'La Faculté de Médecine et des Sciences Pharmaceutiques (FMSP) de l’Université de Douala se profile comme une forteresse de savoir médical et pharmaceutique, où l’excellence académique et la passion pour la santé convergent. La FMSP offre une myriade de programmes académiques, englobant la médecine, la pharmacie, et d’autres disciplines connexes. Chaque département est rigoureusement conçu pour fournir une formation théorique solide et des expériences pratiques, garantissant que les étudiants acquièrent les compétences nécessaires pour exceller dans le domaine médical et pharmaceutique.',
    condition_admission = 'Sur concours pour les titulaires d’un bacc Scientifique'
WHERE faculte_id = 18;
-- Commentaire : Modification de la Faculté de Médecine et des Sciences Pharmaceutiques (FMSP)
-- Modification des informations pour la filière correspondant à la Faculté de Médecine et des Sciences Pharmaceutiques (FMSP)
UPDATE filieres
SET
    duree = 7,
    diplome_delivre = 'Doctorat'
WHERE faculte_id = 18;
-- Commentaire : Modification de la durée et du diplôme délivré pour la filière liée à la Faculté de Médecine et des Sciences Pharmaceutiques (FMSP)
-- Modification des informations pour la Faculté liée à l'École Normale Supérieure de l’Enseignement (ENSE)
UPDATE faculte
SET
    descriptif = 'Au cœur de l''Université de Douala, l’École Normale Supérieure de l’Enseignement (ENSE) se distingue comme un pilier essentiel de l’éducation, façonnant les enseignants de demain avec dévouement et excellence. L’ENSE offre une variété de programmes éducatifs, embrassant toutes les facettes de l’enseignement. Structurée pour fournir une éducation complète, elle prépare les futurs éducateurs à transmettre non seulement des connaissances mais aussi des compétences de vie aux générations futures. L’ENSE va au-delà de la simple transmission de savoir-faire en cultivant un esprit de réflexion critique et d’innovation éducative. Les professeurs, des éducateurs chevronnés, guident les étudiants à travers des méthodologies d’enseignement modernes et des pratiques pédagogiques novatrices.',
    condition_admission = 'Sur concours aux titulaires des Bac C-D-E ou GCE A/L, BT EF ,BT IB, BT MEB'
WHERE faculte_id = 19;
-- Commentaire : Modification du descriptif et des conditions d'admission pour la Faculté liée à l'École Normale Supérieure de l’Enseignement (ENSE)
-- Ajout de la filière Génie Forestier
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('GENIE FORESTIER', 'La filière de Génie Forestier forme des experts dans la gestion durable des ressources forestières. Les étudiants acquièrent des compétences en écologie forestière, gestion des écosystèmes forestiers et sylviculture.', 5, 50000.00, 'Français, Anglais', 'Licence, Master', 19);
-- Commentaire : Ajout de la filière Génie Forestier

-- Ajout de la filière Génie Informatique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('GENIE INFORMATIQUE', 'La filière de Génie Informatique forme des ingénieurs spécialisés dans le développement de logiciels, la gestion des réseaux et la sécurité informatique. Les étudiants explorent la programmation, l’analyse des systèmes et les technologies de l’information.', 5, 50000.00, 'Français, Anglais', 'Licence, Master', 19);
-- Commentaire : Ajout de la filière Génie Informatique

-- Ajout de la filière Génie Chimique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('GENIE CHIMIQUE', 'La filière de Génie Chimique forme des ingénieurs spécialisés dans la conception et l’optimisation des procédés chimiques industriels. Les étudiants acquièrent des compétences en génie des réacteurs, transfert de chaleur et de masse, et contrôle des procédés.', 5, 50000.00, 'Français, Anglais', 'Licence, Master', 19);
-- Commentaire : Ajout de la filière Génie Chimique
-- Ajout de la filière Économie Sociale et Familiale
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('ECONOMIE SOCIALE ET FAMILIALE', 'La filière d’Économie Sociale et Familiale forme des professionnels capables de conseiller et d’accompagner les individus et les familles dans les domaines de la gestion budgétaire, de l’alimentation, de l’éducation et du logement. Les étudiants développent des compétences en économie domestique et en intervention sociale.', 5, 50000.00, 'Français, Anglais', 'Licence, Master', 19);
-- Commentaire : Ajout de la filière Économie Sociale et Familiale

-- Ajout de la filière Techniques Administratives
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('TECHNIQUES ADMINISTRATIVES', 'La filière de Techniques Administratives forme des professionnels polyvalents capables de soutenir les activités administratives au sein des organisations. Les étudiants acquièrent des compétences en gestion documentaire, en communication d’entreprise et en techniques administratives.', 5, 50000.00, 'Français, Anglais', 'Licence, Master', 19);
-- Commentaire : Ajout de la filière Techniques Administratives

-- Ajout de la filière Sciences Techniques Économiques et Gestion
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('SCIENCES TECHNIQUES ECONOMIQUES ET GESTION', 'La filière de Sciences Techniques Économiques et Gestion forme des experts en économie, gestion et finance. Les étudiants explorent les principes économiques, la comptabilité, la gestion des ressources humaines et d’autres domaines connexes.', 5, 50000.00, 'Français, Anglais', 'Licence, Master', 19);
-- Commentaire : Ajout de la filière Sciences Techniques Économiques et Gestion

-- Ajout de la filière Sciences de l'Éducation
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES ('SCIENCES DE L’EDUCATION', 'La filière de Sciences de l’Éducation forme des professionnels de l’éducation capables de comprendre les processus d’apprentissage et de contribuer au développement de programmes éducatifs. Les étudiants explorent la pédagogie, la psychologie de l’éducation et d’autres domaines liés à l’éducation.', 5, 50000.00, 'Français, Anglais', 'Licence, Master', 19);
-- Commentaire : Ajout de la filière Sciences de l'Éducation
-- Modification de la filière Génie Civil
UPDATE filieres
SET nom = 'GENIE CIVIL', descriptif = 'La filière de Génie Civil forme des ingénieurs capables de concevoir, construire et entretenir des infrastructures telles que des routes, des ponts et des bâtiments. Les étudiants acquièrent des compétences en conception architecturale, gestion de projet et technologies de construction.'
WHERE filieres_id = 127;
-- Commentaire : Modification de la filière Génie Civil

-- Modification de la filière Génie Electrique
UPDATE filieres
SET nom = 'GENIE ELECTRIQUE', descriptif = 'La filière de Génie Electrique forme des ingénieurs spécialisés dans la conception et la gestion des systèmes électriques. Les étudiants acquièrent des compétences en électronique, automatisation, énergie renouvelable et systèmes de contrôle.'
WHERE filieres_id = 128;
-- Commentaire : Modification de la filière Génie Electrique

-- Modification de la filière Génie Mécanique
UPDATE filieres
SET nom = 'GENIE MECANIQUE', descriptif = 'La filière de Génie Mécanique forme des ingénieurs spécialisés dans la conception, la fabrication et la maintenance des machines. Les étudiants explorent les domaines de la mécanique des fluides, de la thermodynamique et de la conception de machines.'
WHERE filieres_id = 129;
-- Commentaire : Modification de la filière Génie Mécanique
-- Modification du nom et des informations de la faculté ESC
UPDATE faculte
SET nom = 'Etudes Supérieures de Commerce (ESC)',
    descriptif = 'Première Ecole de Gestion de la sous région par le volume de sa formation scientifique, et de la qualité de sa formation, l''Ecole Supérieure des Sciences Economiques et Commerciales (ESSEC) a été créée 1979 au sein de l''ancien Centre Universitaire de Douala, dans le but de former les futurs cadres gestionnaires nationaux et africains. Elle est actuellement un établissement de l''Université de Douala. Plus de 1000 cadres gestionnaires camerounais ou africains de la sous région y ont déjà été formés et exercent actuellement dans les différents secteurs économiques et sociaux du Cameroun, en Afrique et dans le monde.', 
    condition_admission = 'Sur Concours de Niveau Bac A, B, C, D, G ou GCE A/L'
WHERE faculte_id = 21;
-- Commentaire : Modification de la faculté ESC
-- Modification du descriptif et des conditions d'admission de la faculté ENSPD
UPDATE faculte
SET descriptif = 'L’Ecole Nationale Supérieure Polytechnique de Douala (ex Faculté de Génie Industrielle) travaille à garantir un avenir meilleur pour ses étudiants, avec des formations axées sur les besoins réels du monde de l’emploi. Une éducation taillée pour le développement technologique, industriel et social du pays. Entre Cursus Ingénieur, Cursus Sciences de l’Ingénieur, Masters Professionnel et Recherche, il y a de quoi faire dans cette Ecole de référence des Ingénieurs.',
    condition_admission = 'Bac C-D-E-F-TI-BT(industriel)/ GCE-AL in Pure Mathematics, Physics and Applied Mathematics or Chemistry ou tout autre diplôme jugé équivalent par le MINESUP'
WHERE faculte_id = 23;
-- Commentaire : Modification de la faculté ENSPD
-- Modification du nom de la faculté ENSPD [Cursus Ingénieur]
UPDATE faculte
SET nom = 'Ecole Nationale Supérieure Polytechnique de Douala (ENSPD) [Cursus Ingénieur]'
WHERE faculte_id = 23;
-- Commentaire : Modification du nom de la faculté ENSPD [Cursus Ingénieur]
-- Ajout des filières dans la table filiere
-- Génie Mécanique
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Mécanique',
    'La filière de Génie Mécanique forme des ingénieurs spécialisés dans la conception, la fabrication et la maintenance des machines. Les étudiants explorent les domaines de la mécanique des fluides, de la thermodynamique et de la conception de machines.',
    5, 50000, 'Français, Anglais', 'Ingénieur', 23
);
-- Commentaire : Ajout de la filière Génie Mécanique

-- Génie Electrique et Systèmes Intelligents
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Electrique et Systèmes Intelligents',
    'La filière de Génie Electrique et Systèmes Intelligents forme des ingénieurs spécialisés dans la conception et la gestion des systèmes électriques intelligents. Les étudiants acquièrent des compétences en électronique, automatisation et systèmes intelligents.',
    5, 50000, 'Français, Anglais', 'Ingénieur', 23
);
-- Commentaire : Ajout de la filière Génie Electrique et Systèmes Intelligents

-- Génie des Procédés
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie des Procédés',
    'La filière de Génie des Procédés forme des ingénieurs spécialisés dans la conception et l’optimisation des procédés industriels. Les étudiants acquièrent des compétences en génie chimique, gestion des procédés et technologies industrielles.',
    5, 50000, 'Français, Anglais', 'Ingénieur', 23
);
-- Commentaire : Ajout de la filière Génie des Procédés

-- Génie de la Qualité Hygiène, Sécurité et Environnement Industriel
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie de la Qualité Hygiène, Sécurité et Environnement Industriel',
    'La filière de Génie de la Qualité Hygiène, Sécurité et Environnement Industriel forme des ingénieurs spécialisés dans l’assurance qualité, la sécurité industrielle et la gestion environnementale. Les étudiants acquièrent des compétences en gestion de la qualité, sécurité au travail et environnement industriel.',
    5, 50000, 'Français, Anglais', 'Ingénieur', 23
);
-- Commentaire : Ajout de la filière Génie de la Qualité Hygiène, Sécurité et Environnement Industriel

-- Génie Informatique et Télécommunication
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Informatique et Télécommunication',
    'La filière de Génie Informatique et Télécommunication forme des ingénieurs spécialisés dans le développement de logiciels, les réseaux informatiques et les technologies de télécommunication. Les étudiants acquièrent des compétences en programmation, gestion de réseau et technologies de communication.',
    5, 50000, 'Français, Anglais', 'Ingénieur', 23
);
-- Commentaire : Ajout de la filière Génie Informatique et Télécommunication

-- Génie Maritime et Portuaire
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Maritime et Portuaire',
    'La filière de Génie Maritime et Portuaire forme des ingénieurs spécialisés dans la conception, la gestion et l’entretien des infrastructures maritimes et portuaires. Les étudiants explorent les domaines de la navigation maritime, de l’ingénierie portuaire et de la logistique maritime.',
    5, 50000, 'Français, Anglais', 'Ingénieur', 23
);
-- Commentaire : Ajout de la filière Génie Maritime et Portuaire

-- Génie Physique et Technologie Biomedical
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES (
    'Génie Physique et Technologie Biomedical',
    'La filière de Génie Physique et Technologie Biomedical forme des ingénieurs spécialisés dans l’application de la physique à la médecine et aux technologies médicales. Les étudiants acquièrent des compétences en instrumentation médicale, imagerie biomédicale et technologies de santé.',
    5, 50000, 'Français, Anglais', 'Ingénieur', 23
);
-- Commentaire : Ajout de la filière Génie Physique et Technologie Biomedical
-- Modification des informations dans la table filiere
-- Génie Civil
UPDATE filieres
SET descriptif = 'La filière de Génie Civil forme des ingénieurs capables de concevoir, construire et entretenir des infrastructures telles que des routes, des ponts et des bâtiments. Les étudiants acquièrent des compétences en conception architecturale, gestion de projet et technologies de construction.',
    diplome_delivre = 'Ingénieur'
WHERE filieres_id = 144;
-- Commentaire : Modification des informations pour la filière Génie Civil

-- Génie Energétique
UPDATE filieres
SET descriptif = 'La filière de Génie Energétique forme des ingénieurs spécialisés dans la gestion et l’optimisation des systèmes énergétiques. Les étudiants acquièrent des compétences en énergie renouvelable, gestion de l''énergie et technologies durables.',
    diplome_delivre = 'Ingénieur'
WHERE filieres_id = 145;
-- Commentaire : Modification des informations pour la filière Génie Energétique

-- Génie Automobile et Mécatronique
UPDATE filieres
SET descriptif = 'La filière de Génie Automobile et Mécatronique forme des ingénieurs spécialisés dans la conception et la maintenance des véhicules automobiles. Les étudiants explorent les domaines de la mécanique, de l’électronique et de la mécatronique.',
    diplome_delivre = 'Ingénieur'
WHERE filieres_id = 146;
-- Commentaire : Modification des informations pour la filière Génie Automobile et Mécatronique
-- Ajout des informations dans la table facultes
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES (
    'Ecole Nationale Supérieure Polytechnique de Douala (ENSPD) [Cursus Science de l’Ingénieur]',
    'Au sein de l’Université de Douala, l’École Nationale Supérieure Polytechnique de Douala (ENSPD) se dresse comme une forteresse de l’ingénierie, forgeant les esprits créatifs et innovants qui façonneront le futur. L’ENSPD propose des programmes de premier plan en Sciences de l’Ingénieur, couvrant une gamme diversifiée de disciplines allant de l’informatique à l’électrotechnique. Chaque cursus est méticuleusement structuré pour fournir une base solide en théorie tout en offrant des opportunités pratiques à travers des projets de recherche et des stages en entreprise. L’ENSPD va au-delà de la simple transmission de connaissances pour cultiver une culture de l’innovation et de l’entrepreneuriat. Les étudiants sont guidés par des professeurs experts, véritables mentors qui stimulent leur réflexion critique et les inspirent à repousser les limites de l’ingénierie.',
    'Entrée en Première année : Bac C-D-E-F-TI-BT(industriel)/ GCE-AL in Pure Mathematics, Physics and Applied Mathematics or Chemistry ou tout autre diplôme jugé équivalent par le MINESUP',
    null,
    null,
    3
);
-- Commentaire : Ajout de la faculté - Ecole Nationale Supérieure Polytechnique de Douala (ENSPD) [Cursus Science de l'Ingénieur]
-- Ajout des informations dans la table filieres
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
    (
        'Electronique, Electrotechnique, Automatisme et Télécommunication',
        'Cette filière explore les domaines de l’électronique, de l’électrotechnique, de l’automatisme et des télécommunications. Les étudiants acquièrent des compétences dans la conception et la maintenance des systèmes électroniques, des équipements électriques, des systèmes automatisés et des réseaux de télécommunication.',
        5,
        50000,
        'Français, Anglais',
        'Licence, Master',
        51
    ),
    (
        'Mécaniques et Matériaux',
        'La filière de Mécaniques et Matériaux forme des ingénieurs spécialisés dans la conception, la fabrication et l’analyse des structures mécaniques et des matériaux. Les étudiants explorent les domaines de la mécanique des matériaux, de la thermodynamique et de la conception mécanique.',
        5,
        50000,
        'Français, Anglais',
        'Licence, Master',
        51
    ),
    (
        'Géophisique, Eau et Environnement',
        'Cette filière se concentre sur l’étude de la géophysique, de l’eau et de l’environnement. Les étudiants acquièrent des compétences dans la collecte et l’analyse de données géophysiques, la gestion des ressources en eau et la préservation de l’environnement.',
        5,
        50000,
        'Français, Anglais',
        'Licence, Master',
        51
    ),
    (
        'Energie',
        'La filière Energie forme des ingénieurs spécialisés dans la production, la distribution et l’utilisation efficace de l''énergie. Les étudiants explorent les sources d’énergie, les technologies de production d''énergie et les systèmes de gestion énergétique.',
        5,
        50000,
        'Français, Anglais',
        'Licence, Master',
        51
    ),
    (
        'Science des Données et Intelligence artificielle',
        'Cette filière se concentre sur l’analyse et l’interprétation des données, ainsi que sur le développement de solutions basées sur l’intelligence artificielle. Les étudiants acquièrent des compétences en science des données, en apprentissage automatique et en traitement de l’information.',
        5,
        50000,
        'Français, Anglais',
        'Licence, Master',
        51
    ),
    (
        'Chimie Industrielle et Bioprocédés Industriels',
        'La filière de Chimie Industrielle et Bioprocédés Industriels forme des ingénieurs spécialisés dans les processus chimiques industriels et les bioprocédés. Les étudiants explorent les domaines de la chimie industrielle, des réactions biologiques et des techniques de production industrielle.',
        5,
        50000,
        'Français, Anglais',
        'Licence, Master',
        51
    );
-- Commentaires : Ajout des filières dans la faculté_id 51
-- Ajout des informations dans la table facultes
INSERT INTO faculte (nom, descriptif, condition_admission, email, telephone, universite_id)
VALUES 
    (
        'Ecole Nationale Supérieure Polytechnique de Douala (ENSPD) [Cursus Science de l''Ingénieur]',
        'Au cœur de l’Université de Douala, l’École Nationale Supérieure Polytechnique de Douala (ENSPD) se distingue par son engagement inébranlable envers l’ingénierie de pointe, mettant en avant son cursus de Master Professionnel qui façonne les leaders de l’industrie de demain. Le cursus de Master Professionnel à l’ENSPD s’inscrit dans une approche holistique de l’ingénierie, couvrant des disciplines allant de l’informatique à l’électrotechnique. Chaque module est conçu pour approfondir la compréhension des étudiants dans leur domaine de spécialisation tout en développant des compétences transversales essentielles.',
        'Admission sur ETUDE DE DOSSIER toutes les filières',
        null,
        null,
        3
    );
-- Commentaires : Ajout de la faculte "Ecole Nationale Supérieure Polytechnique de Douala (ENSPD) [Cursus Science de l'Ingénieur]"

-- Ajout des informations dans la table filieres
INSERT INTO filieres (nom, descriptif, duree, cout, langue_enseignement, diplome_delivre, faculte_id)
VALUES 
    (
        'Geotechnique Et Infrastructure Du Genie Civil',
        'Cette filière forme des experts en géotechnique et infrastructure du génie civil. Les étudiants acquièrent des compétences avancées dans la conception, la planification et la gestion de projets d’infrastructures, en mettant l’accent sur les aspects géotechniques.',
        2,
        750000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Ingénierie Electrique et Automatisme',
        'La filière d’Ingénierie Electrique et Automatisme forme des professionnels capables de concevoir, développer et gérer des systèmes électriques et automatisés. Les étudiants explorent les domaines de l’électrotechnique, de l’automatisme et de la régulation.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Génie Logiciel',
        'La filière de Génie Logiciel prépare les étudiants à concevoir, développer et maintenir des logiciels de haute qualité. Les compétences acquises couvrent l’ensemble du cycle de vie du développement logiciel, de la conception à la maintenance.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Génie Réseaux et Télécommunication',
        'Cette filière forme des experts en réseaux et télécommunications. Les étudiants acquièrent des compétences approfondies dans la conception, la mise en œuvre et la gestion des infrastructures de communication.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Cybersécurité et Cyberdéfense',
        'La filière de Cybersécurité et Cyberdéfense forme des professionnels capables de sécuriser les systèmes d’information contre les cybermenaces. Les étudiants développent des compétences en sécurité informatique et en défense contre les attaques cybernétiques.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Biotechnologie et Sécurité Alimentaire',
        'Cette filière explore les applications des biotechnologies dans le domaine de la sécurité alimentaire. Les étudiants acquièrent des compétences pour développer et mettre en œuvre des solutions biotechnologiques visant à assurer la sécurité des denrées alimentaires.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Construction Métallique et Mécanique Industrielle',
        'La filière de Construction Métallique et Mécanique Industrielle forme des ingénieurs spécialisés dans la conception et la gestion des structures métalliques et des équipements mécaniques industriels. Les étudiants développent des compétences en conception, fabrication et gestion de projets industriels.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Sécurité des Systèmes d’Information',
        'Cette filière se concentre sur la sécurité des systèmes d’information. Les étudiants apprennent à évaluer les risques, à mettre en œuvre des mesures de sécurité et à protéger les informations contre les menaces cybernétiques.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Ingénierie Thermique et Energie (ITE)',
        'La filière d’Ingénierie Thermique et Energie (ITE) forme des spécialistes en thermique et en gestion des énergies. Les étudiants développent des compétences pour concevoir et optimiser des systèmes énergétiques efficaces et durables.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Aménagement des Collectivités-Topographie-Urbanisme (ACTU)',
        'Cette filière prépare les étudiants à travailler sur l’aménagement des collectivités, la topographie et l’urbanisme. Les compétences acquises couvrent la planification territoriale, la topographie et la conception urbaine.',
        2,
        750000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Mécatronique et Gestion Technique des équipements',
        'La filière de Mécatronique et Gestion Technique des équipements forme des ingénieurs polyvalents capables de concevoir, mettre en œuvre et gérer des systèmes mécatroniques. Les étudiants acquièrent des compétences en mécanique, électronique et automatisme.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    ),
    (
        'Gestion Intégrée de l''Environnement et des Ressources Naturelles',
        'Cette filière se concentre sur la gestion intégrée de l’environnement et des ressources naturelles. Les étudiants apprennent à équilibrer le développement économique avec la préservation de l''environnement et des ressources naturelles.',
        2,
        600000,
        'Français, Anglais',
        'Master professionnel',
        52
    );
-- Commentaires : Ajout des filières pour la faculté 52
-- Ajout du métier "Enseignant de langues et de littérature française" dans la table Metiers
INSERT INTO metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Enseignant de langues et de littérature française',
    'L’enseignant de langues et de littérature française est responsable d’instruire les élèves sur la langue française et la littérature associée. Il crée des plans de cours, évalue les progrès des élèves, et favorise le développement des compétences linguistiques et littéraires. Il peut travailler dans des écoles primaires, secondaires ou des établissements d’enseignement supérieur.',
    NULL,
    '200000-300000',
    'Maîtrise de la langue française, connaissance approfondie de la littérature française, compétences pédagogiques, communication efficace.',
    106
);
-- Ajout du métier "Rédacteur" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Rédacteur',
    'Le rédacteur est chargé de produire des contenus écrits clairs et engageants. Il peut travailler dans divers domaines tels que le journalisme, la rédaction technique, la création de contenu web, etc. Son rôle consiste à transmettre des informations de manière compréhensible et captivante.',
    NULL,
    '200000-300000',
    'Maîtrise de la langue, compétences rédactionnelles, recherche approfondie, adaptation au ton et style demandés.',
    106
);

-- Ajout du métier "Éditeur" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Éditeur',
    'L’éditeur est responsable de la préparation et de la publication de contenus écrits. Cela inclut la révision, la correction et la coordination avec les auteurs pour garantir la qualité du produit final. Les éditeurs peuvent travailler dans l’édition de livres, de magazines, ou d’autres supports écrits.',
    NULL,
    '200000-300000',
    'Excellente compréhension de la grammaire et de la syntaxe, compétences en révision, organisation, communication efficace.',
    106
);
-- Ajout du métier "Chargé de communication" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Chargé de communication',
    'Le chargé de communication est responsable de la gestion et de la diffusion de l’information au sein d’une organisation. Il élabore des stratégies de communication, rédige des supports de communication, organise des événements et assure la relation avec les médias. Son rôle est essentiel pour promouvoir une image positive de l''entreprise ou de l’organisation.',
    NULL,
    '400000+',
    'Compétences en communication écrite et orale, créativité, maîtrise des outils de communication, gestion de crise, relation avec les médias.',
    106
);
-- Ajout du métier "Animateur socioculturel" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Animateur socioculturel',
    'L’animateur socioculturel organise et met en place des activités socioculturelles visant à favoriser le lien social et le bien-être des participants. Il peut intervenir dans des structures variées telles que les centres sociaux, les associations, les collectivités locales. Son rôle est d’animer des ateliers, des événements culturels et de favoriser la participation active des personnes.',
    NULL,
    '250000+',
    'Animation, gestion de projet socioculturel, communication, capacité d''écoute, créativité, médiation.',
    106
);
-- Ajout du métier "Enseignant de la Langue de la littérature et de la culture" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Enseignant de la Langue de la littérature et de la culture',
    'L’enseignant de la langue, de la littérature et de la culture intervient dans le domaine de l’éducation en enseignant la langue, la littérature et la culture à des élèves ou des étudiants. Son rôle est de transmettre des connaissances linguistiques, littéraires et culturelles tout en favorisant le développement des compétences de communication et d''analyse chez les apprenants.',
    NULL,
    '200000',
    'Enseignement, pédagogie, maîtrise de la langue, connaissance littéraire, capacité d’analyse, communication.',
    107
);
-- Ajout du métier "Animateur culturel" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Animateur culturel',
    'L’animateur culturel est chargé de concevoir, organiser et animer des activités culturelles au sein d’organismes culturels, de centres sociaux, ou lors d’événements spécifiques. Son rôle est de promouvoir la culture et d’encourager la participation communautaire à travers des activités variées et enrichissantes.',
    NULL,
    '250000',
    'Animation culturelle, organisation d’événements, communication, créativité, gestion de projets culturels.',
    107
);

-- Ajout du métier "Chargé de patrimoine" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Chargé de patrimoine',
    'Le chargé de patrimoine est responsable de la préservation, de la valorisation et de la transmission du patrimoine culturel. Il peut travailler dans des institutions culturelles, des musées, des archives, ou des collectivités territoriales. Son rôle est de conserver le patrimoine et de le rendre accessible au public.',
    NULL,
    '250000',
    'Gestion du patrimoine, conservation, médiation culturelle, connaissance historique, recherche documentaire.',
    107
);
-- Ajout du métier "Traducteur" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Traducteur',
    'Le traducteur est chargé de convertir des textes écrits d’une langue à une autre tout en préservant le sens et le contexte d’origine. Il peut travailler dans différents domaines tels que la littérature, les affaires, la technique ou le médical. Le traducteur doit maîtriser parfaitement les langues source et cible.',
    NULL,
    '200000',
    'Maîtrise des langues source et cible, compréhension approfondie des cultures, compétences rédactionnelles, recherche terminologique.',
    107
);
-- Ajout du métier "Communication d'entreprise" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Communication d''entreprise',
    'Le professionnel de la communication d’entreprise est responsable de la gestion des communications internes et externes d’une organisation. Il élabore des stratégies de communication, rédige des contenus, organise des événements et entretient les relations avec les médias. Le rôle est crucial pour construire et maintenir une image positive de l’entreprise.',
    NULL,
    '200000',
    'Stratégie de communication, rédaction, relations publiques, gestion de crise, maîtrise des outils de communication.',
    108
);
-- Ajout du métier "Agence conseil en communication" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Agence conseil en communication',
    'Le professionnel travaillant dans une agence conseil en communication est chargé de conseiller les clients sur leurs stratégies de communication. Il participe à la conception et à la mise en œuvre de campagnes publicitaires, événementielles et digitales. Son rôle est d’optimiser l’image et la visibilité des clients sur le marché.',
    NULL,
    '200000',
    'Conseil en communication, gestion de projet, stratégies publicitaires, marketing digital, relations clients.',
    108
);
-- Ajout du métier "Communication sociale et médiatique" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Communication sociale et médiatique',
    'Le professionnel spécialisé en communication sociale et médiatique travaille à créer, diffuser et analyser des contenus médiatiques dans le but d’influencer positivement l’opinion publique. Il peut être impliqué dans la gestion de campagnes de communication sociale, la rédaction de communiqués de presse, la gestion des réseaux sociaux, etc.',
    NULL,
    '200000',
    'Communication sociale, médias, gestion de l’information, journalisme, relations publiques.',
    108
);
-- Ajout du métier "Analyse des médias" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Analyse des médias',
    'Le professionnel spécialisé en analyse des médias est chargé d’étudier et d’analyser les contenus médiatiques afin de comprendre leur impact sur la société. Il peut travailler dans des instituts de recherche, des agences de communication, des entreprises de médias, etc., en utilisant des méthodologies d’analyse pour évaluer les tendances médiatiques.',
    NULL,
    '200000',
    'Analyse des médias, recherche, méthodologies d’analyse, journalisme, communication.',
    108
);
-- Ajout du métier "Administrateur de spectacles" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Administrateur de spectacles',
    'L’administrateur de spectacles est responsable de la gestion et de l’organisation des événements culturels et artistiques. Il collabore avec les artistes, coordonne les aspects logistiques et veille au bon déroulement des spectacles. Il peut travailler dans des salles de spectacle, des festivals, des agences artistiques, etc.',
    NULL,
    '200000',
    'Gestion événementielle, coordination, logistique, relation artistes, administratif culturel.',
    108
);
-- Ajout du métier "Enseignant de théâtre" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Enseignant de théâtre',
    'L’enseignant de théâtre est responsable de l’enseignement des techniques théâtrales, de la direction d’acteurs, et de l’organisation de représentations. Il guide les étudiants dans le développement de leurs compétences artistiques et de leur compréhension du théâtre.',
    NULL,
    '200000',
    'Enseignement théâtral, direction d’acteurs, organisation de représentations, pédagogie artistique.',
    108
);
-- Ajout du domaine "Possibilité de carrière dans les administrations publiques, les organismes Internationaux, les ONG, les ministères" dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Possibilité de carrière dans les administrations publiques, les organismes Internationaux, les ONG, les ministères',
    'Ce domaine offre diverses opportunités de carrière au sein des administrations publiques, des organismes internationaux, des ONG et des ministères. Les professionnels travaillent généralement dans des rôles liés à la gestion publique, aux relations internationales, à la diplomatie et à la planification stratégique.',
    NULL,
    '200000',
    'Gestion publique, relations internationales, diplomatie, planification stratégique.',
    109
);
-- Ajout du secteur social dans les maisons de l'enfance, foyers, crèches dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Secteur social : maison de l’enfance, foyer, crèches',
    'Les professionnels travaillant dans le secteur social au sein des maisons de l’enfance, foyers et crèches sont dédiés à fournir un soutien essentiel aux enfants. Ils créent un environnement sûr, stimulant et éducatif, favorisant le bien-être et le développement des enfants.',
    NULL,
    '200000',
    'Soutien social, éducation de l’enfance, gestion de groupe, communication interpersonnelle.',
    109
);
-- Ajout du métier lié aux Organisations Non Gouvernementales (ONG) dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Organisations Non Gouvernementales (ONG)',
    'Les professionnels travaillant au sein des Organisations Non Gouvernementales (ONG) jouent un rôle crucial dans la promotion du changement social. Leur travail peut couvrir divers domaines tels que la santé, l’éducation, l’environnement, et bien plus encore. Ils sont impliqués dans la conception, la mise en œuvre et la gestion de projets visant à améliorer les conditions de vie des communautés.',
    NULL,
    '200000',
    'Gestion de projet, plaidoyer, communication interculturelle, collecte de fonds, analyse de données sociales.',
    109
);
-- Ajout du métier lié à l'Éclairagiste dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Éclairagiste',
    'L’éclairagiste est un professionnel spécialisé dans la conception et la mise en œuvre de l’éclairage dans divers contextes tels que les spectacles, les événements, les productions cinématographiques et les installations architecturales. Leur rôle est d’utiliser la lumière de manière créative pour influencer l’atmosphère et mettre en valeur les éléments visuels.',
    NULL,
    '200000',
    'Connaissance des équipements d’éclairage, compétences techniques en électricité, créativité artistique, compréhension de la couleur et de la lumière, coordination avec d’autres professionnels du spectacle.',
    109
);
-- Ajout du métier lié au Metteur en scène dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Metteur en scène',
    'Le metteur en scène est un professionnel du spectacle chargé de diriger et coordonner l’ensemble des éléments d’une production théâtrale, cinématographique ou télévisuelle. Son rôle consiste à interpréter le script, guider les acteurs, concevoir la mise en scène et superviser les aspects créatifs de la production.',
    NULL,
    '200000',
    'Compétences en direction artistique, excellente compréhension du script, leadership, communication efficace avec les acteurs et l’équipe de production, créativité et sens artistique développé.',
    109
);
-- Ajout du métier lié à l'Administrateur de spectacles dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Administrateur de spectacles',
    'L’administrateur de spectacles est un professionnel du secteur culturel chargé de la gestion administrative et financière d’une production artistique ou d''un spectacle. Son rôle consiste à organiser les différentes étapes de la réalisation d’un spectacle, du budget à la logistique, en veillant à la conformité avec les réglementations en vigueur.',
    NULL,
    '200000',
    'Compétences en gestion administrative et financière, connaissance des réglementations culturelles, excellentes compétences organisationnelles, négociation et communication efficace avec les partenaires et intervenants.',
    109
);
-- Ajout du métier lié au Cartographe dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Cartographe',
    'Le cartographe est un professionnel spécialisé dans la création de cartes géographiques. Son rôle principal est de collecter, analyser et représenter graphiquement des données géographiques pour produire des cartes précises et informatives. Les cartographes utilisent des outils technologiques avancés et ont une compréhension approfondie de la topographie et de la cartographie numérique.',
    NULL,
    '200000 à 300000', -- Fourchette de salaire moyen pour le métier de Cartographe.
    'Compétences en cartographie numérique, maîtrise des logiciels SIG (Systèmes d''Information Géographique), capacité à interpréter des données géospatiales, précision et attention aux détails.',
    111
);
-- Ajout du métier lié à l'Analyste SIG dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Analyste SIG',
    'L’analyste SIG (Système d''Information Géographique) est un professionnel spécialisé dans l’analyse et l’interprétation de données géographiques. Il utilise des logiciels SIG pour cartographier, modéliser et analyser des informations spatiales. L’analyste SIG travaille souvent avec des données provenant de diverses sources pour aider à la prise de décision dans des domaines tels que la planification urbaine, la gestion des ressources naturelles et l’analyse environnementale.',
    NULL,
    'Entre 45 000 et 60 000', -- Fourchette de salaire moyen pour un Analyste SIG.
    'Maîtrise des logiciels SIG, capacité d’analyse spatiale, interprétation de données géospatiales, résolution de problèmes complexes liés à la cartographie.',
    111
);
-- Ajout du métier lié à l'Enseignant en Géographie dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Enseignant',
    'L’enseignant en géographie est un professionnel de l’éducation spécialisé dans l’enseignement de la géographie. Il transmet des connaissances sur les divers aspects de la géographie physique, humaine et sociale. L''enseignant prépare des cours, crée des supports pédagogiques et évalue les étudiants. Il joue un rôle clé dans le développement des compétences géographiques des apprenants, les préparant à comprendre le monde qui les entoure.',
    NULL,
    'Entre 40 000 et 55 000', -- Fourchette de salaire moyen pour un Enseignant en Géographie.
    'Maîtrise des concepts géographiques, capacité à enseigner de manière interactive, compétences pédagogiques, communication efficace avec les élèves.',
    111
);
-- Ajout du métier lié à Chargé de projet environnementaux en Géographie dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Chargé de projet environnementaux',
    'Le chargé de projet environnementaux est un professionnel spécialisé dans la gestion et la coordination de projets liés à l’environnement. Il travaille sur des initiatives visant à protéger, restaurer et gérer les ressources naturelles. Ses responsabilités incluent la planification, la mise en œuvre et l’évaluation de projets environnementaux, ainsi que la collaboration avec différentes parties prenantes pour atteindre des objectifs durables.',
    NULL,
    'Entre 50 000 et 70 000', -- Fourchette de salaire moyen pour un Chargé de projet environnementaux en Géographie.
    'Gestion de projets, expertise en environnement, communication interdisciplinaire, sensibilité aux enjeux environnementaux, capacité d''analyse géographique.',
    111
);
-- Ajout du métier lié à Planificateur Territorial en Géographie dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Planificateur Territorial',
    'Le planificateur territorial en géographie est un professionnel spécialisé dans la conception, la gestion et la mise en œuvre de plans d’aménagement du territoire. Il collabore avec des experts en urbanisme, environnement, transport, et d’autres domaines connexes pour élaborer des projets qui répondent aux besoins de la collectivité tout en tenant compte des aspects environnementaux, sociaux et économiques. Son rôle consiste à assurer un développement territorial durable.',
    NULL,
    'Entre 60 000 et 80 000', -- Fourchette de salaire moyen pour un Planificateur Territorial en Géographie.
    'Planification urbaine, aménagement du territoire, gestion de projets, analyse géographique, communication interdisciplinaire.',
    111
);
-- Ajout du métier lié aux Organisations Non Gouvernementales (ONG) et organisations Internationales luttant contre les changements climatiques dans la table Metiers
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES (
    'Expert en Environnement et Changements Climatiques',
    'L’expert en environnement et changements climatiques travaille au sein d’organisations non gouvernementales (ONG) et d’organisations internationales dédiées à la lutte contre les changements climatiques. Son rôle consiste à mener des recherches, analyser les données environnementales, développer des stratégies et des politiques pour atténuer les impacts du changement climatique, et sensibiliser les populations à ces enjeux. Il participe également à des projets visant à promouvoir le développement durable et à réduire l’empreinte carbone.',
    NULL,
    'Entre 70 000 et 90 000', -- Fourchette de salaire moyen pour un Expert en Environnement et Changements Climatiques.
    'Expertise en environnement, changements climatiques, gestion de projets environnementaux, analyse de données, sensibilisation, communication interculturelle.',
    111
);
-- Ajout du métier: Enseignant
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Enseignant', 'Un enseignant est une personne chargée de transmettre des connaissances et de former des élèves ou des étudiants dans un établissement scolaire ou universitaire. Ses principales tâches consistent à préparer et dispenser des cours, évaluer les élèves, gérer la discipline en classe et participer à des réunions pédagogiques.', NULL, 250000, 'Connaissance approfondie de la matière enseignée, capacités pédagogiques, gestion de classe, communication orale et écrite', 112);

-- Ajout du métier: Archiviste
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Archiviste', 'Un archiviste est un professionnel chargé de la collecte, de la conservation, du classement et de la mise à disposition des documents et archives historiques. Il veille à préserver l’intégrité des documents et à faciliter leur accessibilité pour la recherche et la consultation.', NULL, 300000, 'Connaissance de l’histoire et des techniques de conservation, compétences en gestion documentaire, capacité d''analyse et de synthèse', 112);

-- Ajout du métier: Historien
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Historien', 'Un historien est un chercheur et un expert dans l’étude et l’analyse des événements, des civilisations et des cultures du passé. Il mène des recherches approfondies, analyse des sources primaires et secondaires, et produit des publications académiques ou des ouvrages historiques.', NULL, 400000, 'Connaissance approfondie de l’histoire, capacités de recherche et d’analyse, esprit critique, rédaction scientifique', 112);

-- Ajout du métier: Guide touristique
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Guide touristique', 'Un guide touristique est un professionnel chargé d’accompagner et d’informer les visiteurs sur les sites historiques, les monuments et les attractions culturelles d''une région. Il partage ses connaissances historiques et fournit des explications détaillées pour enrichir l’expérience des touristes.', NULL, 150000, 'Connaissances approfondies de l’histoire locale, compétences en communication orale, aptitudes à l''animation de groupe', 112);

-- Ajout du métier: Conservateur de musée
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Conservateur de musée', 'Un conservateur de musée est responsable de la gestion, de la préservation et de la mise en valeur des collections d’un musée. Il supervise l’acquisition, la documentation, la restauration et l’exposition des œuvres et objets historiques. Il contribue également à la recherche et à l’éducation du public.', NULL, 500000, 'Expertise dans un domaine historique spécifique, connaissance des techniques de conservation, compétences en gestion de collections et en médiation culturelle', 112);
--Bien noté, j'ai modifié le Filieres_id à 113 dans les insertions SQL suivantes :

-- Ajout du métier: Enseignant de philosophie
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Enseignant de philosophie', 'Un enseignant de philosophie est chargé de transmettre les connaissances et les concepts fondamentaux de la philosophie aux élèves ou aux étudiants. Il enseigne l''histoire de la pensée philosophique, les différents courants et les grands penseurs. Son rôle est de stimuler la réflexion critique et le questionnement chez les apprenants.', NULL, 300000, 'Connaissance approfondie de la philosophie, capacités pédagogiques, aptitude à la réflexion critique, compétences en communication orale et écrite', 113);

-- Ajout du métier: Chercheur en philosophie
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chercheur en philosophie', 'Un chercheur en philosophie mène des recherches approfondies dans des domaines spécifiques de la philosophie, tels que l''éthique, la métaphysique, l''épistémologie ou la philosophie politique. Il contribue au développement de nouvelles théories et à l''avancement des connaissances dans le domaine philosophique.', NULL, 500000, 'Expertise philosophique spécialisée, capacités d''analyse et de raisonnement logique, compétences en recherche et en rédaction académique', 113);

-- Ajout du métier: Consultant en éthique
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Consultant en éthique', 'Un consultant en éthique fournit des conseils et des recommandations sur les questions éthiques et morales aux entreprises, aux organisations ou aux institutions. Il aide à établir des politiques éthiques, à former le personnel sur les enjeux éthiques et à résoudre les dilemmes moraux rencontrés.', NULL, 600000, 'Connaissance approfondie de l''éthique et de la philosophie morale, capacités d''analyse et de résolution de problèmes, compétences en communication et en conseil', 113);

-- Ajout du métier: Écrivain philosophique
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Écrivain philosophique', 'Un écrivain philosophique rédige des ouvrages, des essais ou des articles sur des sujets philosophiques. Il explore des concepts abstraits, développe des arguments et des réflexions sur des questions existentielles, éthiques ou métaphysiques, dans le but de partager ses idées avec un public plus large.', NULL, 400000, 'Connaissance approfondie de la philosophie, capacités d''analyse et de synthèse, compétences rédactionnelles, créativité et originalité de la pensée', 113);

-- Ajout du métier: Conférencier en philosophie
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Conférencier en philosophie', 'Un conférencier en philosophie est un orateur qui présente et partage ses réflexions philosophiques lors de conférences, de séminaires ou d''événements publics. Il vulgarise des concepts philosophiques complexes et encourage le public à s''interroger sur des questions fondamentales liées à l''existence humaine.', NULL, 350000, 'Expertise philosophique, compétences en communication orale et en vulgarisation, capacité à capter l''attention du public, charisme', 113);
-- Ajout du métier: Acteur
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Acteur', 'Un acteur est un artiste qui interprète des rôles dans des productions théâtrales, cinématographiques ou télévisuelles. Il incarne des personnages fictifs ou réels en utilisant ses compétences d''expression corporelle, vocale et émotionnelle pour donner vie à un scénario.', NULL, 500000, 'Talents d''interprétation, mémorisation des textes, capacités d''improvisation, maîtrise des techniques de jeu d''acteur', 332);

-- Ajout du métier: Réalisateur
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Réalisateur', 'Un réalisateur est responsable de la supervision artistique et technique d''une production cinématographique ou télévisuelle. Il dirige l''équipe de tournage, guide les acteurs dans leur interprétation et prend les décisions créatives pour traduire un scénario en images.', NULL, 800000, 'Vision artistique, compétences techniques en cinématographie, leadership, gestion d''équipe, connaissance des processus de production', 332);

-- Ajout du métier: Scénariste
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Scénariste', 'Un scénariste est un auteur qui écrit les scénarios pour le cinéma, la télévision ou le théâtre. Il développe l''histoire, les personnages, les dialogues et la structure narrative d''une production audiovisuelle ou scénique.', NULL, 600000, 'Créativité, compétences en écriture et en structure narrative, connaissance des formats de scénario, capacité à développer des personnages convaincants', 332);

-- Ajout du métier: Metteur en scène
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Metteur en scène', 'Un metteur en scène est responsable de la conception et de la réalisation d''une pièce de théâtre ou d''un spectacle vivant. Il dirige les acteurs, supervise les aspects techniques et artistiques, et traduit le texte en une représentation scénique cohérente.', NULL, 700000, 'Vision artistique, compréhension des textes dramatiques, direction d''acteurs, gestion d''équipe, connaissance des techniques de mise en scène', 332);

-- Ajout du métier: Directeur de la photographie
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Directeur de la photographie', 'Un directeur de la photographie, également appelé chef opérateur, est responsable de la direction artistique et technique de l’image dans une production cinématographique ou télévisuelle. Il collabore avec le réalisateur pour créer l’atmosphère visuelle souhaitée à travers l''éclairage, les cadrages et les mouvements de caméra.', NULL, 900000, 'Expertise en photographie et en éclairage, connaissance des équipements cinématographiques, sens artistique, capacité à travailler en équipe', 332);
-- Ajout du métier: Biochimiste
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Biochimiste', 'Un biochimiste est un scientifique qui étudie la composition chimique et les processus métaboliques des organismes vivants. Il analyse les molécules, les protéines, les enzymes et les voies biochimiques impliquées dans le fonctionnement cellulaire et le développement des êtres vivants.', NULL, 800000, 'Connaissances approfondies en biochimie, en biologie moléculaire et en chimie organique, compétences en techniques de laboratoire et d''analyse, capacités d''interprétation des résultats', 114);

-- Ajout du métier: Chercheur en biotechnologie
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chercheur en biotechnologie', 'Un chercheur en biotechnologie mène des recherches visant à développer des applications pratiques à partir de processus biologiques. Il travaille sur des projets tels que la production de médicaments, le développement de biocarburants, l''amélioration des cultures ou le traitement des déchets.', NULL, 900000, 'Expertise en biochimie, en biologie moléculaire et en génétique, compétences en techniques de laboratoire et en conception expérimentale, capacité d''innovation', 114);

-- Ajout du métier: Consultant en réglementation
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Consultant en réglementation', 'Un consultant en réglementation fournit des conseils aux entreprises et aux organisations sur la conformité avec les réglementations et les normes en vigueur dans le domaine biochimique et biotechnologique. Il évalue les risques, analyse les dossiers techniques et veille au respect des exigences légales.', NULL, 700000, 'Connaissance approfondie des réglementations et des normes applicables, capacités d''analyse et de résolution de problèmes, compétences en communication et en gestion de projets', 114);

-- Ajout du métier: Enseignant en biochimie
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Enseignant en biochimie', 'Un enseignant en biochimie est chargé de transmettre les connaissances théoriques et pratiques de la biochimie aux étudiants. Il prépare et dispense des cours, encadre des travaux pratiques en laboratoire et supervise les projets de recherche des étudiants.', NULL, 500000, 'Expertise en biochimie, capacités pédagogiques, compétences en communication orale et écrite, maîtrise des techniques de laboratoire', 114);

-- Ajout du métier: Spécialiste en contrôle qualité
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Spécialiste en contrôle qualité', 'Un spécialiste en contrôle qualité est responsable de veiller à la conformité des produits biochimiques et biotechnologiques avec les normes et les réglementations en vigueur. Il met en place des protocoles d''analyse, effectue des tests de qualité et s''assure de la sécurité des produits.', NULL, 600000, 'Connaissances en biochimie, en chimie analytique et en réglementation, compétences en techniques d''analyse et de contrôle qualité, rigueur et attention aux détails', 114);
-- Ajout du métier: Zoologiste
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Zoologiste', 'Un zoologiste est un scientifique qui étudie les animaux, leur comportement, leur physiologie, leur écologie et leur évolution. Il mène des recherches sur le terrain ou en laboratoire pour comprendre les différentes espèces animales et contribuer à leur conservation.', NULL, 700000, 'Connaissances approfondies en zoologie, en biologie animale et en écologie, compétences en observation et en techniques d''étude sur le terrain, capacité d''analyse et de synthèse', 115);

-- Ajout du métier: Vétérinaire
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Vétérinaire', 'Un vétérinaire est un professionnel de la santé spécialisé dans le diagnostic, le traitement et la prévention des maladies chez les animaux. Il examine, vaccine et soigne les animaux domestiques, de compagnie ou de production.', NULL, 800000, 'Connaissances approfondies en médecine vétérinaire, en anatomie et en physiologie animale, compétences en examen clinique et en intervention chirurgicale, capacité de communication avec les propriétaires d''animaux', 115);

-- Ajout du métier: Biologiste de la faune
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Biologiste de la faune', 'Un biologiste de la faune étudie les populations d''animaux sauvages, leur habitat, leur comportement et leur interaction avec l''environnement. Il mène des recherches sur le terrain pour surveiller les espèces, gérer les ressources fauniques et contribuer à la conservation de la biodiversité.', NULL, 600000, 'Connaissances en biologie animale, en écologie et en gestion des ressources naturelles, compétences en techniques d''étude sur le terrain, capacité d''analyse des données', 115);

-- Ajout du métier: Écologue animalier
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Écologue animalier', 'Un écologue animalier étudie les relations entre les animaux et leur environnement, ainsi que les interactions entre les différentes espèces. Il mène des recherches sur les écosystèmes, les chaînes alimentaires et les processus écologiques impliquant les animaux.', NULL, 650000, 'Connaissances en écologie, en biologie animale et en sciences de l''environnement, compétences en techniques d''étude sur le terrain et en analyse de données, capacité de travail en équipe', 115);

-- Ajout du métier: Gestionnaire de ressources fauniques
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Gestionnaire de ressources fauniques', 'Un gestionnaire de ressources fauniques est responsable de la gestion et de la conservation des populations d''animaux sauvages et de leurs habitats. Il élabore et met en œuvre des plans de gestion, surveille les populations animales et coordonne les efforts de conservation.', NULL, 750000, 'Connaissances en biologie de la faune, en écologie et en gestion des ressources naturelles, compétences en planification et en mise en œuvre de programmes, capacité de communication et de sensibilisation', 115);
-- Ajout du métier: Botaniste
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Botaniste', 'Un botaniste est un scientifique qui étudie les plantes, leur structure, leur physiologie, leur reproduction, leur classification et leur évolution. Il mène des recherches sur le terrain ou en laboratoire pour comprendre les différentes espèces végétales et contribuer à leur conservation.', NULL, 700000, 'Connaissances approfondies en botanique, en biologie végétale et en écologie, compétences en observation et en techniques d''étude sur le terrain, capacité d''analyse et de synthèse', 116);

-- Ajout du métier: Agronome
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Agronome', 'Un agronome est un spécialiste des sciences agricoles qui se concentre sur l''amélioration des cultures et des pratiques agricoles. Il étudie les sols, les plantes, les techniques culturales et les systèmes de production pour accroître la productivité et la durabilité de l''agriculture.', NULL, 800000, 'Connaissances en agronomie, en biologie végétale, en pédologie et en gestion des ressources naturelles, compétences en expérimentation et en analyse de données, capacité de conseil auprès des agriculteurs', 116);

-- Ajout du métier: Phytopathologiste
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Phytopathologiste', 'Un phytopathologiste est un spécialiste des maladies des plantes. Il étudie les agents pathogènes (champignons, bactéries, virus) qui affectent les cultures, diagnostique les infections et recommande des stratégies de lutte pour protéger les récoltes.', NULL, 750000, 'Connaissances en phytopathologie, en microbiologie et en protection des végétaux, compétences en techniques de diagnostic et d''analyse en laboratoire, capacité de gestion intégrée des ravageurs', 116);

-- Ajout du métier: Généticien végétal
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Généticien végétal', 'Un généticien végétal étudie la génétique des plantes et applique ces connaissances pour développer de nouvelles variétés améliorées. Il travaille sur la sélection végétale, la modification génétique et l''amélioration des caractéristiques souhaitées des plantes cultivées.', NULL, 900000, 'Expertise en génétique végétale, en biologie moléculaire et en biotechnologie, compétences en techniques de laboratoire et d''analyse génomique, capacité d''innovation', 116);

-- Ajout du métier: Écologiste végétal
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Écologiste végétal', 'Un écologiste végétal étudie les relations entre les plantes et leur environnement, ainsi que les interactions entre les différentes espèces végétales. Il mène des recherches sur les écosystèmes naturels, les communautés végétales et les processus écologiques impliquant les plantes.', NULL, 650000, 'Connaissances en écologie végétale, en botanique et en sciences de l''environnement, compétences en techniques d''étude sur le terrain et en analyse de données, capacité de travail en équipe', 116);
-- Ajout du métier : Ingénieur en Informatique
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en Informatique',
        'L''ingénieur en informatique conçoit, développe et optimise des systèmes informatiques. Il intervient dans la programmation, la gestion de projets et la résolution de problèmes informatiques.',
        NULL,
        600000,
        'Programmation, Gestion de projets, Résolution de problèmes',
        117);

-- Ajout du métier : Chercheur en Biologie Moléculaire
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chercheur en Biologie Moléculaire',
        'Le chercheur en biologie moléculaire mène des recherches sur la structure et la fonction des molécules biologiques. Il utilise des techniques avancées pour comprendre les processus cellulaires et génétiques.',
        NULL,
        800000,
        'Biologie Moléculaire, Techniques de recherche, Analyse génétique',
        117);

-- Ajout du métier : Analyste de Données
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Analyste de Données',
        'L''analyste de données analyse et interprète des ensembles de données complexes pour aider les entreprises à prendre des décisions éclairées. Il utilise des outils statistiques et informatiques.',
        NULL,
        550000,
        'Analyse de Données, Statistiques, Programmation',
        117);

-- Ajout du métier : Ingénieur Civil
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur Civil',
        'L''ingénieur civil conçoit, supervise et gère la construction de projets d''infrastructures tels que des routes, des ponts et des bâtiments. Il assure également le suivi des chantiers.',
        NULL,
        700000,
        'Conception, Gestion de projets, Suivi de chantier',
        117);

-- Ajout du métier : Analyste en Cybersécurité
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Analyste en Cybersécurité',
        'L''analyste en cybersécurité protège les systèmes informatiques contre les attaques, les virus et les intrusions. Il met en place des mesures de sécurité et surveille les activités suspectes.',
        NULL,
        650000,
        'Sécurité informatique, Analyse des risques, Veille technologique',
        117);
-- Ajout du métier : Analyste de données
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Analyste de données',
        'L’analyste de données est chargé de collecter, traiter et interpréter des données. Il utilise des outils informatiques avancés pour aider les entreprises à prendre des décisions éclairées.',
        null,
        500000, -- Salaire moyen à ajuster
        'Maîtrise des langages de programmation (Python, R), compétences en statistiques, capacité d’analyse et de synthèse.',
        118);

-- Ajout du métier : Actuaire
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Actuaire',
        'L’actuaire évalue les risques financiers en utilisant des modèles mathématiques et statistiques. Il travaille généralement dans le secteur des assurances et de la finance.',
        null,
        600000, -- Salaire moyen à ajuster
        'Connaissances approfondies en mathématiques, maîtrise des logiciels actuariels, capacité d’analyse.',
        118);

-- Ajout du métier : Chercheur en mathématiques appliquées
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chercheur en mathématiques appliquées',
        'Le chercheur en mathématiques appliquées développe des modèles mathématiques pour résoudre des problèmes concrets dans divers domaines tels que la physique, l’informatique, l’économie, etc.',
        null,
        700000, -- Salaire moyen à ajuster
        'Compétences avancées en mathématiques, maîtrise des techniques de modélisation, capacité à mener des recherches approfondies.',
        118);

-- Ajout du métier : Ingénieur en cryptographie
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en cryptographie',
        'L’ingénieur en cryptographie conçoit des systèmes de sécurité basés sur des algorithmes mathématiques pour protéger les données sensibles. Il travaille souvent dans le domaine de la sécurité informatique.',
        null,
        550000, -- Salaire moyen à ajuster
        'Connaissances approfondies en mathématiques discrètes, maîtrise des algorithmes de cryptographie, compétences en sécurité informatique.',
        118);

-- Ajout du métier : Enseignant-chercheur en mathématiques
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Enseignant-chercheur en mathématiques',
        'L’enseignant-chercheur en mathématiques travaille à la fois dans l’enseignement supérieur et mène des recherches dans son domaine de spécialisation.',
        null,
        650000, -- Salaire moyen à ajuster
        'Compétences pédagogiques, maîtrise des techniques de recherche, connaissances avancées en mathématiques.',
        118);

-- Ajout du métier : Statisticien
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Statisticien',
        'Le statisticien collecte, analyse et interprète des données pour aider à la prise de décision dans divers domaines tels que la santé, l’économie, etc.',
        null,
        580000, -- Salaire moyen à ajuster
        'Maîtrise des méthodes statistiques, compétences en programmation statistique, capacité à interpréter les résultats.',
        118);

-- Ajout du métier : Développeur en intelligence artificielle
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Développeur en intelligence artificielle',
        'Le développeur en intelligence artificielle utilise des concepts mathématiques avancés pour concevoir des systèmes d’intelligence artificielle. Il travaille souvent dans le domaine de la technologie.',
        null,
        620000, -- Salaire moyen à ajuster
        'Compétences en mathématiques, programmation avancée, connaissance des techniques d’apprentissage automatique.',
        118);
-- Ajout du métier: Développeur logiciel
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Développeur logiciel', 'Conçoit, développe et maintient des applications informatiques. Écrit du code source, teste les programmes et corrige les bogues.', 500000, 'Programmation, Conception logicielle, Travail d''équipe, Résolution de problèmes', 119);

-- Ajout du métier: Administrateur système
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Administrateur système', 'Gère et maintient les systèmes informatiques, les réseaux et les bases de données d''une entreprise.', 450000, 'Gestion des réseaux, Sécurité informatique, Dépannage, Automatisation', 119);

-- Ajout du métier: Ingénieur logiciel
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur logiciel', 'Conçoit, développe et optimise des systèmes logiciels complexes en respectant les exigences techniques et fonctionnelles.', 600000, 'Conception logicielle, Architecture logicielle, Gestion de projet, Travail d''équipe', 119);

-- Ajout du métier: Analyste en cybersécurité
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Analyste en cybersécurité', 'Protège les systèmes informatiques et les réseaux d''une entreprise contre les menaces de sécurité.', 550000, 'Sécurité informatique, Analyse des risques, Gestion des incidents, Conformité réglementaire', 119);

-- Ajout du métier: Spécialiste en intelligence artificielle
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Spécialiste en intelligence artificielle', 'Conçoit, développe et déploie des systèmes d''intelligence artificielle pour résoudre des problèmes complexes.', 700000, 'Apprentissage automatique, Traitement du langage naturel, Vision par ordinateur, Statistiques', 119);

-- Ajout du métier: Architecte de données
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Architecte de données', 'Conçoit, met en œuvre et optimise des systèmes de gestion de données pour répondre aux besoins de l''entreprise.', 550000, 'Modélisation de données, Gestion des bases de données, Analytique des données, Gouvernance des données', 119);

-- Ajout du métier: Chef de projet informatique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chef de projet informatique', 'Planifie, coordonne et supervise les projets informatiques en respectant les délais, les budgets et les exigences.', 650000, 'Gestion de projet, Communication, Résolution de problèmes, Leadership', 119);
-- Ajout du métier: Chimiste analytique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chimiste analytique', 'Analyse la composition et la structure des substances chimiques en utilisant des techniques analytiques avancées.', 500000, 'Techniques d''analyse chimique, Instrumentation, Contrôle qualité, Interprétation des données', 120);

-- Ajout du métier: Chimiste de recherche
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chimiste de recherche', 'Conçoit et réalise des expériences chimiques pour développer de nouveaux produits, procédés ou matériaux.', 600000, 'Synthèse chimique, Caractérisation des matériaux, Gestion de projet, Rédaction scientifique', 120);

-- Ajout du métier: Ingénieur en génie chimique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en génie chimique', 'Conçoit, optimise et contrôle les procédés de production chimique à l''échelle industrielle.', 650000, 'Opérations unitaires, Conception de procédés, Sécurité des procédés, Réglementation environnementale', 120);

-- Ajout du métier: Chimiste en environnement
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chimiste en environnement', 'Étudie l''impact des substances chimiques sur l''environnement et développe des solutions pour réduire la pollution.', 550000, 'Chimie environnementale, Écotoxicologie, Gestion des déchets, Développement durable', 120);

-- Ajout du métier: Chimiste en pharmacie
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chimiste en pharmacie', 'Synthétise et caractérise des molécules à visée thérapeutique pour le développement de nouveaux médicaments.', 700000, 'Synthèse organique, Chimie médicinale, Réglementation pharmaceutique, Assurance qualité', 120);
-- Ajout du métier: Physicien de recherche
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Physicien de recherche', 'Mène des recherches théoriques et expérimentales pour explorer les lois fondamentales de la nature et les phénomènes physiques.', 600000, 'Analyse de données, Modélisation, Rédaction scientifique, Travail d''équipe', 121);

-- Ajout du métier: Ingénieur en physique appliquée
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en physique appliquée', 'Applique les principes de la physique pour concevoir et développer de nouveaux produits, systèmes ou technologies.', 550000, 'Conception de systèmes, Simulations, Tests et mesures, Résolution de problèmes', 121);

-- Ajout du métier: Enseignant en physique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Enseignant en physique', 'Enseigne les principes de la physique et guide les étudiants dans leur compréhension du monde naturel.', 400000, 'Pédagogie, Communication, Gestion de classe, Expertise en physique', 121);

-- Ajout du métier: Spécialiste en optique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Spécialiste en optique', 'Conçoit, développe et teste des systèmes optiques pour diverses applications telles que les télécommunications, l''imagerie ou les instruments scientifiques.', 600000, 'Optique géométrique, Optique ondulatoire, Conception de systèmes optiques, Simulation numérique', 121);

-- Ajout du métier: Physicien médical
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Physicien médical', 'Applique les principes de la physique dans le domaine médical pour le diagnostic, le traitement et la recherche en radiologie, radiothérapie et médecine nucléaire.', 650000, 'Physique médicale, Radioprotection, Contrôle qualité, Interaction rayonnement-matière', 121);

-- Ajout du métier: Météorologue
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Météorologue', 'Étudie et prédit les conditions météorologiques en utilisant des modèles numériques et des observations atmosphériques.', 500000, 'Dynamique atmosphérique, Analyse de données, Modélisation numérique, Communication', 121);
-- Ajout du métier: Médecin généraliste
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Médecin généraliste', 'Fournit des soins de santé primaires, diagnostique et traite une variété de maladies et de conditions médicales chez les patients de tous âges.', 800000, 'Diagnostic médical, Gestion des soins, Communication, Éthique médicale', 124);

-- Ajout du métier: Chirurgien
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chirurgien', 'Pratique des interventions chirurgicales pour traiter des maladies, des blessures ou des malformations.', 1200000, 'Techniques chirurgicales, Gestion du stress, Prise de décision rapide, Travail d''équipe', 124);

-- Ajout du métier: Pédiatre
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Pédiatre', 'Spécialiste en santé de l''enfant, diagnostique et traite diverses maladies et problèmes de santé chez les nourrissons, les enfants et les adolescents.', 900000, 'Soins pédiatriques, Communication avec les enfants, Empathie, Connaissance du développement de l''enfant', 124);

-- Ajout du métier: Obstétricien-gynécologue
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Obstétricien-gynécologue', 'Fournit des soins médicaux liés à la grossesse, à l''accouchement et aux problèmes de santé féminins.', 1000000, 'Suivi de grossesse, Accouchement, Chirurgie gynécologique, Soins prénataux et postnataux', 124);

-- Ajout du métier: Psychiatre
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Psychiatre', 'Diagnostique et traite les troubles mentaux, les troubles émotionnels et les troubles du comportement.', 900000, 'Évaluation psychiatrique, Psychothérapie, Pharmacologie, Éthique médicale', 124);

-- Ajout du métier: Radiologue
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Radiologue', 'Utilise des techniques d''imagerie médicale comme les rayons X, l''IRM et la tomodensitométrie pour diagnostiquer et traiter des maladies et des blessures.', 1100000, 'Interprétation d''images médicales, Connaissance de l''anatomie, Communication, Radioprotection', 124);
-- Ajout du métier: Anesthésiste
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Anesthésiste', 'Spécialiste médical chargé d''administrer l''anesthésie aux patients avant une intervention chirurgicale ou un examen médical, et de surveiller leur état pendant et après la procédure.', 1100000, 'Gestion de l''anesthésie, Surveillance des signes vitaux, Réanimation, Travail sous pression', 124);

-- Ajout du métier: Cardiologue
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Cardiologue', 'Médecin spécialisé dans le diagnostic et le traitement des maladies cardiovasculaires, telles que les troubles cardiaques, les accidents vasculaires cérébraux et les maladies des vaisseaux sanguins.', 1200000, 'Interprétation des examens cardiaques, Gestion des urgences cardiaques, Prévention cardiovasculaire, Communication avec les patients', 124);

-- Ajout du métier: Oncologue
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Oncologue', 'Médecin spécialisé dans le diagnostic, le traitement et la prévention des cancers. Établit des plans de traitement personnalisés pour les patients atteints de cancer.', 1300000, 'Diagnostic du cancer, Chimiothérapie, Radiothérapie, Soins palliatifs', 124);

-- Ajout du métier: Neurologue
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Neurologue', 'Médecin spécialisé dans le diagnostic et le traitement des troubles du système nerveux, tels que les maladies du cerveau, de la moelle épinière et des nerfs périphériques.', 1100000, 'Examen neurologique, Interprétation des tests neurologiques, Gestion des troubles neurologiques, Rééducation neurologique', 124);

-- Ajout du métier: Nutritionniste clinique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Nutritionniste clinique', 'Professionnel de la santé spécialisé dans l''évaluation de l''état nutritionnel des patients et l''élaboration de plans alimentaires pour prévenir ou traiter les problèmes de santé liés à l''alimentation.', 600000, 'Évaluation nutritionnelle, Planification des régimes alimentaires, Éducation nutritionnelle, Travail en équipe multidisciplinaire', 124);
-- Ajout du métier: Pharmacien d'officine
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Pharmacien d''officine', 'Prépare et délivre des médicaments sur ordonnance ou en vente libre, conseille les patients sur l''utilisation et les effets secondaires des médicaments.', 600000, 'Connaissance des médicaments, Conseil pharmaceutique, Gestion de stock, Communication', 125);

-- Ajout du métier: Pharmacien hospitalier
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Pharmacien hospitalier', 'Gère l''approvisionnement, la préparation et la distribution des médicaments dans les établissements de santé, assure la sécurité et l''efficacité des traitements médicamenteux.', 700000, 'Gestion des médicaments, Pharmacovigilance, Travail d''équipe, Connaissances cliniques', 125);

-- Ajout du métier: Pharmacien de l'industrie pharmaceutique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Pharmacien de l''industrie pharmaceutique', 'Participe à la recherche, au développement, à la production et au contrôle qualité des médicaments et des produits pharmaceutiques.', 800000, 'Réglementation pharmaceutique, Assurance qualité, Gestion de projet, Expertise scientifique', 125);

-- Ajout du métier: Pharmacien de recherche clinique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Pharmacien de recherche clinique', 'Conçoit, coordonne et surveille les essais cliniques pour évaluer l''efficacité et la sécurité de nouveaux médicaments.', 900000, 'Méthodologie des essais cliniques, Réglementation, Gestion des données, Éthique de la recherche', 125);

-- Ajout du métier: Pharmacien de santé publique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Pharmacien de santé publique', 'Promeut l''utilisation sécuritaire et efficace des médicaments au niveau de la population, développe des programmes de prévention et de gestion des maladies.', 700000, 'Politiques de santé publique, Épidémiologie, Promotion de la santé, Gestion de programmes', 125);

-- Ajout du métier: Pharmacien-toxicologue
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Pharmacien-toxicologue', 'Étudie les effets toxiques des substances chimiques sur les organismes vivants et évalue les risques pour la santé humaine et l''environnement.', 800000, 'Toxicologie, Analyse de risques, Réglementation environnementale, Gestion des urgences toxicologiques', 125);
-- Ajout du métier: Styliste
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Styliste', 'Conçoit des collections de vêtements, d''accessoires et de chaussures en créant des designs originaux et en suivant les tendances de la mode.', 600000, 'Créativité, Connaissance des tendances, Sens du style, Dessin technique', 126);

-- Ajout du métier: Modéliste
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Modéliste', 'Transpose les croquis de mode en patrons techniques permettant la confection des vêtements.', 500000, 'Maîtrise du patronage, Interprétation des croquis, Connaissances techniques, Précision', 126);

-- Ajout du métier: Technicien de production
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Technicien de production', 'Supervise et coordonne les processus de fabrication des vêtements, de la coupe à l''emballage final.', 450000, 'Gestion de la production, Contrôle qualité, Optimisation des processus, Leadership', 126);

-- Ajout du métier: Acheteur textile
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Acheteur textile', 'Sélectionne et achète les tissus, les fournitures et les accessoires nécessaires à la production de vêtements.', 550000, 'Connaissance des textiles, Négociation, Gestion des approvisionnements, Veille sur les tendances', 126);

-- Ajout du métier: Coloriste
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Coloriste', 'Sélectionne et crée les palettes de couleurs pour les collections de vêtements en tenant compte des tendances et des préférences des consommateurs.', 500000, 'Sens des couleurs, Connaissance des techniques de teinture, Créativité, Analyse des tendances', 126);

-- Ajout du métier: Responsable du contrôle qualité
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Responsable du contrôle qualité', 'Assure le respect des normes de qualité tout au long du processus de production des vêtements, de la conception à la livraison.', 600000, 'Méthodologie d''audit, Connaissances techniques, Gestion des non-conformités, Sens de l''organisation', 126);

-- Ajout du métier: Merchandiser
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Merchandiser', 'Coordonne la commercialisation et la présentation visuelle des collections de vêtements dans les points de vente.', 450000, 'Connaissance du merchandising, Sens esthétique, Gestion des stocks, Communication', 126);

-- Ajout du métier: Responsable de la logistique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Responsable de la logistique', 'Gère la chaîne d''approvisionnement et la distribution des vêtements, de la réception des matières premières à la livraison aux clients.', 600000, 'Gestion de la chaîne logistique, Optimisation des flux, Réglementation transport, Gestion des stocks', 126);

-- Ajout du métier: Commerciale mode
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Commercial mode', 'Prospecte et développe le portefeuille clients pour vendre les collections de vêtements auprès des détaillants et des grossistes.', 700000, 'Techniques de vente, Négociation, Connaissance des produits, Gestion de la relation client', 126);

-- Ajout du métier: Responsable développement durable
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Responsable développement durable', 'Définit et met en œuvre la stratégie de développement durable de l''entreprise dans la conception et la production des vêtements.', 650000, 'Réglementation environnementale, Éco-conception, Gestion de projets, Sensibilisation au développement durable', 126);

-- Ajout du métier: Graphiste textile
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Graphiste textile', 'Conçoit et dessine des motifs, des imprimés et des broderies pour décorer les tissus et les vêtements.', 500000, 'Techniques de dessin, Maîtrise des logiciels de création graphique, Créativité, Connaissance des techniques d''impression textile', 126);

-- Ajout du métier: Chef de produit
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chef de produit', 'Coordonne le développement d''une gamme de produits vestimentaires, de la conception à la commercialisation.', 700000, 'Gestion de projet, Connaissance du marché, Sens du style, Analyse des tendances', 126);

-- Ajout du métier: Formateur en mode
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Formateur en mode', 'Enseigne les techniques de conception, de modélisme et de production de vêtements aux futurs professionnels de l''industrie de l''habillement.', 600000, 'Expertise technique, Pédagogie, Communication, Connaissance de l''industrie', 126);

-- Ajout du métier: Influenceur mode
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Influenceur mode', 'Partage son style et ses conseils mode sur les réseaux sociaux pour inspirer et influencer les tendances vestimentaires.', 500000, 'Sens du style, Présence en ligne, Communication, Connaissance des tendances', 126);

-- Ajout du métier: Consultant en image
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Consultant en image', 'Conseille les clients sur leur apparence vestimentaire pour améliorer leur image et leur confiance en soi.', 550000, 'Analyse du style personnel, Connaissance des tendances, Communication, Sens du service', 126);
-- Ajout du métier: Ingénieur en structure
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en structure', 'Conçoit et dimensionne les structures porteuses des ouvrages de génie civil comme les bâtiments, les ponts et les tunnels.', 800000, 'Calcul des structures, Modélisation numérique, Résistance des matériaux, Normes et réglementations', 127);

-- Ajout du métier: Ingénieur en génie maritime
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en génie maritime', 'Conçoit et supervise la construction d''infrastructures maritimes telles que les ports, les digues et les ouvrages côtiers.', 900000, 'Hydraulique maritime, Géotechnique, Conception assistée par ordinateur, Gestion de projet', 127);

-- Ajout du métier: Chef de chantier
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Chef de chantier', 'Coordonne et supervise les travaux de construction sur les chantiers de génie civil.', 600000, 'Planification des travaux, Gestion d''équipe, Contrôle qualité, Sécurité au travail', 127);

-- Ajout du métier: Conducteur de travaux
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Conducteur de travaux', 'Assure le suivi technique et la mise en œuvre des projets de construction sur le terrain.', 500000, 'Lecture de plans, Métrés et devis, Coordination des corps de métier, Respect des normes', 127);

-- Ajout du métier: Ingénieur en voirie et réseaux divers
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en voirie et réseaux divers', 'Conçoit et dimensionne les réseaux routiers, d''assainissement, d''adduction d''eau et d''énergie.', 700000, 'Hydraulique, Topographie, Conception assistée par ordinateur, Étude d''impact environnemental', 127);

-- Ajout du métier: Ingénieur en géotechnique
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en géotechnique', 'Étudie les propriétés mécaniques et physiques des sols et des roches pour dimensionner les fondations des ouvrages.', 800000, 'Mécanique des sols, Essais de laboratoire, Modélisation numérique, Interprétation des sondages', 127);

-- Ajout du métier: Topographe
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Topographe', 'Réalise des relevés topographiques pour établir des plans et des cartes précis des terrains.', 500000, 'Utilisation des instruments topographiques, Calculs de nivellement, Dessin assisté par ordinateur, Travail sur le terrain', 127);

-- Ajout du métier: Économiste de la construction
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Économiste de la construction', 'Établit les coûts et les devis des projets de construction et optimise les ressources financières.', 600000, 'Estimation des coûts, Analyse financière, Gestion budgétaire, Connaissance des marchés publics', 127);

-- Ajout du métier: Ingénieur en bâtiment
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en bâtiment', 'Conçoit et dimensionne les bâtiments résidentiels, commerciaux et industriels en respectant les normes de construction.', 700000, 'Conception architecturale, Calcul des structures, Thermique du bâtiment, Réglementation en vigueur', 127);

-- Ajout du métier: Ingénieur en génie urbain
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en génie urbain', 'Planifie et conçoit l''aménagement des villes et des espaces urbains en tenant compte des aspects techniques, environnementaux et sociaux.', 800000, 'Urbanisme, Mobilité urbaine, Gestion des ressources, Développement durable', 127);

-- Ajout du métier: Ingénieur en énergie et environnement
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Ingénieur en énergie et environnement', 'Conçoit et met en œuvre des solutions pour l''optimisation énergétique des bâtiments et la protection de l''environnement.', 700000, 'Efficacité énergétique, Énergies renouvelables, Gestion des déchets, Réglementation environnementale', 127);

-- Ajout du métier: Expert en sécurité incendie
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Expert en sécurité incendie', 'Évalue les risques d''incendie et conçoit des systèmes de prévention et de protection pour les bâtiments.', 650000, 'Réglementation incendie, Systèmes de détection et d''extinction, Évacuation des personnes, Formation à la sécurité', 127);

-- Ajout du métier: Expert en accessibilité
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Expert en accessibilité', 'Conçoit des aménagements pour rendre les bâtiments et les espaces publics accessibles aux personnes à mobilité réduite.', 600000, 'Réglementation en accessibilité, Conception universelle, Ergonomie, Sensibilisation au handicap', 127);

-- Ajout du métier: Enseignant en génie civil
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id)
VALUES ('Enseignant en génie civil', 'Enseigne les concepts théoriques et les techniques du génie civil aux étudiants universitaires.', 500000, 'Expertise technique, Pédagogie, Communication, Mise à jour des connaissances', 127);
-- Ajout des métiers pour la filière "GENIE ELECTRIQUE"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en électricité industrielle', 'Conception, installation et maintenance des systèmes électriques industriels. Travaille sur la sécurité des installations électriques et l’efficacité énergétique.', null, 1500000, 'Conception électrique, Automatisation industrielle, Sécurité électrique', 128);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en électronique', 'Réparation et maintenance des équipements électroniques. Diagnostique et résout les problèmes techniques.', null, 700000, 'Diagnostic électronique, Réparation, Maintenance préventive', 128);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Concepteur de systèmes embarqués', 'Développement de systèmes électroniques embarqués pour des applications spécifiques comme l’automobile, l’aérospatiale, etc.', null, 1200000, 'Programmation embarquée, Conception matérielle, Tests et validation', 128);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Électrotechnicien', 'Installation, maintenance et réparation des équipements électriques. Travaille sur des systèmes résidentiels et commerciaux.', null, 800000, 'Installation électrique, Maintenance, Dépannage', 128);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chef de projet en génie électrique', 'Gestion de projets liés aux systèmes électriques. Coordination des équipes et suivi de l’avancement des projets.', null, 1800000, 'Gestion de projet, Leadership, Communication', 128);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien de maintenance industrielle', 'Entretien préventif et correctif des équipements électriques dans des environnements industriels.', null, 900000, 'Maintenance industrielle, Dépannage, Lecture de schémas électriques', 128);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en automatisation', 'Conception et mise en place de systèmes d’automatisation pour améliorer l’efficacité des processus industriels.', null, 1600000, 'Automatisation, Programmation PLC, Contrôle-commande', 128);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Électronicien de puissance', 'Conception et maintenance des équipements électroniques utilisés dans la distribution d’énergie électrique.', null, 1300000, 'Électronique de puissance, Maintenance, Analyse de circuit', 128);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en instrumentation et contrôle', 'Installation et maintenance d’instruments de mesure et de contrôle dans des processus industriels.', null, 950000, 'Instrumentation, Contrôle, Calibration', 128);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en énergie renouvelable', 'Développement de solutions énergétiques durables en utilisant des sources d’énergie renouvelable comme le solaire et l’éolien.', null, 1700000, 'Énergie renouvelable, Conception énergétique, Études de faisabilité', 128);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien de bureau d’études électriques', 'Participation à la conception et à la réalisation des projets électriques en bureau d’études.', null, 1000000, 'Conception électrique, Dessin technique, Simulation', 128);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Spécialiste en sécurité électrique', 'Évaluation et mise en place de mesures de sécurité pour prévenir les risques liés à l’électricité.', null, 1400000, 'Sécurité électrique, Audit, Formation', 128);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en éclairage', 'Conception et installation de systèmes d’éclairage intérieur et extérieur.', null, 850000, 'Conception d’éclairage, Installation électrique, Étude de luminosité', 128);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en télécommunications', 'Planification et mise en œuvre de réseaux de télécommunications, y compris la téléphonie et l’accès Internet.', null, 1550000, 'Réseaux de télécommunications, Protocoles de communication, Gestion de réseau', 128);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien de maintenance éolienne', 'Maintenance préventive et corrective des installations éoliennes pour assurer un fonctionnement optimal.', null, 1100000, 'Maintenance éolienne, Diagnostic de panne, Sécurité en hauteur', 128);
-- Ajout des métiers pour la filière "GENIE MECANIQUE"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en conception mécanique', 'Conception et développement de produits mécaniques, en utilisant des logiciels de modélisation et en assurant la faisabilité technique.', null, 1500000, 'Conception mécanique, Modélisation 3D, Analyse de faisabilité', 129);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en mécanique industrielle', 'Maintenance et réparation des équipements mécaniques dans des environnements industriels, en assurant le bon fonctionnement des machines.', null, 700000, 'Maintenance mécanique, Réparation, Diagnostic de panne', 129);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Concepteur de machines automatisées', 'Conception et développement de machines automatisées pour améliorer les processus de production dans l’industrie.', null, 1200000, 'Automatisation, Conception mécanique, Programmation PLC', 129);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en énergétique', 'Optimisation des systèmes énergétiques en travaillant sur la conception et la gestion des équipements liés à la production et à l’utilisation de l’énergie.', null, 800000, 'Énergétique, Conception thermique, Gestion énergétique', 129);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé d’affaires en génie mécanique', 'Gestion de projets liés au génie mécanique, de la conception à la réalisation. Coordination des équipes et suivi des budgets.', null, 1800000, 'Gestion de projet, Coordination, Suivi budgétaire', 129);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien d’usinage', 'Usinage de pièces mécaniques selon des plans précis en utilisant des machines-outils. Respect des tolérances et des normes de qualité.', null, 900000, 'Usinage, Lecture de plans, Contrôle qualité', 129);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en matériaux', 'Étude et sélection des matériaux appropriés pour les applications mécaniques, en tenant compte des propriétés physiques et mécaniques.', null, 1600000, 'Science des matériaux, Sélection des matériaux, Tests mécaniques', 129);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Dessinateur industriel', 'Réalisation de plans détaillés des pièces mécaniques à produire, en utilisant des logiciels de CAO.', null, 1300000, 'Dessin industriel, CAO, Lecture de plans', 129);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en mécanique automobile', 'Conception et développement de systèmes mécaniques pour les véhicules automobiles. Optimisation de la performance et de l’efficacité énergétique.', null, 950000, 'Conception automobile, Dynamique des véhicules, Optimisation énergétique', 129);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable de production', 'Supervision de la production des biens mécaniques, en s’assurant de l’efficacité des processus et du respect des délais.', null, 1700000, 'Gestion de production, Planification, Optimisation des processus', 129);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien de bureau d’études mécaniques', 'Participation à la conception et à la réalisation des projets mécaniques en bureau d’études, en utilisant des logiciels spécialisés.', null, 1000000, 'Conception mécanique, CAO, Simulation', 129);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Spécialiste en maintenance prédictive', 'Mise en place de stratégies de maintenance prédictive basées sur l’analyse des données pour anticiper les pannes mécaniques.', null, 1400000, 'Maintenance prédictive, Analyse de données, Capteurs intelligents', 129);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien de recherche et développement', 'Participation à des projets de recherche visant à développer de nouvelles technologies ou améliorer les produits mécaniques existants.', null, 850000, 'Recherche et développement, Expérimentation, Analyse de résultats', 129);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en mécanique navale', 'Conception et maintenance de systèmes mécaniques pour les navires, en assurant la sécurité et la performance en milieu maritime.', null, 1550000, 'Conception navale, Maintenance maritime, Réglementation maritime', 129);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en robotique industrielle', 'Installation, maintenance et programmation de systèmes robotiques utilisés dans des environnements industriels.', null, 1100000, 'Robotique industrielle, Programmation robotique, Maintenance robotique', 129);
-- Ajout des métiers pour la filière "GENIE FORESTIER"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur forestier', 'Gestion et planification des ressources forestières, y compris la gestion durable des forêts, la sylviculture et la conservation de la biodiversité.', null, 1300000, 'Gestion forestière, Sylviculture, Biodiversité', 335);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en aménagement forestier', 'Mise en œuvre des plans d’aménagement forestier pour optimiser l’utilisation des ressources tout en préservant l’écosystème.', null, 800000, 'Aménagement forestier, Cartographie, Inventaire forestier', 335);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Géomaticien forestier', 'Utilisation de systèmes d’information géographique (SIG) pour cartographier et analyser les données spatiales liées aux ressources forestières.', null, 1000000, 'SIG, Cartographie, Analyse spatiale', 335);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Forestier consultant', 'Fourniture de conseils spécialisés aux propriétaires fonciers, aux entreprises et aux organismes gouvernementaux sur la gestion durable des ressources forestières.', null, 1500000, 'Consultation forestière, Évaluation des ressources, Planification stratégique', 335);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de projet environnemental en milieu forestier', 'Coordination et gestion de projets visant à minimiser l’impact environnemental des activités forestières et à promouvoir la durabilité.', null, 1200000, 'Gestion de projet, Écologie forestière, Évaluation environnementale', 335);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien forestier de protection', 'Surveillance des forêts pour prévenir et contrôler les ravageurs, les incendies et les maladies affectant les arbres et les écosystèmes forestiers.', null, 850000, 'Protection forestière, Surveillance, Gestion des risques', 335);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Gestionnaire de réserves naturelles', 'Planification et gestion des réserves naturelles, en veillant à la protection de la faune, de la flore et des écosystèmes forestiers.', null, 1100000, 'Gestion de réserves naturelles, Conservation, Surveillance écologique', 335);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Spécialiste en foresterie communautaire', 'Facilitation de projets de gestion forestière impliquant les communautés locales, en favorisant une exploitation durable et équitable des ressources forestières.', null, 900000, 'Foresterie communautaire, Partenariat local, Éducation environnementale', 335);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en écologie forestière', 'Étude des interactions entre les organismes vivants et leur environnement forestier, avec un accent sur la biodiversité et l’écologie des écosystèmes forestiers.', null, 950000, 'Écologie forestière, Inventaire biologique, Étude de la biodiversité', 335);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de communication en environnement forestier', 'Communication des enjeux liés à la gestion forestière durable, sensibilisation du public et coordination des efforts de préservation.', null, 800000, 'Communication environnementale, Sensibilisation, Médias sociaux', 335);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Spécialiste en gestion des incendies forestiers', 'Développement de stratégies de prévention et de lutte contre les incendies forestiers, coordination des équipes de lutte en cas d’urgence.', null, 1200000, 'Gestion des incendies, Planification d’urgence, Coordination d’équipes', 335);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chercheur en écologie forestière', 'Conduite de recherches scientifiques sur les écosystèmes forestiers, avec un accent sur la biodiversité, la dynamique des populations et les interactions écologiques.', null, 1400000, 'Recherche scientifique, Méthodologie de recherche, Analyse statistique', 335);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en exploitation forestière', 'Supervision et coordination des opérations d’exploitation forestière, en veillant au respect des normes environnementales et des quotas de récolte.', null, 1000000, 'Exploitation forestière, Gestion opérationnelle, Conformité réglementaire', 335);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Cartographe forestier', 'Production de cartes et de données géographiques détaillées pour soutenir la planification et la gestion des ressources forestières.', null, 850000, 'Cartographie, SIG, Analyse spatiale', 335);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Agent de conservation forestière', 'Surveillance et application des lois et règlements relatifs à la protection des forêts, en assurant la conformité et la préservation des écosystèmes.', null, 950000, 'Application des lois, Surveillance, Lutte contre le braconnage', 335);
-- Ajout des métiers pour la filière "GENIE INFORMATIQUE"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en développement logiciel', 'Conception, développement et maintenance de logiciels en utilisant des langages de programmation. Participation à toutes les phases du cycle de vie du logiciel.', null, 1500000, 'Développement logiciel, Programmation, Analyse des besoins', 336);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Administrateur systèmes et réseaux', 'Gestion et maintenance des systèmes informatiques et des réseaux. Installation de logiciels, surveillance de la performance et résolution des problèmes.', null, 1000000, 'Administration système, Réseaux, Sécurité informatique', 336);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste en cybersécurité', 'Protection des systèmes informatiques contre les attaques malveillantes. Mise en place de mesures de sécurité, détection des vulnérabilités et gestion des incidents.', null, 1300000, 'Cybersécurité, Analyse des risques, Détection d’intrusion', 336);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Développeur web', 'Conception et développement de sites web, applications en ligne et interfaces utilisateur. Utilisation de langages de programmation spécifiques au web.', null, 900000, 'Développement web, HTML, CSS, JavaScript', 336);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Architecte cloud', 'Conception et gestion de l’infrastructure cloud. Mise en place de solutions cloud, optimisation des ressources et garantie de la sécurité des données.', null, 1600000, 'Architecture cloud, Services cloud, Sécurité des données', 336);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste de données', 'Analyse de données pour fournir des insights et des recommandations. Utilisation d’outils statistiques et de visualisation de données.', null, 1200000, 'Analyse de données, Statistiques, Visualisation de données', 336);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Consultant en système d’information', 'Conseil aux entreprises sur l’optimisation de leurs systèmes d’information. Analyse des besoins, recommandations et gestion de projet.', null, 1400000, 'Conseil en SI, Gestion de projet, Analyse des besoins', 336);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Développeur d’applications mobiles', 'Conception et développement d’applications mobiles pour diverses plateformes. Utilisation de langages adaptés aux applications mobiles.', null, 1100000, 'Développement mobile, Programmation, UX/UI design', 336);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Expert en intelligence artificielle', 'Conception et mise en œuvre de solutions basées sur l’intelligence artificielle. Développement d’algorithmes, apprentissage automatique.', null, 1800000, 'Intelligence artificielle, Machine Learning, Deep Learning', 336);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste fonctionnel', 'Analyse des besoins des utilisateurs et traduction en spécifications fonctionnelles. Collaboration étroite avec les développeurs pour garantir la satisfaction des utilisateurs.', null, 950000, 'Analyse fonctionnelle, Communication, Collaboration interdisciplinaire', 336);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Spécialiste en interface utilisateur (UI)', 'Conception des interfaces utilisateur attrayantes et fonctionnelles. Travail sur l’ergonomie, la navigation et l’expérience utilisateur.', null, 850000, 'UI design, UX/UI prototyping, Ergonomie', 336);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Administrateur de bases de données', 'Gestion et maintenance des bases de données. Installation, sauvegarde, optimisation des performances et sécurité des données.', null, 1000000, 'Administration de bases de données, SQL, Sécurité des données', 336);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Développeur de jeux vidéo', 'Conception et programmation de jeux vidéo. Travail sur le gameplay, les graphismes et l’intégration de fonctionnalités.', null, 1300000, 'Développement de jeux, Programmation, Graphismes', 336);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste en veille technologique', 'Surveillance continue des évolutions technologiques pertinentes pour l’entreprise. Analyse des impacts potentiels et recommandations.', null, 900000, 'Veille technologique, Analyse d’impact, Rapports de recommandation', 336);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en réseaux et télécommunications', 'Conception, mise en place et maintenance des infrastructures de réseaux et de télécommunications. Garantie de la connectivité et de la sécurité des communications.', null, 1600000, 'Réseaux, Télécommunications, Sécurité des communications', 336);
-- Ajout des métiers pour la filière "GENIE CHIMIQUE"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur chimiste de recherche', 'Conception et réalisation d’expériences pour développer de nouveaux produits chimiques ou améliorer des produits existants. Analyse des résultats et rédaction de rapports.', null, 1600000, 'Recherche chimique, Expérimentation, Analyse des résultats', 337);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en procédés chimiques', 'Optimisation des processus de production chimique. Conception, mise en œuvre et supervision des procédés industriels.', null, 1500000, 'Procédés chimiques, Optimisation, Supervision industrielle', 337);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chimiste analytique', 'Analyse des échantillons chimiques pour déterminer leur composition et leurs propriétés. Utilisation d’instruments et de méthodes analytiques avancés.', null, 1200000, 'Analyse chimique, Instruments analytiques, Méthodes analytiques', 337);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en génie des polymères', 'Conception et développement de matériaux polymères pour diverses applications industrielles. Optimisation des propriétés mécaniques et chimiques.', null, 1400000, 'Génie des polymères, Développement de matériaux, Optimisation des propriétés', 337);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable de la qualité chimique', 'Mise en place et gestion des normes de qualité dans la production chimique. Contrôle des processus pour assurer la conformité aux normes.', null, 1300000, 'Gestion de la qualité, Contrôle de processus, Normes de qualité', 337);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en environnement chimique', 'Évaluation et gestion des impacts environnementaux des activités chimiques. Conception de solutions pour minimiser l’impact sur l’environnement.', null, 1100000, 'Environnement chimique, Évaluation des impacts, Solutions environnementales', 337);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien de laboratoire chimique', 'Réalisation d’analyses chimiques, tests et expériences en laboratoire. Utilisation d’instruments et de méthodes standard.', null, 700000, 'Techniques de laboratoire, Analyse chimique, Précision', 337);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en biotechnologie', 'Utilisation de techniques chimiques pour le développement de produits biotechnologiques. Conception de procédés pour la production de médicaments, de carburants, etc.', null, 1700000, 'Biotechnologie, Procédés chimiques, Développement de produits', 337);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chercheur en chimie médicinale', 'Conception et développement de composés chimiques pour une utilisation en médecine. Recherche de molécules ayant des propriétés thérapeutiques.', null, 1800000, 'Chimie médicinale, Recherche de médicaments, Pharmacologie', 337);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en génie chimique', 'Conception, optimisation et gestion des procédés de production chimique à grande échelle. Coordination des opérations de l’usine.', null, 1600000, 'Génie chimique, Optimisation de procédés, Gestion opérationnelle', 337);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en chimie industrielle', 'Participation à la mise en œuvre des procédés chimiques dans un contexte industriel. Contrôle des équipements et des processus.', null, 800000, 'Chimie industrielle, Contrôle de processus, Maintenance', 337);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en sécurité chimique', 'Évaluation et gestion des risques liés à l’utilisation de produits chimiques. Mise en place de mesures de sécurité pour protéger les travailleurs et l’environnement.', null, 1400000, 'Sécurité chimique, Évaluation des risques, Mesures de sécurité', 337);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en nanotechnologie', 'Conception et manipulation de matériaux à l’échelle nanométrique. Application de la nanotechnologie dans divers domaines, y compris la médecine et l’électronique.', null, 1700000, 'Nanotechnologie, Manipulation à l’échelle nanométrique, Applications spécifiques', 337);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de développement durable', 'Intégration de pratiques durables dans les activités chimiques. Réduction des impacts environnementaux et promotion de la responsabilité sociale.', null, 1300000, 'Développement durable, Responsabilité sociale, Pratiques écologiques', 337);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Ingénieur en génie des matériaux', 'Conception, développement et évaluation de matériaux pour diverses applications. Sélection de matériaux en fonction de leurs propriétés et performances.', null, 1500000, 'Génie des matériaux, Développement de matériaux, Évaluation des propriétés', 337);
-- Ajout des métiers pour la filière "ECONOMIE SOCIALE ET FAMILIALE"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Conseiller en économie sociale et familiale', 'Accompagnement de familles ou d’individus en difficulté sociale. Conseils sur la gestion du budget, l’accès aux droits sociaux et l’amélioration des conditions de vie.', null, 900000, 'Conseil social, Gestion budgétaire, Accès aux droits sociaux', 338);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Médiateur familial', 'Intervention dans les situations de conflit au sein des familles. Médiation pour favoriser la communication et la résolution de problèmes familiaux.', null, 850000, 'Médiation familiale, Communication, Résolution de conflits', 338);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Animateur socio-éducatif', 'Organisation d’activités sociales et éducatives visant à améliorer la qualité de vie des individus ou des groupes. Animation, coordination et suivi des projets.', null, 800000, 'Animation sociale, Coordination de projets, Éducation populaire', 338);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Conseiller en insertion sociale et professionnelle', 'Accompagnement des personnes en difficulté vers l’insertion sociale et professionnelle. Aide à la recherche d’emploi, conseils sur la formation et le développement des compétences.', null, 950000, 'Insertion sociale, Insertion professionnelle, Conseil en formation', 338);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Éducateur de jeunes enfants', 'Accompagnement et éducation des enfants de 0 à 6 ans. Mise en place d’activités éducatives, développement de la socialisation et du bien-être des enfants.', null, 850000, 'Éducation de la petite enfance, Développement social, Animation', 338);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Assistant de service social', 'Intervention sociale auprès des individus ou des familles en difficulté. Écoute, accompagnement et orientation vers les services appropriés.', null, 1000000, 'Travail social, Écoute, Orientation', 338);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Conseiller en économie solidaire', 'Promotion des activités économiques solidaires. Accompagnement des initiatives locales et promotion des valeurs de solidarité et de coopération.', null, 950000, 'Économie solidaire, Promotion locale, Coopération', 338);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de mission en développement social', 'Conception et mise en œuvre de projets visant à améliorer les conditions de vie dans les communautés. Coordination des actions et suivi des projets.', null, 1100000, 'Développement social, Coordination de projets, Gestion de mission', 338);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable de crèche', 'Gestion administrative et pédagogique d’une structure d’accueil pour les jeunes enfants. Coordination du personnel, suivi du budget et garantie du bien-être des enfants.', null, 1200000, 'Gestion de crèche, Administration, Pédagogie', 338);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de projet en économie sociale', 'Conception et gestion de projets visant à favoriser le développement social et économique. Coordination des partenaires, suivi du budget et évaluation des impacts.', null, 1000000, 'Gestion de projet, Coordination, Évaluation d’impact', 338);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Conseiller en budget familial', 'Accompagnement des familles dans la gestion de leur budget. Conseils sur l’épargne, la planification financière et la résolution des problèmes financiers.', null, 850000, 'Conseil financier, Gestion budgétaire, Planification financière', 338);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Coordinateur d’action sociale', 'Coordination des actions sociales au sein d’une organisation. Collaboration avec les intervenants sociaux, suivi des actions et évaluation des résultats.', null, 1100000, 'Coordination sociale, Collaboration interdisciplinaire, Évaluation de résultats', 338);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable de service en économie sociale', 'Gestion opérationnelle d’un service dédié à l’économie sociale. Planification des activités, supervision du personnel et suivi des résultats.', null, 1200000, 'Gestion opérationnelle, Supervision, Planification', 338);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Éducateur spécialisé', 'Accompagnement et éducation des personnes en situation de handicap ou en difficulté sociale. Développement de compétences adaptatives et promotion de l’autonomie.', null, 1000000, 'Éducation spécialisée, Adaptation, Autonomie', 338);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Conseiller en prévention sociale', 'Mise en place de programmes de prévention sociale. Sensibilisation, formation et suivi des actions visant à prévenir les difficultés sociales.', null, 950000, 'Prévention sociale, Sensibilisation, Formation', 338);
-- Ajout des métiers pour la filière "TECHNIQUES ADMINISTRATIVES"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Assistant administratif', 'Gestion administrative quotidienne au sein d’une organisation. Rédaction de courriers, gestion des appels, organisation de réunions et suivi des dossiers administratifs.', null, 700000, 'Gestion administrative, Rédaction, Organisation', 339);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Secrétaire de direction', 'Assistance au niveau de la direction d’une entreprise. Gestion de l’agenda, organisation des déplacements, rédaction de comptes-rendus et communication interne.', null, 900000, 'Assistance de direction, Organisation, Communication', 339);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Gestionnaire de dossiers administratifs', 'Traitement et suivi des dossiers administratifs. Vérification de la conformité des documents, gestion des formalités administratives et coordination avec les différents services.', null, 750000, 'Gestion de dossiers, Conformité administrative, Coordination', 339);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Agent de bureau', 'Exécution des tâches administratives de base. Classement de documents, réception des appels, gestion du courrier et assistance aux différentes activités de bureau.', null, 600000, 'Tâches administratives, Classement, Assistance de bureau', 339);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Technicien en bureautique', 'Gestion des outils bureautiques au sein d’une organisation. Installation et maintenance des équipements informatiques, assistance aux utilisateurs et gestion des logiciels de bureautique.', null, 800000, 'Bureautique, Maintenance informatique, Assistance aux utilisateurs', 339);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de gestion administrative', 'Coordination des activités administratives au sein d’une entreprise. Suivi des budgets, gestion des ressources matérielles et optimisation des processus administratifs.', null, 1000000, 'Gestion administrative, Coordination, Optimisation des processus', 339);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Spécialiste en traitement de données', 'Collecte, analyse et traitement des données au sein d’une organisation. Utilisation d’outils informatiques pour assurer la qualité des données et générer des rapports.', null, 900000, 'Traitement de données, Analyse de données, Qualité des données', 339);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Agent de service client', 'Réception des appels et gestion des demandes des clients. Résolution des problèmes, assistance aux clients et suivi de la satisfaction client.', null, 750000, 'Service client, Résolution de problèmes, Satisfaction client', 339);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable des achats administratifs', 'Gestion des achats de biens et services pour l’entreprise. Négociation avec les fournisseurs, suivi des contrats et optimisation des coûts.', null, 1100000, 'Gestion des achats, Négociation, Optimisation des coûts', 339);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de communication interne', 'Conception et diffusion des informations au sein de l’entreprise. Organisation d’événements internes, rédaction de communications et gestion des supports de communication.', null, 950000, 'Communication interne, Organisation d’événements, Rédaction', 339);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Assistant en gestion des ressources humaines', 'Assistance dans la gestion des ressources humaines. Gestion des dossiers du personnel, suivi des absences et participation aux processus de recrutement.', null, 850000, 'Gestion des RH, Administration du personnel, Recrutement', 339);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Coordinateur administratif', 'Coordination des activités administratives entre les différents services d’une organisation. Suivi des projets, gestion des plannings et optimisation des processus.', null, 1200000, 'Coordination administrative, Suivi de projets, Optimisation des processus', 339);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Gestionnaire de paie', 'Traitement des éléments liés à la paie des employés. Calcul des salaires, gestion des déclarations sociales et suivi des réglementations en matière de paie.', null, 1000000, 'Gestion de paie, Calcul des salaires, Déclarations sociales', 339);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable de la logistique administrative', 'Gestion logistique des activités administratives. Suivi des stocks, organisation des déplacements professionnels et coordination des livraisons.', null, 1100000, 'Logistique administrative, Suivi des stocks, Coordination des livraisons', 339);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Agent administratif des ventes', 'Support administratif aux équipes commerciales. Gestion des commandes, suivi des livraisons, traitement des litiges et communication avec les clients.', null, 800000, 'Support administratif, Gestion des ventes, Communication client', 339);
-- Ajout des métiers pour la filière "SCIENCES TECHNIQUES ECONOMIQUES ET GESTION"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste financier', 'Analyse des données financières pour évaluer la santé financière d’une entreprise. Préparation de rapports, recommandations d’investissements et suivi des marchés financiers.', null, 1500000, 'Analyse financière, Rapports, Marchés financiers', 340);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Consultant en stratégie d’entreprise', 'Conseils aux entreprises pour développer des stratégies efficaces. Analyse des marchés, identification des opportunités et recommandations pour améliorer la performance.', null, 1800000, 'Stratégie d’entreprise, Analyse de marché, Conseils stratégiques', 340);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé d’études économiques', 'Réalisation d’études sur l’économie locale, nationale ou internationale. Collecte de données, analyse statistique et rédaction de rapports économiques.', null, 1400000, 'Études économiques, Collecte de données, Analyse statistique', 340);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable des ressources humaines', 'Gestion des aspects liés aux ressources humaines au sein d’une entreprise. Recrutement, gestion des carrières, formation et résolution des problèmes RH.', null, 1600000, 'Gestion des RH, Recrutement, Formation', 340);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Auditeur interne', 'Évaluation de la conformité des processus internes d’une organisation. Vérification des comptes, recommandations pour améliorer l’efficacité et la conformité.', null, 1700000, 'Audit interne, Vérification des comptes, Conformité', 340);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste marketing', 'Étude des marchés, analyse des tendances et recommandations pour les stratégies marketing. Collecte et interprétation des données pour aider à la prise de décision.', null, 1600000, 'Analyse marketing, Étude de marché, Collecte de données', 340);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de gestion de projets', 'Coordination et gestion de projets au sein d’une entreprise. Planification, suivi des budgets, communication avec les parties prenantes et résolution des problèmes.', null, 1500000, 'Gestion de projets, Planification, Communication', 340);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable logistique', 'Gestion logistique des opérations d’une entreprise. Suivi des stocks, organisation des livraisons et optimisation des processus logistiques.', null, 1400000, 'Logistique, Gestion des stocks, Optimisation logistique', 340);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste de données', 'Analyse des données pour fournir des informations exploitables. Utilisation d’outils statistiques, création de rapports et recommandations basées sur les analyses.', null, 1700000, 'Analyse de données, Statistiques, Rapports analytiques', 340);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable financier', 'Gestion des aspects financiers d’une entreprise. Préparation des budgets, suivi des indicateurs financiers, reporting et conseils pour optimiser la performance financière.', null, 1800000, 'Gestion financière, Préparation de budgets, Reporting financier', 340);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de relations publiques', 'Gestion des relations entre une entreprise et le public. Organisation d’événements, rédaction de communiqués de presse et maintien d’une image positive de l’entreprise.', null, 1600000, 'Relations publiques, Organisation d’événements, Communication', 340);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de développement commercial', 'Développement et mise en œuvre de stratégies pour augmenter les ventes. Prospection, négociation des contrats et suivi des relations clients.', null, 1700000, 'Développement commercial, Prospection, Négociation', 340);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de conformité', 'Vérification de la conformité des activités d’une entreprise avec les réglementations en vigueur. Élaboration de politiques de conformité et suivi des processus internes.', null, 1600000, 'Conformité, Vérification, Élaboration de politiques', 340);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de communication d’entreprise', 'Développement et mise en œuvre de stratégies de communication. Rédaction de communiqués, gestion des médias sociaux et maintien d’une image positive de l’entreprise.', null, 1500000, 'Communication d’entreprise, Rédaction, Gestion des médias sociaux', 340);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Analyste en gestion des risques', 'Identification et évaluation des risques potentiels pour l’entreprise. Mise en place de stratégies pour minimiser les risques et assurer la continuité des activités.', null, 1750000, 'Gestion des risques, Évaluation des risques, Stratégies de minimisation', 340);
-- Ajout des métiers pour la filière "SCIENCES DE L’EDUCATION"

-- Métier 1
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Enseignant primaire', 'Enseignement des matières de base aux élèves du primaire. Planification des cours, évaluation des élèves et création d’un environnement d’apprentissage favorable.', null, 800000, 'Enseignement, Planification de cours, Évaluation', 341);

-- Métier 2
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Conseiller pédagogique', 'Conseils aux enseignants pour améliorer leurs méthodes d’enseignement. Formation continue, observation des cours et développement de programmes pédagogiques.', null, 1200000, 'Conseil pédagogique, Formation des enseignants, Développement de programmes', 341);

-- Métier 3
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Psychologue scolaire', 'Évaluation des besoins psychologiques des élèves. Conseils individuels ou en groupe, identification des troubles de l’apprentissage et collaboration avec les enseignants et les parents.', null, 1400000, 'Psychologie scolaire, Conseil, Identification des troubles', 341);

-- Métier 4
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Directeur d’établissement scolaire', 'Gestion administrative et pédagogique d’un établissement scolaire. Supervision du personnel, gestion des budgets, relations avec les parents et les autorités éducatives.', null, 1800000, 'Gestion administrative, Gestion pédagogique, Relations publiques', 341);

-- Métier 5
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Éducateur spécialisé', 'Accompagnement et éducation des personnes en situation de handicap ou en difficulté sociale. Développement de compétences adaptatives et promotion de l’autonomie.', null, 1300000, 'Éducation spécialisée, Adaptation, Autonomie', 341);

-- Métier 6
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chargé de formation', 'Conception et mise en œuvre de programmes de formation. Évaluation des besoins en formation, création de supports pédagogiques et animation des sessions de formation.', null, 1500000, 'Conception de formation, Évaluation des besoins, Animation de sessions', 341);

-- Métier 7
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Conseiller d’orientation scolaire et professionnelle', 'Accompagnement des élèves dans leurs choix d’orientation. Tests psychométriques, entretiens individuels et informations sur les filières d’études et les professions.', null, 1300000, 'Orientation scolaire, Tests psychométriques, Conseil professionnel', 341);

-- Métier 8
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Inspecteur de l’éducation nationale', 'Inspection des établissements scolaires pour assurer la qualité de l’enseignement. Évaluation des enseignants, suivi des programmes et rapports aux autorités éducatives.', null, 1700000, 'Inspection éducative, Évaluation des enseignants, Suivi des programmes', 341);

-- Métier 9
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Formateur en entreprise', 'Animation de formations professionnelles au sein des entreprises. Conception de modules de formation, adaptation aux besoins spécifiques des entreprises et évaluation des participants.', null, 1600000, 'Formation professionnelle, Conception de modules, Adaptation aux besoins', 341);

-- Métier 10
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Animateur socio-éducatif', 'Organisation d’activités éducatives et sociales. Animation de groupes, développement de projets éducatifs et suivi du bien-être des participants.', null, 1100000, 'Animation, Développement de projets éducatifs, Suivi social', 341);

-- Métier 11
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Référent éducatif', 'Accompagnement personnalisé des élèves en difficulté. Coordination avec les enseignants, les parents et les professionnels de la santé pour favoriser la réussite scolaire.', null, 1400000, 'Accompagnement personnalisé, Coordination, Relation avec les parents', 341);

-- Métier 12
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Assistant de recherche en éducation', 'Participation à des projets de recherche dans le domaine de l’éducation. Collecte de données, analyse statistique et rédaction de rapports de recherche.', null, 1600000, 'Recherche en éducation, Collecte de données, Analyse statistique', 341);

-- Métier 13
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Coordonnateur pédagogique', 'Coordination des programmes d’enseignement au sein d’un établissement ou d’une organisation éducative. Élaboration des emplois du temps, suivi des enseignants et évaluation des résultats pédagogiques.', null, 1600000, 'Coordination pédagogique, Élaboration des emplois du temps, Évaluation pédagogique', 341);

-- Métier 14
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Chef de projet éducatif', 'Gestion de projets éducatifs au sein d’établissements scolaires ou d’organisations spécialisées. Planification, coordination des équipes et évaluation des résultats.', null, 1700000, 'Gestion de projets éducatifs, Planification, Coordination', 341);

-- Métier 15
INSERT INTO Metiers (Nom, Description, EntreprisesRecrutent, SalaireMoyen, CompetencesCles, Filieres_id) 
VALUES 
('Responsable de la vie étudiante', 'Coordination des activités liées à la vie étudiante au sein d’une institution éducative. Organisation d’événements, soutien aux étudiants et résolution des problèmes.', null, 1500000, 'Coordination vie étudiante, Organisation d’événements, Soutien étudiant', 341);
ALTER TABLE Metiers
ADD COLUMN Principales_Missions TEXT;
ALTER TABLE Temoignage
ALTER COLUMN Photo TYPE VARCHAR(255);
ALTER TABLE Utilisateur
ALTER COLUMN Photo_de_Profil TYPE VARCHAR(255);
ALTER TABLE Administrateur
ALTER COLUMN Photo_de_Profil TYPE VARCHAR(255);
UPDATE Metiers 
SET "principales_missions" = 'Enseigner la langue française et la littérature française, Préparer les cours et les supports pédagogiques, Évaluer les élèves, Encadrer les projets pédagogiques, Participer aux réunions pédagogiques, Assurer un suivi des élèves, Promouvoir la langue et la culture française'
WHERE Nom= 'Enseignant de langues et de littérature française';

UPDATE Metiers
SET "principales_missions" = 'Rédiger des contenus pour différents supports (web, print, etc.), Effectuer des recherches et analyser des informations, Relire et corriger les textes, Respecter les délais et les consignes, Travailler en collaboration avec d’autres professionnels'
WHERE Nom= 'Rédacteur';

UPDATE Metiers
SET "principales_missions" = 'Superviser le processus de publication, Coordonner l’équipe éditoriale, Valider les contenus et les mises en page, Assurer le respect des délais, Gérer les relations avec les auteurs et les fournisseurs, Promouvoir les publications'
WHERE Nom= 'Éditeur';

UPDATE Metiers
SET "principales_missions" = 'Élaborer et mettre en œuvre la stratégie de communication, Gérer les relations avec les médias, Organiser des événements et des campagnes de communication, Produire des contenus pour différents supports, Analyser et suivre les résultats des actions de communication'
WHERE Nom= 'Chargé de communication';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et animer des activités socioculturelles, Favoriser l’intégration et la cohésion sociale, Développer des projets à dimension culturelle et éducative, Encadrer des groupes, Travailler en partenariat avec différents acteurs locaux'
WHERE Nom= 'Animateur socioculturel';

UPDATE Metiers
SET "principales_missions" = 'Enseigner une langue étrangère et sa culture, Préparer les cours et les supports pédagogiques, Évaluer les élèves, Encadrer des projets pédagogiques, Participer aux réunions pédagogiques, Assurer un suivi des élèves, Promouvoir la langue et la culture enseignées'
WHERE Nom= 'Enseignant de la Langue de la littérature et de la culture';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et animer des activités culturelles, Organiser des événements et des ateliers, Sensibiliser le public à la culture, Travailler en partenariat avec différents acteurs culturels, Promouvoir la culture auprès de différents publics'
WHERE Nom= 'Animateur culturel';

UPDATE Metiers
SET "principales_missions" = 'Gérer et valoriser le patrimoine culturel, Organiser des expositions et des événements, Assurer la conservation et la restauration des biens patrimoniaux, Mener des recherches et des études sur le patrimoine, Sensibiliser le public à la richesse du patrimoine'
WHERE Nom= 'Chargé de patrimoine';

UPDATE Metiers
SET "principales_missions" = 'Traduire des textes de différents domaines, Effectuer des recherches terminologiques, Relire et corriger les traductions, Respecter les délais et les consignes, Travailler en collaboration avec d’autres professionnels'
WHERE Nom= 'Traducteur';

UPDATE Metiers
SET "principales_missions" = 'Élaborer et mettre en œuvre la stratégie de communication de l’entreprise, Gérer les relations avec les médias, Organiser des événements et des campagnes de communication, Produire des contenus pour différents supports, Analyser et suivre les résultats des actions de communication'
WHERE Nom= 'Communication d’entreprise';

UPDATE Metiers
SET "principales_missions" = 'Conseiller les clients sur leur stratégie de communication, Concevoir et mettre en œuvre des campagnes de communication, Gérer les relations avec les médias, Organiser des événements, Produire des contenus pour différents supports, Analyser et suivre les résultats des actions de communication'
WHERE Nom= 'Agence conseil en communication';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et mettre en œuvre des campagnes de communication sociale et médiatique, Sensibiliser le public à des enjeux sociétaux, Produire des contenus pour différents supports, Analyser et suivre les résultats des actions de communication, Travailler en partenariat avec différents acteurs'
WHERE Nom= 'Communication sociale et médiatique';

UPDATE Metiers
SET "principales_missions" = 'Analyser les contenus médiatiques, Étudier les effets des médias sur le public, Mener des recherches sur les pratiques médiatiques, Rédiger des rapports d’analyse, Participer à des colloques et des publications scientifiques'
WHERE Nom= 'Analyse des médias';

UPDATE Metiers
SET "principales_missions" = 'Gérer les aspects administratifs et financiers des spectacles, Coordonner les équipes techniques et artistiques, Assurer la promotion et la communication des spectacles, Négocier les contrats avec les partenaires, Veiller au respect des réglementations'
WHERE Nom= 'Administrateur de spectacles';

UPDATE Metiers
SET "principales_missions" = 'Enseigner les techniques théâtrales, Diriger des ateliers de pratique théâtrale, Encadrer des projets de mise en scène, Transmettre une culture théâtrale, Participer à des jurys et des commissions d’évaluation'
WHERE Nom= 'Enseignant de théâtre';

UPDATE Metiers
SET "principales_missions" = 'Gérer des projets administratifs et politiques, Analyser et mettre en œuvre des politiques publiques, Représenter les institutions auprès d’organismes nationaux et internationaux, Rédiger des rapports et des études, Participer à des négociations et des réunions internationales'
WHERE Nom= 'Possibilité de carrière dans les administrations publiques, les organismes Internationaux, les ONG, les ministères';

UPDATE Metiers
SET "principales_missions" = 'Encadrer et animer des groupes d’enfants, Concevoir et mettre en œuvre des activités éducatives et ludiques, Veiller au bien-être et à la sécurité des enfants, Travailler en équipe avec d’autres professionnels, Assurer un suivi individualisé des enfants'
WHERE Nom= 'Secteur social : maison de l’enfance, foyer, crèches';

UPDATE Metiers
SET "principales_missions" = 'Mener des actions de développement et d’aide humanitaire, Sensibiliser le public aux enjeux sociaux et environnementaux, Gérer des projets de terrain, Collecter des fonds et mobiliser des ressources, Travailler en partenariat avec différents acteurs locaux et internationaux'
WHERE Nom= 'Organisations Non Gouvernementales (ONG)';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et régler les éclairages pour des spectacles, Installer et régler les équipements d’éclairage, Collaborer avec le metteur en scène et les autres membres de l’équipe technique, Assurer la maintenance des équipements, Respecter les normes de sécurité'
WHERE Nom= 'Éclairagiste';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et diriger la mise en scène d’une pièce de théâtre ou d’un spectacle, Diriger les comédiens et les équipes techniques, Effectuer des recherches et des choix artistiques, Collaborer avec les différents intervenants, Respecter le budget et les délais de production'
WHERE Nom= 'Metteur en scène';

UPDATE Metiers
SET "principales_missions" = 'Gérer les aspects administratifs et financiers des spectacles, Coordonner les équipes techniques et artistiques, Assurer la promotion et la communication des spectacles, Négocier les contrats avec les partenaires, Veiller au respect des réglementations'
WHERE Nom= 'Administrateur de spectacles';
UPDATE Metiers
SET "principales_missions" = 'Collecter et analyser des données géographiques, Créer et mettre à jour des cartes numériques, Effectuer des relevés de terrain, Réaliser des analyses spatiales, Produire des rapports et des présentations cartographiques'
WHERE Nom= 'Cartographe';

UPDATE Metiers
SET "principales_missions" = 'Collecter et traiter des données géographiques, Créer et mettre à jour des bases de données spatiales, Effectuer des analyses spatiales et géostatistiques, Développer des applications SIG, Produire des cartes et des rapports d’analyse'
WHERE Nom= 'Analyste SIG';

UPDATE Metiers
SET "principales_missions" = 'Enseigner une matière liée à l’environnement (biologie, écologie, géographie, etc.), Préparer les cours et les supports pédagogiques, Évaluer les élèves, Encadrer des projets pédagogiques, Participer aux réunions pédagogiques, Assurer un suivi des élèves, Sensibiliser à la protection de l’environnement'
WHERE Nom= 'Enseignant';

UPDATE Metiers
SET "principales_missions" = 'Identifier et analyser les enjeux environnementaux, Concevoir et mettre en œuvre des projets de protection de l’environnement, Sensibiliser le public et les acteurs concernés, Rédiger des études d’impact et des rapports, Coordonner les équipes et les partenaires'
WHERE Nom= 'Chargé de projet environnementaux';

UPDATE Metiers
SET "principales_missions" = 'Élaborer des plans d’aménagement du territoire, Analyser les enjeux urbains, environnementaux et sociaux, Coordonner les différents acteurs impliqués, Organiser des concertations publiques, Veiller au respect des réglementations et des normes'
WHERE Nom= 'Planificateur Territorial';

UPDATE Metiers
SET "principales_missions" = 'Évaluer les impacts environnementaux et climatiques, Concevoir des stratégies d’adaptation et d’atténuation, Mener des études et des recherches scientifiques, Sensibiliser les décideurs et le public, Participer à des négociations internationales'
WHERE Nom= 'Expert en Environnement et Changements Climatiques';

UPDATE Metiers
SET "principales_missions" = 'Enseigner l’histoire et transmettre des connaissances, Préparer les cours et les supports pédagogiques, Évaluer les élèves, Encadrer des projets pédagogiques, Participer aux réunions pédagogiques, Assurer un suivi des élèves, Susciter l’intérêt pour l’histoire'
WHERE Nom= 'Enseignant';

UPDATE Metiers
SET "principales_missions" = 'Collecter, classer et conserver des archives, Assurer la gestion et la préservation des fonds d’archives, Faciliter l’accès aux archives et en assurer la valorisation, Mener des recherches historiques et documentaires, Participer à des expositions et des publications'
WHERE Nom= 'Archiviste';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches historiques, Collecter et analyser des sources primaires, Rédiger des ouvrages et des articles scientifiques, Enseigner l’histoire, Participer à des colloques et des conférences, Valoriser le patrimoine historique'
WHERE Nom= 'Historien';

UPDATE Metiers
SET "principales_missions" = 'Guider des groupes de visiteurs, Présenter et commenter des lieux, des monuments ou des expositions, Effectuer des recherches historiques et documentaires, Concevoir des circuits et des visites guidées, Promouvoir le patrimoine touristique'
WHERE Nom= 'Guide touristique';

UPDATE Metiers
SET "principales_missions" = 'Gérer et valoriser les collections d’un musée, Organiser des expositions temporaires et permanentes, Assurer la conservation des œuvres et des objets, Mener des recherches et des études, Concevoir des activités et des supports pédagogiques'
WHERE Nom= 'Conservateur de musée';

UPDATE Metiers
SET "principales_missions" = 'Enseigner la philosophie et transmettre des connaissances, Préparer les cours et les supports pédagogiques, Évaluer les élèves, Encadrer des projets pédagogiques, Participer aux réunions pédagogiques, Assurer un suivi des élèves, Susciter la réflexion philosophique'
WHERE Nom= 'Enseignant de philosophie';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches philosophiques, Rédiger des ouvrages et des articles scientifiques, Participer à des colloques et des conférences, Enseigner la philosophie, Contribuer au débat d’idées, Promouvoir la réflexion philosophique'
WHERE Nom= 'Chercheur en philosophie';

UPDATE Metiers
SET "principales_missions" = 'Conseiller des organisations sur des questions éthiques, Analyser des enjeux éthiques et proposer des solutions, Animer des formations et des ateliers sur l’éthique, Rédiger des chartes et des codes de déontologie, Participer à des comités d’éthique'
WHERE Nom= 'Consultant en éthique';

UPDATE Metiers
SET "principales_missions" = 'Écrire des ouvrages philosophiques (essais, romans, etc.), Effectuer des recherches et des lectures approfondies, Promouvoir ses œuvres et participer à des événements littéraires, Contribuer au débat d’idées, Transmettre une réflexion philosophique'
WHERE Nom= 'Écrivain philosophique';

UPDATE Metiers
SET "principales_missions" = 'Présenter et vulgariser des concepts philosophiques, Animer des conférences et des débats, Susciter la réflexion et le questionnement, Promouvoir la philosophie auprès de divers publics, Contribuer à la diffusion de la pensée philosophique'
WHERE Nom= 'Conférencier en philosophie';

UPDATE Metiers
SET "principales_missions" = 'Interpréter un rôle dans une pièce de théâtre, un film ou une série, Étudier et préparer son personnage, Assister aux répétitions et aux tournages, Travailler en collaboration avec le metteur en scène et l’équipe de production, Promouvoir le projet artistique'
WHERE Nom= 'Acteur';

UPDATE Metiers
SET "principales_missions" = 'Diriger la réalisation d’un film ou d’une série, Superviser l’équipe technique et artistique, Effectuer des choix artistiques et narratifs, Gérer le planning et le budget de production, Collaborer avec les différents intervenants du projet'
WHERE Nom= 'Réalisateur';

UPDATE Metiers
SET "principales_missions" = 'Écrire le scénario d’un film, d’une série ou d’une pièce de théâtre, Développer l’histoire, les personnages et les dialogues, Effectuer des recherches et de la documentation, Collaborer avec le réalisateur et les producteurs, Participer au processus de réécriture'
WHERE Nom= 'Scénariste';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et diriger la mise en scène d’une pièce de théâtre, Diriger les comédiens et les équipes techniques, Effectuer des recherches et des choix artistiques, Collaborer avec les différents intervenants, Respecter le budget et les délais de production'
WHERE Nom= 'Metteur en scène';

UPDATE Metiers
SET "principales_missions" = 'Superviser les aspects techniques liés à la photographie d’un film ou d’une série, Diriger l’équipe de prise de vue, Effectuer des choix de cadrage et d’éclairage, Collaborer avec le réalisateur et les autres départements, Veiller au respect du planning et du budget'
WHERE Nom= 'Directeur de la photographie';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en biochimie, Analyser des molécules et des processus biochimiques, Développer des applications biotechnologiques, Enseigner la biochimie, Rédiger des articles scientifiques et des rapports techniques'
WHERE Nom= 'Biochimiste';

UPDATE Metiers
SET "principales_missions" = 'Conduire des recherches en biotechnologie, Développer de nouveaux procédés et produits biotechnologiques, Effectuer des analyses en laboratoire, Rédiger des rapports et des publications scientifiques, Encadrer des projets de recherche'
WHERE Nom= 'Chercheur en biotechnologie';

UPDATE Metiers
SET "principales_missions" = 'Analyser et interpréter les réglementations en biotechnologie, Conseiller les entreprises sur la conformité réglementaire, Évaluer les risques et les impacts des produits biotechnologiques, Participer à l’élaboration de normes et de directives, Assurer une veille réglementaire'
WHERE Nom= 'Consultant en réglementation';

UPDATE Metiers
SET "principales_missions" = 'Enseigner les disciplines liées à la biochimie, Préparer les cours et les supports pédagogiques, Évaluer les étudiants, Encadrer des projets de recherche, Participer aux réunions pédagogiques, Assurer un suivi des étudiants, Promouvoir les sciences de la vie'
WHERE Nom= 'Enseignant en biochimie';

UPDATE Metiers
SET "principales_missions" = 'Assurer le contrôle qualité des procédés et des produits biotechnologiques, Réaliser des analyses en laboratoire, Mettre en place des procédures de contrôle, Veiller au respect des normes et des réglementations, Rédiger des rapports d’analyses et d’audits'
WHERE Nom= 'Spécialiste en contrôle qualité';

UPDATE Metiers
SET "principales_missions" = 'Étudier le comportement, l’écologie et la conservation des animaux, Mener des recherches sur le terrain et en laboratoire, Collecter et analyser des données, Rédiger des publications scientifiques, Enseigner la zoologie, Participer à des programmes de conservation'
WHERE Nom= 'Zoologiste';

UPDATE Metiers
SET "principales_missions" = 'Soigner et traiter les animaux, Réaliser des examens médicaux et des interventions chirurgicales, Conseiller les propriétaires sur les soins à apporter, Assurer la prévention et le suivi sanitaire, Participer à des missions de santé publique vétérinaire'
WHERE Nom= 'Vétérinaire';

UPDATE Metiers
SET "principales_missions" = 'Étudier les populations animales et leurs habitats, Mener des recherches sur la conservation et la gestion de la faune, Collecter et analyser des données sur le terrain, Rédiger des rapports et des publications scientifiques, Participer à des programmes de protection de la biodiversité'
WHERE Nom= 'Biologiste de la faune';
UPDATE Metiers
SET "principales_missions" = 'Étudier les populations animales et leurs habitats naturels, Mener des recherches sur l’écologie et le comportement des animaux, Collecter et analyser des données sur le terrain, Rédiger des rapports et des publications scientifiques, Participer à des programmes de conservation de la faune'
WHERE Nom= 'Écologue animalier';

UPDATE Metiers
SET "principales_missions" = 'Gérer les ressources fauniques et leurs habitats, Élaborer et mettre en œuvre des plans de gestion de la faune, Mener des inventaires et des suivis des populations animales, Sensibiliser le public à la conservation de la faune, Collaborer avec différents acteurs du milieu'
WHERE Nom= 'Gestionnaire de ressources fauniques';

UPDATE Metiers
SET "principales_missions" = 'Étudier les plantes et leurs caractéristiques, Mener des recherches sur la classification, la génétique et l’écologie des plantes, Collecter et analyser des échantillons végétaux, Rédiger des publications scientifiques, Enseigner la botanique, Participer à des programmes de conservation des plantes'
WHERE Nom= 'Botaniste';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en agronomie, Développer des techniques de production agricole, Étudier les sols et les cultures, Conseiller les exploitants agricoles, Enseigner l’agronomie, Participer à des projets de développement rural'
WHERE Nom= 'Agronome';

UPDATE Metiers
SET "principales_missions" = 'Étudier les maladies et les ravageurs des plantes, Identifier les causes des problèmes phytosanitaires, Développer des méthodes de lutte contre les pathogènes, Conseiller les producteurs agricoles, Effectuer des recherches en laboratoire et sur le terrain'
WHERE Nom= 'Phytopathologiste';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en génétique végétale, Développer de nouvelles variétés de plantes, Étudier les mécanismes génétiques des végétaux, Effectuer des analyses en laboratoire, Rédiger des publications scientifiques, Participer à des projets d’amélioration des cultures'
WHERE Nom= 'Généticien végétal';

UPDATE Metiers
SET "principales_missions" = 'Étudier les interactions entre les plantes et leur environnement, Mener des recherches sur l’écologie végétale, Collecter et analyser des données sur le terrain, Rédiger des rapports et des publications scientifiques, Participer à des programmes de conservation des écosystèmes'
WHERE Nom= 'Écologiste végétal';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des logiciels et des applications informatiques, Analyser les besoins des utilisateurs, Coder et tester les programmes, Assurer la maintenance et la mise à jour des systèmes, Collaborer avec d’autres professionnels de l’informatique'
WHERE Nom= 'Ingénieur en Informatique';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en biologie moléculaire, Étudier les mécanismes moléculaires des organismes vivants, Effectuer des expériences en laboratoire, Analyser et interpréter les données, Rédiger des publications scientifiques, Encadrer des projets de recherche'
WHERE Nom= 'Chercheur en Biologie Moléculaire';

UPDATE Metiers
SET "principales_missions" = 'Collecter, traiter et analyser des données, Développer des modèles et des algorithmes d’analyse, Visualiser et communiquer les résultats, Assurer la qualité et l’intégrité des données, Collaborer avec différents départements pour résoudre des problèmes analytiques'
WHERE Nom= 'Analyste de Données';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et superviser des projets de construction, Effectuer des calculs de structure et d’installation, Veiller au respect des normes et des réglementations, Gérer les équipes de chantier, Coordonner les différents intervenants du projet'
WHERE Nom= 'Ingénieur Civil';

UPDATE Metiers
SET "principales_missions" = 'Évaluer les risques et les menaces en cybersécurité, Mettre en place des mesures de protection des systèmes informatiques, Détecter et analyser les incidents de sécurité, Rester informé des nouvelles vulnérabilités et menaces, Sensibiliser les utilisateurs aux bonnes pratiques de sécurité'
WHERE Nom= 'Analyste en Cybersécurité';

UPDATE Metiers
SET "principales_missions" = 'Collecter, traiter et analyser des données, Développer des modèles et des algorithmes d’analyse, Visualiser et communiquer les résultats, Assurer la qualité et l’intégrité des données, Collaborer avec différents départements pour résoudre des problèmes analytiques'
WHERE Nom= 'Analyste de données';

UPDATE Metiers
SET "principales_missions" = 'Évaluer les risques financiers et actuariels, Calculer les primes d’assurance et les réserves, Modéliser les données et effectuer des projections, Rédiger des rapports techniques, Conseiller les compagnies d’assurance sur la gestion des risques'
WHERE Nom= 'Actuaire';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en mathématiques appliquées, Développer des modèles mathématiques pour résoudre des problèmes concrets, Effectuer des simulations et des analyses numériques, Rédiger des publications scientifiques, Enseigner les mathématiques appliquées'
WHERE Nom= 'Chercheur en mathématiques appliquées';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des algorithmes de cryptographie, Assurer la sécurité des communications et des données, Effectuer des analyses de sécurité et de vulnérabilité, Rester informé des dernières avancées en cryptographie, Collaborer avec d’autres experts en sécurité informatique'
WHERE Nom= 'Ingénieur en cryptographie';

UPDATE Metiers
SET "principales_missions" = 'Enseigner les mathématiques à l’université, Préparer les cours et les supports pédagogiques, Encadrer des projets de recherche, Participer à des colloques et des publications scientifiques, Assurer un suivi des étudiants, Promouvoir les mathématiques'
WHERE Nom= 'Enseignant-chercheur en mathématiques';

UPDATE Metiers
SET "principales_missions" = 'Collecter et analyser des données statistiques, Développer des modèles et des méthodes statistiques, Effectuer des études et des sondages, Rédiger des rapports et des publications, Conseiller les organisations sur l’interprétation des résultats'
WHERE Nom= 'Statisticien';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes d’intelligence artificielle, Entraîner des modèles de machine learning, Collecter et préparer les données, Tester et optimiser les algorithmes, Intégrer les solutions d’IA dans des applications'
WHERE Nom= 'Développeur en intelligence artificielle';

UPDATE Metiers
SET "principales_missions" = 'Concevoir, développer et tester des applications logicielles, Analyser les besoins des utilisateurs, Coder et debugger les programmes, Assurer la maintenance et la mise à jour des logiciels, Documenter et former les utilisateurs'
WHERE Nom= 'Développeur logiciel';

UPDATE Metiers
SET "principales_missions" = 'Gérer et administrer les systèmes informatiques, Assurer la sécurité et la disponibilité des serveurs, Effectuer les mises à jour et les sauvegardes, Surveiller les performances et résoudre les incidents, Automatiser les tâches d’administration'
WHERE Nom= 'Administrateur système';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des logiciels, Analyser les besoins fonctionnels et techniques, Coder et tester les programmes, Assurer la maintenance et l’évolution des applications, Documenter et former les utilisateurs, Encadrer des équipes de développement'
WHERE Nom= 'Ingénieur logiciel';

UPDATE Metiers
SET "principales_missions" = 'Évaluer les risques et les menaces en cybersécurité, Mettre en place des mesures de protection des systèmes informatiques, Détecter et analyser les incidents de sécurité, Rester informé des nouvelles vulnérabilités et menaces, Sensibiliser les utilisateurs aux bonnes pratiques de sécurité'
WHERE Nom= 'Analyste en cybersécurité';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes d’intelligence artificielle, Modéliser et entraîner des algorithmes de machine learning, Collecter et préparer les données, Tester et optimiser les modèles, Intégrer les solutions d’IA dans des applications'
WHERE Nom= 'Spécialiste en intelligence artificielle';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et modéliser les architectures de données, Définir les standards et les bonnes pratiques de gestion des données, Superviser la mise en place des solutions de données, Assurer la qualité et la sécurité des données, Collaborer avec les équipes métier et IT'
WHERE Nom= 'Architecte de données';

UPDATE Metiers
SET "principales_missions" = 'Planifier et coordonner les projets informatiques, Gérer les ressources et les délais, Assurer le suivi de l’avancement des projets, Communiquer avec les parties prenantes, Encadrer les équipes techniques, Veiller au respect des objectifs et des budgets'
WHERE Nom= 'Chef de projet informatique';

UPDATE Metiers 
SET "principales_missions" = 'Effectuer des analyses chimiques qualitatives et quantitatives, Utiliser des techniques analytiques (spectrométrie, chromatographie, etc.), Assurer le contrôle qualité des analyses, Rédiger des rapports et des procédures, Respecter les normes de sécurité en laboratoire'
WHERE Nom= 'Chimiste analytique';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en chimie, Concevoir et réaliser des expériences en laboratoire, Analyser et interpréter les résultats, Rédiger des publications scientifiques, Encadrer des projets de recherche, Participer à des conférences et des colloques'
WHERE Nom= 'Chimiste de recherche';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et optimiser des procédés chimiques industriels, Réaliser des simulations et des calculs d’ingénierie, Superviser la construction et l’exploitation d’usines chimiques, Veiller au respect des normes de sécurité et environnementales, Gérer des projets d’ingénierie'
WHERE Nom= 'Ingénieur en génie chimique';

UPDATE Metiers
SET "principales_missions" = 'Étudier les impacts environnementaux des substances chimiques, Analyser la pollution de l’air, de l’eau et des sols, Développer des techniques de traitement et de dépollution, Effectuer des études d’impact et des audits environnementaux, Conseiller sur les réglementations environnementales'
WHERE Nom= 'Chimiste en environnement';

UPDATE Metiers
SET "principales_missions" = 'Synthétiser et analyser des molécules à visée thérapeutique, Développer des méthodes d’analyse et de contrôle qualité, Effectuer des études de stabilité et de formulation, Rédiger des rapports techniques et réglementaires, Respecter les bonnes pratiques de fabrication'
WHERE Nom= 'Chimiste en pharmacie';
UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en physique fondamentale ou appliquée, Concevoir et réaliser des expériences en laboratoire, Analyser et interpréter les résultats, Rédiger des publications scientifiques, Encadrer des projets de recherche, Participer à des conférences et des colloques'
WHERE Nom= 'Physicien de recherche';

UPDATE Metiers
SET "principales_missions" = 'Appliquer les principes de la physique à des problèmes concrets, Concevoir et développer de nouveaux produits ou procédés, Réaliser des simulations et des calculs d’ingénierie, Effectuer des tests et des validations expérimentales, Collaborer avec d’autres ingénieurs et experts techniques'
WHERE Nom= 'Ingénieur en physique appliquée';

UPDATE Metiers
SET "principales_missions" = 'Enseigner les cours de physique à différents niveaux, Préparer les cours et les supports pédagogiques, Encadrer des travaux pratiques et des projets étudiants, Évaluer les élèves et les étudiants, Participer à des activités de recherche en physique'
WHERE Nom= 'Enseignant en physique';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes optiques, Réaliser des simulations et des calculs d’ingénierie optique, Effectuer des tests et des validations expérimentales, Assurer le contrôle qualité des composants optiques, Collaborer avec d’autres ingénieurs et experts techniques'
WHERE Nom= 'Spécialiste en optique';

UPDATE Metiers
SET "principales_missions" = 'Assurer le fonctionnement et la sécurité des équipements médicaux utilisant la physique, Effectuer des calculs dosimétriques pour les traitements de radiothérapie, Réaliser des contrôles qualité et des calibrations, Former le personnel médical à l’utilisation des équipements, Respecter les normes et réglementations en vigueur'
WHERE Nom= 'Physicien médical';

UPDATE Metiers
SET "principales_missions" = 'Étudier l’atmosphère et ses phénomènes, Collecter et analyser des données météorologiques, Effectuer des prévisions météorologiques, Surveiller les conditions météorologiques et les risques potentiels, Rédiger des bulletins et des rapports météorologiques'
WHERE Nom= 'Météorologue';

UPDATE Metiers
SET "principales_missions" = 'Examiner et soigner les patients, Établir des diagnostics, Prescrire des traitements médicaux, Effectuer des gestes techniques, Assurer un suivi médical, Promouvoir la santé et la prévention, Coordonner les soins avec d’autres professionnels de santé'
WHERE Nom= 'Médecin généraliste';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des interventions chirurgicales, Examiner les patients avant et après l’opération, Déterminer le plan opératoire, Superviser l’équipe médicale au bloc opératoire, Assurer le suivi post-opératoire, Respecter les protocoles et les normes de sécurité'
WHERE Nom= 'Chirurgien';

UPDATE Metiers
SET "principales_missions" = 'Examiner et soigner les enfants, Suivre leur croissance et leur développement, Établir des diagnostics et prescrire des traitements, Pratiquer des actes médicaux et des vaccinations, Promouvoir la santé et la prévention auprès des familles'
WHERE Nom= 'Pédiatre';

UPDATE Metiers
SET "principales_missions" = 'Assurer le suivi médical des femmes enceintes, Pratiquer des accouchements, Effectuer des examens gynécologiques, Dépister et traiter les pathologies féminines, Promouvoir la santé reproductive et la planification familiale'
WHERE Nom= 'Obstétricien-gynécologue';

UPDATE Metiers
SET "principales_missions" = 'Diagnostiquer et traiter les troubles psychiatriques, Réaliser des consultations et des suivis thérapeutiques, Prescrire des traitements médicamenteux, Pratiquer des psychothérapies, Travailler en collaboration avec d’autres professionnels de la santé mentale'
WHERE Nom= 'Psychiatre';

UPDATE Metiers
SET "principales_missions" = 'Interpréter des images médicales (radiographies, scanners, IRM, etc.), Établir des diagnostics à partir des examens d’imagerie, Rédiger des comptes rendus détaillés, Collaborer avec les autres médecins pour définir la prise en charge des patients'
WHERE Nom= 'Radiologue';

UPDATE Metiers
SET "principales_missions" = 'Administrer les anesthésies aux patients avant une intervention chirurgicale, Surveiller les paramètres vitaux pendant l’opération, Assurer la gestion de la douleur post-opératoire, Respecter les protocoles et les normes de sécurité'
WHERE Nom= 'Anesthésiste';

UPDATE Metiers
SET "principales_missions" = 'Diagnostiquer et traiter les pathologies cardiaques, Réaliser des examens cardio-vasculaires, Pratiquer des actes médicaux et des interventions cardio-vasculaires, Assurer le suivi des patients souffrant de maladies cardiaques, Promouvoir la prévention des risques cardio-vasculaires'
WHERE Nom= 'Cardiologue';

UPDATE Metiers
SET "principales_missions" = 'Diagnostiquer et traiter les cancers, Réaliser des examens et des bilans, Prescrire des traitements (chimiothérapie, radiothérapie, etc.), Assurer le suivi des patients atteints de cancer, Travailler en équipe pluridisciplinaire, Promouvoir le dépistage et la prévention'
WHERE Nom= 'Oncologue';

UPDATE Metiers
SET "principales_missions" = 'Diagnostiquer et traiter les pathologies du système nerveux, Réaliser des examens neurologiques, Pratiquer des actes médicaux et des interventions neurochirurgicales, Assurer le suivi des patients souffrant de troubles neurologiques, Travailler en collaboration avec d’autres spécialistes'
WHERE Nom= 'Neurologue';

UPDATE Metiers
SET "principales_missions" = 'Évaluer l’état nutritionnel des patients, Élaborer des plans nutritionnels adaptés, Assurer le suivi et l’accompagnement des patients, Promouvoir une alimentation saine et équilibrée, Travailler en collaboration avec les autres professionnels de santé'
WHERE Nom= 'Nutritionniste clinique';

UPDATE Metiers
SET "principales_missions" = 'Délivrer des médicaments sur ordonnance, Conseiller les patients sur l’utilisation des médicaments, Assurer la préparation et le contrôle des préparations pharmaceutiques, Gérer les stocks de médicaments, Promouvoir le bon usage des médicaments'
WHERE Nom= 'Pharmacien d’officine';

UPDATE Metiers
SET "principales_missions" = 'Gérer l’approvisionnement et la distribution des médicaments à l’hôpital, Préparer et contrôler les préparations pharmaceutiques, Conseiller les équipes médicales sur les traitements, Assurer la pharmacovigilance, Participer aux comités thérapeutiques'
WHERE Nom= 'Pharmacien hospitalier';
UPDATE Metiers
SET "principales_missions" = 'Développer et formuler des médicaments, Assurer le contrôle qualité des produits pharmaceutiques, Effectuer des analyses en laboratoire, Rédiger les dossiers réglementaires, Participer aux essais cliniques, Respecter les bonnes pratiques de fabrication'
WHERE Nom= 'Pharmacien de l’industrie pharmaceutique';

UPDATE Metiers
SET "principales_missions" = 'Coordonner et superviser les essais cliniques, Élaborer les protocoles d’études, Assurer le respect des réglementations, Encadrer les équipes de recherche clinique, Analyser et interpréter les données, Rédiger les rapports et les publications'
WHERE Nom= 'Pharmacien de recherche clinique';

UPDATE Metiers
SET "principales_missions" = 'Élaborer et mettre en œuvre des politiques de santé publique, Promouvoir la prévention et l’éducation à la santé, Gérer les programmes de santé communautaire, Analyser les données épidémiologiques, Collaborer avec les autorités et les partenaires locaux'
WHERE Nom= 'Pharmacien de santé publique';

UPDATE Metiers
SET "principales_missions" = 'Étudier les effets toxiques des substances chimiques et des médicaments, Réaliser des analyses toxicologiques, Évaluer les risques toxicologiques, Participer à des expertises médico-légales, Promouvoir la sécurité des produits et la prévention des intoxications'
WHERE Nom= 'Pharmacien-toxicologue';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et créer des collections de vêtements, Réaliser des croquis et des illustrations de mode, Sélectionner les matières et les couleurs, Superviser la réalisation des prototypes, Définir les tendances et les styles à venir'
WHERE Nom= 'Styliste';

UPDATE Metiers
SET "principales_missions" = 'Réaliser les patrons et les gradations des vêtements, Effectuer les mises au point des prototypes, Collaborer avec les stylistes et les équipes de production, Maîtriser les techniques de patronage et de gradation, Respecter les normes et les contraintes techniques'
WHERE Nom= 'Modéliste';

UPDATE Metiers
SET "principales_missions" = 'Assurer la production des vêtements en usine, Superviser les équipes de couture et de finition, Contrôler la qualité des produits, Optimiser les processus de fabrication, Respecter les délais et les coûts de production'
WHERE Nom= 'Technicien de production';

UPDATE Metiers
SET "principales_missions" = 'Rechercher et sélectionner les fournisseurs de matières premières, Négocier les prix et les conditions d’achat, Gérer les approvisionnements et les stocks, Suivre les tendances et les innovations textiles, Respecter les contraintes budgétaires et qualitatives'
WHERE Nom= 'Acheteur textile';

UPDATE Metiers
SET "principales_missions" = 'Sélectionner les couleurs et les harmonies chromatiques, Effectuer des nuanciers et des recherches de teintes, Contrôler la conformité des couleurs, Conseiller les équipes créatives et techniques, Maîtriser les techniques de teinture et d’impression'
WHERE Nom= 'Coloriste';

UPDATE Metiers
SET "principales_missions" = 'Contrôler la qualité des produits tout au long de la chaîne de production, Effectuer des audits et des contrôles qualité, Veiller au respect des normes et des spécifications, Former les équipes aux procédures et aux outils de contrôle, Analyser les non-conformités et proposer des actions correctives'
WHERE Nom= 'Responsable du contrôle qualité';

UPDATE Metiers
SET "principales_missions" = 'Gérer l’assortiment des produits en magasin, Définir les plans de collection et de merchandising, Analyser les ventes et les tendances, Optimiser la présentation et la mise en valeur des produits, Collaborer avec les équipes commerciales et marketing'
WHERE Nom= 'Merchandiser';

UPDATE Metiers
SET "principales_missions" = 'Planifier et organiser les opérations logistiques, Optimiser les flux de marchandises, Gérer les stocks et les inventaires, Coordonner les équipes de transport et de manutention, Assurer le suivi et la traçabilité des commandes'
WHERE Nom= 'Responsable de la logistique';

UPDATE Metiers
SET "principales_missions" = 'Prospecter et développer un portefeuille de clients, Présenter et vendre les collections de mode, Négocier les conditions commerciales, Atteindre les objectifs de vente, Assurer un suivi de la clientèle et du service après-vente'
WHERE Nom= 'Commercial mode';

UPDATE Metiers
SET "principales_missions" = 'Élaborer et mettre en œuvre la stratégie de développement durable, Sensibiliser les équipes aux enjeux environnementaux et sociaux, Mettre en place des actions éco-responsables, Effectuer des audits et des évaluations, Rédiger des rapports de développement durable'
WHERE Nom= 'Responsable développement durable';

UPDATE Metiers
SET "principales_missions" = 'Concevoir des motifs, des imprimés et des illustrations pour les collections textiles, Réaliser des recherches créatives et des tendances, Maîtriser les techniques de création graphique, Collaborer avec les équipes de stylisme et de production'
WHERE Nom= 'Graphiste textile';

UPDATE Metiers
SET "principales_missions" = 'Définir la stratégie produit et les plans de collection, Coordonner les équipes créatives et techniques, Analyser les tendances et les comportements des consommateurs, Gérer le cycle de vie des produits, Assurer le lancement et le suivi des collections'
WHERE Nom= 'Chef de produit';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et animer des formations techniques et créatives, Transmettre les savoir-faire et les compétences liés à la mode, Élaborer des contenus et des supports pédagogiques, Évaluer les acquis des apprenants, Promouvoir les formations dans le secteur de la mode'
WHERE Nom= 'Formateur en mode';

UPDATE Metiers
SET "principales_missions" = 'Promouvoir des marques et des produits de mode sur les réseaux sociaux, Créer du contenu attractif (photos, vidéos, etc.), Interagir avec sa communauté, Analyser les tendances et les comportements des consommateurs, Collaborer avec les marques pour des partenariats'
WHERE Nom= 'Influenceur mode';

UPDATE Metiers
SET "principales_missions" = 'Conseiller les clients sur leur image et leur style vestimentaire, Réaliser des analyses de morphologie et de colorimétrie, Proposer des solutions vestimentaires adaptées, Organiser des séances de relooking, Accompagner les clients dans leur projet d’image'
WHERE Nom= 'Consultant en image';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et dimensionner les structures des bâtiments, Effectuer des calculs de résistance des matériaux, Réaliser des études de stabilité et de sécurité, Superviser la mise en œuvre des structures sur les chantiers, Rédiger les notes de calcul et les rapports techniques'
WHERE Nom= 'Ingénieur en structure';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et dimensionner les navires et les structures maritimes, Effectuer des études hydrodynamiques et de stabilité, Optimiser les performances et l’efficacité énergétique, Superviser la construction et les essais en mer, Assurer le respect des normes et des réglementations maritimes'
WHERE Nom= 'Ingénieur en génie maritime';  

UPDATE Metiers
SET "principales_missions" = 'Planifier et coordonner les travaux sur les chantiers de construction, Gérer les ressources humaines et les approvisionnements, Assurer le respect des délais, des coûts et des normes de sécurité, Superviser les équipes d’ouvriers et d’artisans, Communiquer avec les différents intervenants'
WHERE Nom= 'Chef de chantier';

UPDATE Metiers
SET "principales_missions" = 'Diriger et encadrer les équipes d’ouvriers sur les chantiers, Organiser et suivre l’avancement des travaux, Veiller au respect des normes de sécurité, Contrôler la qualité des réalisations, Assurer la coordination avec les autres corps de métier'
WHERE Nom= 'Conducteur de travaux';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et dimensionner les infrastructures routières et les réseaux divers, Réaliser des études de faisabilité et d’impact, Planifier et coordonner les travaux, Assurer le suivi et le contrôle de la construction, Respecter les normes techniques et environnementales'
WHERE Nom= 'Ingénieur en voirie et réseaux divers';

UPDATE Metiers
SET "principales_missions" = 'Étudier les caractéristiques des sols et des sous-sols, Réaliser des études de stabilité et de risques géotechniques, Dimensionner les ouvrages de soutènement et de fondation, Superviser les travaux de terrassement et de consolidation, Assurer le respect des normes de sécurité'
WHERE Nom= 'Ingénieur en géotechnique';

UPDATE Metiers
SET "principales_missions" = 'Effectuer des relevés topographiques et des mesures de terrain, Réaliser des plans et des modèles numériques de terrain, Implanter des ouvrages et des infrastructures, Assurer le suivi et le contrôle des travaux, Maîtriser les instruments et les logiciels de topographie'
WHERE Nom= 'Topographe';

UPDATE Metiers
SET "principales_missions" = 'Analyser les coûts et les rentabilités des projets de construction, Réaliser des études de prix et des devis estimatifs, Optimiser les coûts de réalisation et d’exploitation, Élaborer des outils d’aide à la décision économique, Participer aux négociations contractuelles'
WHERE Nom= 'Économiste de la construction';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et dimensionner les bâtiments et les ouvrages, Effectuer des études de structure et d’équipements techniques, Planifier et coordonner les travaux, Assurer le suivi et le contrôle de la construction, Veiller au respect des normes et des réglementations'
WHERE Nom= 'Ingénieur en bâtiment';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et aménager les espaces urbains, Réaliser des études d’urbanisme et de planification territoriale, Coordonner les différents intervenants sur les projets, Prendre en compte les enjeux environnementaux et sociaux, Promouvoir un développement urbain durable'
WHERE Nom= 'Ingénieur en génie urbain';

UPDATE Metiers
SET "principales_missions" = 'Concevoir des systèmes et des équipements respectueux de l’environnement, Optimiser l’efficacité énergétique des bâtiments et des installations, Réaliser des études d’impact environnemental, Promouvoir les énergies renouvelables et les technologies propres, Sensibiliser aux enjeux du développement durable'
WHERE Nom= 'Ingénieur en énergie et environnement';

UPDATE Metiers
SET "principales_missions" = 'Étudier les risques d’incendie et les mesures de prévention, Concevoir des systèmes de sécurité incendie, Réaliser des audits et des diagnostics de sécurité, Former les équipes à la gestion des situations d’urgence, Veiller au respect des normes et des réglementations'
WHERE Nom= 'Expert en sécurité incendie';

UPDATE Metiers
SET "principales_missions" = 'Évaluer l’accessibilité des bâtiments et des espaces publics, Proposer des solutions pour faciliter l’accès aux personnes à mobilité réduite, Réaliser des audits et des diagnostics d’accessibilité, Sensibiliser les professionnels aux enjeux de l’accessibilité, Veiller au respect des normes et des réglementations'
WHERE Nom= 'Expert en accessibilité';

UPDATE Metiers
SET "principales_missions" = 'Enseigner les disciplines du génie civil à différents niveaux, Préparer les cours et les supports pédagogiques, Encadrer des projets et des travaux pratiques, Effectuer des recherches dans le domaine du génie civil, Participer à des jurys et des commissions d’évaluation'
WHERE Nom= 'Enseignant en génie civil';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et dimensionner les installations électriques industrielles, Réaliser des schémas et des plans d’installation, Superviser la mise en œuvre et les essais, Assurer la maintenance et le dépannage des équipements, Veiller au respect des normes de sécurité électrique'
WHERE Nom= 'Ingénieur en électricité industrielle';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des installations et des équipements électroniques, Effectuer des réparations et des dépannages, Assurer la maintenance préventive des systèmes, Respecter les normes et les procédures de sécurité, Rédiger des rapports techniques et d’intervention'
WHERE Nom= 'Technicien en électronique';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes électroniques embarqués, Programmer les cartes électroniques et les microcontrôleurs, Réaliser des tests et des validations, Intégrer les systèmes dans des équipements ou des véhicules, Rédiger la documentation technique'
WHERE Nom= 'Concepteur de systèmes embarqués';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des installations électriques dans les bâtiments et les locaux industriels, Effectuer le câblage et le raccordement des équipements, Assurer la maintenance et les dépannages, Respecter les normes et les règles de sécurité, Rédiger des rapports d’intervention'
WHERE Nom= 'Électrotechnicien';

UPDATE Metiers
SET "principales_missions" = 'Planifier et coordonner les projets d’installations électriques, Gérer les ressources humaines et les approvisionnements, Assurer le suivi des travaux et le respect des délais, Contrôler la qualité des réalisations, Veiller au respect des normes de sécurité'
WHERE Nom= 'Chef de projet en génie électrique';

UPDATE Metiers
SET "principales_missions" = 'Assurer la maintenance préventive et curative des équipements industriels, Effectuer des dépannages et des réparations, Réaliser des contrôles et des réglages, Respecter les consignes de sécurité, Rédiger des rapports d’intervention'
WHERE Nom= 'Technicien de maintenance industrielle';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes automatisés, Programmer les automates et les systèmes de contrôle, Intégrer les équipements dans les procédés industriels, Effectuer la mise en service et les tests, Assurer la maintenance et l’optimisation des installations'
WHERE Nom= 'Ingénieur en automatisation';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes électroniques de puissance, Dimensionner les convertisseurs et les composants de puissance, Réaliser des simulations et des tests, Assurer l’intégration et la mise en service des équipements, Respecter les normes de sécurité électrique'
WHERE Nom= 'Électronicien de puissance';

UPDATE Metiers
SET "principales_missions" = 'Installer et configurer des systèmes d’instrumentation et de contrôle, Effectuer des réglages et des étalonnages, Assurer la maintenance et le dépannage des équipements, Analyser les données de mesure, Rédiger des rapports techniques'
WHERE Nom= 'Technicien en instrumentation et contrôle';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et dimensionner des installations de production d’énergie renouvelable, Réaliser des études de faisabilité et d’optimisation, Superviser la construction et la mise en service des équipements, Assurer le suivi et la maintenance des installations, Promouvoir les énergies renouvelables'
WHERE Nom= 'Ingénieur en énergie renouvelable';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des études techniques et des plans d’installations électriques, Concevoir des schémas de câblage et de raccordement, Effectuer des calculs de dimensionnement, Rédiger les cahiers des charges et les notices techniques, Assurer le suivi et la coordination des projets'
WHERE Nom= 'Technicien de bureau d’études électriques';

UPDATE Metiers
SET "principales_missions" = 'Évaluer les risques électriques et les mesures de prévention, Effectuer des audits et des diagnostics de sécurité, Former les équipes aux règles de sécurité électrique, Investiguer les accidents et les incidents liés à l’électricité, Veiller au respect des normes et des réglementations'
WHERE Nom= 'Spécialiste en sécurité électrique';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et dimensionner des installations d’éclairage, Réaliser des études d’éclairement et de consommation énergétique, Sélectionner les sources lumineuses et les équipements, Superviser la mise en œuvre et les réglages, Assurer la maintenance des installations d’éclairage'
WHERE Nom= 'Technicien en éclairage';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des réseaux et des systèmes de télécommunications, Dimensionner les infrastructures et les équipements, Assurer le déploiement et la mise en service des installations, Optimiser les performances et la qualité de service, Respecter les normes et les réglementations des télécoms'
WHERE Nom= 'Ingénieur en télécommunications';

UPDATE Metiers
SET "principales_missions" = 'Assurer la maintenance préventive et curative des éoliennes, Effectuer des inspections et des réparations mécaniques et électriques, Respecter les consignes de sécurité sur les sites éoliens, Rédiger des rapports d’intervention, Participer aux opérations de mise en service et de démantèlement'
WHERE Nom= 'Technicien de maintenance éolienne';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des produits mécaniques, Réaliser des calculs et des simulations numériques, Modéliser les pièces et les ensembles en CAO, Rédiger les dossiers techniques et les plans de définition, Assurer le suivi de la mise en production'
WHERE Nom= 'Ingénieur en conception mécanique';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des opérations d’usinage, de montage et de réparation sur des équipements mécaniques, Effectuer des réglages et des contrôles de conformité, Assurer la maintenance préventive des installations industrielles, Respecter les consignes de sécurité, Rédiger des rapports d’intervention'
WHERE Nom= 'Technicien en mécanique industrielle';
UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des machines et des systèmes automatisés, Modéliser et simuler les mécanismes, Programmer les automates et les systèmes de contrôle, Intégrer les équipements dans les procédés industriels, Assurer la mise en service et la maintenance'
WHERE Nom= 'Concepteur de machines automatisées';

UPDATE Metiers
SET "principales_missions" = 'Optimiser la performance énergétique des installations industrielles, Concevoir des systèmes de production et de distribution d’énergie, Réaliser des audits et des bilans énergétiques, Promouvoir les énergies renouvelables, Assurer la formation et le conseil auprès des entreprises'
WHERE Nom= 'Ingénieur en énergétique';

UPDATE Metiers
SET "principales_missions" = 'Prospecter et développer un portefeuille de clients, Répondre aux appels d’offres et rédiger les devis, Négocier les conditions commerciales, Assurer le suivi des projets de génie mécanique, Coordonner les équipes techniques et les sous-traitants'
WHERE Nom= 'Chargé d’affaires en génie mécanique';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des opérations d’usinage sur des machines-outils, Effectuer des réglages et des contrôles de conformité, Lire et interpréter les plans techniques, Assurer la maintenance des équipements d’usinage, Respecter les consignes de sécurité'
WHERE Nom= 'Technicien d’usinage';

UPDATE Metiers
SET "principales_missions" = 'Étudier les propriétés et le comportement des matériaux, Sélectionner les matériaux adaptés aux applications industrielles, Développer de nouveaux matériaux et procédés de fabrication, Effectuer des tests et des caractérisations, Assurer une veille technologique'
WHERE Nom= 'Ingénieur en matériaux';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des plans techniques et des schémas en DAO, Dessiner des pièces, des ensembles mécaniques et des circuits, Mettre en plan les solutions techniques, Rédiger les nomenclatures et les notices techniques, Assurer la gestion des données techniques'
WHERE Nom= 'Dessinateur industriel';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes mécaniques pour l’automobile, Réaliser des simulations et des calculs d’ingénierie, Participer à la conception des véhicules, Optimiser les performances et la fiabilité des composants, Assurer le suivi de la production'
WHERE Nom= 'Ingénieur en mécanique automobile';

UPDATE Metiers
SET "principales_missions" = 'Planifier et organiser les activités de production, Gérer les ressources humaines et les approvisionnements, Optimiser les processus de fabrication, Assurer le respect des délais et des objectifs de qualité, Analyser les indicateurs de performance'
WHERE Nom= 'Responsable de production';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des études techniques et des plans d’ensembles mécaniques, Effectuer des calculs de dimensionnement et de simulation, Rédiger les cahiers des charges et les spécifications techniques, Assurer le suivi et la coordination des projets'
WHERE Nom= 'Technicien de bureau d’études mécaniques';

UPDATE Metiers
SET "principales_missions" = 'Mettre en place des stratégies de maintenance prédictive, Analyser les données de surveillance des équipements, Détecter les défaillances potentielles, Optimiser les interventions de maintenance, Former les équipes aux techniques de maintenance prédictive'
WHERE Nom= 'Spécialiste en maintenance prédictive';

UPDATE Metiers
SET "principales_missions" = 'Effectuer des essais et des tests en laboratoire, Réaliser des prototypes et des maquettes, Analyser les résultats expérimentaux, Participer au développement de nouveaux produits ou procédés, Rédiger des rapports techniques et des modes opératoires'
WHERE Nom= 'Technicien de recherche et développement';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes mécaniques pour les navires, Réaliser des études hydrodynamiques et de stabilité, Participer à la conception des coques et des équipements navals, Optimiser les performances et la fiabilité des composants, Assurer le suivi de la construction navale'
WHERE Nom= 'Ingénieur en mécanique navale';

UPDATE Metiers
SET "principales_missions" = 'Programmer et mettre en service des robots industriels, Effectuer la maintenance et le dépannage des équipements robotisés, Assurer la sécurité des installations robotiques, Former les opérateurs aux systèmes de robotique, Optimiser les processus automatisés'
WHERE Nom= 'Technicien en robotique industrielle';

UPDATE Metiers
SET "principales_missions" = 'Gérer et aménager les forêts de manière durable, Élaborer des plans d’aménagement forestier, Effectuer des inventaires et des suivis des ressources forestières, Encadrer les travaux sylvicoles, Promouvoir la protection et la valorisation des forêts'
WHERE Nom= 'Ingénieur forestier';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des travaux d’aménagement et d’entretien en milieu forestier, Effectuer des éclaircies et des coupes, Participer aux reboisements et aux travaux sylvicoles, Utiliser les équipements et les techniques forestières, Respecter les normes de sécurité et d’environnement'
WHERE Nom= 'Technicien en aménagement forestier';

UPDATE Metiers
SET "principales_missions" = 'Collecter et analyser des données géographiques sur les milieux forestiers, Créer et mettre à jour des bases de données cartographiques, Réaliser des cartes et des plans de gestion forestière, Utiliser les outils de géomatique et de télédétection'
WHERE Nom= 'Géomaticien forestier';

UPDATE Metiers
SET "principales_missions" = 'Conseiller les propriétaires forestiers et les entreprises du secteur, Réaliser des études et des plans d’aménagement, Effectuer des inventaires et des évaluations de ressources, Assurer une veille réglementaire et technique, Promouvoir la gestion durable des forêts'
WHERE Nom= 'Forestier consultant';

UPDATE Metiers
SET "principales_missions" = 'Planifier et coordonner des projets environnementaux en milieu forestier, Réaliser des études d’impact et des plans de gestion, Mener des actions de conservation et de restauration des écosystèmes, Sensibiliser les acteurs et le public, Assurer le suivi et l’évaluation des projets'
WHERE Nom= 'Chargé de projet environnemental en milieu forestier';

UPDATE Metiers
SET "principales_missions" = 'Surveiller et protéger les forêts contre les incendies, les parasites et les maladies, Mettre en œuvre des mesures de prévention et de lutte, Sensibiliser le public aux risques, Participer aux opérations de secours en cas de sinistre, Rédiger des rapports d’intervention'
WHERE Nom= 'Technicien forestier de protection';

UPDATE Metiers
SET "principales_missions" = 'Gérer et valoriser les réserves naturelles et les espaces protégés, Élaborer des plans de gestion et de conservation, Encadrer les travaux d’entretien et d’aménagement, Sensibiliser le public à la protection de la nature, Assurer la surveillance et le suivi écologique'
WHERE Nom= 'Gestionnaire de réserves naturelles';

UPDATE Metiers
SET "principales_missions" = 'Promouvoir la gestion participative des forêts avec les populations locales, Organiser des programmes de sensibilisation et de formation, Faciliter la concertation entre les différents acteurs, Valoriser les savoirs et les pratiques traditionnelles, Contribuer au développement socio-économique des communautés'
WHERE Nom= 'Spécialiste en foresterie communautaire';

UPDATE Metiers
SET "principales_missions" = 'Étudier le fonctionnement des écosystèmes forestiers, Mener des recherches sur le terrain et en laboratoire, Collecter et analyser des données écologiques, Rédiger des publications scientifiques, Participer à des programmes de conservation de la biodiversité'
WHERE Nom= 'Technicien en écologie forestière';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et mettre en œuvre des stratégies de communication sur les enjeux forestiers, Sensibiliser le public et les acteurs concernés, Organiser des événements et des campagnes de sensibilisation, Produire des contenus de communication (print, web, etc.), Assurer les relations avec les médias'
WHERE Nom= 'Chargé de communication en environnement forestier';

UPDATE Metiers
SET "principales_missions" = 'Évaluer les risques d’incendie en milieu forestier, Élaborer des plans de prévention et de lutte contre les incendies, Former les équipes d’intervention, Superviser les opérations de secours en cas de sinistre, Analyser les causes et les conséquences des feux de forêt'
WHERE Nom= 'Spécialiste en gestion des incendies forestiers';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches sur les écosystèmes forestiers et leur fonctionnement, Étudier les interactions entre les facteurs biotiques et abiotiques, Collecter et analyser des données de terrain, Rédiger des publications scientifiques, Participer à des projets de conservation et de gestion durable des forêts'
WHERE Nom= 'Chercheur en écologie forestière';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des travaux d’exploitation forestière (abattage, débardage, etc.), Utiliser les équipements et les techniques d’exploitation, Respecter les normes de sécurité et d’environnement, Assurer la traçabilité des bois récoltés, Participer à l’entretien et à la maintenance des équipements'
WHERE Nom= 'Technicien en exploitation forestière';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des cartes et des plans des massifs forestiers, Collecter et analyser des données géographiques, Effectuer des relevés topographiques sur le terrain, Utiliser les outils de cartographie numérique, Produire des documents cartographiques pour la gestion forestière'
WHERE Nom= 'Cartographe forestier';

UPDATE Metiers
SET "principales_missions" = 'Surveiller et protéger les forêts contre les infractions (défrichements illégaux, braconnage, etc.), Effectuer des contrôles et des patrouilles en milieu forestier, Sensibiliser le public à la réglementation, Dresser des procès-verbaux en cas d’infraction, Assurer la sécurité des massifs forestiers'
WHERE Nom= 'Agent de conservation forestière';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des applications logicielles, Analyser les besoins fonctionnels et techniques, Coder et tester les programmes, Assurer la maintenance et l’évolution des logiciels, Documenter et former les utilisateurs, Encadrer des équipes de développement'
WHERE Nom= 'Ingénieur en développement logiciel';

UPDATE Metiers
SET "principales_missions" = 'Administrer et gérer les systèmes et les réseaux informatiques, Assurer la sécurité, la disponibilité et les performances, Effectuer les mises à jour et les sauvegardes, Surveiller les infrastructures et résoudre les incidents, Automatiser les tâches d’administration'
WHERE Nom= 'Administrateur systèmes et réseaux';

UPDATE Metiers
SET "principales_missions" = 'Évaluer les risques et les menaces en cybersécurité, Mettre en place des mesures de protection des systèmes informatiques, Détecter et analyser les incidents de sécurité, Rester informé des nouvelles vulnérabilités et menaces, Sensibiliser les utilisateurs aux bonnes pratiques de sécurité'
WHERE Nom= 'Analyste en cybersécurité';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des sites web et des applications web, Intégrer les interfaces et les fonctionnalités, Optimiser l’expérience utilisateur et le référencement, Assurer la maintenance et la mise à jour des sites, Collaborer avec les équipes de conception et de développement'
WHERE Nom= 'Développeur web';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et déployer des architectures cloud, Migrer les applications et les infrastructures vers le cloud, Optimiser les performances et la sécurité des environnements cloud, Automatiser les processus de déploiement et de gestion, Assurer la conformité aux réglementations et aux bonnes pratiques'
WHERE Nom= 'Architecte cloud';

UPDATE Metiers
SET "principales_missions" = 'Collecter, traiter et analyser des données, Développer des modèles et des algorithmes d’analyse, Visualiser et communiquer les résultats, Assurer la qualité et l’intégrité des données, Collaborer avec différents départements pour résoudre des problèmes analytiques'
WHERE Nom= 'Analyste de données';

UPDATE Metiers
SET "principales_missions" = 'Conseiller les entreprises sur leur stratégie et leur système d’information, Analyser les besoins et définir les solutions SI adaptées, Accompagner les projets de transformation numérique, Optimiser les processus et les flux d’information, Assurer la formation et le support aux utilisateurs'
WHERE Nom= 'Consultant en système d’information';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des applications mobiles pour différentes plateformes, Intégrer les fonctionnalités et les interfaces, Optimiser l’expérience utilisateur et la performance, Assurer la maintenance et la mise à jour des applications, Collaborer avec les équipes de conception et de développement'
WHERE Nom= 'Développeur d’applications mobiles';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des systèmes d’intelligence artificielle, Modéliser et entraîner des algorithmes de machine learning, Collecter et préparer les données, Tester et optimiser les modèles, Intégrer les solutions d’IA dans des applications'
WHERE Nom= 'Expert en intelligence artificielle';

UPDATE Metiers
SET "principales_missions" = 'Analyser les besoins métier et rédiger les spécifications fonctionnelles, Assurer la liaison entre les utilisateurs et les équipes de développement, Tester et valider les fonctionnalités, Assurer le support et la maintenance des applications, Participer à l’évolution des solutions informatiques'
WHERE Nom= 'Analyste fonctionnel';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et améliorer l’interface utilisateur des applications, Créer des maquettes et des prototypes, Optimiser l’ergonomie et l’accessibilité, Collaborer avec les équipes de développement et de design, Tester et recueillir les retours utilisateurs'
WHERE Nom= 'Spécialiste en interface utilisateur (UI)';

UPDATE Metiers
SET "principales_missions" = 'Installer, configurer et administrer des bases de données, Optimiser les performances et la sécurité des systèmes de gestion de données, Assurer la sauvegarde et la récupération des données, Réaliser des migrations et des mises à jour, Assurer le support technique'
WHERE Nom= 'Administrateur de bases de données';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des jeux vidéo, Programmer les fonctionnalités de gameplay, Créer des prototypes et des démonstrations, Optimiser les performances et la jouabilité, Collaborer avec les artistes et les designers'
WHERE Nom= 'Développeur de jeux vidéo';

UPDATE Metiers
SET "principales_missions" = 'Analyser les tendances technologiques et leurs impacts, Collecter et synthétiser des informations sur les technologies émergentes, Évaluer les opportunités et les risques, Conseiller les entreprises sur leurs choix technologiques, Participer à la veille stratégique'
WHERE Nom= 'Analyste en veille technologique';

UPDATE Metiers
SET "principales_missions" = 'Concevoir, configurer et administrer des réseaux informatiques, Déployer et maintenir des équipements de télécommunications, Assurer la sécurité et la disponibilité des infrastructures, Superviser les performances et la qualité de service, Apporter un support technique aux utilisateurs'
WHERE Nom= 'Ingénieur en réseaux et télécommunications';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer de nouveaux produits chimiques, Réaliser des études de faisabilité et des analyses de risques, Optimiser les procédés de fabrication, Assurer le respect des normes de sécurité et d’environnement, Collaborer avec les équipes de recherche et de production'
WHERE Nom= 'Ingénieur chimiste de recherche';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et optimiser des procédés de production chimique, Élaborer des schémas de fabrication et des plans d’exploitation, Piloter et superviser les installations industrielles, Assurer la qualité et la conformité des produits, Participer à l’amélioration continue des procédés'
WHERE Nom= 'Ingénieur en procédés chimiques';

UPDATE Metiers
SET "principales_missions" = 'Analyser la composition chimique des échantillons, Utiliser des techniques d’analyse chimique et spectrométrique, Interpréter les résultats et rédiger des rapports d’analyse, Assurer la calibration et la maintenance des équipements, Respecter les normes de qualité et de sécurité'
WHERE Nom= 'Chimiste analytique';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer de nouveaux matériaux polymères, Optimiser les formulations et les procédés de fabrication, Tester les propriétés physiques et chimiques, Assurer la conformité réglementaire et environnementale, Collaborer avec les équipes de recherche et de production'
WHERE Nom= 'Ingénieur en génie des polymères';

UPDATE Metiers
SET "principales_missions" = 'Définir et mettre en place des normes de qualité dans le domaine chimique, Élaborer des procédures d’analyse et de contrôle, Superviser les processus de fabrication et de contrôle, Assurer la conformité aux réglementations en vigueur, Participer à l’amélioration continue'
WHERE Nom= 'Responsable de la qualité chimique';

UPDATE Metiers
SET "principales_missions" = 'Étudier les impacts environnementaux des activités chimiques, Proposer des solutions d’optimisation et de réduction des risques, Assurer la veille réglementaire et technologique, Participer à la mise en place de mesures de prévention, Sensibiliser les équipes aux bonnes pratiques environnementales'
WHERE Nom= 'Ingénieur en environnement chimique';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des analyses chimiques et physico-chimiques, Suivre des protocoles et des normes de laboratoire, Utiliser des équipements de mesure et d’analyse, Interpréter les résultats et rédiger des rapports, Contribuer à la recherche et au développement de nouveaux produits'
WHERE Nom= 'Technicien de laboratoire chimique';
UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des applications biotechnologiques, Optimiser les procédés de production de substances biologiques, Effectuer des tests et des analyses génétiques, Participer à la recherche et au développement de nouvelles technologies en biotechnologie'
WHERE Nom= 'Ingénieur en biotechnologie';

UPDATE Metiers
SET "principales_missions" = 'Mener des recherches en chimie pour développer de nouveaux médicaments, Concevoir des molécules à visée thérapeutique, Optimiser la structure des composés chimiques, Collaborer avec des équipes multidisciplinaires, Participer à des projets de recherche médicinale'
WHERE Nom= 'Chercheur en chimie médicinale';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et optimiser des procédés chimiques industriels, Piloter des installations de production, Assurer la sécurité et la conformité des procédés, Collaborer avec des équipes de production et de recherche, Participer à l’amélioration continue des procédés'
WHERE Nom= 'Ingénieur en génie chimique';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des analyses chimiques dans un contexte industriel, Contrôler la qualité des produits chimiques, Suivre des protocoles et des normes de sécurité, Assurer la traçabilité des produits, Participer à la résolution des problèmes techniques'
WHERE Nom= 'Technicien en chimie industrielle';

UPDATE Metiers
SET "principales_missions" = 'Évaluer et gérer les risques chimiques dans les installations industrielles, Développer des plans d’urgence et des protocoles de sécurité, Former le personnel aux bonnes pratiques de sécurité, Collaborer avec les autorités réglementaires, Participer à la veille en sécurité chimique'
WHERE Nom= 'Ingénieur en sécurité chimique';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer des technologies au niveau de l’échelle nanométrique, Participer à la recherche de nouvelles applications des nanotechnologies, Optimiser les procédés de fabrication des nanomatériaux, Collaborer avec des équipes pluridisciplinaires, Assurer la veille technologique en nanotechnologie'
WHERE Nom= 'Ingénieur en nanotechnologie';

UPDATE Metiers
SET "principales_missions" = 'Mettre en place des actions et des projets en faveur du développement durable, Élaborer des stratégies environnementales, Sensibiliser les acteurs et le public aux enjeux du développement durable, Participer à la mise en œuvre de pratiques responsables, Assurer le suivi et l’évaluation des actions'
WHERE Nom= 'Chargé de développement durable';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et développer de nouveaux matériaux, Étudier les propriétés et les applications des matériaux, Optimiser les procédés de fabrication, Collaborer avec des équipes de recherche et de production, Participer à l’amélioration des performances des matériaux'
WHERE Nom= 'Ingénieur en génie des matériaux';

UPDATE Metiers
SET "principales_missions" = 'Accompagner et conseiller les familles dans leur quotidien, Proposer des solutions aux problématiques sociales et familiales, Informer sur les droits et les aides sociales, Collaborer avec des partenaires institutionnels, Participer à des actions de prévention'
WHERE Nom= 'Conseiller en économie sociale et familiale';

UPDATE Metiers
SET "principales_missions" = 'Faciliter la communication et la résolution de conflits au sein des familles, Organiser des médiations familiales, Accompagner les familles dans le processus de séparation, Collaborer avec des professionnels du droit et de la santé, Participer à des actions de prévention'
WHERE Nom= 'Médiateur familial';

UPDATE Metiers
SET "principales_missions" = 'Animer des activités socio-éducatives, Concevoir des projets d’animation, Encadrer des groupes d’enfants, d’adolescents ou d’adultes, Favoriser l’épanouissement individuel et collectif, Participer à des actions éducatives et culturelles'
WHERE Nom= 'Animateur socio-éducatif';

UPDATE Metiers
SET "principales_missions" = 'Accompagner les personnes en difficulté dans leur parcours d’insertion, Élaborer des projets professionnels, Proposer des formations et des ateliers, Collaborer avec des entreprises et des organismes de formation, Participer à des actions de prévention'
WHERE Nom= 'Conseiller en insertion sociale et professionnelle';

UPDATE Metiers
SET "principales_missions" = 'Organiser et animer des activités éducatives pour les jeunes enfants, Favoriser le développement psychomoteur et social des enfants, Collaborer avec les parents et les professionnels de la petite enfance, Participer à des actions de prévention et d’éducation'
WHERE Nom= 'Éducateur de jeunes enfants';

UPDATE Metiers
SET "principales_missions" = 'Accompagner les personnes en difficulté sociale, Évaluer les besoins et élaborer des plans d’action, Orienter vers des services et des aides, Assurer le suivi et la coordination des interventions, Participer à des actions de prévention'
WHERE Nom= 'Assistant de service social';

UPDATE Metiers
SET "principales_missions" = 'Promouvoir l’économie solidaire et responsable, Conseiller les acteurs économiques engagés, Participer à la création et au développement d’entreprises solidaires, Collaborer avec des partenaires institutionnels et associatifs, Participer à des actions de sensibilisation'
WHERE Nom= 'Conseiller en économie solidaire';

UPDATE Metiers
SET "principales_missions" = 'Concevoir et mettre en œuvre des projets de développement social, Animer des actions en faveur des populations vulnérables, Collaborer avec des partenaires locaux, Participer à la coordination d’actions sociales, Assurer le suivi et l’évaluation des projets'
WHERE Nom= 'Chargé de mission en développement social';

UPDATE Metiers
SET "principales_missions" = 'Coordonner les activités d’une crèche ou d’une structure d’accueil, Superviser les équipes et les projets éducatifs, Assurer la sécurité et le bien-être des enfants, Collaborer avec les parents et les partenaires institutionnels, Participer à l’amélioration continue des services'
WHERE Nom= 'Responsable de crèche';

UPDATE Metiers
SET "principales_missions" = 'Mener des projets en faveur de l’économie sociale, Développer des partenariats avec des acteurs du secteur, Concevoir et mettre en œuvre des actions solidaires, Collaborer avec des entreprises et des institutions, Participer à des actions de sensibilisation'
WHERE Nom= 'Chargé de projet en économie sociale';

UPDATE Metiers
SET "principales_missions" = 'Accompagner les personnes dans la gestion de leur budget, Proposer des solutions d’optimisation financière, Informer sur les droits sociaux et les aides financières, Collaborer avec des partenaires institutionnels, Participer à des actions de prévention'
WHERE Nom= 'Conseiller en budget familial';

UPDATE Metiers
SET "principales_missions" = 'Coordonner des actions et des projets d’insertion sociale, Encadrer des équipes d’intervenants sociaux, Assurer le suivi et l’évaluation des actions, Collaborer avec des partenaires institutionnels, Participer à la coordination de dispositifs sociaux'
WHERE Nom= 'Coordinateur d’action sociale';

UPDATE Metiers
SET "principales_missions" = 'Gérer des services ou des structures d’économie sociale, Superviser les équipes et les projets, Assurer la gestion administrative et financière, Collaborer avec des partenaires institutionnels, Participer à la définition des orientations stratégiques'
WHERE Nom= 'Responsable de service en économie sociale';

UPDATE Metiers
SET "principales_missions" = 'Accompagner les personnes en difficulté sociale et psychologique, Élaborer des projets éducatifs et thérapeutiques, Intervenir auprès de publics spécifiques (jeunes, adultes, personnes handicapées), Collaborer avec des partenaires médico-sociaux, Participer à des actions de prévention'
WHERE Nom= 'Éducateur spécialisé';

UPDATE Metiers
SET "principales_missions" = 'Proposer des solutions de prévention et d’accompagnement social, Évaluer les situations de précarité, Collaborer avec des structures médico-sociales, Participer à des actions de sensibilisation, Assurer le suivi et l’évaluation des interventions'
WHERE Nom= 'Conseiller en prévention sociale';

UPDATE Metiers
SET "principales_missions" = 'Assurer des tâches administratives au sein d’une entreprise, Gérer la correspondance et les communications, Organiser des réunions et des événements, Traiter les dossiers et les documents administratifs, Collaborer avec les différents services de l’entreprise'
WHERE Nom= 'Assistant administratif';

UPDATE Metiers
SET "principales_missions" = 'Assister la direction dans la gestion administrative, Organiser l’agenda et les déplacements, Rédiger des comptes rendus et des documents, Coordonner les informations au sein de l’entreprise, Collaborer avec les différents services et partenaires externes'
WHERE Nom= 'Secrétaire de direction';
UPDATE Metiers
SET "principales_missions" = 'Gérer et organiser des dossiers administratifs, Assurer la traçabilité des documents, Collaborer avec différents services, Suivre les procédures administratives, Participer à l’amélioration des processus'
WHERE Nom= 'Gestionnaire de dossiers administratifs';

UPDATE Metiers
SET "principales_missions" = 'Assurer des tâches administratives courantes, Gérer le courrier et les communications, Organiser les agendas et les rendez-vous, Traiter les demandes internes et externes, Collaborer avec les membres de l’équipe'
WHERE Nom= 'Agent de bureau';

UPDATE Metiers
SET "principales_missions" = 'Assurer la maintenance des équipements bureautiques, Installer et configurer des logiciels, Former les utilisateurs aux outils bureautiques, Assurer le support technique, Collaborer avec les services informatiques'
WHERE Nom= 'Technicien en bureautique';

UPDATE Metiers
SET "principales_missions" = 'Gérer les aspects administratifs d’une entreprise, Superviser les processus administratifs, Assurer la conformité des dossiers, Collaborer avec les différents services, Participer à la définition des procédures administratives'
WHERE Nom= 'Chargé de gestion administrative';

UPDATE Metiers
SET "principales_missions" = 'Collecter, traiter et analyser des données, Concevoir des bases de données, Mettre en place des outils de traitement de données, Assurer la qualité et la sécurité des données, Collaborer avec les équipes informatiques'
WHERE Nom= 'Spécialiste en traitement de données';

UPDATE Metiers
SET "principales_missions" = 'Assurer un service client de qualité, Répondre aux demandes et aux réclamations, Traiter les informations et les commandes, Collaborer avec les différents services de l’entreprise, Participer à l’amélioration de la satisfaction client'
WHERE Nom= 'Agent de service client';

UPDATE Metiers
SET "principales_missions" = 'Gérer les achats administratifs de l’entreprise, Négocier avec les fournisseurs, Suivre les budgets et les dépenses, Collaborer avec les services internes, Participer à l’optimisation des coûts'
WHERE Nom= 'Responsable des achats administratifs';

UPDATE Metiers
SET "principales_missions" = 'Assurer la communication interne de l’entreprise, Organiser des événements internes, Rédiger des supports de communication, Collaborer avec les différents services, Participer à la promotion de la culture d’entreprise'
WHERE Nom= 'Chargé de communication interne';

UPDATE Metiers
SET "principales_missions" = 'Assister la gestion des ressources humaines, Traiter les dossiers administratifs du personnel, Participer au recrutement, Assurer le suivi des congés et des formations, Collaborer avec les responsables RH'
WHERE Nom= 'Assistant en gestion des ressources humaines';

UPDATE Metiers
SET "principales_missions" = 'Coordonner les tâches administratives, Suivre les procédures internes, Assurer la communication entre les services, Participer à l’optimisation des processus, Collaborer avec les différents responsables'
WHERE Nom= 'Coordinateur administratif';

UPDATE Metiers
SET "principales_missions" = 'Gérer la paie des employés, Calculer les rémunérations et les cotisations, Assurer la conformité des bulletins de paie, Collaborer avec les services comptables et RH, Participer à la veille réglementaire'
WHERE Nom= 'Gestionnaire de paie';

UPDATE Metiers
SET "principales_missions" = 'Superviser la logistique administrative, Organiser les déplacements et les événements, Assurer la gestion des fournitures et des équipements, Collaborer avec les services internes, Participer à l’optimisation des ressources'
WHERE Nom= 'Responsable de la logistique administrative';

UPDATE Metiers
SET "principales_missions" = 'Assurer le suivi administratif des ventes, Traiter les commandes et les factures, Gérer les relations avec les clients, Collaborer avec les équipes commerciales, Participer à l’amélioration des processus'
WHERE Nom= 'Agent administratif des ventes';

UPDATE Metiers
SET "principales_missions" = 'Analyser les données financières, Établir des prévisions budgétaires, Participer à la définition des objectifs financiers, Collaborer avec les services comptables, Participer à la prise de décision'
WHERE Nom= 'Analyste financier';

UPDATE Metiers
SET "principales_missions" = 'Conseiller les entreprises sur leur stratégie, Analyser les marchés et les concurrents, Participer à la définition des objectifs, Collaborer avec les équipes de direction, Participer à la mise en place de nouvelles orientations stratégiques'
WHERE Nom= 'Consultant en stratégie d’entreprise';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des études économiques, Analyser les données macroéconomiques, Évaluer les politiques économiques, Collaborer avec les organismes publics et privés, Participer à la prise de décision'
WHERE Nom= 'Chargé d’études économiques';

UPDATE Metiers
SET "principales_missions" = 'Superviser les ressources humaines de l’entreprise, Définir les politiques RH, Gérer les recrutements et les départs, Assurer le suivi des collaborateurs, Participer à l’amélioration du climat social'
WHERE Nom= 'Responsable des ressources humaines';

UPDATE Metiers
SET "principales_missions" = 'Réaliser des audits internes, Évaluer la conformité des processus, Proposer des recommandations d’amélioration, Collaborer avec les différentes directions, Participer à la gestion des risques'
WHERE Nom= 'Auditeur interne';

UPDATE Metiers
SET "principales_missions" = 'Analyser les marchés et les tendances, Étudier le comportement des consommateurs, Proposer des stratégies marketing, Collaborer avec les équipes commerciales, Participer à la définition des actions marketing'
WHERE Nom= 'Analyste marketing';

UPDATE Metiers
SET "principales_missions" = 'Gérer des projets au sein de l’entreprise, Définir les objectifs et les échéances, Coordonner les équipes et les ressources, Assurer le suivi et l’évaluation des projets, Participer à l’optimisation des processus'
WHERE Nom= 'Chargé de gestion de projets';

UPDATE Metiers
SET "principales_missions" = 'Superviser la logistique de l’entreprise, Organiser les flux et les stocks, Assurer la coordination des livraisons, Collaborer avec les services internes, Participer à l’optimisation des coûts logistiques'
WHERE Nom= 'Responsable logistique';

UPDATE Metiers
SET "principales_missions" = 'Collecter, traiter et analyser des données, Développer des modèles et des algorithmes d’analyse, Visualiser et communiquer les résultats, Assurer la qualité et l’intégrité des données, Collaborer avec différents départements pour résoudre des problèmes analytiques'
WHERE Nom= 'Analyste de données';

UPDATE Metiers
SET "principales_missions" = 'Gérer les aspects financiers de l’entreprise, Établir les budgets et les prévisions, Assurer le suivi des indicateurs financiers, Collaborer avec les services comptables, Participer à la prise de décision'
WHERE Nom= 'Responsable financier';

UPDATE Metiers
SET "principales_missions" = 'Assurer les relations publiques de l’entreprise, Organiser des événements et des partenariats, Communiquer avec les médias et le public, Collaborer avec les différentes directions, Participer à la promotion de l’image de l’entreprise'
WHERE Nom= 'Chargé de relations publiques';

UPDATE Metiers
SET "principales_missions" = 'Développer le portefeuille clients de l’entreprise, Prospecter de nouveaux clients, Négocier des contrats commerciaux, Collaborer avec les équipes internes, Participer à l’optimisation des ventes'
WHERE Nom= 'Chargé de développement commercial';
UPDATE Metiers
SET "principales_missions" = 'Assurer la conformité des activités de l’entreprise, Mettre en place des procédures de conformité, Former les collaborateurs aux normes, Effectuer des audits internes, Collaborer avec les différentes directions'
WHERE Nom= 'Chargé de conformité';

UPDATE Metiers
SET "principales_missions" = 'Gérer la communication de l’entreprise, Développer des stratégies de communication, Rédiger des supports de communication, Organiser des événements, Collaborer avec les médias et les partenaires'
WHERE Nom= 'Chargé de communication d’entreprise';

UPDATE Metiers
SET "principales_missions" = 'Analyser les risques liés aux activités de l’entreprise, Mettre en place des dispositifs de gestion des risques, Proposer des actions préventives, Assurer le suivi des indicateurs de risque, Collaborer avec les différentes directions'
WHERE Nom= 'Analyste en gestion des risques';

UPDATE Metiers
SET "principales_missions" = 'Enseigner aux élèves du primaire, Préparer et dispenser des cours, Évaluer les élèves, Mettre en place des activités pédagogiques, Collaborer avec l’équipe éducative et les parents'
WHERE Nom= 'Enseignant primaire';

UPDATE Metiers
SET "principales_missions" = 'Conseiller les enseignants sur les méthodes pédagogiques, Participer à la conception des programmes, Former les enseignants aux nouvelles pratiques, Assurer le suivi des élèves, Collaborer avec la direction de l’établissement'
WHERE Nom= 'Conseiller pédagogique';

UPDATE Metiers
SET "principales_missions" = 'Fournir un soutien psychologique aux élèves, Réaliser des évaluations psychologiques, Participer à l’élaboration de projets éducatifs, Collaborer avec l’équipe éducative, Intervenir en cas de difficultés scolaires ou sociales'
WHERE Nom= 'Psychologue scolaire';

UPDATE Metiers
SET "principales_missions" = 'Diriger un établissement scolaire, Définir les orientations pédagogiques, Gérer les ressources humaines et matérielles, Assurer le suivi des élèves, Collaborer avec les instances éducatives'
WHERE Nom= 'Directeur d’établissement scolaire';

UPDATE Metiers
SET "principales_missions" = 'Intervenir auprès d’un public spécifique, Élaborer des projets éducatifs, Mettre en place des activités socio-éducatives, Collaborer avec les partenaires locaux, Assurer le suivi individuel des participants'
WHERE Nom= 'Éducateur spécialisé';

UPDATE Metiers
SET "principales_missions" = 'Charger de la conception et de la mise en place de formations, Élaborer des programmes de formation, Animer des sessions de formation, Évaluer les compétences acquises, Collaborer avec les responsables de formation'
WHERE Nom= 'Chargé de formation';

UPDATE Metiers
SET "principales_missions" = 'Accompagner les individus dans leurs choix scolaires et professionnels, Proposer des orientations en fonction des aptitudes, Réaliser des entretiens individuels, Organiser des actions d’information, Collaborer avec les établissements et les entreprises'
WHERE Nom= 'Conseiller d’orientation scolaire et professionnelle';

UPDATE Metiers
SET "principales_missions" = 'Superviser les établissements scolaires, Évaluer les enseignants et les équipes éducatives, Assurer le suivi des programmes, Collaborer avec les institutions éducatives, Participer à l’application des politiques éducatives'
WHERE Nom= 'Inspecteur de l’éducation nationale';

UPDATE Metiers
SET "principales_missions" = 'Former les collaborateurs au sein d’une entreprise, Développer des programmes de formation, Animer des sessions de formation, Évaluer les compétences acquises, Collaborer avec les responsables RH et les managers'
WHERE Nom= 'Formateur en entreprise';

UPDATE Metiers
SET "principales_missions" = 'Animer des actions socio-éducatives, Mettre en place des projets d’animation, Encadrer des groupes d’individus, Collaborer avec les institutions et les partenaires locaux, Participer à la vie communautaire'
WHERE Nom= 'Animateur socio-éducatif';

UPDATE Metiers
SET "principales_missions" = 'Assurer le suivi éducatif d’un public spécifique, Mettre en place des actions individuelles, Collaborer avec les équipes éducatives, Participer à la résolution des difficultés rencontrées, Assurer le lien avec les familles'
WHERE Nom= 'Référent éducatif';

UPDATE Metiers
SET "principales_missions" = 'Contribuer aux travaux de recherche en éducation, Collecter et analyser des données, Rédiger des rapports de recherche, Collaborer avec des chercheurs et des institutions, Participer à des projets de recherche éducative'
WHERE Nom= 'Assistant de recherche en éducation';

UPDATE Metiers
SET "principales_missions" = 'Coordonner les actions pédagogiques au sein d’une structure, Mettre en place des projets éducatifs, Assurer le suivi des équipes éducatives, Collaborer avec les institutions et les partenaires, Participer à l’animation pédagogique'
WHERE Nom= 'Coordonnateur pédagogique';

UPDATE Metiers
SET "principales_missions" = 'Piloter des projets éducatifs, Définir les objectifs et les actions, Coordonner les équipes et les ressources, Assurer le suivi et l’évaluation des projets, Collaborer avec les partenaires éducatifs'
WHERE Nom= 'Chef de projet éducatif';

UPDATE Metiers
SET "principales_missions" = 'Gérer les aspects de la vie étudiante, Organiser des événements et des activités, Assurer le suivi des étudiants, Collaborer avec les services administratifs, Participer à l’amélioration des conditions de vie sur le campus'
WHERE Nom= 'Responsable de la vie étudiante';
-- Enseignant de langues et de littérature française
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id, principales_missions)
VALUES ('Enseignant de langues et de littérature française', 'L’enseignant de langues et de littérature française est responsable d’instruire les élèves sur la langue française et la littérature associée. Il crée des plans de cours, évalue les progrès des élèves, et favorise le développement des compétences linguistiques et littéraires. Il peut travailler dans des écoles primaires, secondaires ou des établissements d’enseignement supérieur.', '200000-300000', 'Maîtrise de la langue française, connaissance approfondie de la littérature française, compétences pédagogiques, communication efficace.', 1, 'Enseigner la langue française et la littérature française, Préparer les cours et les supports pédagogiques, Évaluer les élèves, Encadrer les projets pédagogiques, Participer aux réunions pédagogiques, Assurer un suivi des élèves, Promouvoir la langue et la culture française');

-- Rédacteur
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id, principales_missions)
VALUES ('Rédacteur', 'Le rédacteur est chargé de produire des contenus écrits clairs et engageants. Il peut travailler dans divers domaines tels que le journalisme, la rédaction technique, la création de contenu web, etc. Son rôle consiste à transmettre des informations de manière compréhensible et captivante.', '200000-300000', 'Maîtrise de la langue, compétences rédactionnelles, recherche approfondie, adaptation au ton et style demandés.', 1, 'Rédiger des contenus pour différents supports (web, print, etc.), Effectuer des recherches et analyser des informations, Relire et corriger les textes, Respecter les délais et les consignes, Travailler en collaboration avec d’autres professionnels');

-- Éditeur
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id, principales_missions)
VALUES ('Éditeur', 'L’éditeur est responsable de la préparation et de la publication de contenus écrits. Cela inclut la révision, la correction et la coordination avec les auteurs pour garantir la qualité du produit final. Les éditeurs peuvent travailler dans l’édition de livres, de magazines, ou d’autres supports écrits.', '200000-300000', 'Excellente compréhension de la grammaire et de la syntaxe, compétences en révision, organisation, communication efficace.', 1, 'Superviser le processus de publication, Coordonner l’équipe éditoriale, Valider les contenus et les mises en page, Assurer le respect des délais, Gérer les relations avec les auteurs et les fournisseurs, Promouvoir les publications');

-- Chargé de communication
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id, principales_missions)
VALUES ('Chargé de communication', 'Le chargé de communication est responsable de la gestion et de la diffusion de l’information au sein d’une organisation. Il élabore des stratégies de communication, rédige des supports de communication, organise des événements et assure la relation avec les médias. Son rôle est essentiel pour promouvoir une image positive de l’entreprise ou de l’organisation.', '400000+', 'Compétences en communication écrite et orale, créativité, maîtrise des outils de communication, gestion de crise, relation avec les médias.', 1, 'Élaborer et mettre en œuvre la stratégie de communication, Gérer les relations avec les médias, Organiser des événements et des campagnes de communication, Produire des contenus pour différents supports, Analyser et suivre les résultats des actions de communication');

-- Animateur socioculturel
INSERT INTO Metiers (Nom, Description, SalaireMoyen, CompetencesCles, Filieres_id, principales_missions)
VALUES ('Animateur socioculturel', 'L’animateur socioculturel organise et met en place des activités socioculturelles visant à favoriser le lien social et le bien-être des participants. Il peut intervenir dans des structures variées telles que les centres sociaux, les associations, les collectivités locales. Son rôle est d’animer des ateliers, des événements culturels et de favoriser la participation active des personnes.', '250000+', 'Animation, gestion de projet socioculturel, communication, capacité d’écoute, créativité, médiation.', 1, 'Concevoir et animer des activités socioculturelles, Favoriser l’intégration et la cohésion sociale, Développer des projets à dimension culturelle et éducative, Encadrer des groupes, Travailler en partenariat avec différents acteurs locaux'); 
UPDATE Filieres
SET faculte_id = 17
WHERE filieres_id IN (333, 334);