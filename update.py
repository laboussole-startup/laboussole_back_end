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
OLD_URL = 'https://laboussole-back-end.onrender.com'
NEW_URL = 'https://api.laboussole-edu.com'

def main():
    try:
        # Connexion à la base de données
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        conn.autocommit = False  # pour gérer manuellement la transaction
        cur = conn.cursor()

        # Récupérer les colonnes de type texte (excluant les schémas système)
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
        
        # Pour chaque colonne, mettre à jour les valeurs contenant l'ancien URL
        for table_schema, table_name, column_name in columns:
            # Construire la requête UPDATE en utilisant psycopg2.sql pour éviter les injections SQL
            update_query = sql.SQL(
                "UPDATE {schema}.{table} "
                "SET {col} = REPLACE({col}, %s, %s) "
                "WHERE {col} LIKE %s"
            ).format(
                schema=sql.Identifier(table_schema),
                table=sql.Identifier(table_name),
                col=sql.Identifier(column_name)
            )
            like_pattern = f"%{OLD_URL}%"
            cur.execute(update_query, (OLD_URL, NEW_URL, like_pattern))
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
