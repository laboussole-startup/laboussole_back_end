-- Table Universités
CREATE TABLE universite (
    universite_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) UNIQUE NOT NULL,
    ville VARCHAR(255) NOT NULL,
    descriptif TEXT NOT NULL,
    email VARCHAR(255) NOT NULL,
    telephone VARCHAR(255) NOT NULL,
    site_web VARCHAR(255),
    imageurl VARCHAR(255)
);

-- Table Facultés
CREATE TABLE faculte (
    faculte_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    descriptif TEXT,
    condition_admission TEXT,
    email VARCHAR(255),
    telephone VARCHAR(255),
    imageurl VARCHAR(255),
    universite_id INT NOT NULL,
    FOREIGN KEY (universite_id) REFERENCES universite(universite_id) ON DELETE CASCADE
);

-- Table Filieres
CREATE TABLE filieres (
    filieres_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    descriptif TEXT NOT NULL,
    duree INT NOT NULL,
    cout DECIMAL(10, 2) NOT NULL,
    langue_enseignement VARCHAR(50) NOT NULL,
    diplome_delivre VARCHAR(255) NOT NULL,
    imageurl VARCHAR(255),
    faculte_id INT NOT NULL,
    FOREIGN KEY (faculte_id) REFERENCES faculte(faculte_id) ON DELETE CASCADE
);

-- Création de la table Bourse_Etude
CREATE TABLE bourse_etude (
    Id_Bourse SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Date_limite DATE,
    Niveau VARCHAR(255),
    Finance VARCHAR(255),
    imageurl VARCHAR(255),
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
    Page_officielle VARCHAR(255)
);

-- Création de la table Administrateur
CREATE TABLE administrateur (
    Id_Admin SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Mail VARCHAR(255),
    Mot_de_passe VARCHAR(255),
    Telephone VARCHAR(20),
    Derniere_Connexion TIMESTAMP,
    photo_de_profil VARCHAR(255)
);

-- Création de la table Temoignage
CREATE TABLE temoignage (
    Id_Temoignage SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Telephone VARCHAR(20),
    Contenu TEXT,
    Photo VARCHAR(255),
    Profession VARCHAR(255),
    Score INTEGER
);

-- Création de la table Metiers
CREATE TABLE Metiers (
    Id_Metiers SERIAL PRIMARY KEY,
    Nom VARCHAR(255),
    Description TEXT,
    EntreprisesRecrutent TEXT,
    SalaireMoyen TEXT,
    CompetencesCles TEXT
);

CREATE TABLE centre_interet (
    Id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    Filieres_id INT,
    imageurl VARCHAR(255),
    FOREIGN KEY (Filieres_id) REFERENCES filieres(filieres_id)
);
