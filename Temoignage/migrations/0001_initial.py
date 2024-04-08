# Generated by Django 4.2.10 on 2024-04-07 16:43

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Temoignage",
            fields=[
                ('id_temoignage', models.AutoField(primary_key=True, serialize=False)),
                ('nom', models.CharField(blank=True, max_length=255, null=True)),
                ('telephone', models.CharField(blank=True, max_length=20, null=True)),
                ('contenu', models.TextField(blank=True, null=True)),
                ('photo', models.ImageField(null=True, upload_to='images/temoignages/')),
                ('profession', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                "db_table": "temoignage",
                "managed": False,
            },
        ),
    ]
