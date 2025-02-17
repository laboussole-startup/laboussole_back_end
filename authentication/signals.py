# compte/signals.py

import psycopg2
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from psycopg2.extras import RealDictCursor, Json
from decouple import config 
from .models import Utilisateur

@receiver(post_save, sender=Utilisateur)
def replicate_user_to_second_db(sender, instance, created, **kwargs):
    """
    À chaque fois qu'un objet Utilisateur est créé ou mis à jour dans 
    la première base, on va répliquer/mettre à jour l'enregistrement 
    dans la seconde base.
    """

    username = instance.username
    password = instance.password
    role = "student"
    email = instance.email
    first_name = instance.first_name if instance.first_name else ""
    last_name = instance.last_name if instance.last_name else ""
    image = instance.photo_de_profil.url if instance.photo_de_profil else None
    phone_number = instance.telephone if instance.telephone else None
    is_validated = False
    social_links = Json({})
    weekly_emails_enabled = True
    last_weekly_email = None
    is_staff = instance.is_staff if instance.is_staff else False
    is_superuser = instance.is_superuser if instance.is_superuser else False
    is_active = instance.is_active if instance.is_active else False
    date_joined =instance.date_joined
    last_login = instance.last_login


    upsert_query= ""
    try:
        conn = psycopg2.connect(
            host="localhost",
            port="5432",
            database="e_learning",
            user="postgres",
            password=config("DB_PASSWORD")
        )
        cur = conn.cursor()

        # 3) Upsert (INSERT ou UPDATE) dans la 2e BD
        #    - Supposons que la table s'appelle "users_user"
        #    - On part du principe que "email" est unique ou "username" est unique
        #    - ON CONFLICT DO UPDATE permet de mettre à jour
        #      si l'enregistrement existe déjà
        if created:
            upsert_query = """
                INSERT INTO users_user (
                    username,
                    password,
                    role,
                    email,
                    first_name,
                    last_name,
                    image,
                    phone_number,
                    is_validated,
                    social_links,
                    weekly_emails_enabled,
                    last_weekly_email,
                    is_staff,
                    is_superuser,
                    is_active,
                    date_joined,
                    last_login
                )
                VALUES (
                    %s, %s, %s, %s, %s,
                    %s, %s, %s, %s, %s,
                    %s, %s, %s, %s, %s,
                    %s, %s
                )
                
                ON CONFLICT (email) DO NOTHING;
            """
            cur.execute(
                upsert_query, 
                (
                    username,
                    password,
                    role,
                    email,
                    first_name,
                    last_name,
                    image,
                    phone_number,
                    is_validated,
                    social_links,
                    weekly_emails_enabled,
                    last_weekly_email,
                    is_staff,
                    is_superuser,
                    is_active,
                    date_joined,
                    last_login
                )
            )
        else :
            upsert_query = """
                UPDATE users_user
                SET
                    username = %s,
                    password = %s,
                    role = %s,
                    email = %s,
                    first_name = %s,
                    last_name = %s,
                    image = %s,
                    phone_number = %s,
                    is_validated = %s,
                    social_links = %s,
                    weekly_emails_enabled = %s,
                    last_weekly_email = %s,
                    is_staff = %s,
                    is_superuser = %s,
                    is_active = %s,
                    date_joined = %s,
                    last_login = %s
                WHERE id = %s;
            """

            cur.execute(
                upsert_query, 
                (
                    username,
                    password,
                    role,
                    email,
                    first_name,
                    last_name,
                    image,
                    phone_number,
                    is_validated,
                    social_links,
                    weekly_emails_enabled,
                    last_weekly_email,
                    is_staff,
                    is_superuser,
                    is_active,
                    date_joined,
                    last_login,
                    instance.id
                )
            )
        conn.commit()

    except Exception as e:
        print("Erreur lors de la réplique de l'utilisateur:", e)
        if conn:
            conn.rollback()
    finally:
        if conn:
            cur.close()
            conn.close()

@receiver(post_delete, sender=Utilisateur)
def replicate_user_deletion_to_second_db(sender, instance, **kwargs):
    email = instance.email

    # Se connecter à la seconde base
    try:
        conn = psycopg2.connect(
            host="localhost",
            port="5432",
            database="e_learning",
            user="postgres",
            password=config("DB_PASSWORD")
        )
        cur = conn.cursor()

        # Supposons que la table s'appelle 'users_user' et que 'email' soit la clé unique
        delete_query = """
            DELETE FROM users_user
            WHERE email = %s
        """
        cur.execute(delete_query, (email,))
        conn.commit()

    except Exception as e:
        print("Erreur lors de la suppression dans la seconde base :", e)
        if conn:
            conn.rollback()
    finally:
        if conn:
            cur.close()
            conn.close()