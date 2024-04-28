# Generated by Django 4.2.10 on 2024-04-28 10:24

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Actualit',
            fields=[
                ('id_actualite', models.AutoField(primary_key=True, serialize=False)),
                ('titre', models.CharField(blank=True, max_length=255, null=True)),
                ('date', models.DateField(blank=True, null=True)),
                ('nom', models.CharField(blank=True, max_length=255, null=True)),
                ('contenu', models.TextField(blank=True, null=True)),
                ('domaine', models.CharField(blank=True, max_length=255, null=True)),
                ('image_pc', models.TextField(blank=True, null=True)),
                ('image_tablette', models.TextField(blank=True, null=True)),
                ('image_desktop', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'actualité',
                'managed': False,
            },
        ),
    ]
