# Generated by Django 4.2.10 on 2024-04-14 14:38

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id_notification', models.AutoField(primary_key=True, serialize=False)),
                ('titre', models.CharField(blank=True, max_length=255, null=True)),
                ('contenu', models.TextField(blank=True, null=True)),
                ('statut', models.CharField(blank=True, max_length=255, null=True)),
                ('nationalité', models.CharField(blank=True, max_length=255, null=True)),
                ('image_pc', models.TextField(blank=True, null=True)),
                ('image_tablette', models.TextField(blank=True, null=True)),
                ('image_desktop', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'notification',
                'managed': False,
            },
        ),
    ]
