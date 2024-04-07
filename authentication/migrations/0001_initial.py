# Generated by Django 4.2.10 on 2024-04-07 16:43

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Utilisateur',
            fields=[
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(blank=True, max_length=255, null=True)),
                ('first_name', models.CharField(blank=True, max_length=255, null=True)),
                ('last_name', models.CharField(blank=True, max_length=255, null=True)),
                ('niveau', models.CharField(blank=True, max_length=50, null=True)),
                ('genre', models.CharField(blank=True, max_length=10, null=True)),
                ('date_de_naissance', models.DateField(blank=True, null=True)),
                ('email', models.CharField(blank=True, max_length=255, null=True, unique=True)),
                ('centres_interet', models.CharField(max_length=255)),
                ('telephone', models.CharField(blank=True, max_length=20, null=True)),
                ('photo_de_profil', models.ImageField(blank=True, null=True, upload_to='profiles/')),
                ('dernier_diplome', models.CharField(blank=True, max_length=255, null=True)),
                ('serie', models.CharField(blank=True, max_length=50, null=True)),
                ('is_staff', models.BooleanField(blank=True, null=True)),
                ('is_superuser', models.BooleanField(blank=True, null=True)),
                ('is_active', models.BooleanField(blank=True)),
                ('last_login', models.DateTimeField(auto_now=True, null=True)),
                ('date_joined', models.DateTimeField(auto_now_add=True, null=True)),
                ('date_inscription', models.DateTimeField(auto_now_add=True, null=True)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'db_table': 'utilisateur',
                'managed': True,
            },
        ),
    ]
