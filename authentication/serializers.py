from .models import Utilisateur
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from rest_framework import serializers


class UserCreationSerializer(serializers.ModelSerializer):

    username = serializers.CharField()
    first_name = serializers.CharField( )
    last_name = serializers.CharField( )
    niveau = serializers.CharField(  )
    genre = serializers.CharField( )
    date_de_naissance = serializers.DateField(  )
    email = serializers.CharField()
    password = serializers.CharField( )
    telephone = serializers.CharField()
    dernier_diplome = serializers.CharField( )
    serie = serializers.CharField()
    photo_de_profil = serializers.ImageField()
    centres_interet = serializers.CharField()



    class Meta:
        model = Utilisateur
        fields = ['username','first_name','last_name','niveau','genre','date_de_naissance','email','password','telephone','dernier_diplome', 'serie','photo_de_profil','centres_interet']


    def validate(self,attrs):

        email_exists = Utilisateur.objects.filter(email=attrs['email']).exists()

        if email_exists:
            raise serializers.ValidationError(detail="User with email already exits ")

        username_exists = Utilisateur.objects.filter(username=attrs['username']).exists()

        if username_exists:
            raise serializers.ValidationError(detail="User with username already exits ")


        return super().validate(attrs)

    def create(self,validated_data):



        user = Utilisateur.objects.create(
            username=validated_data['username'],
            first_name = validated_data['first_name'],
            last_name = validated_data['last_name'],
            email = validated_data['email'],
            niveau = validated_data['niveau'],
            genre = validated_data['genre'],
            date_de_naissance = validated_data['date_de_naissance'],
            telephone = validated_data['telephone'],
            is_active = True,
            serie = validated_data['serie'],
            dernier_diplome = validated_data['dernier_diplome'],
            photo_de_profil = validated_data['photo_de_profil'],
            centres_interet = validated_data['centres_interet']

        )

        user.set_password(validated_data['password'])

        user.save()

        return user

class UserDetailSerializer(serializers.ModelSerializer):

    username = serializers.CharField()
    first_name = serializers.CharField( )
    last_name = serializers.CharField( )
    niveau = serializers.CharField(  )
    genre = serializers.CharField( )
    date_de_naissance = serializers.DateField(  )
    email = serializers.CharField()
    password = serializers.CharField( )
    telephone = serializers.CharField()
    dernier_diplome = serializers.CharField( )
    serie = serializers.CharField()
    photo_de_profil = serializers.ImageField()
    centres_interet = serializers.CharField()



    class Meta:
        model = Utilisateur
        fields = ['username','first_name','last_name','niveau','genre','date_de_naissance','email','password','telephone','dernier_diplome', 'serie','photo_de_profil','centres_interet']


    def update(self, instance, validated_data):


        new_profile_image = validated_data.get('photo_de_profil')
        if new_profile_image and instance.photo_de_profil:
            # Delete the previous profile image
            if default_storage.exists(instance.photo_de_profil.name):
                default_storage.delete(instance.photo_de_profil.name)

        instance.username = validated_data.get('username', instance.username)
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.niveau = validated_data.get('niveau', instance.niveau)
        instance.genre = validated_data.get('genre', instance.genre)
        instance.date_de_naissance = validated_data.get('date_de_naissance', instance.date_de_naissance)
        instance.email = validated_data.get('email', instance.email)
        instance.telephone = validated_data.get('telephone', instance.telephone)
        instance.dernier_diplome = validated_data.get('dernier_diplome', instance.dernier_diplome)
        instance.serie = validated_data.get('serie', instance.serie)
        instance.photo_de_profil = validated_data.get('photo_de_profil', instance.photo_de_profil)
        instance.centres_interet = validated_data.get('centres_interet', instance.centres_interet)

        password = validated_data.get('password', None)
        if password:
            # Assuming you have a method to hash passwords, replace `hash_password` with that
            instance.set_password(password)

        

        # Save the instance
        instance.save()
        return instance

class PasswordRecoverySerializer(serializers.Serializer):
    user_email = serializers.EmailField()
    code = serializers.CharField(max_length=100)
    new_password = serializers.CharField(max_length=128)

    def validate(self, data):
        user_email = data.get('user_email')
        code = data.get('code')

        # Validate that the user with the provided email exists
        if not Utilisateur.objects.filter(email=user_email).exists():
            raise serializers.ValidationError("User with this email does not exist.")

        # Perform additional validation for the code field if needed

        return data

class ContactUsSerializer(serializers.Serializer):
    user_email = serializers.EmailField()
    message = serializers.CharField(max_length=500)

    def validate(self, data):
        user_email = data.get('user_email')

        # Validate that the user with the provided email exists
        if not Utilisateur.objects.filter(email=user_email).exists():
            raise serializers.ValidationError("User with this email does not exist.")

        # Perform additional validation for the code field if needed

        return data