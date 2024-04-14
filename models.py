# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Actualit(models.Model):
    id_actualite = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=255, blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    contenu = models.TextField(blank=True, null=True)
    domaine = models.CharField(max_length=255, blank=True, null=True)
    image_pc = models.TextField(blank=True, null=True)
    image_tablette = models.TextField(blank=True, null=True)
    image_desktop = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'actualité'


class Administrateur(models.Model):
    id_admin = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    prenom = models.CharField(max_length=255, blank=True, null=True)
    mail = models.CharField(max_length=255, blank=True, null=True)
    mot_de_passe = models.CharField(max_length=255, blank=True, null=True)
    telephone = models.CharField(max_length=20, blank=True, null=True)
    derniere_connexion = models.DateTimeField(blank=True, null=True)
    photo_de_profil = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'administrateur'


class BourseEtude(models.Model):
    id_bourse = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    date_limite = models.DateField(blank=True, null=True)
    niveau = models.CharField(max_length=255, blank=True, null=True)
    finance = models.CharField(max_length=255, blank=True, null=True)
    ouvert_pour = models.CharField(max_length=255, blank=True, null=True)
    pays = models.CharField(max_length=255, blank=True, null=True)
    statut = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    etablissements_hotes = models.TextField(blank=True, null=True)
    programme_eligible = models.TextField(blank=True, null=True)
    nombre_bourse = models.CharField(max_length=255, blank=True, null=True)
    duree = models.CharField(max_length=255, blank=True, null=True)
    groupe_cible = models.CharField(max_length=255, blank=True, null=True)
    avantages_bourse = models.TextField(blank=True, null=True)
    critères_eligibilite = models.TextField(blank=True, null=True)
    comment_postuler = models.TextField(blank=True, null=True)
    page_officielle = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bourse_etude'


class CentreInteret(models.Model):
    nom = models.CharField(max_length=255, blank=True, null=True)
    filieres = models.ForeignKey('Filieres', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'centre_interet'


class Faculte(models.Model):
    faculte_id = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255)
    descriptif = models.TextField(blank=True, null=True)
    condition_admission = models.TextField(blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True)
    telephone = models.CharField(max_length=255, blank=True, null=True)
    images_pc = models.TextField(blank=True, null=True)
    images_telephone = models.TextField(blank=True, null=True)
    images_tablettes = models.TextField(blank=True, null=True)
    universite = models.ForeignKey('Universite', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'faculte'


class Filieres(models.Model):
    filieres_id = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255)
    descriptif = models.TextField()
    duree = models.IntegerField()
    cout = models.DecimalField(max_digits=10, decimal_places=2)
    langue_enseignement = models.CharField(max_length=50)
    diplome_delivre = models.CharField(max_length=255)
    images_pc = models.CharField(max_length=255, blank=True, null=True)
    images_telephone = models.CharField(max_length=255, blank=True, null=True)
    images_tablettes = models.CharField(max_length=255, blank=True, null=True)
    faculte = models.ForeignKey(Faculte, models.DO_NOTHING)
    centre_interet = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'filieres'


class Metiers(models.Model):
    id_metiers = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    entreprisesrecrutent = models.TextField(blank=True, null=True)
    salairemoyen = models.TextField(blank=True, null=True)
    competencescles = models.TextField(blank=True, null=True)
    logo = models.TextField(blank=True, null=True)
    filieres = models.ForeignKey(Filieres, models.DO_NOTHING, blank=True, null=True)
    images_pc = models.CharField(max_length=255, blank=True, null=True)
    principales_missions = models.TextField(blank=True, null=True)
    images_telephone = models.CharField(max_length=255, blank=True, null=True)
    images_tablettes = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'metiers'


class Notification(models.Model):
    id_notification = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=255, blank=True, null=True)
    contenu = models.TextField(blank=True, null=True)
    statut = models.CharField(max_length=255, blank=True, null=True)
    nationalité = models.CharField(max_length=255, blank=True, null=True)
    image_pc = models.TextField(blank=True, null=True)
    image_tablette = models.TextField(blank=True, null=True)
    image_desktop = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'notification'


class Temoignage(models.Model):
    id_temoignage = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    telephone = models.CharField(max_length=20, blank=True, null=True)
    contenu = models.TextField(blank=True, null=True)
    photo = models.CharField(max_length=255, blank=True, null=True)
    profession = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'temoignage'


class Universite(models.Model):
    universite_id = models.AutoField(primary_key=True)
    nom = models.CharField(unique=True, max_length=255)
    pays = models.CharField(max_length=255)
    ville = models.CharField(max_length=255)
    descriptif = models.TextField()
    email = models.CharField(max_length=255)
    telephone = models.CharField(max_length=255)
    site_web = models.CharField(max_length=255, blank=True, null=True)
    logo = models.TextField(blank=True, null=True)
    images_pc = models.TextField(blank=True, null=True)
    images_telephone = models.TextField(blank=True, null=True)
    images_tablettes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'universite'
