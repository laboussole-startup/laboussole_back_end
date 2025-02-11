#!/usr/bin/env python3
import psycopg2
from psycopg2 import sql

# Paramètres de connexion à adapter
DB_NAME = "laboussolebd"
DB_USER = "postgres"
DB_PASSWORD = "Labousang@123"
DB_HOST = "localhost"      # ou l'adresse IP / nom d'hôte du serveur
DB_PORT = "5432"           # par défaut 5432

# Ancien et nouveau URL
# L'URL Firebase complète est du type :
# https://firebasestorage.googleapis.com/v0/b/laboussole-42479.appspot.com/o/uploads/1739272464949_Screenshot_20250210-161319_LinkedIn.jpg?alt=media&token=...
# On extrait ainsi le nom de fichier (ici "1739272464949_Screenshot_20250210-161319_LinkedIn.jpg")
OLD_BASE_URL = 'https://firebasestorage.googleapis.com/v0/b/laboussole-42479.appspot.com/o/uploads/'
NEW_BASE_URL = 'orientation-laboussole.s3.eu-north-1.amazonaws.com/uploads/'

def main():
    conn = None
    cur = None
    try:
        # Connexion à la base de données
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        conn.autocommit = False  # gestion manuelle de la transaction
        cur = conn.cursor()

        # Récupérer toutes les colonnes de type texte (hors schémas système)
        query = """
            SELECT table_schema, table_name, column_name
            FROM information_schema.columns
            WHERE data_type IN ('character varying', 'text', 'character')
              AND table_schema NOT IN ('information_schema', 'pg_catalog')
            ORDER BY table_schema, table_name;
        """
        cur.execute(query)
        columns = cur.fetchall()
        print(f"Nombre de colonnes textuelles trouvées : {len(columns)}")

        # Pour chaque colonne, mettre à jour les valeurs contenant l'URL Firebase
        for table_schema, table_name, column_name in columns:
            # Construction de la requête UPDATE de manière sécurisée
            update_query = sql.SQL(
                "UPDATE {schema}.{table} "
                "SET {col} = regexp_replace({col}, %s, %s, 'g') "
                "WHERE {col} ~ %s"
            ).format(
                schema=sql.Identifier(table_schema),
                table=sql.Identifier(table_name),
                col=sql.Identifier(column_name)
            )
            # Expression régulière pour détecter l'URL Firebase en version décodée (avec "uploads/")
            regex_pattern = r'https://firebasestorage\.googleapis\.com/v0/b/[^/]+/o/uploads(?:%2F|/)([^?]+)\?alt=media.*'
            # Remplacement : on reconstruit l'URL S3 en ajoutant un "F" devant le nom du fichier
            regex_replacement = r'orientation-laboussole.s3.eu-north-1.amazonaws.com/uploads/\1'
            cur.execute(update_query, (regex_pattern, regex_replacement, regex_pattern))
            if cur.rowcount > 0:
                print(f"[{table_schema}.{table_name}.{column_name}] : {cur.rowcount} ligne(s) mise(s) à jour.")

        # Valider toutes les mises à jour
        conn.commit()
        print("Mise à jour terminée avec succès.")

    except Exception as e:
        print("Une erreur est survenue :", e)
        if conn:
            conn.rollback()
    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    main()
