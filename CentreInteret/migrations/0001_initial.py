# Generated by Django 4.2.10 on 2024-03-13 05:13

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CentreInteret',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(blank=True, max_length=255, null=True)),
                ('image_url', models.ImageField(blank=True, max_length=255, null=True, upload_to='')),
            ],
            options={
                'db_table': 'centre_interet',
                'managed': False,
            },
        ),
    ]
